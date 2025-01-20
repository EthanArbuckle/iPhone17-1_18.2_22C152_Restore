@interface APOdmlStoreServerPolicy
- (id)allowableClassesForClientWithContext:(id)a3;
@end

@implementation APOdmlStoreServerPolicy

- (id)allowableClassesForClientWithContext:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = objc_msgSend_allowedTopLevelClasses(APOdmlFeatureValueTransformer, a2, (uint64_t)a3);
  v6 = objc_msgSend_setWithArray_(v3, v5, (uint64_t)v4);

  return v6;
}

@end