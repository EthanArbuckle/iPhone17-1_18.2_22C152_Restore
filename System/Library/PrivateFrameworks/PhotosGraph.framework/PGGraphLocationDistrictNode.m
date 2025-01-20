@interface PGGraphLocationDistrictNode
+ (id)filter;
- (PGGraphLocationDistrictNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphLocationDistrictNodeCollection)collection;
- (id)label;
- (unint64_t)featureType;
@end

@implementation PGGraphLocationDistrictNode

- (unint64_t)featureType
{
  return 19;
}

- (PGGraphLocationDistrictNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphLocationDistrictNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)label
{
  v2 = @"District";
  return @"District";
}

- (PGGraphLocationDistrictNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PGGraphLocationDistrictNode;
  return [(PGGraphNamedLocationNode *)&v6 initWithLabel:a3 domain:a4 properties:a5];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"District" domain:200];
  return v2;
}

@end