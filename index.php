<?php

header('server: love');
header('x-powered-by: Kubernetes, phoenix servers, blue-green deployments, TDD, BDD, DDD, unikernels, docker containers, immutable infrastructure, Go, stateless microservices');

if (isset($_GET['src'])) {
    highlight_file(__FILE__);
    exit(0);
}

$imgs = giflist();
shuffle($imgs);
$img = $imgs[0];

switch (substr($img, -4)) {
case ".gif":
    header('Content-Type: image/gif');
    break;
case ".jpg":
    header('Content-Type: image/jpeg');
    break;
case ".png":
    header('Content-Type: image/png');
    break;
}
readfile($img);
