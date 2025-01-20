@interface PUPhotosGridDownloadHelpContext
- (NSString)gridProgressIdentifier;
- (PHResourceLocalAvailabilityRequest)resourceLocalAvailabilityRequest;
- (id)downloadHandler;
- (void)setDownloadHandler:(id)a3;
- (void)setGridProgressIdentifier:(id)a3;
- (void)setResourceLocalAvailabilityRequest:(id)a3;
@end

@implementation PUPhotosGridDownloadHelpContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_downloadHandler, 0);
  objc_storeStrong((id *)&self->_gridProgressIdentifier, 0);
  objc_storeStrong((id *)&self->_resourceLocalAvailabilityRequest, 0);
}

- (void)setDownloadHandler:(id)a3
{
}

- (id)downloadHandler
{
  return self->_downloadHandler;
}

- (void)setGridProgressIdentifier:(id)a3
{
}

- (NSString)gridProgressIdentifier
{
  return self->_gridProgressIdentifier;
}

- (void)setResourceLocalAvailabilityRequest:(id)a3
{
}

- (PHResourceLocalAvailabilityRequest)resourceLocalAvailabilityRequest
{
  return self->_resourceLocalAvailabilityRequest;
}

@end