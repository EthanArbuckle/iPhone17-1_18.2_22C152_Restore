@interface PUCleanupUserSettingBridge
- (BOOL)retouchPixellatesFaces;
@end

@implementation PUCleanupUserSettingBridge

- (BOOL)retouchPixellatesFaces
{
  v2 = +[PUPhotoEditProtoSettings sharedInstance];
  char v3 = [v2 retouchPixellatesFaces];

  return v3;
}

@end