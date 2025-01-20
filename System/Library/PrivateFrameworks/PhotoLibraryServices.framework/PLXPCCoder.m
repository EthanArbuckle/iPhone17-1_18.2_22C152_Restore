@interface PLXPCCoder
+ (id)userInfoForCoder:(id)a3;
@end

@implementation PLXPCCoder

+ (id)userInfoForCoder:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable _PLAssertRespondsToSelector(id  _Nullable __strong, SEL _Nonnull)");
      v9 = NSStringFromSelector(sel_userInfo);
      [v7 handleFailureInFunction:v8, @"PLHelperExtension.h", 91, @"Object does not respond to selector %@: %@", v9, v3 file lineNumber description];
    }
    id v4 = v3;
  }

  v5 = [v3 userInfo];

  return v5;
}

@end