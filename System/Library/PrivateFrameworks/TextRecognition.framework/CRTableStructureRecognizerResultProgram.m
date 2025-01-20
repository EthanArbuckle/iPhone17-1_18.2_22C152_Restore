@interface CRTableStructureRecognizerResultProgram
- (CRNormalizedQuad)tableQuad;
- (NSArray)programTokens;
- (NSString)programString;
- (id).cxx_construct;
- (vector<int,)programTokenIdxs;
- (void)setProgramString:(id)a3;
- (void)setProgramTokenIdxs:()vector<int;
- (void)setProgramTokens:(id)a3;
- (void)setTableQuad:(id)a3;
@end

@implementation CRTableStructureRecognizerResultProgram

- (NSString)programString
{
  return [(NSArray *)self->_programTokens componentsJoinedByString:@" "];
}

- (vector<int,)programTokenIdxs
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<int, std::allocator<int>> *)std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(retstr, self->_programTokenIdxs.__begin_, (uint64_t)self->_programTokenIdxs.__end_, self->_programTokenIdxs.__end_ - self->_programTokenIdxs.__begin_);
}

- (void)setProgramTokenIdxs:()vector<int
{
  p_programTokenIdxs = (char *)&self->_programTokenIdxs;
  if (p_programTokenIdxs != (char *)a3) {
    std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>(p_programTokenIdxs, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
  }
}

- (NSArray)programTokens
{
  return self->_programTokens;
}

- (void)setProgramTokens:(id)a3
{
}

- (void)setProgramString:(id)a3
{
}

- (CRNormalizedQuad)tableQuad
{
  return self->_tableQuad;
}

- (void)setTableQuad:(id)a3
{
}

- (void).cxx_destruct
{
  begin = self->_programTokenIdxs.__begin_;
  if (begin)
  {
    self->_programTokenIdxs.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_tableQuad, 0);
  objc_storeStrong((id *)&self->_programString, 0);
  objc_storeStrong((id *)&self->_programTokens, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end