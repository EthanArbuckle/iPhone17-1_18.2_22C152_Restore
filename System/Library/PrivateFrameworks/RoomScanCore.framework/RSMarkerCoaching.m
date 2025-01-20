@interface RSMarkerCoaching
- (id).cxx_construct;
@end

@implementation RSMarkerCoaching

- (id).cxx_construct
{
  *((void *)self + 1) = &unk_2708F1E58;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = xmmword_25B5F1780;
  *((void *)self + 12) = 0x41F000003F333333;
  *((void *)self + 13) = 0x143E99999ALL;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_OWORD *)self + 1) = xmmword_25B5F1790;
  *((_OWORD *)self + 2) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  return self;
}

- (void).cxx_destruct
{
  isa = (void **)self[1].super.isa;
  if (isa)
  {
    self[1]._generator._vptr$MarkerProposal = isa;
    operator delete(isa);
  }
  begin = self->_all_major_view_lines.__begin_;
  if (begin)
  {
    self->_all_major_view_lines.__end_ = begin;
    operator delete(begin);
  }

  sub_25B5852C4((uint64_t)&self->_generator);
}

@end