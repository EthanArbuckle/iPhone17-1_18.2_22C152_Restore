@interface PLSortedChangedObjects
- (NSArray)changedObjects;
- (PLSortedChangedObjects)initWithChangedObjects:(id)a3;
- (id)sortedObjectPointers;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation PLSortedChangedObjects

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  free(self->_sortedObjectPointers);
  v3.receiver = self;
  v3.super_class = (Class)PLSortedChangedObjects;
  [(PLSortedChangedObjects *)&v3 dealloc];
}

- (PLSortedChangedObjects)initWithChangedObjects:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLSortedChangedObjects;
  v6 = [(PLSortedChangedObjects *)&v10 init];
  if (v6)
  {
    size_t v7 = [v5 count];
    v6->_count = v7;
    objc_storeStrong((id *)&v6->_changedObjects, a3);
    v8 = (id *)malloc_type_calloc(v7, 8uLL, 0x80040B8603338uLL);
    v6->_sortedObjectPointers = v8;
    objc_msgSend(v5, "getObjects:range:", v8, 0, v7);
    qsort(v6->_sortedObjectPointers, v7, 8uLL, (int (__cdecl *)(const void *, const void *))_pointerComparator);
  }

  return v6;
}

- (id)sortedObjectPointers
{
  return self->_sortedObjectPointers;
}

- (NSArray)changedObjects
{
  return self->_changedObjects;
}

@end