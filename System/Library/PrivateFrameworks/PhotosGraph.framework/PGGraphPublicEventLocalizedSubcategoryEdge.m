@interface PGGraphPublicEventLocalizedSubcategoryEdge
- (PGGraphPublicEventLocalizedSubcategoryEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromPublicEventNode:(id)a3 toLocalizedCategoryNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphPublicEventLocalizedSubcategoryEdge

- (unsigned)domain
{
  return 902;
}

- (id)label
{
  v2 = @"LOCALIZED_SUBCATEGORY";
  return @"LOCALIZED_SUBCATEGORY";
}

- (PGGraphPublicEventLocalizedSubcategoryEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPublicEventLocalizedSubcategoryEdge *)[(PGGraphPublicEventLocalizedSubcategoryEdge *)self initFromPublicEventNode:a4 toLocalizedCategoryNode:a5];
}

- (id)initFromPublicEventNode:(id)a3 toLocalizedCategoryNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphPublicEventLocalizedSubcategoryEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

@end