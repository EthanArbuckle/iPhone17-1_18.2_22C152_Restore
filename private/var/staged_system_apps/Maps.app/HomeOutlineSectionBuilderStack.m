@interface HomeOutlineSectionBuilderStack
- (HomeOutlineSectionBuilderStack)initWithSectionIdentifier:(id)a3 sectionIndex:(int64_t)a4;
- (IdentifierPath)topIdentifierPath;
- (NSArray)identifiers;
- (NSArray)indices;
- (NSArray)items;
- (id)parentItem;
- (int64_t)topIndex;
- (unint64_t)depth;
- (void)_pop;
- (void)_pushItem:(id)a3 index:(int64_t)a4;
- (void)_setTopIdentifier:(id)a3;
@end

@implementation HomeOutlineSectionBuilderStack

- (HomeOutlineSectionBuilderStack)initWithSectionIdentifier:(id)a3 sectionIndex:(int64_t)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HomeOutlineSectionBuilderStack;
  v7 = [(HomeOutlineSectionBuilderStack *)&v21 init];
  v8 = v7;
  if (v7)
  {
    v7->_depth = 1;
    v9 = +[NSNull null];
    v24 = v9;
    v10 = +[NSArray arrayWithObjects:&v24 count:1];
    uint64_t v11 = +[NSMutableArray arrayWithArray:v10];
    items = v8->_items;
    v8->_items = (NSMutableArray *)v11;

    id v23 = v6;
    v13 = +[NSArray arrayWithObjects:&v23 count:1];
    uint64_t v14 = +[NSMutableArray arrayWithArray:v13];
    identifiers = v8->_identifiers;
    v8->_identifiers = (NSMutableArray *)v14;

    v16 = +[NSNumber numberWithInteger:a4];
    v22 = v16;
    v17 = +[NSArray arrayWithObjects:&v22 count:1];
    uint64_t v18 = +[NSMutableArray arrayWithArray:v17];
    indices = v8->_indices;
    v8->_indices = (NSMutableArray *)v18;
  }
  return v8;
}

- (void)_pushItem:(id)a3 index:(int64_t)a4
{
  ++self->_depth;
  [(NSMutableArray *)self->_items addObject:a3];
  [(NSMutableArray *)self->_identifiers addObject:&stru_101324E70];
  indices = self->_indices;
  v7 = +[NSNumber numberWithInteger:a4];
  [(NSMutableArray *)indices addObject:v7];

  topIdentifierPath = self->_topIdentifierPath;
  self->_topIdentifierPath = 0;
}

- (void)_setTopIdentifier:(id)a3
{
  unint64_t depth = self->_depth;
  if (depth >= 2)
  {
    [(NSMutableArray *)self->_identifiers setObject:a3 atIndexedSubscript:depth - 1];
    topIdentifierPath = self->_topIdentifierPath;
    self->_topIdentifierPath = 0;
  }
}

- (void)_pop
{
  unint64_t depth = self->_depth;
  if (depth >= 2)
  {
    self->_unint64_t depth = depth - 1;
    [(NSMutableArray *)self->_items removeLastObject];
    [(NSMutableArray *)self->_identifiers removeLastObject];
    [(NSMutableArray *)self->_indices removeLastObject];
    topIdentifierPath = self->_topIdentifierPath;
    self->_topIdentifierPath = 0;
  }
}

- (id)parentItem
{
  unint64_t depth = self->_depth;
  if (depth >= 2)
  {
    v3 = [(NSMutableArray *)self->_items objectAtIndexedSubscript:depth - 2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (IdentifierPath)topIdentifierPath
{
  v3 = [(NSMutableArray *)self->_identifiers lastObject];
  id v4 = [v3 length];

  if (v4)
  {
    topIdentifierPath = self->_topIdentifierPath;
    if (!topIdentifierPath)
    {
      id v6 = +[IdentifierPath identifierPathWithIdentifiers:self->_identifiers];
      v7 = self->_topIdentifierPath;
      self->_topIdentifierPath = v6;

      topIdentifierPath = self->_topIdentifierPath;
    }
    v8 = topIdentifierPath;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)topIndex
{
  v2 = [(NSMutableArray *)self->_indices lastObject];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (unint64_t)depth
{
  return self->_depth;
}

- (NSArray)items
{
  return &self->_items->super;
}

- (NSArray)identifiers
{
  return &self->_identifiers->super;
}

- (NSArray)indices
{
  return &self->_indices->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topIdentifierPath, 0);
  objc_storeStrong((id *)&self->_indices, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end