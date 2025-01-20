@interface UGCDownloadablePhotoInfoComposer
+ (id)downloadablePhotoForGeoMapItemPhotoInfo:(id)a3;
+ (id)downloadablePhotoForUGCPhoto:(id)a3;
- (NSString)downloadIdentifier;
- (NSURL)url;
- (UGCDownloadablePhotoInfoComposer)initWithIdentifier:(id)a3 url:(id)a4 timeoutInterval:(double)a5;
- (double)timeoutInterval;
@end

@implementation UGCDownloadablePhotoInfoComposer

- (UGCDownloadablePhotoInfoComposer)initWithIdentifier:(id)a3 url:(id)a4 timeoutInterval:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UGCDownloadablePhotoInfoComposer;
  v11 = [(UGCDownloadablePhotoInfoComposer *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_downloadIdentifier, a3);
    objc_storeStrong((id *)&v12->_url, a4);
    v12->_timeoutInterval = a5;
  }

  return v12;
}

+ (id)downloadablePhotoForGeoMapItemPhotoInfo:(id)a3
{
  v3 = [a3 url];
  v4 = [UGCDownloadablePhotoInfoComposer alloc];
  v5 = [v3 absoluteString];
  v6 = [(UGCDownloadablePhotoInfoComposer *)v4 initWithIdentifier:v5 url:v3 timeoutInterval:15.0];

  return v6;
}

+ (id)downloadablePhotoForUGCPhoto:(id)a3
{
  id v3 = a3;
  v4 = [v3 url];
  v5 = [UGCDownloadablePhotoInfoComposer alloc];
  v6 = [v3 identifier];

  v7 = [(UGCDownloadablePhotoInfoComposer *)v5 initWithIdentifier:v6 url:v4 timeoutInterval:15.0];

  return v7;
}

- (NSString)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (NSURL)url
{
  return self->_url;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_downloadIdentifier, 0);
}

@end