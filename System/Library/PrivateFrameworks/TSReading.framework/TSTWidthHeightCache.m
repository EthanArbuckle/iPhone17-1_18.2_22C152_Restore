@interface TSTWidthHeightCache
- (BOOL)deleteColsStartingWith:(unsigned __int8)a3 andEndingWith:(unsigned __int8)a4;
- (BOOL)deleteRowsStartingWith:(unsigned __int16)a3 andEndingWith:(unsigned __int16)a4;
- (BOOL)insertCols:(unsigned __int16)a3 atColumn:(unsigned __int8)a4;
- (BOOL)insertRows:(unsigned __int16)a3 atRow:(unsigned __int16)a4;
- (BOOL)moveColsFrom:(id)a3 toCol:(unsigned __int8)a4;
- (BOOL)moveRowsFrom:(id)a3 toRow:(unsigned __int16)a4;
- (BOOL)resetModelCache;
- (BOOL)resetModelCacheRange:(id)a3;
- (BOOL)setFitDims:(CGSize)a3 forCellID:(id)a4;
- (BOOL)setFitHeight:(double)a3 forCellID:(id)a4;
- (BOOL)setFitWidth:(double)a3 forCellID:(id)a4;
- (BOOL)setModelHeight:(double)a3 forRow:(unsigned __int16)a4;
- (BOOL)setModelWidth:(double)a3 forColumn:(unsigned __int8)a4;
- (BOOL)verifyDims:(CGSize)a3 forCellID:(id)a4;
- (TSTWidthHeightCache)init;
- (TSTWidthHeightCache)initWithNumRows:(unsigned __int16)a3 andNumCols:(unsigned __int16)a4;
- (double)getFitHeightForRow:(unsigned __int16)a3;
- (double)getFitWidthForCol:(unsigned __int8)a3;
- (double)getModelHeightForRow:(unsigned __int16)a3;
- (double)getModelWidthForColumn:(unsigned __int8)a3;
- (id).cxx_construct;
- (id)description;
- (id)getListOfInvalidColsInRow:(unsigned __int16)a3;
- (id)validateChangeDescriptors:(id)a3 tableModel:(id)a4;
- (unint64_t)numModelColumnWidths;
- (unint64_t)numModelRowHeights;
- (unint64_t)resetAllInvalidColsInRow:(unsigned __int16)a3;
- (void)_increaseColCapacity:(unsigned int)a3;
- (void)_increaseRowCapacity:(unsigned int)a3;
- (void)dealloc;
- (void)logInternalState;
- (void)resetAllCol;
- (void)resetAllRow;
- (void)resetColWidthsStartingWith:(unsigned __int8)a3 andEndingWith:(unsigned __int8)a4;
- (void)resetFitHeightForCellID:(id)a3;
- (void)resetRowHeightForCell:(id)a3;
- (void)resetRowHeightsStartingWith:(unsigned __int16)a3 andEndingWith:(unsigned __int16)a4;
- (void)resetWidthsHeightsForRange:(id)a3;
- (void)setNumsRows:(unsigned __int16)a3 andNumCols:(unsigned __int8)a4;
@end

@implementation TSTWidthHeightCache

- (TSTWidthHeightCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSTWidthHeightCache;
  id v2 = [(TSTWidthHeightCache *)&v5 init];
  v3 = (TSTWidthHeightCache *)v2;
  if (v2)
  {
    std::vector<TSTWidthHeightCache_Private::WHCCol>::reserve((uint64_t *)v2 + 1, 0x20uLL);
    v3->mMaxRow = 0;
    v3->mMaxCol = 0;
    pthread_rwlock_init(&v3->mLock, 0);
  }
  return v3;
}

- (TSTWidthHeightCache)initWithNumRows:(unsigned __int16)a3 andNumCols:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSTWidthHeightCache;
  v6 = [(TSTWidthHeightCache *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->mMaxRow = v5 - 1;
    v6->mMaxCol = v4 - 1;
    uint64_t v9 = 0;
    std::vector<double>::resize((uint64_t)&v6->mModelRowHeight, v5, &v9);
    uint64_t v9 = 0;
    std::vector<double>::resize((uint64_t)&v7->mModelColumnWidth, v4, &v9);
    [(TSTWidthHeightCache *)v7 _increaseRowCapacity:v5];
    [(TSTWidthHeightCache *)v7 _increaseColCapacity:v4];
    pthread_rwlock_init(&v7->mLock, 0);
  }
  return v7;
}

- (void)dealloc
{
  pthread_rwlock_destroy(&self->mLock);
  v3.receiver = self;
  v3.super_class = (Class)TSTWidthHeightCache;
  [(TSTWidthHeightCache *)&v3 dealloc];
}

- (BOOL)setFitDims:(CGSize)a3 forCellID:(id)a4
{
  LOBYTE(v5) = 0;
  if (a4.var0 != 0xFFFF)
  {
    uint64_t v6 = *(void *)&a4.var0 >> 16;
    if ((unint64_t)a4.var1 << 16 != 16711680)
    {
      double height = a3.height;
      double width = a3.width;
      int var1 = a4.var1;
      p_mLock = &self->mLock;
      pthread_rwlock_wrlock(&self->mLock);
      begin = self->mFittingColumnWidth.__begin_;
      if (a4.var1 >= (unint64_t)((self->mFittingColumnWidth.__end_ - begin) >> 5))
      {
        std::vector<TSTWidthHeightCache_Private::WHCCol>::resize((uint64_t *)&self->mFittingColumnWidth, (var1 + 1));
        begin = self->mFittingColumnWidth.__begin_;
      }
      int v13 = TSTWidthHeightCache_Private::WHCCol::setWidth((TSTWidthHeightCache_Private::WHCCol *)((char *)begin + 32 * a4.var1), a4.var0, width);
      v14 = self->mFittingRowHeight.__begin_;
      end = self->mFittingRowHeight.__end_;
      p_mFittingRowHeight = (uint64_t *)&self->mFittingRowHeight;
      if (a4.var0 >= 0xCF3CF3CF3CF3CF3DLL * ((end - v14) >> 3))
      {
        std::vector<TSTWidthHeightCache_Private::WHCRow>::resize(p_mFittingRowHeight, a4.var0 + 1);
        v14 = (WHCRow *)*p_mFittingRowHeight;
      }
      int v5 = v13 | TSTWidthHeightCache_Private::WHCRow::setHeight((TSTWidthHeightCache_Private::WHCRow *)((char *)v14 + 168 * a4.var0), v6, height);
      pthread_rwlock_unlock(p_mLock);
    }
  }
  return v5;
}

