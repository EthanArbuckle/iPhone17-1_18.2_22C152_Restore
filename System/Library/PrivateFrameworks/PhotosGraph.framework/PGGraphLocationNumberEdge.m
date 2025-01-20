@interface PGGraphLocationNumberEdge
+ (id)filter;
- (PGGraphLocationNumberEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromLocationNode:(id)a3 toLocationNumberNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphLocationNumberEdge

- (unsigned)domain
{
  return 200;
}

- (id)label
{
  v2 = @"NUMBER";
  return @"NUMBER";
}

- (PGGraphLocationNumberEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphLocationNumberEdge *)[(PGGraphLocationNumberEdge *)self initFromLocationNode:a4 toLocationNumberNode:a5];
}

- (id)initFromLocationNode:(id)a3 toLocationNumberNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphLocationNumberEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"NUMBER" domain:200];
  return v2;
}

@end