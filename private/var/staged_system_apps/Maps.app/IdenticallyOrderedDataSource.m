@interface IdenticallyOrderedDataSource
- (IdenticallyOrderedDataSource)initWithObjects:(id)a3;
- (NSArray)orderedObjects;
- (id)objectAtIndexPath:(id)a3;
- (id)titleForHeaderInSection:(int64_t)a3;
- (id)viewForHeaderInSection:(int64_t)a3 isFirstNonEmptySection:(BOOL)a4;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)setOrderedObjects:(id)a3;
@end

@implementation IdenticallyOrderedDataSource

- (IdenticallyOrderedDataSource)initWithObjects:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IdenticallyOrderedDataSource;
  v5 = [(IdenticallyOrderedDataSource *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    orderedObjects = v5->_orderedObjects;
    v5->_orderedObjects = v6;
  }
  return v5;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  v3 = [(IdenticallyOrderedDataSource *)self orderedObjects];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 row];
  v6 = [(IdenticallyOrderedDataSource *)self orderedObjects];
  id v7 = [v6 count];

  if (v5 >= v7)
  {
    objc_super v9 = 0;
  }
  else
  {
    v8 = [(IdenticallyOrderedDataSource *)self orderedObjects];
    objc_super v9 = [v8 objectAtIndexedSubscript:[v4 row]];
  }

  return v9;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  return 0;
}

- (id)viewForHeaderInSection:(int64_t)a3 isFirstNonEmptySection:(BOOL)a4
{
  return 0;
}

- (NSArray)orderedObjects
{
  return self->_orderedObjects;
}

- (void)setOrderedObjects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end