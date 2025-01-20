@interface GKFamiliarPlayerInternal
+ (int)familiarity;
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKFamiliarPlayerInternal

- (void)updateWithCacheObject:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKFamiliarPlayerInternal;
  id v4 = a3;
  [(GKFamiliarPlayerInternal *)&v8 updateWithCacheObject:v4];
  v5 = [v4 firstName];
  v6 = [v4 lastName];

  [(GKFamiliarPlayerInternal *)self setFirstName:v5];
  [(GKFamiliarPlayerInternal *)self setLastName:v6];
  v7 = [(id)objc_opt_class() compositeNameForFirstName:v5 lastName:v6];
  [(GKFamiliarPlayerInternal *)self setCompositeName:v7];
}

+ (int)familiarity
{
  return 3;
}

@end