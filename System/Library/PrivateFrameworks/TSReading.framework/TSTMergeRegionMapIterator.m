@interface TSTMergeRegionMapIterator
- ($CA3468F20078D5D2DB35E78E73CA60DA)nextMergeRegion;
- (BOOL)hasNextMergeRegion;
- (TSTMergeRegionMapIterator)initWithMergeRegionMap:(id)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)reset;
@end

@implementation TSTMergeRegionMapIterator

- (TSTMergeRegionMapIterator)initWithMergeRegionMap:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSTMergeRegionMapIterator;
  v4 = [(TSTMergeRegionMapIterator *)&v7 init];
  if (v4)
  {
    v5 = (TSTMergeRegionMap *)a3;
    v4->mMergeRegionMap = v5;
    v4->mMergeRegionIterator.__i_.__node_ = v5->mMergeRegionTopLeftToMergeRegionSize.__table_.__p1_.__value_.__next_;
  }
  return v4;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)nextMergeRegion
{
  node = self->mMergeRegionIterator.__i_.__node_;
  if (!node) {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  }
  $CA3468F20078D5D2DB35E78E73CA60DA v4 = ($CA3468F20078D5D2DB35E78E73CA60DA)*((void *)node + 2);
  self->mMergeRegionIterator.__i_.__node_ = *(void **)node;
  return v4;
}

- (BOOL)hasNextMergeRegion
{
  return self->mMergeRegionIterator.__i_.__node_ != 0;
}

- (void)dealloc
{
  self->mMergeRegionMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTMergeRegionMapIterator;
  [(TSTMergeRegionMapIterator *)&v3 dealloc];
}

- (void)reset
{
  self->mMergeRegionIterator.__i_.__node_ = self->mMergeRegionMap->mMergeRegionTopLeftToMergeRegionSize.__table_.__p1_.__value_.__next_;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end