@interface ACM2SVTransportController
- (ACM2SVTransportControllerDelegate)delegate;
- (void)cancelImageFetching;
- (void)generateAndSendSecCodeWithContext:(id)a3 completion:(id)a4;
- (void)getImageWithURL:(id)a3 completion:(id)a4;
- (void)loadTrustedDevicesWithContext:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)verifySecureCodeWithContext:(id)a3 completion:(id)a4;
@end

@implementation ACM2SVTransportController

- (void)loadTrustedDevicesWithContext:(id)a3 completion:(id)a4
{
  v6 = +[ACCHTTPHandler handlerWithContext:a3];
  v7 = [(ACM2SVTransportController *)self delegate];

  [(ACM2SVTransportControllerDelegate *)v7 twoSVTransportController:self scheduleHandler:v6 withCompletion:a4];
}

- (void)generateAndSendSecCodeWithContext:(id)a3 completion:(id)a4
{
  v6 = +[ACCHTTPHandler handlerWithContext:a3];
  v7 = [(ACM2SVTransportController *)self delegate];

  [(ACM2SVTransportControllerDelegate *)v7 twoSVTransportController:self scheduleHandler:v6 withCompletion:a4];
}

- (void)verifySecureCodeWithContext:(id)a3 completion:(id)a4
{
  v6 = +[ACCHTTPHandler handlerWithContext:a3];
  v7 = [(ACM2SVTransportController *)self delegate];

  [(ACM2SVTransportControllerDelegate *)v7 twoSVTransportController:self scheduleHandler:v6 withCompletion:a4];
}

- (void)getImageWithURL:(id)a3 completion:(id)a4
{
  if (a3)
  {
    v6 = +[ACM2SVHTTPImageDownloadHandler handlerWithURLString:](ACM2SVHTTPImageDownloadHandler, "handlerWithURLString:");
    v7 = [(ACM2SVTransportController *)self delegate];
    [(ACM2SVTransportControllerDelegate *)v7 twoSVTransportController:self fetchImageWithHandler:v6 completion:a4];
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
  {
    ACFLog(3, (uint64_t)"-[ACM2SVTransportController getImageWithURL:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVTransportController.m", 45, 0, "Image download URL is empty");
  }
}

- (void)cancelImageFetching
{
  v3 = [(ACM2SVTransportController *)self delegate];

  [(ACM2SVTransportControllerDelegate *)v3 twoSVTransportControllerCancelFetchingImages:self];
}

- (ACM2SVTransportControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACM2SVTransportControllerDelegate *)a3;
}

@end