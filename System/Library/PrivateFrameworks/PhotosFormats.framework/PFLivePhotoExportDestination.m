@interface PFLivePhotoExportDestination
+ (id)destinationWithPhotoURL:(id)a3 videoURL:(id)a4;
- (NSURL)photoURL;
- (NSURL)videoURL;
- (PFLivePhotoExportDestination)initWithPhotoURL:(id)a3 videoURL:(id)a4;
@end

@implementation PFLivePhotoExportDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoURL, 0);

  objc_storeStrong((id *)&self->_photoURL, 0);
}

- (NSURL)videoURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)photoURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (PFLivePhotoExportDestination)initWithPhotoURL:(id)a3 videoURL:(id)a4
{
  v6 = (NSURL *)a3;
  v7 = (NSURL *)a4;
  v13.receiver = self;
  v13.super_class = (Class)PFLivePhotoExportDestination;
  v8 = [(PFLivePhotoExportDestination *)&v13 init];
  photoURL = v8->_photoURL;
  v8->_photoURL = v6;
  v10 = v6;

  videoURL = v8->_videoURL;
  v8->_videoURL = v7;

  return v8;
}

+ (id)destinationWithPhotoURL:(id)a3 videoURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithPhotoURL:v7 videoURL:v6];

  return v8;
}

@end