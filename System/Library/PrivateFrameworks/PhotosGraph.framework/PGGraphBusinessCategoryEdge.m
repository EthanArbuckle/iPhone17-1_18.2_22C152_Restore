@interface PGGraphBusinessCategoryEdge
+ (id)filter;
- (PGGraphBusinessCategoryEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromBusinessNode:(id)a3 toBusinessCategoryNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphBusinessCategoryEdge

- (unsigned)domain
{
  return 504;
}

- (id)label
{
  v2 = @"BUSINESSCATEGORY";
  return @"BUSINESSCATEGORY";
}

- (PGGraphBusinessCategoryEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphBusinessCategoryEdge *)[(PGGraphBusinessCategoryEdge *)self initFromBusinessNode:a4 toBusinessCategoryNode:a5];
}

- (id)initFromBusinessNode:(id)a3 toBusinessCategoryNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphBusinessCategoryEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"BUSINESSCATEGORY" domain:504];
  return v2;
}

@end