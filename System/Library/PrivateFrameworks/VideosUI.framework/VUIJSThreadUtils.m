@interface VUIJSThreadUtils
+ (BOOL)isVideosUICoreJSThread;
@end

@implementation VUIJSThreadUtils

+ (BOOL)isVideosUICoreJSThread
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [v2 name];
  char v4 = [v3 isEqualToString:@"VUICoreThread"];

  return v4;
}

@end