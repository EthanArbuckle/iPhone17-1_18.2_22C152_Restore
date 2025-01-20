@interface UIApplication(SUPPT)
- (void)beginPPTWithName:()SUPPT;
- (void)endCurrentPPT;
@end

@implementation UIApplication(SUPPT)

- (void)beginPPTWithName:()SUPPT
{
  if ((void *)__CurrentTestName != a3)
  {

    __CurrentTestName = a3;
  }
}

- (void)endCurrentPPT
{
  __CurrentTestName = 0;
}

@end