- (BOOL)setFitWidth:(double)a3 forCellID:(id)a4
{
  if (a4.var0 == 0xFFFF) {
    return 0;
  }
  int var1 = a4.var1;
  if (a4.var1 << 16 == 16711680) {
    return 0;
  }
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingColumnWidth.__begin_;
  end = self->mFittingColumnWidth.__end_;
  p_mFittingColumnWidth = (uint64_t *)&self->mFittingColumnWidth;
  if (a4.var1 >= (unint64_t)((end - begin) >> 5))
  {
    std::vector<TSTWidthHeightCache_Private::WHCCol>::resize(p_mFittingColumnWidth, (var1 + 1));
    begin = (WHCCol *)*p_mFittingColumnWidth;
  }
  char v12 = TSTWidthHeightCache_Private::WHCCol::setWidth((TSTWidthHeightCache_Private::WHCCol *)((char *)begin + 32 * a4.var1), a4.var0, a3);
  pthread_rwlock_unlock(p_mLock);
  return v12;
}

- (BOOL)setFitHeight:(double)a3 forCellID:(id)a4
{
  unint64_t var0 = a4.var0;
  if (a4.var0 == 0xFFFFLL || (*(void *)&a4.var0 & 0xFF0000) == 0xFF0000) {
    return 0;
  }
  uint64_t v7 = *(void *)&a4.var0 >> 16;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  end = self->mFittingRowHeight.__end_;
  p_mFittingRowHeight = (uint64_t *)&self->mFittingRowHeight;
  if (var0 >= 0xCF3CF3CF3CF3CF3DLL * ((end - begin) >> 3))
  {
    std::vector<TSTWidthHeightCache_Private::WHCRow>::resize(p_mFittingRowHeight, var0 + 1);
    begin = (WHCRow *)*p_mFittingRowHeight;
  }
  char v12 = TSTWidthHeightCache_Private::WHCRow::setHeight((TSTWidthHeightCache_Private::WHCRow *)((char *)begin + 168 * var0), v7, a3);
  pthread_rwlock_unlock(p_mLock);
  return v12;
}

- (BOOL)setModelWidth:(double)a3 forColumn:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mModelColumnWidth.__begin_;
  unint64_t v9 = self->mModelColumnWidth.__end_ - begin;
  if (v9 > v4) {
    begin[v4] = a3;
  }
  BOOL v10 = v9 > v4;
  pthread_rwlock_unlock(p_mLock);
  return v10;
}

- (BOOL)setModelHeight:(double)a3 forRow:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mModelRowHeight.__begin_;
  unint64_t v9 = self->mModelRowHeight.__end_ - begin;
  if (v9 > v4) {
    begin[v4] = a3;
  }
  BOOL v10 = v9 > v4;
  pthread_rwlock_unlock(p_mLock);
  return v10;
}

- (BOOL)resetModelCache
{
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mModelRowHeight.__begin_;
  uint64_t v5 = (char *)self->mModelRowHeight.__end_ - (char *)begin;
  if (v5 >= 1) {
    bzero(begin, 8 * (((unint64_t)v5 >> 3) - ((unint64_t)v5 > 7)) + 8);
  }
  uint64_t v6 = self->mModelColumnWidth.__begin_;
  uint64_t v7 = (char *)self->mModelColumnWidth.__end_ - (char *)v6;
  if (v7 >= 1) {
    bzero(v6, 8 * (((unint64_t)v7 >> 3) - ((unint64_t)v7 > 7)) + 8);
  }
  pthread_rwlock_unlock(p_mLock);
  return 1;
}

- (unint64_t)numModelColumnWidths
{
  p_mLock = &self->mLock;
  pthread_rwlock_rdlock(&self->mLock);
  unint64_t v4 = self->mModelColumnWidth.__end_ - self->mModelColumnWidth.__begin_;
  pthread_rwlock_rdlock(p_mLock);
  return v4;
}

- (unint64_t)numModelRowHeights
{
  p_mLock = &self->mLock;
  pthread_rwlock_rdlock(&self->mLock);
  unint64_t v4 = self->mModelRowHeight.__end_ - self->mModelRowHeight.__begin_;
  pthread_rwlock_rdlock(p_mLock);
  return v4;
}

- (BOOL)resetModelCacheRange:(id)a3
{
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mModelRowHeight.__begin_;
  uint64_t v7 = self->mModelRowHeight.__end_ - begin;
  unsigned int v8 = (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1);
  if (v8 < v7) {
    LODWORD(v7) = v8 + 1;
  }
  uint64_t v9 = 8 * v7 - 8 * a3.var0.var0;
  if (v9 >= 1) {
    bzero(&begin[a3.var0.var0], 8 * (((unint64_t)v9 >> 3) - ((unint64_t)v9 > 7)) + 8);
  }
  BOOL v10 = self->mModelColumnWidth.__begin_;
  uint64_t v11 = self->mModelColumnWidth.__end_ - v10;
  unsigned int v12 = (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1);
  if (v12 < v11) {
    LODWORD(v11) = v12 + 1;
  }
  uint64_t v13 = 8 * v11 - 8 * a3.var0.var1;
  if (v13 >= 1) {
    bzero(&v10[a3.var0.var1], 8 * (((unint64_t)v13 >> 3) - ((unint64_t)v13 > 7)) + 8);
  }
  pthread_rwlock_unlock(p_mLock);
  return 1;
}

