@interface NSProcessInfo
@end

@implementation NSProcessInfo

void __46__NSProcessInfo_ICAdditions__ic_isCloudDaemon__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  ic_isCloudDaemon_sIsCloudDaemon = [v0 isEqualToString:@"com.apple.itunescloudd"];
}

@end