@interface PLPhotoLibraryShouldReloadNotification
- (id)initNotificationWithPhotoLibrary:(id)a3;
- (id)name;
- (id)object;
- (id)userInfo;
@end

@implementation PLPhotoLibraryShouldReloadNotification

- (void).cxx_destruct
{
}

- (id)userInfo
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)object
{
  return self->_photoLibrary;
}

- (id)name
{
  return @"PLPhotoLibraryShouldReload";
}

- (id)initNotificationWithPhotoLibrary:(id)a3
{
  return self;
}

@end