- (BOOL)deleteColsStartingWith:(unsigned __int8)a3 andEndingWith:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingColumnWidth.__begin_;
  if (v4 <= ((unint64_t)(self->mFittingColumnWidth.__end_ - begin) >> 5)) {
    unsigned __int8 v9 = v4;
  }
  else {
    unsigned __int8 v9 = (unint64_t)(self->mFittingColumnWidth.__end_ - begin) >> 5;
  }
  uint64_t v10 = v5;
  if (v5 < v9)
  {
    std::vector<TSTWidthHeightCache_Private::WHCCol>::erase((uint64_t)&self->mFittingColumnWidth, (char *)begin + 32 * v5, (uint64_t)begin + 32 * v9);
    for (i = self->mFittingRowHeight.__begin_; i < self->mFittingRowHeight.__end_; i = (WHCRow *)((char *)i + 168))
      TSTWidthHeightCache_Private::WHCRow::resetColDataInRange((uint64_t)i, v5, v9);
  }
  if (v5 != v4)
  {
    unsigned int v12 = self->mModelColumnWidth.__begin_;
    end = self->mModelColumnWidth.__end_;
    v14 = &v12[v5];
    v15 = &v12[v4];
    int64_t v16 = (char *)end - (char *)v15;
    if (end != v15) {
      memmove(&v12[v10], v15, (char *)end - (char *)v15);
    }
    self->mModelColumnWidth.__end_ = (double *)((char *)v14 + v16);
  }
  pthread_rwlock_unlock(p_mLock);
  return 1;
}

- (BOOL)deleteRowsStartingWith:(unsigned __int16)a3 andEndingWith:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  unsigned __int16 v9 = -12483 * ((unint64_t)(self->mFittingRowHeight.__end_ - begin) >> 3);
  if (v4 <= v9) {
    unsigned __int16 v9 = v4;
  }
  int v10 = v9;
  uint64_t v11 = v5;
  if (v9 > v5)
  {
    std::vector<TSTWidthHeightCache_Private::WHCRow>::erase((uint64_t)&self->mFittingRowHeight, (uint64_t)begin + 168 * v5, (long long *)((char *)begin + 168 * v9));
    for (i = (uint64_t **)self->mFittingColumnWidth.__begin_; (WHCCol *)i < self->mFittingColumnWidth.__end_; i += 4)
      TSTWidthHeightCache_Private::WHCCol::removeRowDataInRange(i, v5, v10);
  }
  if (v5 != v4)
  {
    uint64_t v13 = self->mModelRowHeight.__begin_;
    end = self->mModelRowHeight.__end_;
    v15 = &v13[v5];
    int64_t v16 = &v13[v4];
    int64_t v17 = (char *)end - (char *)v16;
    if (end != v16) {
      memmove(&v13[v11], v16, (char *)end - (char *)v16);
    }
    self->mModelRowHeight.__end_ = (double *)((char *)v15 + v17);
  }
  pthread_rwlock_unlock(p_mLock);
  return 1;
}

- (BOOL)insertCols:(unsigned __int16)a3 atColumn:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingColumnWidth.__begin_;
  if (v4 > (unint64_t)((self->mFittingColumnWidth.__end_ - begin) >> 5))
  {
    std::vector<TSTWidthHeightCache_Private::WHCCol>::resize((uint64_t *)&self->mFittingColumnWidth, v4);
    begin = self->mFittingColumnWidth.__begin_;
  }
  __p = 0;
  uint64_t v13 = 0;
  char v15 = 0;
  uint64_t v14 = 0;
  std::vector<TSTWidthHeightCache_Private::WHCCol>::insert((uint64_t *)&self->mFittingColumnWidth, (char *)begin + 32 * v4, v5, (unint64_t)&__p);
  if (__p)
  {
    uint64_t v13 = __p;
    operator delete(__p);
  }
  for (i = self->mFittingRowHeight.__begin_; i < self->mFittingRowHeight.__end_; i = (WHCRow *)((char *)i + 168))
    TSTWidthHeightCache_NibArray::NibArray<8u>::insert((uint64_t)i, v5, v4, 15);
  int v10 = (char *)&self->mModelColumnWidth.__begin_[v4];
  __p = 0;
  std::vector<double>::insert((uint64_t)&self->mModelColumnWidth, v10, v5, (char *)&__p);
  pthread_rwlock_unlock(p_mLock);
  return 1;
}

- (BOOL)insertRows:(unsigned __int16)a3 atRow:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - begin) >> 3) < v4)
  {
    std::vector<TSTWidthHeightCache_Private::WHCRow>::resize((uint64_t *)&self->mFittingRowHeight, v4);
    begin = self->mFittingRowHeight.__begin_;
  }
  char v19 = 0;
  uint64_t v9 = (uint64_t)begin + 168 * v4;
  *(_OWORD *)__p = 0u;
  long long v18 = 0u;
  *(void *)&long long v10 = -1;
  *((void *)&v10 + 1) = -1;
  v16[0] = v10;
  v16[1] = v10;
  v16[2] = v10;
  v16[3] = v10;
  v16[4] = v10;
  v16[5] = v10;
  v16[6] = v10;
  v16[7] = v10;
  uint64_t v14 = (char *)&v18 + 8;
  int v15 = 0;
  std::__fill_n[abi:nn180100]<false,std::__bitset<1ul,14ul>>((uint64_t)&v14, 0xEuLL);
  std::vector<TSTWidthHeightCache_Private::WHCRow>::insert((uint64_t *)&self->mFittingRowHeight, v9, v5, (unint64_t)v16);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  for (i = (uint64_t *)self->mFittingColumnWidth.__begin_; (WHCCol *)i < self->mFittingColumnWidth.__end_; i += 4)
    TSTWidthHeightCache_Private::WHCCol::insertRows(i, v5, v4);
  unsigned int v12 = (char *)&self->mModelRowHeight.__begin_[v4];
  *(void *)&v16[0] = 0;
  std::vector<double>::insert((uint64_t)&self->mModelRowHeight, v12, v5, (char *)v16);
  pthread_rwlock_unlock(p_mLock);
  return 1;
}

