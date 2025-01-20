@interface TSTMergeRangeSortedSet
- ($CA3468F20078D5D2DB35E78E73CA60DA)begin;
- ($CA3468F20078D5D2DB35E78E73CA60DA)iter;
- (BOOL)isCheckbox;
- (CGSize)getSize;
- (TSTMergeRangeSortedSet)init;
- (UIEdgeInsets)getPaddingInsets;
- (id).cxx_construct;
- (unint64_t)count;
- (void)addRange:(id)a3 andSize:(CGSize)a4 andPaddingInsets:(UIEdgeInsets)a5 andIsCheckbox:(BOOL)a6;
- (void)dealloc;
- (void)reset;
@end

@implementation TSTMergeRangeSortedSet

- (TSTMergeRangeSortedSet)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSTMergeRangeSortedSet;
  if ([(TSTMergeRangeSortedSet *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  mSet = (void **)self->mSet;
  if (mSet)
  {
    std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)self->mSet, mSet[1]);
    MEMORY[0x223CB8F20](mSet, 0x1020C4062D53EE8);
  }
  dispatch_release((dispatch_object_t)self->mSem);
  v4.receiver = self;
  v4.super_class = (Class)TSTMergeRangeSortedSet;
  [(TSTMergeRangeSortedSet *)&v4 dealloc];
}

- (void)addRange:(id)a3 andSize:(CGSize)a4 andPaddingInsets:(UIEdgeInsets)a5 andIsCheckbox:(BOOL)a6
{
  $CA3468F20078D5D2DB35E78E73CA60DA v7 = a3;
  CGSize v8 = a4;
  UIEdgeInsets v9 = a5;
  int v10 = ((LOBYTE(a3.var1.var0) + a3.var0.var1 - 1) | ((*(_DWORD *)&a3.var0 + a3.var1.var1) << 16))
      - 0x10000;
  BOOL v11 = a6;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mSem, 0xFFFFFFFFFFFFFFFFLL);
  std::__tree<TSTMergeRangeElem,TSTMergeRangeElemCompare,std::allocator<TSTMergeRangeElem>>::__emplace_unique_key_args<TSTMergeRangeElem,TSTMergeRangeElem const&>((uint64_t **)self->mSet, (uint64_t)&v7, &v7);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mSem);
}

- (unint64_t)count
{
  return *((void *)self->mSet + 2);
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)begin
{
  mSet = (void **)self->mSet;
  objc_super v3 = ($CA3468F20078D5D2DB35E78E73CA60DA *)*mSet;
  self->mIter.__ptr_ = *mSet;
  if (v3 == ($CA3468F20078D5D2DB35E78E73CA60DA *)(mSet + 1)) {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  }
  else {
    return v3[4];
  }
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)iter
{
  ptr = self->mIter.__ptr_;
  objc_super v3 = ($CA3468F20078D5D2DB35E78E73CA60DA *)*((void *)ptr + 1);
  if (v3)
  {
    do
    {
      objc_super v4 = v3;
      objc_super v3 = ($CA3468F20078D5D2DB35E78E73CA60DA *)*v3;
    }
    while (v3);
  }
  else
  {
    do
    {
      objc_super v4 = ($CA3468F20078D5D2DB35E78E73CA60DA *)*((void *)ptr + 2);
      BOOL v5 = *v4 == (void)ptr;
      ptr = v4;
    }
    while (!v5);
  }
  self->mIter.__ptr_ = v4;
  if (v4 == ($CA3468F20078D5D2DB35E78E73CA60DA *)self->mSet + 1) {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  }
  else {
    return v4[4];
  }
}

- (CGSize)getSize
{
  ptr = (double *)self->mIter.__ptr_;
  if (ptr == (double *)self->mSet + 1)
  {
    double v3 = 0.0;
    double v4 = 0.0;
  }
  else
  {
    double v3 = ptr[5];
    double v4 = ptr[6];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)isCheckbox
{
  ptr = self->mIter.__ptr_;
  return ptr != (unsigned char *)self->mSet + 8 && ptr[92] != 0;
}

- (UIEdgeInsets)getPaddingInsets
{
  ptr = (double *)self->mIter.__ptr_;
  double v3 = (double *)&TSDEdgeInsetsZero + 1;
  BOOL v4 = ptr == (double *)self->mSet + 1;
  BOOL v5 = ptr + 7;
  v6 = ptr + 8;
  $CA3468F20078D5D2DB35E78E73CA60DA v7 = ptr + 9;
  CGSize v8 = ptr + 10;
  if (v4) {
    BOOL v5 = (double *)&TSDEdgeInsetsZero;
  }
  else {
    double v3 = v6;
  }
  if (v4) {
    UIEdgeInsets v9 = (double *)&qword_223839588;
  }
  else {
    UIEdgeInsets v9 = v7;
  }
  if (v4) {
    CGSize v8 = (double *)&qword_223839590;
  }
  double v10 = *v8;
  double v11 = *v9;
  double v12 = *v5;
  double v13 = *v3;
  result.right = v10;
  result.bottom = v11;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)reset
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mSem, 0xFFFFFFFFFFFFFFFFLL);
  mSet = (char *)self->mSet;
  std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)mSet, *((void **)mSet + 1));
  *(void *)mSet = mSet + 8;
  *((void *)mSet + 2) = 0;
  *((void *)mSet + 1) = 0;
  self->mIter.__ptr_ = *(void **)self->mSet;
  mSem = self->mSem;

  dispatch_semaphore_signal(mSem);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end