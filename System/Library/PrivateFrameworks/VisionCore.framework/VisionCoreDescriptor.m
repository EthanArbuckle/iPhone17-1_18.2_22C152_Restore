@interface VisionCoreDescriptor
+ (BOOL)supportsSecureCoding;
- (id)description;
@end

@implementation VisionCoreDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v2 = [NSString alloc];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = (void *)[v2 initWithFormat:@"%@", v4];

  return v5;
}

@end