- (BOOL)moveRowsFrom:(id)a3 toRow:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  unsigned __int16 var0 = a3.var0.var0;
  unint64_t var1 = a3.var1.var1;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  unsigned int v8 = var1 + var0;
  if (v8 <= v4) {
    unint64_t v9 = v4;
  }
  else {
    unint64_t v9 = v8;
  }
  begin = self->mFittingRowHeight.__begin_;
  p_mFittingRowHeight = &self->mFittingRowHeight;
  if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - begin) >> 3) < v9)
  {
    std::vector<TSTWidthHeightCache_Private::WHCRow>::resize((uint64_t *)&self->mFittingRowHeight, v9);
    begin = p_mFittingRowHeight->__begin_;
  }
  uint64_t v12 = (uint64_t)begin + 168 * var0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  std::vector<TSTWidthHeightCache_Private::WHCRow>::__assign_with_size[abi:nn180100]<std::__wrap_iter<TSTWidthHeightCache_Private::WHCRow*>,std::__wrap_iter<TSTWidthHeightCache_Private::WHCRow*>>(&v24, v12, v12 + 168 * var1, var1);
  unint64_t v13 = (unint64_t)begin + 168 * v4;
  if (v12 + 168 * (unint64_t)var1 >= v13)
  {
    std::__copy_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TSTWidthHeightCache_Private::WHCRow *,TSTWidthHeightCache_Private::WHCRow *,TSTWidthHeightCache_Private::WHCRow *>((uint64_t)&v27, v13, v12, v12 + 168 * var1);
  }
  else
  {
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TSTWidthHeightCache_Private::WHCRow *,TSTWidthHeightCache_Private::WHCRow *,TSTWidthHeightCache_Private::WHCRow *>((uint64_t)&v27, v12 + 168 * var1, v13, v12);
    unint64_t v13 = (unint64_t)p_mFittingRowHeight->__begin_ + 168 * (int)(v4 - var1);
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TSTWidthHeightCache_Private::WHCRow *,TSTWidthHeightCache_Private::WHCRow *,TSTWidthHeightCache_Private::WHCRow *>((uint64_t)&v27, v24, v25, v13);
  for (i = (unint64_t *)self->mFittingColumnWidth.__begin_; (WHCCol *)i < self->mFittingColumnWidth.__end_; i += 4)
    TSTWidthHeightCache_Private::WHCCol::moveRowIds(i, var0, var1, v4);
  int v15 = self->mModelRowHeight.__begin_;
  end = self->mModelRowHeight.__end_;
  p_mModelRowHeight = &self->mModelRowHeight;
  if (v9 > end - v15)
  {
    v28 = 0;
    std::vector<double>::resize((uint64_t)p_mModelRowHeight, v9, &v28);
  }
  long long v18 = p_mModelRowHeight->__begin_;
  if (var0 >= v4)
  {
    uint64_t v20 = &v18[v4];
    uint64_t v21 = 8 * (unsigned __int16)(var0 + var1 - 1) - 8 * v4 + 8;
    char v19 = p_mLock;
    if (v21 < 1) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  char v19 = p_mLock;
  uint64_t v20 = &v18[var0];
  uint64_t v21 = 8 * v4 - 8 * var0;
  if (v21 > 0) {
LABEL_16:
  }
    bzero(v20, 8 * (((unint64_t)v21 >> 3) - ((unint64_t)v21 > 7)) + 8);
LABEL_17:
  v28 = (void **)&v24;
  std::vector<TSTWidthHeightCache_Private::WHCRow>::__destroy_vector::operator()[abi:nn180100](&v28);
  pthread_rwlock_unlock(v19);
  return 1;
}

- (BOOL)moveColsFrom:(id)a3 toCol:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  unsigned __int16 var0 = a3.var1.var0;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  unsigned __int8 v24 = var0;
  unsigned int v8 = a3.var0.var1 + var0;
  if (v8 <= v4) {
    unint64_t v9 = v4;
  }
  else {
    unint64_t v9 = v8;
  }
  begin = self->mFittingColumnWidth.__begin_;
  p_mFittingColumnWidth = &self->mFittingColumnWidth;
  if (v9 > (self->mFittingColumnWidth.__end_ - begin) >> 5)
  {
    std::vector<TSTWidthHeightCache_Private::WHCCol>::resize((uint64_t *)&self->mFittingColumnWidth, v9);
    begin = p_mFittingColumnWidth->__begin_;
  }
  uint64_t v12 = (char *)begin + 32 * a3.var0.var1;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  std::vector<TSTWidthHeightCache_Private::WHCCol>::__assign_with_size[abi:nn180100]<std::__wrap_iter<TSTWidthHeightCache_Private::WHCCol*>,std::__wrap_iter<TSTWidthHeightCache_Private::WHCCol*>>(&v25, (uint64_t)v12, (uint64_t)&v12[32 * a3.var1.var0], a3.var1.var0);
  unint64_t v13 = (char *)begin + 32 * v4;
  if (a3.var0.var1 >= (unint64_t)v4)
  {
    std::__copy_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TSTWidthHeightCache_Private::WHCCol *,TSTWidthHeightCache_Private::WHCCol *,TSTWidthHeightCache_Private::WHCCol *>((uint64_t)&v28, (uint64_t)v13, (uint64_t)v12, (uint64_t)&v12[32 * a3.var1.var0]);
  }
  else
  {
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TSTWidthHeightCache_Private::WHCCol *,TSTWidthHeightCache_Private::WHCCol *,TSTWidthHeightCache_Private::WHCCol *>((int)&v28, (uint64_t)&v12[32 * a3.var1.var0], (uint64_t)v13, v12);
    unint64_t v13 = (char *)p_mFittingColumnWidth->__begin_ + 32 * (int)(v4 - a3.var1.var0);
  }
  std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TSTWidthHeightCache_Private::WHCCol *,TSTWidthHeightCache_Private::WHCCol *,TSTWidthHeightCache_Private::WHCCol *>((int)&v28, (uint64_t)v25, v26, v13);
  for (i = self->mFittingRowHeight.__begin_; i < self->mFittingRowHeight.__end_; i = (WHCRow *)((char *)i + 168))
    TSTWidthHeightCache_NibArray::NibArray<8u>::move((uint64_t)i, a3.var0.var1, a3.var0.var1 + v24, v4, 256);
  int v15 = self->mModelColumnWidth.__begin_;
  end = self->mModelColumnWidth.__end_;
  p_mModelColumnWidth = &self->mModelColumnWidth;
  if (v9 > end - v15)
  {
    v29 = 0;
    std::vector<double>::resize((uint64_t)p_mModelColumnWidth, v9, &v29);
  }
  long long v18 = p_mModelColumnWidth->__begin_;
  if (a3.var0.var1 >= v4)
  {
    uint64_t v21 = p_mLock;
    char v19 = &v18[v4];
    uint64_t v20 = 8 * (v24 + a3.var0.var1 - 1) - 8 * v4 + 8;
    if (v20 < 1) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  char v19 = &v18[a3.var0.var1];
  uint64_t v20 = 8 * v4 - 8 * a3.var0.var1;
  uint64_t v21 = p_mLock;
  if (v20 > 0) {
LABEL_15:
  }
    bzero(v19, 8 * (((unint64_t)v20 >> 3) - ((unint64_t)v20 > 7)) + 8);
LABEL_16:
  v29 = &v25;
  std::vector<TSTWidthHeightCache_Private::WHCCol>::__destroy_vector::operator()[abi:nn180100]((void ***)&v29);
  pthread_rwlock_unlock(v21);
  return 1;
}

- (double)getFitHeightForRow:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_rdlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  double v7 = 0.0;
  if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - begin) >> 3) > v3)
  {
    unsigned int v8 = (char *)begin + 168 * v3;
    unint64_t v9 = (double *)*((void *)v8 + 16);
    if (v9 == *((double **)v8 + 17))
    {
      if (*((unsigned char *)begin + 168 * v3 + 160)) {
        double v7 = -1.0;
      }
      else {
        double v7 = 0.0;
      }
    }
    else
    {
      double v7 = *v9;
    }
  }
  pthread_rwlock_unlock(p_mLock);
  return v7;
}

