@interface AEAudiobookPlatformConfiguration
+ (void)configureForPlatform;
@end

@implementation AEAudiobookPlatformConfiguration

+ (void)configureForPlatform
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___AEAudiobookPlatformConfiguration;
  [super configureForPlatform];
  if (qword_22B5D8 != -1) {
    dispatch_once(&qword_22B5D8, &stru_1DD060);
  }
}

@end