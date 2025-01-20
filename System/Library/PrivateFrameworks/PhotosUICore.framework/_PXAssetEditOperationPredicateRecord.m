@interface _PXAssetEditOperationPredicateRecord
- (Class)performerClass;
- (_PXAssetEditOperationPredicateRecord)initWithPerformerClass:(Class)a3 predicate:(id)a4;
- (id)predicate;
@end

@implementation _PXAssetEditOperationPredicateRecord

- (void).cxx_destruct
{
  objc_storeStrong(&self->_predicate, 0);
  objc_storeStrong((id *)&self->_performerClass, 0);
}

- (id)predicate
{
  return self->_predicate;
}

- (Class)performerClass
{
  return self->_performerClass;
}

- (_PXAssetEditOperationPredicateRecord)initWithPerformerClass:(Class)a3 predicate:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXAssetEditOperationPredicateRecord;
  v7 = [(_PXAssetEditOperationPredicateRecord *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_performerClass, a3);
    uint64_t v9 = [v6 copy];
    id predicate = v8->_predicate;
    v8->_id predicate = (id)v9;
  }
  return v8;
}

@end