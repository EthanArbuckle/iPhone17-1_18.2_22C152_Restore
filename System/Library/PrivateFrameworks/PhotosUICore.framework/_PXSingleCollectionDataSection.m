@interface _PXSingleCollectionDataSection
- (PXDisplayCollection)displayCollection;
- (_PXSingleCollectionDataSection)initWithDisplayCollection:(id)a3 lockState:(unint64_t)a4 outlineObject:(id)a5;
- (id)objectAtIndex:(int64_t)a3;
- (int64_t)count;
- (int64_t)indexOfCollection:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)lockState;
- (unint64_t)lockStateForCollection:(id)a3;
@end

@implementation _PXSingleCollectionDataSection

- (void).cxx_destruct
{
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (PXDisplayCollection)displayCollection
{
  return self->_displayCollection;
}

- (int64_t)count
{
  return self->_count;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  if (var0 >= [(_PXSingleCollectionDataSection *)self count]) {
    return 0;
  }
  unint64_t result = 1;
  a3->unint64_t var0 = 1;
  a3->var1 = (id *)self->_collectionArray;
  a3->var2 = &self->_enumerationMutations;
  return result;
}

- (id)objectAtIndex:(int64_t)a3
{
  if ([(_PXSingleCollectionDataSection *)self count] <= a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"%p: index (%lu) beyond bounds (%lu)", self, a3, -[_PXSingleCollectionDataSection count](self, "count"));
    v5 = 0;
  }
  else
  {
    v5 = self->_displayCollection;
  }
  return v5;
}

- (unint64_t)lockStateForCollection:(id)a3
{
  return self->_lockState;
}

- (int64_t)indexOfCollection:(id)a3
{
  if ([a3 isEqual:self->_displayCollection]) {
    return 0;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (_PXSingleCollectionDataSection)initWithDisplayCollection:(id)a3 lockState:(unint64_t)a4 outlineObject:(id)a5
{
  v9 = (PXDisplayCollection *)a3;
  v13.receiver = self;
  v13.super_class = (Class)_PXSingleCollectionDataSection;
  v10 = [(PXDataSection *)&v13 initWithOutlineObject:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_displayCollection, a3);
    v11->_collectionArray[0] = v9;
    v11->_lockState = a4;
    v11->_count = v9 != 0;
  }

  return v11;
}

@end