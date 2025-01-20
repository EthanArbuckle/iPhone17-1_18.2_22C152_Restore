@interface PGCurationArrayTrait
- (BOOL)isActive;
- (NSArray)items;
- (NSArray)negativeItems;
- (PGCurationArrayTrait)initWithItems:(id)a3;
- (PGCurationArrayTrait)initWithItems:(id)a3 negativeItems:(id)a4;
- (id)debugDescription;
@end

@implementation PGCurationArrayTrait

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (NSArray)negativeItems
{
  return self->_negativeItems;
}

- (NSArray)items
{
  return self->_items;
}

- (id)debugDescription
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PGCurationArrayTrait;
  v4 = [(PGCurationTrait *)&v10 debugDescription];
  items = self->_items;
  NSUInteger v6 = [(NSArray *)self->_negativeItems count];
  v7 = @" ";
  if (!v6) {
    v7 = &stru_1F283BC78;
  }
  v8 = [v3 stringWithFormat:@"%@ %@%@%@", v4, items, v7, self->_negativeItems];

  return v8;
}

- (BOOL)isActive
{
  return [(NSArray *)self->_items count] || [(NSArray *)self->_negativeItems count] != 0;
}

- (PGCurationArrayTrait)initWithItems:(id)a3 negativeItems:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGCurationArrayTrait;
  v9 = [(PGCurationTrait *)&v12 init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_items, a3);
    objc_storeStrong((id *)&v10->_negativeItems, a4);
  }

  return v10;
}

- (PGCurationArrayTrait)initWithItems:(id)a3
{
  return [(PGCurationArrayTrait *)self initWithItems:a3 negativeItems:MEMORY[0x1E4F1CBF0]];
}

@end