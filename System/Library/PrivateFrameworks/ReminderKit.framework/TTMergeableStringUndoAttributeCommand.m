@interface TTMergeableStringUndoAttributeCommand
- (BOOL)addToGroup:(id)a3;
- (BOOL)hasTopoIDsThatCanChange;
- (NSString)description;
- (TTMergeableStringUndoAttributeCommand)init;
- (void)applyToString:(id)a3;
- (void)attributeRanges;
- (void)dealloc;
- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4;
@end

@implementation TTMergeableStringUndoAttributeCommand

- (TTMergeableStringUndoAttributeCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)TTMergeableStringUndoAttributeCommand;
  if ([(TTMergeableStringUndoAttributeCommand *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  attributeRanges = self->_attributeRanges;
  if (attributeRanges)
  {
    v5 = (void **)self->_attributeRanges;
    std::vector<std::pair<TopoIDRange,NSDictionary * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x1BA9DB510](attributeRanges, 0x20C40960023A9);
  }
  v4.receiver = self;
  v4.super_class = (Class)TTMergeableStringUndoAttributeCommand;
  [(TTMergeableStringUndoAttributeCommand *)&v4 dealloc];
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  attributeRanges = (uint64_t *)self->_attributeRanges;
  v8 = (TopoIDRange *)*attributeRanges;
  v9 = (TopoIDRange *)attributeRanges[1];
  if ((TopoIDRange *)*attributeRanges != v9)
  {
    v16 = self;
    do
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      updateTopoIDRange(v8, a3, (uint64_t)a4, &v21);
      uint64_t v10 = v21;
      uint64_t v11 = v22;
      while (v10 != v11)
      {
        id v12 = *(id *)v10;
        int v13 = *(_DWORD *)(v10 + 8);
        int v14 = *(_DWORD *)(v10 + 16);
        v15 = (void **)v12;
        v17 = v15;
        int v18 = v13;
        int v19 = v14;
        id v20 = v8[1].var0.var0;
        std::vector<std::pair<TopoIDRange,NSDictionary * {__strong}>>::push_back[abi:ne180100](&v24, (uint64_t *)&v17);

        v10 += 24;
      }
      v17 = (void **)&v21;
      std::vector<TopoIDRange>::__destroy_vector::operator()[abi:ne180100](&v17);
      v8 = (TopoIDRange *)((char *)v8 + 32);
    }
    while (v8 != v9);
    attributeRanges = (uint64_t *)v16->_attributeRanges;
  }
  if (attributeRanges != &v24) {
    std::vector<std::pair<TopoIDRange,NSDictionary * {__strong}>>::__assign_with_size[abi:ne180100]<std::pair<TopoIDRange,NSDictionary * {__strong}>*,std::pair<TopoIDRange,NSDictionary * {__strong}>*>(attributeRanges, v24, v25, (v25 - v24) >> 5);
  }
  v17 = (void **)&v24;
  std::vector<std::pair<TopoIDRange,NSDictionary * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v17);
}

- (BOOL)hasTopoIDsThatCanChange
{
  attributeRanges = self->_attributeRanges;
  uint64_t v3 = attributeRanges[1];
  if (*attributeRanges == v3) {
    return 0;
  }
  uint64_t v4 = *attributeRanges + 32;
  do
  {
    v5 = *(void **)(v4 - 32);
    v6 = +[TTMergeableString unserialisedReplicaID];

    BOOL result = v5 == v6;
    BOOL v8 = v5 == v6 || v4 == v3;
    v4 += 32;
  }
  while (!v8);
  return result;
}

- (void)applyToString:(id)a3
{
  id v4 = a3;
  [v4 beginEditing];
  attributeRanges = (uint64_t *)self->_attributeRanges;
  uint64_t v6 = *attributeRanges;
  uint64_t v7 = attributeRanges[1];
  while (v6 != v7)
  {
    v15 = 0;
    v16 = 0;
    uint64_t v17 = 0;
    id v8 = *(id *)v6;
    id v12 = v8;
    int v9 = *(_DWORD *)(v6 + 16);
    LODWORD(v13) = *(_DWORD *)(v6 + 8);
    LODWORD(v14) = v9;
    if (v4) {
      [v4 getSubstrings:&v15 forTopoIDRange:&v12];
    }
    else {

    }
    uint64_t v10 = v15;
    uint64_t v11 = v16;
    if (v15 != v16)
    {
      do
        objc_msgSend(v4, "setAttributes:substring:", *(void *)(v6 + 24), *v10++, v12, v13, v14);
      while (v10 != v11);
      uint64_t v10 = v15;
    }
    if (v10)
    {
      v16 = v10;
      operator delete(v10);
    }
    v6 += 32;
  }
  [v4 endEditing];
}

- (BOOL)addToGroup:(id)a3
{
  id v4 = a3;
  v5 = [(TTMergeableStringUndoAttributeCommand *)self attributeRanges];
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  if (*v5 == v7)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    int v8 = 0;
    do
    {
      id v9 = *(id *)v6;
      id v12 = v9;
      int v10 = *(_DWORD *)(v6 + 16);
      int v13 = *(_DWORD *)(v6 + 8);
      int v14 = v10;
      if (v4) {
        v8 |= [v4 addSeenRange:&v12];
      }
      else {

      }
      v6 += 32;
    }
    while (v6 != v7);
  }

  return v8 & 1;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v3, "appendFormat:", @"<TTMergeableStringUndoAttributeCommand %p ", self);
  attributeRanges = (uint64_t *)self->_attributeRanges;
  uint64_t v5 = *attributeRanges;
  uint64_t v6 = attributeRanges[1];
  if (*attributeRanges != v6)
  {
    do
    {
      uint64_t v7 = [*(id *)v5 TTShortDescription];
      [v3 appendFormat:@"%@:%d-%u => %@ ", v7, *(unsigned int *)(v5 + 8), (*(_DWORD *)(v5 + 8) + *(_DWORD *)(v5 + 16) - 1), *(void *)(v5 + 24)];

      v5 += 32;
    }
    while (v5 != v6);
  }
  [v3 appendFormat:@">"];

  return (NSString *)v3;
}

- (void)attributeRanges
{
  return self->_attributeRanges;
}

@end