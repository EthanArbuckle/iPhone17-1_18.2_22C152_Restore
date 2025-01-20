@interface TTMergeableStringUndoEditCommand
- (BOOL)addToGroup:(id)a3;
- (BOOL)hasTopoIDsThatCanChange;
- (NSString)description;
- (TTMergeableStringUndoEditCommand)init;
- (void)applyToString:(id)a3;
- (void)dealloc;
- (void)deleteRanges;
- (void)insertStrings;
- (void)updateInsertTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4;
- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4;
@end

@implementation TTMergeableStringUndoEditCommand

- (TTMergeableStringUndoEditCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)TTMergeableStringUndoEditCommand;
  if ([(TTMergeableStringUndoEditCommand *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  deleteRanges = self->_deleteRanges;
  if (deleteRanges)
  {
    v6 = (void **)self->_deleteRanges;
    std::vector<TopoIDRange>::__destroy_vector::operator()[abi:ne180100](&v6);
    MEMORY[0x1BA9DB510](deleteRanges, 0x20C40960023A9);
  }
  insertStrings = self->_insertStrings;
  if (insertStrings)
  {
    v6 = (void **)self->_insertStrings;
    std::vector<std::pair<TopoIDRange,NSDictionary * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v6);
    MEMORY[0x1BA9DB510](insertStrings, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)TTMergeableStringUndoEditCommand;
  [(TTMergeableStringUndoEditCommand *)&v5 dealloc];
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  deleteRanges = (uint64_t *)self->_deleteRanges;
  v8 = (TopoIDRange *)*deleteRanges;
  v9 = (TopoIDRange *)deleteRanges[1];
  if ((TopoIDRange *)*deleteRanges != v9)
  {
    do
      updateTopoIDRange(v8++, a3, (uint64_t)a4, &v18);
    while (v8 != v9);
    deleteRanges = (uint64_t *)self->_deleteRanges;
  }
  if (deleteRanges != &v18) {
    std::vector<TopoIDRange>::__assign_with_size[abi:ne180100]<TopoIDRange*,TopoIDRange*>((uint64_t)deleteRanges, v18, v19, 0xAAAAAAAAAAAAAAABLL * ((v19 - v18) >> 3));
  }
  id v15 = a3->var0.var0;
  unsigned int var1 = a3->var1;
  unsigned int v16 = a3->var0.var1;
  unsigned int v17 = var1;
  id v12 = a4->var0.var0;
  unsigned int v11 = a4->var1;
  unsigned int v13 = a4->var0.var1;
  unsigned int v14 = v11;
  [(TTMergeableStringUndoEditCommand *)self updateInsertTopoIDRange:&v15 toNewRangeID:&v12];
  v21 = (void **)&v18;
  std::vector<TopoIDRange>::__destroy_vector::operator()[abi:ne180100](&v21);
}

- (BOOL)hasTopoIDsThatCanChange
{
  deleteRanges = (id **)self->_deleteRanges;
  v4 = *deleteRanges;
  objc_super v5 = deleteRanges[1];
  if (*deleteRanges == v5)
  {
LABEL_4:
    insertStrings = (id **)self->_insertStrings;
    v9 = *insertStrings;
    v10 = insertStrings[1];
    if (*insertStrings == v10)
    {
      return 0;
    }
    else
    {
      do
      {
        id v11 = *v9;
        id v12 = v9[3];
        id v13 = +[TTMergeableString unserialisedReplicaID];

        BOOL result = v11 == v13;
        v9 += 4;
      }
      while (v11 != v13 && v9 != v10);
    }
  }
  else
  {
    while (1)
    {
      id v6 = *v4;
      id v7 = +[TTMergeableString unserialisedReplicaID];

      if (v6 == v7) {
        return 1;
      }
      v4 += 3;
      if (v4 == v5) {
        goto LABEL_4;
      }
    }
  }
  return result;
}

- (void)updateInsertTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  insertStrings = (uint64_t *)self->_insertStrings;
  uint64_t v7 = *insertStrings;
  uint64_t v8 = insertStrings[1];
  while (v7 != v8)
  {
    if ([*(id *)v7 isEqual:a3->var0.var0])
    {
      unsigned int v9 = *(_DWORD *)(v7 + 8);
      unsigned int var1 = a3->var0.var1;
      if (v9 >= var1 && (v9 != var1 || [*(id *)v7 TTCompare:a3->var0.var0] != -1))
      {
        id v11 = a3->var0.var0;
        id v12 = (void *)(a3->var1 + a3->var0.var1);
        v14[0] = v11;
        v14[1] = v12;
        BOOL v13 = TopoID::operator>=(v7, v14);

        if (!v13)
        {
          objc_storeStrong((id *)v7, a4->var0.var0);
          *(_DWORD *)(v7 + 8) = *(_DWORD *)(v7 + 8) + a4->var0.var1 - a3->var0.var1;
        }
      }
    }
    v7 += 32;
  }
}

- (void)applyToString:(id)a3
{
  id v4 = a3;
  deleteRanges = (uint64_t *)self->_deleteRanges;
  uint64_t v7 = *deleteRanges;
  uint64_t v6 = deleteRanges[1];
  if (v6 != *deleteRanges)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    do
    {
      id v8 = *(id *)v7;
      int v9 = *(_DWORD *)(v7 + 8);
      int v10 = *(_DWORD *)(v7 + 16);
      id v11 = v8;
      id v12 = v11;
      id v16 = v11;
      int v17 = v9;
      int v18 = v10;
      if (v4) {
        [v4 getSubstrings:&v19 forTopoIDRange:&v16];
      }
      else {

      }
      v7 += 24;
    }
    while (v7 != v6);
    __p = 0;
    unsigned int v14 = 0;
    uint64_t v15 = 0;
    [v4 getCharacterRanges:&__p forSubstrings:&v19];
    [v4 deleteSubstrings:&v19 withCharacterRanges:&__p];
    if (__p)
    {
      unsigned int v14 = __p;
      operator delete(__p);
    }
    if (v19)
    {
      uint64_t v20 = v19;
      operator delete(v19);
    }
  }
  if (*((void *)self->_insertStrings + 1) != *(void *)self->_insertStrings) {
    objc_msgSend(v4, "undeleteSubstrings:");
  }
}

