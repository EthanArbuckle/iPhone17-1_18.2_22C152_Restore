@interface NSObject(TelephonyPreferences)
+ (id)tps_classIdentifier;
@end

@implementation NSObject(TelephonyPreferences)

+ (id)tps_classIdentifier
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSString;
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:v0];
  v3 = [v2 bundleIdentifier];
  v4 = NSStringFromClass(v0);
  v5 = [v1 stringWithFormat:@"%@.%@", v3, v4];

  return v5;
}

@end