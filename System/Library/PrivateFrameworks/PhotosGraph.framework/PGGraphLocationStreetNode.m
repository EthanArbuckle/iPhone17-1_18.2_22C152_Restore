@interface PGGraphLocationStreetNode
+ (id)filter;
- (PGGraphLocationStreetNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphLocationStreetNodeCollection)collection;
- (id)label;
@end

@implementation PGGraphLocationStreetNode

- (PGGraphLocationStreetNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphLocationStreetNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)label
{
  v2 = @"Street";
  return @"Street";
}

- (PGGraphLocationStreetNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PGGraphLocationStreetNode;
  return [(PGGraphNamedLocationNode *)&v6 initWithLabel:a3 domain:a4 properties:a5];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Street" domain:200];
  return v2;
}

@end