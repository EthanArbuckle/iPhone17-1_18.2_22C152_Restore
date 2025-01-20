@interface MTAppCoreSpotlightEntityAnnotator
- (MTAppCoreSpotlightEntityAnnotator)init;
- (id)annotateItem:(id)a3 withManagedObject:(id)a4;
@end

@implementation MTAppCoreSpotlightEntityAnnotator

- (id)annotateItem:(id)a3 withManagedObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = (id)sub_10000CBA0((uint64_t)v6, v7);

  return v9;
}

- (MTAppCoreSpotlightEntityAnnotator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppCoreSpotlightEntityAnnotator();
  return [(MTAppCoreSpotlightEntityAnnotator *)&v3 init];
}

@end