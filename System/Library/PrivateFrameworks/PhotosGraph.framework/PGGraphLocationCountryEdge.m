@interface PGGraphLocationCountryEdge
+ (id)filter;
- (PGGraphLocationCountryEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromLocationNode:(id)a3 toCountryNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphLocationCountryEdge

- (unsigned)domain
{
  return 200;
}

- (id)label
{
  v2 = @"COUNTRY";
  return @"COUNTRY";
}

- (PGGraphLocationCountryEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphLocationCountryEdge *)[(PGGraphLocationCountryEdge *)self initFromLocationNode:a4 toCountryNode:a5];
}

- (id)initFromLocationNode:(id)a3 toCountryNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphLocationCountryEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"COUNTRY" domain:200];
  return v2;
}

@end