- (double)getFitWidthForCol:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_rdlock(&self->mLock);
  begin = self->mFittingColumnWidth.__begin_;
  double v7 = -1.0;
  if (v3 < (unint64_t)((self->mFittingColumnWidth.__end_ - begin) >> 5))
  {
    unsigned int v8 = (char *)begin + 32 * v3;
    if (*(void *)v8 == *((void *)v8 + 1))
    {
      if (v8[24]) {
        double v7 = -1.0;
      }
      else {
        double v7 = 0.0;
      }
    }
    else
    {
      double v7 = **(double **)v8;
    }
  }
  pthread_rwlock_unlock(p_mLock);
  return v7;
}

- (double)getModelHeightForRow:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_rdlock(&self->mLock);
  begin = self->mModelRowHeight.__begin_;
  double v7 = 0.0;
  if (v3 < (unint64_t)(self->mModelRowHeight.__end_ - begin)) {
    double v7 = begin[v3];
  }
  pthread_rwlock_unlock(p_mLock);
  return v7;
}

- (double)getModelWidthForColumn:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_rdlock(&self->mLock);
  begin = self->mModelColumnWidth.__begin_;
  double v7 = 0.0;
  if (v3 < (unint64_t)(self->mModelColumnWidth.__end_ - begin)) {
    double v7 = begin[v3];
  }
  pthread_rwlock_unlock(p_mLock);
  return v7;
}

- (id)getListOfInvalidColsInRow:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_rdlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - begin) >> 3) <= v3) {
    goto LABEL_11;
  }
  unint64_t v7 = v3;
  uint64_t v8 = *((unsigned __int8 *)begin + 168 * v3 + 160);
  unint64_t v9 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v8];
  if (!v8) {
    goto LABEL_12;
  }
  long long v10 = self->mFittingRowHeight.__begin_;
  if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - v10) >> 3) <= v7) {
LABEL_11:
  }
    abort();
  uint64_t v11 = 0;
  while (1)
  {
    uint64_t v12 = (char *)v10 + 168 * v7;
    char v13 = 4 * v11;
    while (v12[(unint64_t)v11 >> 1] >> (v13 & 4) != 14)
    {
      uint64_t v11 = (v11 + 1);
      v13 += 4;
      if (v11 == 256) {
        goto LABEL_12;
      }
    }
    if (v11 > 0xFE) {
      break;
    }
    objc_msgSend(v9, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v11));
    uint64_t v11 = (v11 + 1);
    long long v10 = self->mFittingRowHeight.__begin_;
    if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - v10) >> 3) <= v7) {
      goto LABEL_11;
    }
  }
LABEL_12:
  pthread_rwlock_unlock(p_mLock);
  return v9;
}

- (unint64_t)resetAllInvalidColsInRow:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - begin) >> 3) <= v3) {
    return 0;
  }
  else {
    return (int)TSTWidthHeightCache_NibArray::NibArray<8u>::setValueToValue((uint64_t)begin + 168 * v3, 14, 15, *((unsigned __int8 *)begin + 168 * v3 + 160), 0x100u);
  }
}

- (void)resetRowHeightsStartingWith:(unsigned __int16)a3 andEndingWith:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  end = self->mFittingRowHeight.__end_;
  p_mFittingRowHeight = (uint64_t *)&self->mFittingRowHeight;
  unint64_t v11 = 0xCF3CF3CF3CF3CF3DLL * ((end - begin) >> 3);
  if (v11 <= v4)
  {
    std::vector<TSTWidthHeightCache_Private::WHCRow>::resize(p_mFittingRowHeight, v4 + 1);
    begin = (WHCRow *)*p_mFittingRowHeight;
  }
  if ((unint64_t)v4 + 1 >= v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v4 + 1;
  }
  if (v12 > v5)
  {
    char v13 = (char *)begin + 168 * v12;
    uint64_t v14 = (char *)begin + 168 * v5;
    do
    {
      *(void *)&long long v15 = -1;
      *((void *)&v15 + 1) = -1;
      *((_OWORD *)v14 + 6) = v15;
      *((_OWORD *)v14 + 7) = v15;
      *((_OWORD *)v14 + 4) = v15;
      *((_OWORD *)v14 + 5) = v15;
      *((_OWORD *)v14 + 2) = v15;
      *((_OWORD *)v14 + 3) = v15;
      *(_OWORD *)uint64_t v14 = v15;
      *((_OWORD *)v14 + 1) = v15;
      int64_t v16 = v14 + 152;
      int v17 = 0;
      std::__fill_n[abi:nn180100]<false,std::__bitset<1ul,14ul>>((uint64_t)&v16, 0xEuLL);
      *((void *)v14 + 17) = *((void *)v14 + 16);
      v14[160] = 0;
      v14 += 168;
    }
    while (v14 < v13);
  }
  pthread_rwlock_unlock(p_mLock);
}

