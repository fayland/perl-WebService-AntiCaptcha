# NAME

WebService::AntiCaptcha - anti-captcha.com API

# SYNOPSIS

    use WebService::AntiCaptcha;

    my $wac = WebService::AntiCaptcha->new(
        clientKey => 'your_client_key'
    );

    my $res = $wac->getBalance or die $wac->errstr;
    print $res->{balance};

# DESCRIPTION

WebService::AntiCaptcha is for [https://anticaptcha.atlassian.net/wiki/spaces/API/pages/196635/Documentation+in+English](https://anticaptcha.atlassian.net/wiki/spaces/API/pages/196635/Documentation+in+English)

# NOTE

Note we don't raise error for API response errorId > 0. You should handle those yourself.

    # after each method call
    die $wac_res->{errorDescription} if $wac_res->{errorId};

# METHODS

## createTask

[https://anticaptcha.atlassian.net/wiki/spaces/API/pages/5079073/createTask+captcha+task+creating](https://anticaptcha.atlassian.net/wiki/spaces/API/pages/5079073/createTask+captcha+task+creating)

    my $res = $wac->createTask($task, $softId, $languagePool);

### ImageToTextTask

    my $res = $wac->createTask({
        type => 'ImageToTextTask',
        body => "BASE64_BODY_HERE!",
    }) or die $wac->errstr;

### NoCaptchaTaskProxyless

recaptcha solving. check xt/recaptcha.pl for a working example.

    my $res = $wac->createTask({
        type => 'NoCaptchaTaskProxyless',
        websiteURL => "http://mywebsite.com/recaptcha/test.php",
        websiteKey => "6Lc_aCMTAAAAABx7u2N0D1XnVbI_v6ZdbM6rYf16"
    }) or die $wac->errstr;

### NoCaptchaTask

with proxy

    my $res = $wac->createTask({
        type => 'NoCaptchaTask',
        websiteURL => "http://mywebsite.com/recaptcha/test.php",
        websiteKey => "6Lc_aCMTAAAAABx7u2N0D1XnVbI_v6ZdbM6rYf16",
        "proxyType" => "http",
        "proxyAddress" => "8.8.8.8",
        "proxyPort" => 8080,
        "proxyLogin" => "proxyLoginHere",
        "proxyPassword" => "proxyPasswordHere",
        "userAgent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36"
    }) or die $wac->errstr;

## getTaskResult

[https://anticaptcha.atlassian.net/wiki/spaces/API/pages/5079103/getTaskResult+request+task+result](https://anticaptcha.atlassian.net/wiki/spaces/API/pages/5079103/getTaskResult+request+task+result)

    my $res = $wac->getTaskResult($taskId) or die $wac->errstr;

## getBalance

[https://anticaptcha.atlassian.net/wiki/spaces/API/pages/6389791/getBalance+retrieve+account+balance](https://anticaptcha.atlassian.net/wiki/spaces/API/pages/6389791/getBalance+retrieve+account+balance)

    my $res = $wac->getBalance or die $wac->errstr;
    print $res->{balance};

## getQueueStats

[https://anticaptcha.atlassian.net/wiki/spaces/API/pages/8290316/getQueueStats+obtain+queue+load+statistics](https://anticaptcha.atlassian.net/wiki/spaces/API/pages/8290316/getQueueStats+obtain+queue+load+statistics)

    my $res = $wac->queueId($queueId) or die $wac->errstr;

## reportIncorrectImageCaptcha

    my $res = $wac->reportIncorrectImageCaptcha($taskId) or die $wac->errstr;

# AUTHOR

Fayland Lam <fayland@gmail.com>

# COPYRIGHT

Copyright 2017- Fayland Lam

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO
