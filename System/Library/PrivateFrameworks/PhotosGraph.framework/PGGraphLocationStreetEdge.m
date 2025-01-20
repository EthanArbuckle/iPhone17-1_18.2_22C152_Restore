@interface PGGraphLocationStreetEdge
+ (id)filter;
- (PGGraphLocationStreetEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromLocationNode:(id)a3 toStreetNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphLocationStreetEdge

- (unsigned)domain
{
  return 200;
}

- (id)label
{
  v2 = @"STREET";
  return @"STREET";
}

- (PGGraphLocationStreetEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphLocationStreetEdge *)[(PGGraphLocationStreetEdge *)self initFromLocationNode:a4 toStreetNode:a5];
}

- (id)initFromLocationNode:(id)a3 toStreetNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphLocationStreetEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"STREET" domain:200];
  return v2;
}

@end