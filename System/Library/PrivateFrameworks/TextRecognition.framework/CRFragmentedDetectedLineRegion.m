@interface CRFragmentedDetectedLineRegion
- (NSArray)regionFragments;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_copyContentsToObject:(id)a3;
- (void)setRegionFragments:(id)a3;
@end

@implementation CRFragmentedDetectedLineRegion

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRFragmentedDetectedLineRegion;
  id v4 = [(CRDetectedLineRegion *)&v6 copyWithZone:a3];
  if (v4) {
    [(CRFragmentedDetectedLineRegion *)self _copyContentsToObject:v4];
  }
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CRMutableFragmentedDetectedLineRegion);
  if (v4) {
    [(CRFragmentedDetectedLineRegion *)self _copyContentsToObject:v4];
  }
  return v4;
}

- (void)_copyContentsToObject:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRFragmentedDetectedLineRegion;
  id v4 = a3;
  [(CRDetectedLineRegion *)&v6 _copyContentsToObject:v4];
  v5 = [(CRFragmentedDetectedLineRegion *)self regionFragments];
  [v4 setRegionFragments:v5];
}

- (NSArray)regionFragments
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRegionFragments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end