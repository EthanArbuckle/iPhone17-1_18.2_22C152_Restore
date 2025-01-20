@interface OrderedCollectionGroupedInsertion
- (NSArray)insertions;
- (OrderedCollectionGroupedInsertion)initWithType:(int64_t)a3 insertions:(id)a4 associatedObject:(id)a5;
- (id)associatedObject;
- (int64_t)type;
@end

@implementation OrderedCollectionGroupedInsertion

- (void).cxx_destruct
{
  objc_storeStrong(&self->_associatedObject, 0);

  objc_storeStrong((id *)&self->_insertions, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)insertions
{
  return self->_insertions;
}

- (OrderedCollectionGroupedInsertion)initWithType:(int64_t)a3 insertions:(id)a4 associatedObject:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)OrderedCollectionGroupedInsertion;
  v11 = [(OrderedCollectionGroupedInsertion *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_insertions, a4);
    objc_storeStrong(&v12->_associatedObject, a5);
  }

  return v12;
}

- (id)associatedObject
{
  return self->_associatedObject;
}

@end