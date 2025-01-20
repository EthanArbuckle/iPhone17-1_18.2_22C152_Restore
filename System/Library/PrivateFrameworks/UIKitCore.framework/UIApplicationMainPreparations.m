@interface UIApplicationMainPreparations
@end

@implementation UIApplicationMainPreparations

id ___UIApplicationMainPreparations_block_invoke()
{
  id v0 = _UIKitPreferencesOnce();
  id v1 = (id)[MEMORY[0x1E4F39BE8] layer];
  id v2 = (id)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5.tv_sec = 0;
  *(void *)&v5.tv_usec = 0;
  memset(&v4, 0, sizeof(v4));
  gettimeofday(&v5, 0);
  localtime_r(&v5.tv_sec, &v4);
  _UIApplicationStartLaunchBackgroundTask();
  return +[FBSSceneSpecification specification];
}

@end