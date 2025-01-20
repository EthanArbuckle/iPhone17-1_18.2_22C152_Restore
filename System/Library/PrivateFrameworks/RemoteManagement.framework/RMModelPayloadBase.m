@interface RMModelPayloadBase
+ (id)rm_payloadTypeName;
@end

@implementation RMModelPayloadBase

+ (id)rm_payloadTypeName
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = @"com.apple.activation";
  }
  else if ((id)objc_opt_class() == a1)
  {
    v3 = @"com.apple.asset";
  }
  else if ((id)objc_opt_class() == a1)
  {
    v3 = @"com.apple.configuration";
  }
  else if ((id)objc_opt_class() == a1)
  {
    v3 = @"com.apple.command";
  }
  else
  {
    NSStringFromClass((Class)a1);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

@end