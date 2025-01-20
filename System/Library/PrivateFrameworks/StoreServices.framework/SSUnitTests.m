@interface SSUnitTests
+ (BOOL)isRunningUnitTests;
@end

@implementation SSUnitTests

+ (BOOL)isRunningUnitTests
{
  Class v2 = NSClassFromString(&cfstr_Xctestprobe.isa);
  if (v2)
  {
    SEL v3 = NSSelectorFromString(&cfstr_Istesting.isa);
    v4 = [(objc_class *)v2 methodSignatureForSelector:v3];
    v5 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v4];
    [v5 setSelector:v3];
    [v5 invokeWithTarget:v2];
    char v7 = 0;
    [v5 getReturnValue:&v7];
    LOBYTE(v2) = v7 != 0;
  }
  return (char)v2;
}

@end