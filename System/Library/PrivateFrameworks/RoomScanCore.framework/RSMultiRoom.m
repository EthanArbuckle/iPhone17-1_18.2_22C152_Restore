@interface RSMultiRoom
- (id).cxx_construct;
@end

@implementation RSMultiRoom

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = xmmword_25B5F17D0;
  *(_OWORD *)((char *)self + 24) = xmmword_25B5F17E0;
  *(_OWORD *)((char *)self + 40) = xmmword_25B5F17F0;
  *(_OWORD *)((char *)self + 56) = xmmword_25B5F1800;
  *(_OWORD *)((char *)self + 72) = xmmword_25B5F1810;
  *(_OWORD *)((char *)self + 88) = xmmword_25B5F1820;
  *(_OWORD *)((char *)self + 104) = xmmword_25B5F1830;
  *(_OWORD *)((char *)self + 120) = xmmword_25B5F1840;
  *(_OWORD *)((char *)self + 136) = xmmword_25B5F1850;
  *(_OWORD *)((char *)self + 152) = xmmword_25B5F1860;
  *(_OWORD *)((char *)self + 168) = xmmword_25B5F1870;
  *(_OWORD *)((char *)self + 184) = xmmword_25B5F1880;
  *(_OWORD *)((char *)self + 200) = xmmword_25B5F1890;
  *(_OWORD *)((char *)self + 216) = xmmword_25B5F18A0;
  *(_OWORD *)((char *)self + 232) = xmmword_25B5F18B0;
  *((_DWORD *)self + 62) = 1045220557;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *((_DWORD *)self + 90) = 1065353216;
  *((_OWORD *)self + 23) = 0u;
  *((_OWORD *)self + 24) = 0u;
  *((_DWORD *)self + 100) = 1065353216;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *((_DWORD *)self + 110) = 1065353216;
  *((_OWORD *)self + 28) = 0u;
  *((_OWORD *)self + 29) = 0u;
  *((_OWORD *)self + 30) = 0u;
  *((void *)self + 62) = 0;
  *((_DWORD *)self + 126) = 1065353216;
  *((_OWORD *)self + 32) = 0u;
  *((_OWORD *)self + 33) = 0u;
  *((_DWORD *)self + 136) = 1065353216;
  *(_OWORD *)((char *)self + 552) = 0u;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *((void *)self + 75) = 0;
  *((_DWORD *)self + 152) = 1065353216;
  *((void *)self + 79) = 0;
  *(_OWORD *)((char *)self + 616) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multi_room_floor_estimator, 0);
  objc_storeStrong((id *)&self->_original_wall_association_map, 0);
  objc_storeStrong((id *)&self->_merged_wall_association_map, 0);
  p_begin = &self->_wall_group_clustering.__begin_;
  sub_25B5A5D4C(&p_begin);
  sub_25B3FB178((uint64_t)&self->_z_shape_map);
  p_begin = &self->_orig_room_corner_relation_maps.__begin_;
  sub_25B5A5DD0(&p_begin);
  sub_25B3FACCC((uint64_t)&self->_corner_relation_map);
  next = self->_walls_in_group_set.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (void *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_walls_in_group_set.__table_.__bucket_list_.__ptr_.__value_;
  self->_walls_in_group_set.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  begin = self->_wall_relation_all.__begin_;
  if (begin)
  {
    self->_wall_relation_all.__end_ = begin;
    operator delete(begin);
  }
  sub_25B3FACCC((uint64_t)&self->_window_relation_dict);
  sub_25B3FACCC((uint64_t)&self->_door_relation_dict);
  sub_25B3FACCC((uint64_t)&self->_wall_relation_dict);
  v7 = self->_all_orig_wall_length.__begin_;
  if (v7)
  {
    self->_all_orig_wall_length.__end_ = v7;
    operator delete(v7);
  }
  v8 = *(void **)self->_anon_118;
  if (v8)
  {
    *(void *)&self->_anon_118[8] = v8;
    operator delete(v8);
  }
  objc_storeStrong((id *)&self->_room_all_windows, 0);
  objc_storeStrong((id *)&self->_room_all_doors, 0);

  objc_storeStrong((id *)&self->_room_all_walls, 0);
}

@end