@interface SWTBridge
+ (BOOL)writeIssueReport:(id)a3 filename:(id)a4;
+ (id)swTransparencyXPCInterface;
@end

@implementation SWTBridge

+ (BOOL)writeIssueReport:(id)a3 filename:(id)a4
{
  id v7 = a3;
  id v4 = v7;
  char v5 = OSAWriteLogForSubmission();

  return v5;
}

+ (id)swTransparencyXPCInterface
{
  return +[SWTransparencyXPCInterface interface];
}

@end