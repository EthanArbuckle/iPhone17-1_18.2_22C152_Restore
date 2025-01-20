@interface RSWallOpeningOnlineOptimizer
- (RSWallOpeningOnlineOptimizer)init;
- (id).cxx_construct;
@end

@implementation RSWallOpeningOnlineOptimizer

- (id).cxx_construct
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  *(_OWORD *)self->_online_refinement._search_range_3._view._shape_of_view._sp = 0u;
  self->_online_refinement._vptr$RSOnlineRefinement = (void **)&unk_2708F16B8;
  p_search_range_7 = &self->_online_refinement._search_range_7;
  self->_online_refinement._search_range_7._vptr$Tensor = (void **)&unk_2708F18C0;
  *(_OWORD *)self->_online_refinement._search_range_7._view._shape_of_view._sp = 0u;
  *(_OWORD *)&self->_online_refinement._search_range_7._view._shape_of_view._sp[2] = 0u;
  v4 = &self->_anon_1c0[84];
  *(_OWORD *)&self->_online_refinement._search_range_7._view._shape_of_view._sp[4] = 0u;
  *(_OWORD *)self->_online_refinement._search_range_7._view._stride_of_view._sp = 0u;
  *(_OWORD *)&self->_online_refinement._search_range_7._view._stride_of_view._sp[2] = 0u;
  *(_OWORD *)&self->_online_refinement._search_range_7._view._stride_of_view._sp[4] = 0u;
  self->_online_refinement._search_range_7._storage.__ptr_ = 0;
  self->_online_refinement._search_range_7._storage.__cntrl_ = 0;
  *(_WORD *)&self->_online_refinement._search_range_7._is_contiguous = 257;
  p_search_range_3 = &self->_online_refinement._search_range_3;
  self->_online_refinement._search_range_3._vptr$Tensor = (void **)&unk_2708F18C0;
  *(_OWORD *)&self->_online_refinement._search_range_3._view._shape_of_view._sp[2] = 0u;
  *(_OWORD *)&self->_online_refinement._search_range_3._view._shape_of_view._sp[4] = 0u;
  *(_OWORD *)self->_online_refinement._search_range_3._view._stride_of_view._sp = 0u;
  *(_OWORD *)&self->_online_refinement._search_range_3._view._stride_of_view._sp[2] = 0u;
  *(_OWORD *)&self->_online_refinement._search_range_3._view._stride_of_view._sp[4] = 0u;
  self->_online_refinement._search_range_3._storage.__ptr_ = 0;
  self->_online_refinement._search_range_3._storage.__cntrl_ = 0;
  *(_WORD *)&self->_online_refinement._search_range_3._is_contiguous = 257;
  LOBYTE(self->_online_refinement._fitting_lines.var0.__val_.surface) = 0;
  self->_anon_1c0[64] = 0;
  *(_DWORD *)&self->_anon_1c0[80] = 26;
  *(_OWORD *)&self->_anon_1c0[84] = xmmword_25B5F1470;
  *(void *)&self->_anon_1c0[100] = 0x3ECCCCCD40400000;
  *(_OWORD *)&self->_anon_1c0[108] = xmmword_25B5F1070;
  *(_OWORD *)&self->_anon_1c0[124] = xmmword_25B5F1080;
  *(_OWORD *)&self->_anon_1c0[140] = xmmword_25B5F1090;
  *(void *)&self->_anon_1c0[156] = 0x3F0000003E4CCCCDLL;
  *(void *)&self->_anon_1c0[164] = 0x3F40000000000003;
  *(_DWORD *)&self->_anon_1c0[172] = 3;
  *(_OWORD *)&self->_anon_1c0[176] = xmmword_25B5F10A0;
  *(_OWORD *)&self->_anon_1c0[192] = xmmword_25B5F10B0;
  *(_OWORD *)&self->_anon_1c0[208] = xmmword_25B5F10C0;
  *(_DWORD *)&self->_anon_1c0[224] = 2;
  v25[0] = 14;
  uint64_t v19 = 14;
  sub_25B4578D0(v33, v25, &v19);
  sub_25B408640((uint64_t)v27, v33);
  uint64_t v19 = 14;
  uint64_t v22 = 14;
  sub_25B4578D0(v33, &v19, &v22);
  sub_25B408640((uint64_t)v25, v33);
  int v6 = 0;
  LODWORD(v33[0]) = 0;
  do
  {
    LODWORD(v19) = 0;
    for (int i = 1; i != 15; ++i)
    {
      *(_DWORD *)sub_25B446BB0((uint64_t)v27, (int *)v33, (int *)&v19) = v6 - 7;
      *(_DWORD *)sub_25B446BB0((uint64_t)v25, (int *)v33, (int *)&v19) = i - 8;
      LODWORD(v19) = i;
    }
    LODWORD(v33[0]) = ++v6;
  }
  while (v6 != 14);
  uint64_t v31 = 0xE00000001;
  int v32 = 14;
  sub_25B4A31AC((uint64_t)v33, (uint64_t)v27, &v31);
  uint64_t v29 = 0xE00000001;
  int v30 = 14;
  sub_25B4A31AC((uint64_t)v35, (uint64_t)v25, &v29);
  uint64_t v22 = 0;
  v23 = 0;
  v24 = 0;
  uint64_t v19 = (uint64_t)&v22;
  char v20 = 0;
  v8 = (char *)operator new(0x130uLL);
  uint64_t v9 = 0;
  uint64_t v22 = (uint64_t)v8;
  v23 = v8;
  v24 = v8 + 304;
  do
  {
    sub_25B4A6774((uint64_t)&v8[v9], (uint64_t)v33 + v9);
    v9 += 152;
  }
  while (v9 != 304);
  uint64_t v10 = 0;
  v23 = v8 + 304;
  do
  {
    *(void *)&v35[v10] = &unk_2708F18C0;
    v11 = *(std::__shared_weak_count **)&v37[v10];
    if (v11) {
      sub_25B404120(v11);
    }
    v10 -= 152;
  }
  while (v10 != -304);
  sub_25B4A3BF8((uint64_t)&v19, &v22);
  uint64_t v31 = 0x200000001;
  int v32 = 0;
  sub_25B4A46C8(v33, (uint64_t)&v19, (uint64_t)&v31);
  sub_25B4A4FA0((uint64_t)p_search_range_7, (uint64_t)v33);
  v34 = &unk_2708F18C0;
  if (v36) {
    sub_25B404120(v36);
  }
  uint64_t v19 = (uint64_t)&unk_2708F18C0;
  if (v21) {
    sub_25B404120(v21);
  }
  *(void *)&v33[0] = &v22;
  sub_25B4A3B38((void ***)v33);
  v25[0] = &unk_2708F1C28;
  if (v26) {
    sub_25B404120(v26);
  }
  v27[0] = &unk_2708F1C28;
  if (v28) {
    sub_25B404120(v28);
  }
  v25[0] = 6;
  uint64_t v19 = 6;
  sub_25B4578D0(v33, v25, &v19);
  sub_25B408640((uint64_t)v27, v33);
  uint64_t v19 = 6;
  uint64_t v22 = 6;
  sub_25B4578D0(v33, &v19, &v22);
  sub_25B408640((uint64_t)v25, v33);
  int v12 = 0;
  LODWORD(v33[0]) = 0;
  do
  {
    LODWORD(v19) = 0;
    for (int j = 1; j != 7; ++j)
    {
      *(_DWORD *)sub_25B446BB0((uint64_t)v27, (int *)v33, (int *)&v19) = v12 - 3;
      *(_DWORD *)sub_25B446BB0((uint64_t)v25, (int *)v33, (int *)&v19) = j - 4;
      LODWORD(v19) = j;
    }
    LODWORD(v33[0]) = ++v12;
  }
  while (v12 != 6);
  uint64_t v31 = 0x600000001;
  int v32 = 6;
  sub_25B4A31AC((uint64_t)v33, (uint64_t)v27, &v31);
  uint64_t v29 = 0x600000001;
  int v30 = 6;
  sub_25B4A31AC((uint64_t)v35, (uint64_t)v25, &v29);
  uint64_t v22 = 0;
  v23 = 0;
  v24 = 0;
  uint64_t v19 = (uint64_t)&v22;
  char v20 = 0;
  v14 = (char *)operator new(0x130uLL);
  uint64_t v15 = 0;
  uint64_t v22 = (uint64_t)v14;
  v23 = v14;
  v24 = v14 + 304;
  do
  {
    sub_25B4A6774((uint64_t)&v14[v15], (uint64_t)v33 + v15);
    v15 += 152;
  }
  while (v15 != 304);
  uint64_t v16 = 0;
  v23 = v14 + 304;
  do
  {
    *(void *)&v35[v16] = &unk_2708F18C0;
    v17 = *(std::__shared_weak_count **)&v37[v16];
    if (v17) {
      sub_25B404120(v17);
    }
    v16 -= 152;
  }
  while (v16 != -304);
  sub_25B4A3BF8((uint64_t)&v19, &v22);
  uint64_t v31 = 0x200000001;
  int v32 = 0;
  sub_25B4A46C8(v33, (uint64_t)&v19, (uint64_t)&v31);
  sub_25B4A4FA0((uint64_t)p_search_range_3, (uint64_t)v33);
  v34 = &unk_2708F18C0;
  if (v36) {
    sub_25B404120(v36);
  }
  uint64_t v19 = (uint64_t)&unk_2708F18C0;
  if (v21) {
    sub_25B404120(v21);
  }
  *(void *)&v33[0] = &v22;
  sub_25B4A3B38((void ***)v33);
  v25[0] = &unk_2708F1C28;
  if (v26) {
    sub_25B404120(v26);
  }
  v27[0] = &unk_2708F1C28;
  if (v28) {
    sub_25B404120(v28);
  }
  self->_online_fusion._vptr$RSOnlineFusion = (void **)&unk_2708F1698;
  *(void *)self->_anon_2b8 = 0;
  *(_OWORD *)&self->_anon_2b8[8] = 0u;
  self->_anon_2b8[24] = 0;
  *(void *)&self->_anon_2b8[40] = &unk_2708F1E98;
  *(void *)&self->_anon_2b8[208] = 0;
  *(_OWORD *)&self->_anon_2b8[48] = 0u;
  *(_OWORD *)&self->_anon_2b8[64] = 0u;
  *(_OWORD *)&self->_anon_2b8[80] = 0u;
  *(_OWORD *)&self->_anon_2b8[96] = 0u;
  *(_OWORD *)&self->_anon_2b8[112] = 0u;
  *(_OWORD *)&self->_anon_2b8[128] = 0u;
  *(_OWORD *)&self->_anon_2b8[144] = 0u;
  *(_OWORD *)&self->_anon_2b8[160] = 0u;
  *(_OWORD *)&self->_anon_2b8[176] = 0u;
  *(_OWORD *)&self->_anon_2b8[192] = 0u;
  *(void *)&self->_anon_2b8[216] = &unk_2708F1F38;
  *(void *)&self->_anon_2b8[240] = 0;
  *(_OWORD *)&self->_anon_2b8[224] = 0u;
  sub_25B3F6148((uint64_t)&self->_anon_2b8[248]);
  *(void *)&self->_anon_2b8[440] = 0;
  *(_OWORD *)&self->_anon_2b8[424] = 0u;
  *(_OWORD *)&self->_anon_2b8[456] = xmmword_25B5F1070;
  *(_OWORD *)&self->_anon_2b8[472] = xmmword_25B5F1080;
  *(_OWORD *)&self->_anon_2b8[488] = xmmword_25B5F1090;
  *(void *)&self->_anon_2b8[504] = 0x3F0000003E4CCCCDLL;
  *(void *)&self->_anon_2b8[512] = 0x3F40000000000003;
  *(_DWORD *)&self->_anon_2b8[520] = 3;
  *((_OWORD *)v4 + 43) = xmmword_25B5F10A0;
  *((_OWORD *)v4 + 44) = xmmword_25B5F10B0;
  *((_OWORD *)v4 + 45) = xmmword_25B5F10C0;
  *(_DWORD *)&self->_anon_2b8[572] = 2;
  *(_OWORD *)(v4 + 740) = xmmword_25B5F1480;
  *(void *)&self->_anon_2b8[592] = &unk_2708F1570;
  *(void *)&self->_anon_2b8[600] = &unk_2708F16F8;
  *(_OWORD *)(v4 + 772) = xmmword_25B5F1490;
  *(_OWORD *)(v4 + 788) = xmmword_25B5F14A0;
  *(_OWORD *)(v4 + 804) = xmmword_25B5F1070;
  *(_OWORD *)(v4 + 820) = xmmword_25B5F1080;
  *(_OWORD *)(v4 + 836) = xmmword_25B5F1090;
  *(void *)&self->_anon_2b8[688] = 0x3F0000003E4CCCCDLL;
  *(void *)&self->_anon_2b8[696] = 0x3F40000000000003;
  *(_DWORD *)&self->_anon_2b8[704] = 3;
  *(_OWORD *)(v4 + 872) = xmmword_25B5F10A0;
  *(_OWORD *)(v4 + 888) = xmmword_25B5F10B0;
  *(_OWORD *)(v4 + 904) = xmmword_25B5F10C0;
  *(_DWORD *)&self->_anon_2b8[756] = 2;
  *(_OWORD *)&self->_anon_2b8[760] = 0u;
  *(_OWORD *)&self->_anon_2b8[776] = 0u;
  *(_OWORD *)&self->_anon_2b8[792] = 0u;
  *(_DWORD *)&self->_anon_2b8[808] = 1077936128;
  *((void *)v4 + 122) = 0x2800000032;
  *(_OWORD *)(v4 + 984) = xmmword_25B5F14B0;
  *(void *)&self->_anon_2b8[836] = 0x240400000;
  *((_OWORD *)v4 + 63) = xmmword_25B5F14C0;
  *((void *)v4 + 128) = 0x3DCCCCCD3E99999ALL;
  *(_DWORD *)&self->_anon_2b8[868] = 0;
  *(_OWORD *)&self->_anon_2b8[872] = xmmword_25B5F14D0;
  *(void *)&self->_anon_2b8[888] = 0x41A000003F000000;
  *(void *)&self->_anon_2b8[920] = 0;
  *(_OWORD *)&self->_anon_2b8[904] = 0u;
  self->_anon_2b8[896] = 0;
  self->_tracing_map._vptr$TracingMap = (void **)&unk_2708F1880;
  self->_tracing_map._values.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_tracing_map._values.__table_.__p1_.__value_.__next_ = 0u;
  self->_tracing_map._values.__table_.__p3_.__value_ = 1.0;
  self->_tracing_map._voxel_sz = 0.05;
  *(_OWORD *)&self->_online_config.major_fov_angle_thres = xmmword_25B5F1070;
  *(_OWORD *)&self->_online_config.angle_thres = xmmword_25B5F1080;
  *(_OWORD *)&self->_online_config.overlap_angle_thres = xmmword_25B5F1090;
  *(void *)&self->_online_config.shorten_len_thr = 0x3F0000003E4CCCCDLL;
  *(void *)&self->_online_config.shorten_non_match_thr = 0x3F40000000000003;
  self->_online_config.standalone_opening_thr = 3;
  *((_OWORD *)v4 + 77) = xmmword_25B5F10A0;
  *((_OWORD *)v4 + 78) = xmmword_25B5F10B0;
  *((_OWORD *)v4 + 79) = xmmword_25B5F10C0;
  self->_online_config.low_conf_wall_non_match_thr = 2;
  self->_density_map._vptr$Tensor = (void **)&unk_2708F18E0;
  *(_OWORD *)&self->_density_map._view._stride_of_view._sp[4] = 0u;
  *(_OWORD *)&self->_density_map._view._stride_of_view._sp[2] = 0u;
  *(_OWORD *)self->_density_map._view._stride_of_view._sp = 0u;
  *(_OWORD *)&self->_density_map._view._shape_of_view._sp[4] = 0u;
  *(_OWORD *)&self->_density_map._view._shape_of_view._sp[2] = 0u;
  *(_OWORD *)self->_density_map._view._shape_of_view._sp = 0u;
  self->_density_map._storage = 0u;
  *(_WORD *)&self->_density_map._is_contiguous = 257;
  return self;
}

