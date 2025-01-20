@interface PGCurationSetTrait
- (BOOL)isActive;
- (NSSet)items;
- (NSSet)negativeItems;
- (PGCurationSetTrait)initWithItems:(id)a3;
- (PGCurationSetTrait)initWithItems:(id)a3 negativeItems:(id)a4;
- (id)debugDescription;
@end

@implementation PGCurationSetTrait

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (NSSet)negativeItems
{
  return self->_negativeItems;
}

- (NSSet)items
{
  return self->_items;
}

- (id)debugDescription
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PGCurationSetTrait;
  v4 = [(PGCurationTrait *)&v10 debugDescription];
  items = self->_items;
  NSUInteger v6 = [(NSSet *)self->_negativeItems count];
  v7 = @" ";
  if (!v6) {
    v7 = &stru_1F283BC78;
  }
  v8 = [v3 stringWithFormat:@"%@ %@%@%@", v4, items, v7, self->_negativeItems];

  return v8;
}

- (BOOL)isActive
{
  return [(NSSet *)self->_items count] || [(NSSet *)self->_negativeItems count] != 0;
}

- (PGCurationSetTrait)initWithItems:(id)a3 negativeItems:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGCurationSetTrait;
  v9 = [(PGCurationTrait *)&v12 init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_items, a3);
    objc_storeStrong((id *)&v10->_negativeItems, a4);
  }

  return v10;
}

- (PGCurationSetTrait)initWithItems:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  NSUInteger v6 = [v4 set];
  id v7 = [(PGCurationSetTrait *)self initWithItems:v5 negativeItems:v6];

  return v7;
}

@end