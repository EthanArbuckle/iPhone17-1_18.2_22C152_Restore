@interface PLCameraPreviewImageWellChangeNotification
+ (id)notification;
- (NSString)assetUUID;
- (PLCameraPreviewImageWellChangeNotification)init;
- (UIImage)image;
- (id)_init;
- (id)description;
- (id)name;
- (id)object;
- (id)userInfo;
@end

@implementation PLCameraPreviewImageWellChangeNotification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (NSString)assetUUID
{
  return self->_uuid;
}

- (UIImage)image
{
  image = self->_image;
  if (!image)
  {
    v4 = [MEMORY[0x1E4F8B848] cameraPreviewWellImage];
    v5 = self->_image;
    self->_image = v4;

    image = self->_image;
  }
  return image;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> asset: %@", objc_opt_class(), self, self->_uuid];
}

- (id)object
{
  return 0;
}

- (id)userInfo
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionary];
}

- (id)name
{
  v2 = @"PLCameraPreviewImageWellChanged";
  return @"PLCameraPreviewImageWellChanged";
}

- (PLCameraPreviewImageWellChangeNotification)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLCameraPreviewImageWellChangeNotification;
  return [(PLCameraPreviewImageWellChangeNotification *)&v3 init];
}

- (id)_init
{
  PLCameraPreviewWellAssetUUIDFromPersistedFile();
  objc_super v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v3;

  return self;
}

+ (id)notification
{
  v2 = (void *)[objc_alloc((Class)a1) _init];
  return v2;
}

@end