- (BOOL)addToGroup:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TTMergeableStringUndoEditCommand *)self deleteRanges];
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  while (v6 != v7)
  {
    id v8 = *(id *)v6;
    id v11 = v8;
    int v9 = *(_DWORD *)(v6 + 16);
    int v12 = *(_DWORD *)(v6 + 8);
    int v13 = v9;
    if (v4) {
      [v4 addSeenRange:&v11];
    }
    else {

    }
    v6 += 24;
  }

  return 1;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v3, "appendFormat:", @"<TTMergeableStringUndoEditCommand %p Delete:", self);
  deleteRanges = (uint64_t *)self->_deleteRanges;
  uint64_t v5 = *deleteRanges;
  uint64_t v6 = deleteRanges[1];
  if (*deleteRanges != v6)
  {
    do
    {
      uint64_t v7 = [*(id *)v5 TTShortDescription];
      [v3 appendFormat:@"%@:%d-%u, ", v7, *(unsigned int *)(v5 + 8), (*(_DWORD *)(v5 + 8) + *(_DWORD *)(v5 + 16) - 1)];

      v5 += 24;
    }
    while (v5 != v6);
  }
  [v3 appendFormat:@"  Insert:"];
  insertStrings = (uint64_t *)self->_insertStrings;
  uint64_t v9 = *insertStrings;
  uint64_t v10 = insertStrings[1];
  if (*insertStrings != v10)
  {
    do
    {
      id v11 = [*(id *)v9 TTShortDescription];
      [v3 appendFormat:@"%@:%d-%u=>'%@', ", v11, *(unsigned int *)(v9 + 8), (*(_DWORD *)(v9 + 8) + *(_DWORD *)(v9 + 16) - 1), *(void *)(v9 + 24)];

      v9 += 32;
    }
    while (v9 != v10);
  }
  [v3 appendFormat:@">"];

  return (NSString *)v3;
}

- (void)deleteRanges
{
  return self->_deleteRanges;
}

- (void)insertStrings
{
  return self->_insertStrings;
}

@end