- (void).cxx_destruct
{
  self->_density_map._vptr$Tensor = (void **)&unk_2708F18E0;
  cntrl = self->_density_map._storage.__cntrl_;
  if (cntrl) {
    sub_25B404120((std::__shared_weak_count *)cntrl);
  }
  self->_tracing_map._vptr$TracingMap = (void **)&unk_2708F1880;
  sub_25B52F9E0(&self->_tracing_map._values.__table_.__bucket_list_.__ptr_.__value_);
  sub_25B3FB178((uint64_t)&self->_tracing_map._values);
  objc_storeStrong((id *)&self->_prevFloorPlan, 0);
  sub_25B482144((uint64_t)&self->_online_fusion);

  sub_25B4A705C((uint64_t)&self->_online_refinement);
}

- (RSWallOpeningOnlineOptimizer)init
{
  v7.receiver = self;
  v7.super_class = (Class)RSWallOpeningOnlineOptimizer;
  v2 = [(RSWallOpeningOnlineOptimizer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_isActiveWallEnabled = 1;
    v4 = objc_alloc_init(RSFloorPlan);
    prevFloorPlan = v3->_prevFloorPlan;
    v3->_prevFloorPlan = v4;

    v3->_tracing_map._voxel_sz = 0.05;
    v3->_isCurvedWallEnabled = 0;
  }
  return v3;
}

@end