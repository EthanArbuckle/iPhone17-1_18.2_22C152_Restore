@interface SiriAudioSpringBoardService
+ (BOOL)isSystemApertureAvailable;
@end

@implementation SiriAudioSpringBoardService

+ (BOOL)isSystemApertureAvailable
{
  return MEMORY[0x270F77178](a1, a2);
}

@end