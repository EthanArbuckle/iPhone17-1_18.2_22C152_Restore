@interface PFColorValueTransformer
+ (id)allowedTopLevelClasses;
@end

@implementation PFColorValueTransformer

+ (id)allowedTopLevelClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = NSClassFromString(&cfstr_Uicolor.isa);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

@end