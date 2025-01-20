@interface TSTCellRegionColMajorIterator
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)getNext;
- (TSTCellRegionColMajorIterator)initWithCellRegion:(id)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)terminate;
@end

@implementation TSTCellRegionColMajorIterator

- (TSTCellRegionColMajorIterator)initWithCellRegion:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSTCellRegionColMajorIterator;
  v4 = [(TSTCellRegionColMajorIterator *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [a3 fillCellRangeColMajorSet:&v4->mCellRangeSet leftToRight:1];
    v5->mBoundingCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)[a3 boundingCellRange];
    v5->mCellID = *($5CFCD363C99B2F51819B67AD7AD2E060 *)((char *)v5->mCellRangeSet.__tree_.__begin_node_ + 26);
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TSTCellRegionColMajorIterator;
  [(TSTCellRegionColMajorIterator *)&v2 dealloc];
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)getNext
{
  $5CFCD363C99B2F51819B67AD7AD2E060 mCellID = self->mCellID;
  if (self->mCellID.row != 0xFFFF && (*(void *)&mCellID.row & 0xFF0000) != 0xFF0000)
  {
    p_mCellRangeSet = (uint64_t **)&self->mCellRangeSet;
    begin_node = (uint64_t *)self->mCellRangeSet.__tree_.__begin_node_;
    self->mCellID.row = mCellID.row + 1;
    uint64_t v6 = *(uint64_t *)((char *)begin_node + 26);
    if ((unsigned __int16)(mCellID.row + 1) > (unsigned __int16)(v6 + HIWORD(v6) - 1))
    {
      uint64_t v8 = *(uint64_t *)((char *)begin_node + 26);
      std::__tree<std::__value_type<unsigned short,EQKit::Config::Operator::Form>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,EQKit::Config::Operator::Form>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,EQKit::Config::Operator::Form>>>::__remove_node_pointer((uint64_t **)&self->mCellRangeSet, begin_node);
      operator delete(begin_node);
      WORD2(v8) = WORD2(v6) - 1;
      BYTE2(v8) = BYTE2(v6) + 1;
      if (WORD2(v6) != 1) {
        std::__tree<TSUColumnRowRect,TSTCellRangeColumnMajorLess,std::allocator<TSUColumnRowRect>>::__emplace_unique_key_args<TSUColumnRowRect,TSUColumnRowRect const&>(p_mCellRangeSet, (unsigned __int16 *)&v8, &v8);
      }
      self->$5CFCD363C99B2F51819B67AD7AD2E060 mCellID = *($5CFCD363C99B2F51819B67AD7AD2E060 *)((char *)self->mCellRangeSet.__tree_.__begin_node_ + 26);
    }
  }
  return *($2F2D2FE54C0B9D2AA4EBD8788136C7D0 *)&mCellID;
}

- (void)terminate
{
  if (self->mCellRangeSet.__tree_.__pair3_.__value_ >= 2)
  {
    do
    {
      begin_node = (uint64_t *)self->mCellRangeSet.__tree_.__begin_node_;
      std::__tree<std::__value_type<unsigned short,EQKit::Config::Operator::Form>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,EQKit::Config::Operator::Form>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,EQKit::Config::Operator::Form>>>::__remove_node_pointer((uint64_t **)&self->mCellRangeSet, begin_node);
      operator delete(begin_node);
    }
    while (self->mCellRangeSet.__tree_.__pair3_.__value_ > 1);
  }
  self->$5CFCD363C99B2F51819B67AD7AD2E060 mCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)0xFFFFFF;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

@end