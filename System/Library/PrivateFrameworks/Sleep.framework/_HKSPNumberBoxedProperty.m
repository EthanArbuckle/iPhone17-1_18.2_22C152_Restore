@interface _HKSPNumberBoxedProperty
- (id)allowedInnerClassesForSecureCoding;
@end

@implementation _HKSPNumberBoxedProperty

- (id)allowedInnerClassesForSecureCoding
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

@end