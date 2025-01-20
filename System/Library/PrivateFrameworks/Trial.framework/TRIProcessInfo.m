@interface TRIProcessInfo
+ (BOOL)hostingProcessIsCoreAnalytics;
+ (BOOL)hostingProcessIsSystemProcess;
+ (BOOL)hostingProcessIsTriald;
+ (BOOL)hostingProcessIsTrialdSystem;
@end

@implementation TRIProcessInfo

+ (BOOL)hostingProcessIsTriald
{
  if (qword_1EB3B78C0 != -1) {
    dispatch_once(&qword_1EB3B78C0, &__block_literal_global_17);
  }
  return _MergedGlobals_14;
}

void __40__TRIProcessInfo_hostingProcessIsTriald__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = +[TRIEntitlement applicationBundleIdentifierFromSelf];
  v2 = v1;
  if (v1) {
    char v3 = [v1 isEqualToString:@"com.apple.triald"];
  }
  else {
    char v3 = 0;
  }

  _MergedGlobals_14 = v3;
}

+ (BOOL)hostingProcessIsTrialdSystem
{
  if (qword_1EB3B78C8 != -1) {
    dispatch_once(&qword_1EB3B78C8, &__block_literal_global_15);
  }
  return byte_1EB3B78B9;
}

void __46__TRIProcessInfo_hostingProcessIsTrialdSystem__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = +[TRIEntitlement applicationBundleIdentifierFromSelf];
  v2 = v1;
  if (v1) {
    char v3 = [v1 isEqualToString:@"com.apple.triald.system"];
  }
  else {
    char v3 = 0;
  }

  byte_1EB3B78B9 = v3;
}

+ (BOOL)hostingProcessIsSystemProcess
{
  return getuid() < 0x12D;
}

+ (BOOL)hostingProcessIsCoreAnalytics
{
  if (qword_1EB3B78D0 != -1) {
    dispatch_once(&qword_1EB3B78D0, &__block_literal_global_17);
  }
  return byte_1EB3B78BA;
}

void __47__TRIProcessInfo_hostingProcessIsCoreAnalytics__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = +[TRIEntitlement applicationBundleIdentifierFromSelf];
  v2 = v1;
  if (v1) {
    char v3 = [v1 isEqualToString:@"com.apple.analyticsd"];
  }
  else {
    char v3 = 0;
  }

  byte_1EB3B78BA = v3;
}

@end