- (void)resetColWidthsStartingWith:(unsigned __int8)a3 andEndingWith:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingColumnWidth.__begin_;
  end = self->mFittingColumnWidth.__end_;
  p_mFittingColumnWidth = (uint64_t *)&self->mFittingColumnWidth;
  unint64_t v11 = (end - begin) >> 5;
  if (v11 < v4)
  {
    std::vector<TSTWidthHeightCache_Private::WHCCol>::resize(p_mFittingColumnWidth, v4 + 1);
    begin = (WHCCol *)*p_mFittingColumnWidth;
  }
  if ((unint64_t)v4 + 1 >= v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v4 + 1;
  }
  if (v12 > v5)
  {
    char v13 = (char *)begin + 32 * v12;
    uint64_t v14 = (char *)begin + 32 * v5;
    do
    {
      *((void *)v14 + 1) = *(void *)v14;
      v14[24] = 0;
      v14 += 32;
    }
    while (v14 < v13);
  }

  pthread_rwlock_unlock(p_mLock);
}

- (void)resetAllRow
{
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  end = self->mFittingRowHeight.__end_;
  while (begin < end)
  {
    *(void *)&long long v6 = -1;
    *((void *)&v6 + 1) = -1;
    *((_OWORD *)begin + 6) = v6;
    *((_OWORD *)begin + 7) = v6;
    *((_OWORD *)begin + 4) = v6;
    *((_OWORD *)begin + 5) = v6;
    *((_OWORD *)begin + 2) = v6;
    *((_OWORD *)begin + 3) = v6;
    *(_OWORD *)begin = v6;
    *((_OWORD *)begin + 1) = v6;
    unint64_t v7 = (char *)begin + 152;
    int v8 = 0;
    std::__fill_n[abi:nn180100]<false,std::__bitset<1ul,14ul>>((uint64_t)&v7, 0xEuLL);
    *((void *)begin + 17) = *((void *)begin + 16);
    *((unsigned char *)begin + 160) = 0;
    end = self->mFittingRowHeight.__end_;
    begin = (WHCRow *)((char *)begin + 168);
  }
  pthread_rwlock_unlock(p_mLock);
}

- (void)resetAllCol
{
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingColumnWidth.__begin_;
  end = self->mFittingColumnWidth.__end_;
  while (begin < end)
  {
    *((void *)begin + 1) = *(void *)begin;
    *((unsigned char *)begin + 24) = 0;
    begin = (WHCCol *)((char *)begin + 32);
  }

  pthread_rwlock_unlock(p_mLock);
}

- (void)resetWidthsHeightsForRange:(id)a3
{
  uint64_t var1 = a3.var1.var1;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  p_mFittingRowHeight = &self->mFittingRowHeight;
  unint64_t v8 = var1 + a3.var0.var0;
  if (0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - self->mFittingRowHeight.__begin_) >> 3) < v8) {
    std::vector<TSTWidthHeightCache_Private::WHCRow>::resize((uint64_t *)&self->mFittingRowHeight, var1 + a3.var0.var0);
  }
  begin = self->mFittingColumnWidth.__begin_;
  end = self->mFittingColumnWidth.__end_;
  p_mFittingColumnWidth = (uint64_t *)&self->mFittingColumnWidth;
  if (a3.var0.var1 + a3.var1.var0 > (unint64_t)((end - begin) >> 5)) {
    std::vector<TSTWidthHeightCache_Private::WHCCol>::resize(p_mFittingColumnWidth, a3.var0.var1 + a3.var1.var0);
  }
  if (var1)
  {
    unint64_t v12 = (unint64_t)p_mFittingRowHeight->__begin_ + 168 * a3.var0.var0;
    unint64_t v13 = v12 + 168 * var1;
    do
    {
      TSTWidthHeightCache_Private::WHCRow::resetColDataInRange(v12, a3.var0.var1, (a3.var0.var1 + LOBYTE(a3.var1.var0)));
      v12 += 168;
    }
    while (v12 < v13);
  }
  uint64_t var0 = a3.var1.var0;
  if (a3.var1.var0)
  {
    int v15 = a3.var0.var0;
    int64_t v16 = (uint64_t **)(*p_mFittingColumnWidth + 32 * a3.var0.var1);
    int v17 = &v16[4 * var0];
    do
    {
      TSTWidthHeightCache_Private::WHCCol::removeRowDataInRange(v16, v15, v8);
      v16 += 4;
    }
    while (v16 < v17);
  }

  pthread_rwlock_unlock(p_mLock);
}

- (void)resetRowHeightForCell:(id)a3
{
  uint64_t v5 = *(void *)&a3.var0 >> 16;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  TSTWidthHeightCache_Private::WHCRow::resetColDataInRange((uint64_t)self->mFittingRowHeight.__begin_ + 168 * a3.var0, a3.var1, (v5 + 1));

  pthread_rwlock_unlock(p_mLock);
}

- (void)resetFitHeightForCellID:(id)a3
{
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  begin = self->mFittingRowHeight.__begin_;
  if (a3.var0 < 0xCF3CF3CF3CF3CF3DLL * ((self->mFittingRowHeight.__end_ - begin) >> 3)) {
    TSTWidthHeightCache_Private::WHCRow::resetColDataInRange((uint64_t)begin + 168 * a3.var0, a3.var1, (a3.var1 + 1));
  }

  pthread_rwlock_unlock(p_mLock);
}

