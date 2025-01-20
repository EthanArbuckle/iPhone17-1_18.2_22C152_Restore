@interface NSObject(Voicemail)
+ (id)vm_classIdentifier;
@end

@implementation NSObject(Voicemail)

+ (id)vm_classIdentifier
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSString;
  v2 = [MEMORY[0x263F086E0] bundleForClass:v0];
  v3 = [v2 bundleIdentifier];
  v4 = NSStringFromClass(v0);
  v5 = [v1 stringWithFormat:@"%@.%@", v3, v4];

  return v5;
}

@end