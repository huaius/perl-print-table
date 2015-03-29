#!/usr/bin/perl

sub table {
    my ($values,$titles) = @_;
    my (@max,$i,$length,$format,@items,$break);
    @max = ();
    for my $value (@$values){
        $i = 0;
        for my $title (@$titles) {
            @max[$i] ||= length($title) + 1;
            $length = 0;
            $length = length($value->{$title}) + 1 if defined $value->{$title};
            @max[$i] = ($length > @max[$i]) ? $length : @max[$i];
            $i++;
        }
    }
    $format = "";
    $break = '';
    for my $i (@max) {
        $format .= "\%-$i".'s';
        $break .= '=' x $i;
    }
    print(sprintf($format,@$titles));
    print($break);
    for my $value (@$values){
        @items = ();
        for my $title (@$titles) {
            my $temp = defined $value->{$title} ? $value->{$title} : '-';
            push(@items,$temp);
        }
        print(sprintf($format,@items));
    }
    return;
}


sub table1 {
    my ($values,$titles) = @_;
    my (@max,$i,$length,$format,$stdout_top,$stdout,@items,$break);
    @max = ();
    for my $value (@$values){
        $i = 0;
        for my $title (@$titles) {
            @max[$i] ||= length($title) + 2;
            $length = 0;
            $length = length($value->{$title}) + 2 if defined $value->{$title};
            @max[$i] = ($length > @max[$i]) ? $length : @max[$i];
            $i++;
        }
    }

    $format = "";
    $break = '';
    for my $i (@max) {
        $format .= '@' . '<' x $i;
        $break .= '=' x $i;
    }
    $stdout_top = "format STDOUT_TOP =\n$format\n\@\$titles\n$break\n.";
    $stdout = "format STDOUT =\n$format\n\@items\n.";

    eval $stdout_top;
    eval $stdout;

    for my $value (@$values){
        @items = ();
        for my $title (@$titles) {
            my $temp = defined $value->{$title} ? $value->{$title} : '-';
            push(@items,$temp);
        }
        $^ = 'STDOUT_TOP';
        $~ = 'STDOUT';
        $= = 60;
        write;
    }

    return;
}