- (void)setNumsRows:(unsigned __int16)a3 andNumCols:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  p_mLock = &self->mLock;
  pthread_rwlock_wrlock(&self->mLock);
  unsigned __int8 v8 = v4 - 1;
  if (self->mMaxRow > (unsigned __int16)(v5 - 1)) {
    std::vector<TSTWidthHeightCache_Private::WHCRow>::resize((uint64_t *)&self->mFittingRowHeight, v5);
  }
  if (self->mMaxCol > v8) {
    std::vector<TSTWidthHeightCache_Private::WHCCol>::resize((uint64_t *)&self->mFittingColumnWidth, v4);
  }
  if (self->mMaxRow > (unsigned __int16)(v5 - 1))
  {
    for (i = (uint64_t **)self->mFittingColumnWidth.__begin_; (WHCCol *)i < self->mFittingColumnWidth.__end_; i += 4)
      TSTWidthHeightCache_Private::WHCCol::resetAfter(i, v5);
  }
  if (self->mMaxCol > v8)
  {
    for (j = self->mFittingRowHeight.__begin_; j < self->mFittingRowHeight.__end_; j = (WHCRow *)((char *)j + 168))
      TSTWidthHeightCache_Private::WHCRow::resetAfter((uint64_t)j, v8, self->mMaxCol);
  }
  self->mMaxRow = v8;
  self->mMaxCol = v8;

  pthread_rwlock_unlock(p_mLock);
}

- (BOOL)verifyDims:(CGSize)a3 forCellID:(id)a4
{
  return 1;
}

- (void)logInternalState
{
  NSLog((NSString *)@"RowH: ", a2);
  begin = self->mFittingRowHeight.__begin_;
  if (begin >= self->mFittingRowHeight.__end_) {
    goto LABEL_12;
  }
  int v4 = 0;
  do
  {
    if ((~v4 & 0xF) == 0) {
      NSLog((NSString *)@"\n      ");
    }
    unsigned int v5 = (double *)*((void *)begin + 16);
    if (v5 == *((double **)begin + 17))
    {
      if (*((unsigned char *)begin + 160)) {
        double v6 = -1.0;
      }
      else {
        double v6 = 0.0;
      }
    }
    else
    {
      double v6 = *v5;
    }
    NSLog((NSString *)@"%6.2f ", *(void *)&v6);
    begin = (WHCRow *)((char *)begin + 168);
    ++v4;
  }
  while (begin < self->mFittingRowHeight.__end_);
  if ((~v4 & 0xF) != 0) {
LABEL_12:
  }
    NSLog((NSString *)@"\n");
  NSLog((NSString *)@"ColW: ");
  unint64_t v7 = self->mFittingColumnWidth.__begin_;
  if (v7 >= self->mFittingColumnWidth.__end_) {
    goto LABEL_24;
  }
  int v8 = 0;
  do
  {
    if ((~v8 & 0xF) == 0) {
      NSLog((NSString *)@"\n      ");
    }
    if (*(void *)v7 == *((void *)v7 + 1))
    {
      if (*((unsigned char *)v7 + 24)) {
        double v9 = -1.0;
      }
      else {
        double v9 = 0.0;
      }
    }
    else
    {
      double v9 = *(double *)*(double *)v7;
    }
    NSLog((NSString *)@"%6.2f ", *(void *)&v9);
    unint64_t v7 = (WHCCol *)((char *)v7 + 32);
    ++v8;
  }
  while (v7 < self->mFittingColumnWidth.__end_);
  if ((~v8 & 0xF) != 0) {
LABEL_24:
  }
    NSLog((NSString *)@"\n");
}

- (id)validateChangeDescriptors:(id)a3 tableModel:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  unsigned __int8 v24 = &v23;
  uint64_t v25 = 0x3052000000;
  uint64_t v26 = __Block_byref_object_copy__28;
  uint64_t v27 = __Block_byref_object_dispose__28;
  uint64_t v28 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(a3);
        }
        double v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v10 = [v9 changeDescriptor];
        int v11 = [v9 cellID];
        unint64_t v12 = (void *)[v9 cellRegion];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __60__TSTWidthHeightCache_validateChangeDescriptors_tableModel___block_invoke;
        v16[3] = &unk_2646B37A8;
        int v17 = v10;
        int v18 = v11;
        v16[5] = a4;
        v16[6] = &v23;
        v16[4] = self;
        [v12 enumerateCellRangesUsingBlock:v16];
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v6);
  }
  unint64_t v13 = (void *)v24[5];
  _Block_object_dispose(&v23, 8);
  return v13;
}

