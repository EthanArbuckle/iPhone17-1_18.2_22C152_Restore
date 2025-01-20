@interface PGGraphPublicEventCategoryEdge
+ (id)filter;
- (PGGraphPublicEventCategoryEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromPublicEventNode:(id)a3 toCategoryNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphPublicEventCategoryEdge

- (unsigned)domain
{
  return 901;
}

- (id)label
{
  v2 = @"CATEGORY";
  return @"CATEGORY";
}

- (PGGraphPublicEventCategoryEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPublicEventCategoryEdge *)[(PGGraphPublicEventCategoryEdge *)self initFromPublicEventNode:a4 toCategoryNode:a5];
}

- (id)initFromPublicEventNode:(id)a3 toCategoryNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphPublicEventCategoryEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"CATEGORY" domain:901];
  return v2;
}

@end