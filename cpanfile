requires 'perl', '5.008005';

requires 'LWP::UserAgent';
requires 'MIME::Base64';
requires 'JSON';
requires 'URI';

on test => sub {
    requires 'Test::More', '0.96';
};
