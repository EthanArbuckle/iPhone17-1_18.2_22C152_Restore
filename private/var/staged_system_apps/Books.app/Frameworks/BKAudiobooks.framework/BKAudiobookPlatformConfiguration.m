@interface BKAudiobookPlatformConfiguration
+ (void)configureForPlatform;
@end

@implementation BKAudiobookPlatformConfiguration

+ (void)configureForPlatform
{
  if (qword_48F38 != -1) {
    dispatch_once(&qword_48F38, &stru_3D328);
  }
}

@end