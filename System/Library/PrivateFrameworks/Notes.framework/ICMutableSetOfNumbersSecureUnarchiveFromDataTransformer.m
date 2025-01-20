@interface ICMutableSetOfNumbersSecureUnarchiveFromDataTransformer
+ (id)allowedTopLevelClasses;
@end

@implementation ICMutableSetOfNumbersSecureUnarchiveFromDataTransformer

+ (id)allowedTopLevelClasses
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

@end