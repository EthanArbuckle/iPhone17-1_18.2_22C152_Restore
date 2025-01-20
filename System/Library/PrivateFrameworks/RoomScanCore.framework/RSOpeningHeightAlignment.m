@interface RSOpeningHeightAlignment
- (RSOpeningHeightAlignment)init;
- (id).cxx_construct;
@end

@implementation RSOpeningHeightAlignment

- (id).cxx_construct
{
  self->_openingHeightAlignment._opening_fixed.__table_.__bucket_list_ = 0u;
  p_opening_fixed = &self->_openingHeightAlignment._opening_fixed;
  self->_openingHeightAlignment._vptr$OpeningHeightAlignment = (void **)&unk_2708F11E8;
  *(_OWORD *)&self->_openingHeightAlignment._opening_fixed.__table_.__p1_.__value_.__next_ = 0u;
  self->_openingHeightAlignment._opening_fixed.__table_.__p3_.__value_ = 1.0;
  self->_openingHeightAlignment._hole_vector.__end_ = 0;
  self->_openingHeightAlignment._hole_vector.__end_cap_.__value_ = 0;
  self->_openingHeightAlignment._hole_vector.__begin_ = 0;
  self->_openingHeightAlignment._check_in_view = 1;
  sub_25B4011C0((uint64_t)&self->_openingHeightAlignment._opening_fixed);
  *(void ***)((char *)&p_opening_fixed[1].__table_.__bucket_list_.__ptr_.__value_ + 4) = (void **)0x3FCCCCCD3F800000;
  HIDWORD(p_opening_fixed[1].__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_) = -1027080192;
  p_opening_fixed[1].__table_.__p1_.__value_.__next_ = (void *)0x300000014;
  LODWORD(p_opening_fixed[1].__table_.__p2_.__value_) = 1086324736;
  *(void *)&p_opening_fixed[1].__table_.__p3_.__value_ = 0x3FD3333333333333;
  v6 = p_opening_fixed + 2;
  value = (HoleOpening *)p_opening_fixed[2].__table_.__bucket_list_.__ptr_.__value_;
  for (uint64_t i = v6->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_; (HoleOpening *)i != value; sub_25B401104(i))
    i -= 64;
  self->_openingHeightAlignment._hole_vector.__end_ = value;
  return self;
}

- (void).cxx_destruct
{
  self->_openingHeightAlignment._vptr$OpeningHeightAlignment = (void **)&unk_2708F11E8;
  p_hole_vector = &self->_openingHeightAlignment._hole_vector;
  sub_25B400FF8((void ***)&p_hole_vector);

  sub_25B40107C((uint64_t)&self->_openingHeightAlignment._opening_fixed);
}

- (RSOpeningHeightAlignment)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSOpeningHeightAlignment;
  return [(RSOpeningHeightAlignment *)&v3 init];
}

@end