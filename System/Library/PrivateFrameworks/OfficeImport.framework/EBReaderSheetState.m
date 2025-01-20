@interface EBReaderSheetState
- (EBReaderSheetState)initWithReaderState:(id)a3;
- (id).cxx_construct;
- (id)edSheet;
- (id)readerState;
- (id)resources;
- (id)workbook;
- (unint64_t)nextChartIndex;
- (unint64_t)sharedFormulaIndexForRowCol:(int)a3;
- (void)reportWorksheetWarning:(id)a3;
- (void)setEDSheet:(id)a3;
- (void)setSharedFormulaIndex:(unint64_t)a3 forRowCol:(int)a4;
- (void)xlReader;
@end

@implementation EBReaderSheetState

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 3) = (char *)self + 32;
  return self;
}

- (EBReaderSheetState)initWithReaderState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EBReaderSheetState;
  v6 = [(EBReaderSheetState *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mReaderState, a3);
    v7->mChartIndex = 0;
  }

  return v7;
}

- (id)readerState
{
  return self->mReaderState;
}

- (void)setEDSheet:(id)a3
{
}

- (void)xlReader
{
  return [(EBReaderState *)self->mReaderState xlReader];
}

- (id)edSheet
{
  return self->mEDSheet;
}

- (id)resources
{
  return [(EBState *)self->mReaderState resources];
}

- (void).cxx_destruct
{
  std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)&self->mSharedFormulas, (void *)self->mSharedFormulas.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->mEDSheet, 0);
  objc_storeStrong((id *)&self->mReaderState, 0);
}

- (void)setSharedFormulaIndex:(unint64_t)a3 forRowCol:(int)a4
{
  int v4 = a4;
  id v5 = &v4;
  std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&self->mSharedFormulas, &v4, (uint64_t)&std::piecewise_construct, &v5)[5] = (uint64_t *)a3;
}

- (unint64_t)sharedFormulaIndexForRowCol:(int)a3
{
  left = (char *)self->mSharedFormulas.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->mSharedFormulas.__tree_.__pair1_;
  int v4 = left;
  if (!left) {
    return -1;
  }
  v6 = p_pair1;
  do
  {
    int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 < a3;
    if (v7 >= a3) {
      objc_super v9 = (void **)v4;
    }
    else {
      objc_super v9 = (void **)(v4 + 8);
    }
    if (!v8) {
      v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, unsigned long>, void *>>> *)v4;
    }
    int v4 = (char *)*v9;
  }
  while (*v9);
  if (v6 != p_pair1 && SLODWORD(v6[4].__value_.__left_) <= a3) {
    return (unint64_t)v6[5].__value_.__left_;
  }
  else {
    return -1;
  }
}

- (id)workbook
{
  return [(EBState *)self->mReaderState workbook];
}

- (unint64_t)nextChartIndex
{
  unint64_t mChartIndex = self->mChartIndex;
  self->unint64_t mChartIndex = mChartIndex + 1;
  return mChartIndex;
}

- (void)reportWorksheetWarning:(id)a3
{
  id v5 = a3;
  if (self->mEDSheet)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v4 = [self->mEDSheet worksheetWarnings];
      [v4 addWarning:v5];
    }
  }
}

@end