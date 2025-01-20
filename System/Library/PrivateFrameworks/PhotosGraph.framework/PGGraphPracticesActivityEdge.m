@interface PGGraphPracticesActivityEdge
+ (id)filter;
- (PGGraphPracticesActivityEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromPersonNode:(id)a3 toActivityNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphPracticesActivityEdge

- (unsigned)domain
{
  return 701;
}

- (id)label
{
  v2 = @"PRACTICES_ACTIVITY";
  return @"PRACTICES_ACTIVITY";
}

- (PGGraphPracticesActivityEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPracticesActivityEdge *)[(PGGraphPracticesActivityEdge *)self initFromPersonNode:a4 toActivityNode:a5];
}

- (id)initFromPersonNode:(id)a3 toActivityNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphPracticesActivityEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"PRACTICES_ACTIVITY" domain:701];
  return v2;
}

@end