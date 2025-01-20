@interface PGGraphLocationCityEdge
+ (id)filter;
- (PGGraphLocationCityEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromLocationNode:(id)a3 toCityNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphLocationCityEdge

- (unsigned)domain
{
  return 200;
}

- (id)label
{
  v2 = @"CITY";
  return @"CITY";
}

- (PGGraphLocationCityEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphLocationCityEdge *)[(PGGraphLocationCityEdge *)self initFromLocationNode:a4 toCityNode:a5];
}

- (id)initFromLocationNode:(id)a3 toCityNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphLocationCityEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"CITY" domain:200];
  return v2;
}

@end