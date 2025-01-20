@interface _UILayoutSupportConstraint
+ (id)classFallbacksForKeyedArchiver;
@end

@implementation _UILayoutSupportConstraint

+ (id)classFallbacksForKeyedArchiver
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v2 = (objc_class *)objc_opt_class();
  v4[0] = NSStringFromClass(v2);
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
}

@end