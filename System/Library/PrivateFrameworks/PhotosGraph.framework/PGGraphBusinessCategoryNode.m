@interface PGGraphBusinessCategoryNode
+ (MARelation)businessOfCategory;
+ (id)filter;
+ (id)filterWithCategories:(id)a3;
+ (id)filterWithCategory:(id)a3;
- (PGGraphBusinessCategoryNode)initWithLabel:(id)a3;
- (PGGraphBusinessCategoryNodeCollection)collection;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphBusinessCategoryNode

- (void).cxx_destruct
{
}

- (id)label
{
  return self->_label;
}

- (PGGraphBusinessCategoryNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphBusinessCategoryNodeCollection alloc] initWithNode:self];
  return v2;
}

- (unsigned)domain
{
  return 504;
}

- (PGGraphBusinessCategoryNode)initWithLabel:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphBusinessCategoryNode;
  v5 = [(PGGraphNode *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;
  }
  return v5;
}

+ (id)filterWithCategory:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithLabel:v4 domain:504];

  return v5;
}

+ (id)filterWithCategories:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = (void *)[v5 initWithLabels:v4 domain:504 properties:MEMORY[0x1E4F1CC08]];

  return v6;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:504];
  return v2;
}

+ (MARelation)businessOfCategory
{
  v2 = +[PGGraphBusinessCategoryEdge filter];
  v3 = [v2 inRelation];

  return (MARelation *)v3;
}

@end