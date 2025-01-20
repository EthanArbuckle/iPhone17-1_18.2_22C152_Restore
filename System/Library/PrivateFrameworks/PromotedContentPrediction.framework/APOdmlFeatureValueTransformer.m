@interface APOdmlFeatureValueTransformer
+ (id)allowedTopLevelClasses;
@end

@implementation APOdmlFeatureValueTransformer

+ (id)allowedTopLevelClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);

  return v3;
}

@end