uint64_t __60__TSTWidthHeightCache_validateChangeDescriptors_tableModel___block_invoke(uint64_t result, unint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = result;
  unint64_t v4 = a2 >> 16;
  unint64_t v5 = HIWORD(a2);
  switch(*(_DWORD *)(result + 56))
  {
    case 1:
      [*(id *)(result + 32) deleteColsStartingWith:BYTE2(a2) andEndingWith:(BYTE4(a2) + BYTE2(a2))];
      goto LABEL_25;
    case 2:
      double v9 = *(void **)(result + 32);
      return [v9 insertCols:BYTE4(a2) atColumn:BYTE2(a2)];
    case 3:
      int v10 = *(void **)(result + 32);
      uint64_t v11 = *(unsigned __int8 *)(v3 + 62);
      return [v10 moveColsFrom:a2 toCol:v11];
    case 4:
      unsigned int v12 = HIDWORD(a2) + WORD1(a2) + 255;
      if (BYTE2(a2) <= (BYTE4(a2) + BYTE2(a2) - 1))
      {
        do
        {
          result = TSTTableIsColumnHidden(*(void *)(v3 + 40), v4);
          if ((result & 1) == 0) {
            result = [*(id *)(v3 + 32) setModelWidth:v4 forColumn:0.0];
          }
          LOBYTE(v4) = v4 + 1;
        }
        while (v4 <= v12);
      }
      return result;
    case 5:
    case 0x13:
    case 0x14:
    case 0x1A:
      [*(id *)(result + 32) resetWidthsHeightsForRange:a2];
      uint64_t v6 = *(void **)(*(void *)(*(void *)(v3 + 48) + 8) + 40);
      if (!v6)
      {
        *(void *)(*(void *)(*(void *)(v3 + 48) + 8) + 40) = [MEMORY[0x263F089C8] indexSet];
        uint64_t v6 = *(void **)(*(void *)(*(void *)(v3 + 48) + 8) + 40);
      }
      uint64_t v7 = (unsigned __int16)v2;
      goto LABEL_28;
    case 0xD:
    case 0xE:
    case 0x19:
    case 0x21:
      goto LABEL_6;
    case 0x15:
      unint64_t v13 = *(void **)(result + 32);
      return [v13 deleteRowsStartingWith:(unsigned __int16)a2 andEndingWith:(unsigned __int16)(HIWORD(a2) + a2)];
    case 0x16:
      [*(id *)(result + 32) insertRows:HIWORD(a2) atRow:(unsigned __int16)a2];
LABEL_25:
      uint64_t v6 = *(void **)(*(void *)(*(void *)(v3 + 48) + 8) + 40);
      if (!v6)
      {
        *(void *)(*(void *)(*(void *)(v3 + 48) + 8) + 40) = [MEMORY[0x263F089C8] indexSet];
        uint64_t v6 = *(void **)(*(void *)(*(void *)(v3 + 48) + 8) + 40);
      }
      uint64_t v7 = (unsigned __int16)v2;
LABEL_28:
      result = objc_msgSend(v6, "addIndexesInRange:", v7, v5);
      break;
    case 0x17:
      uint64_t v14 = *(void **)(result + 32);
      uint64_t v15 = *(unsigned __int16 *)(v3 + 60);
      result = [v14 moveRowsFrom:a2 toRow:v15];
      break;
    case 0x18:
      unsigned __int16 v16 = a2 + HIWORD(a2) - 1;
      if (v16 >= (unsigned __int16)a2)
      {
        do
        {
          result = TSTTableIsRowHidden(*(void *)(v3 + 40), (unsigned __int16)v2);
          if ((result & 1) == 0) {
            result = [*(id *)(v3 + 32) setModelHeight:(unsigned __int16)v2 forRow:0.0];
          }
          LOWORD(v2) = v2 + 1;
        }
        while ((unsigned __int16)v2 <= v16);
      }
      break;
    case 0x1D:
    case 0x24:
      [*(id *)(result + 32) resetModelCache];
LABEL_6:
      int v8 = *(void **)(v3 + 32);
      result = [v8 resetWidthsHeightsForRange:v2];
      break;
    default:
      return result;
  }
  return result;
}

- (void)_increaseColCapacity:(unsigned int)a3
{
  begin = self->mFittingColumnWidth.__begin_;
  p_mFittingColumnWidth = (uint64_t *)&self->mFittingColumnWidth;
  if (a3 >= (unint64_t)((p_mFittingColumnWidth[2] - (uint64_t)begin) >> 5))
  {
    if ((a3 & 0xFFFFFF1F) != 0) {
      unint64_t v5 = (a3 + 32) & 0xE0;
    }
    else {
      unint64_t v5 = a3;
    }
    std::vector<TSTWidthHeightCache_Private::WHCCol>::reserve(p_mFittingColumnWidth, v5);
  }
}

- (void)_increaseRowCapacity:(unsigned int)a3
{
  begin = self->mFittingRowHeight.__begin_;
  p_mFittingRowHeight = (uint64_t *)&self->mFittingRowHeight;
  if (0xCF3CF3CF3CF3CF3DLL * ((p_mFittingRowHeight[2] - (uint64_t)begin) >> 3) <= a3) {
    std::vector<TSTWidthHeightCache_Private::WHCRow>::reserve(p_mFittingRowHeight, 0);
  }
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x263F089D8];
  unint64_t v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = (void *)[v3 stringWithFormat:@"<%@ %p\n", NSStringFromClass(v4), self];
  objc_msgSend(v5, "appendFormat:", @"  %u rows={\n", self->mMaxRow + 1);
  int v6 = 0;
  do
  {
    [(TSTWidthHeightCache *)self getModelHeightForRow:(unsigned __int16)v6];
    uint64_t v8 = v7;
    [(TSTWidthHeightCache *)self getFitHeightForRow:(unsigned __int16)v6];
    [v5 appendFormat:@"    {[%u] model=%f, fitting=%f }\n", (unsigned __int16)v6++, v8, v9];
  }
  while (self->mMaxRow >= (unsigned __int16)v6);
  [v5 appendString:@"  }\n"];
  objc_msgSend(v5, "appendFormat:", @"  %u columns={\n", self->mMaxCol + 1);
  int v10 = 0;
  do
  {
    [(TSTWidthHeightCache *)self getModelWidthForColumn:v10];
    uint64_t v12 = v11;
    [(TSTWidthHeightCache *)self getFitWidthForCol:v10];
    [v5 appendFormat:@"    {[%u] model=%f, fitting=%f}\n", v10++, v12, v13];
  }
  while (self->mMaxCol >= v10);
  [v5 appendString:@"  }>"];
  return v5;
}

- (void).cxx_destruct
{
  begin = self->mModelRowHeight.__begin_;
  if (begin)
  {
    self->mModelRowHeight.__end_ = begin;
    operator delete(begin);
  }
  unint64_t v4 = self->mModelColumnWidth.__begin_;
  if (v4)
  {
    self->mModelColumnWidth.__end_ = v4;
    operator delete(v4);
  }
  p_begin = (void **)&self->mFittingRowHeight.__begin_;
  std::vector<TSTWidthHeightCache_Private::WHCRow>::__destroy_vector::operator()[abi:nn180100](&p_begin);
  p_begin = (void **)&self->mFittingColumnWidth.__begin_;
  std::vector<TSTWidthHeightCache_Private::WHCCol>::__destroy_vector::operator()[abi:nn180100](&p_begin);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end