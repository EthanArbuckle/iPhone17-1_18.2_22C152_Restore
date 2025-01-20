@interface PGGraphOverTheYearsNodeCollection
+ (Class)nodeClass;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
@end

@implementation PGGraphOverTheYearsNodeCollection

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end