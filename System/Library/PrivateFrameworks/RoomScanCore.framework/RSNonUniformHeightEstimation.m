@interface RSNonUniformHeightEstimation
- (RSNonUniformHeightEstimation)init;
- (id).cxx_construct;
@end

@implementation RSNonUniformHeightEstimation

- (id).cxx_construct
{
  self->_height_estimator._vptr$HeightCoreBase = (void **)&unk_2708F1C68;
  self->_height_estimator._height_model_input = 0;
  self->_height_estimator._line_generator._vptr$LineGeneration = (void **)&unk_2708F1348;
  self->_height_estimator._line_generator.height_fit._vptr$HeightLineFit = (void **)&unk_2708F1368;
  *(void *)&self->_height_estimator._line_generator.height_fit.edge_score_thr = 0x33DCCCCCDLL;
  *(void *)&self->_height_estimator._line_generator.height_fit.pixel_sz = 0x3F0000003CF5C28FLL;
  self->_height_estimator._line_generator.gt_width = 3;
  self->_height_estimator._global_optimization._vptr$GlobalOptimization = (void **)&unk_2708F1388;
  *(_OWORD *)&self->_height_estimator._global_optimization.small_wall_len_thr = xmmword_25B5F1160;
  *(void *)&long long v2 = 0x3F0000003F000000;
  *((void *)&v2 + 1) = 0x3F0000003F000000;
  *(_OWORD *)&self->_height_estimator._global_optimization.occlusion_thr = v2;
  *(_OWORD *)&self->_height_estimator._global_optimization.window_lower_thr = xmmword_25B5F1170;
  *(_OWORD *)&self->_height_estimator._global_optimization.occlusion_score_thr = xmmword_25B5F1180;
  self->_height_estimator._global_optimization.neighbor_height_align_thr = 0.09;
  *(_OWORD *)&self->_height_estimator._inputs_name.__begin_ = 0u;
  *(_OWORD *)&self->_height_estimator._inputs_name.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_height_estimator._outputs_name.__end_ = 0u;
  *(_OWORD *)&self->_height_estimator._path_pool.__begin_ = 0u;
  self->_height_estimator._path_pool.__end_cap_.__value_ = 0;
  self->_height_estimator._path_fusion._skip_stat_dict.__tree_.__pair1_.__value_.__left_ = 0;
  self->_height_estimator._path_fusion._vptr$PathFusion = (void **)&unk_2708F1C98;
  self->_height_estimator._path_fusion._skip_stat_dict.__tree_.__pair3_.__value_ = 0;
  self->_height_estimator._path_fusion._skip_stat_dict.__tree_.__begin_node_ = &self->_height_estimator._path_fusion._skip_stat_dict.__tree_.__pair1_;
  *(void *)&self->_height_estimator._path_fusion.height_diff_thr = 0x3F0000003F000000;
  operator new();
}

- (void).cxx_destruct
{
}

- (RSNonUniformHeightEstimation)init
{
  *(void *)&long long v23 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)RSNonUniformHeightEstimation;
  long long v2 = [(RSNonUniformHeightEstimation *)&v20 init];
  v3 = v2;
  if (v2) {
    v2->_isNonUniformHeightEnabled = 1;
  }
  v4 = (void *)MEMORY[0x263F086E0];
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_bundleForClass_(v4, v6, v5);
  v9 = objc_msgSend_stringByAppendingPathComponent_(@"PrecompiledModels", v8, @"nuh_model.bundle");
  sub_25B5C99C8(v9, 0, v7);
  id v10 = objc_claimAutoreleasedReturnValue();
  v13 = (char *)objc_msgSend_UTF8String(v10, v11, v12);
  sub_25B403500(v18, v13);
  sub_25B403500(&__p, "height_image");
  sub_25B561750((uint64_t)&v3->_height_estimator._inputs_name, &__p, (long long *)v22, 1uLL);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  sub_25B403500(&__p, "406");
  sub_25B403500(v22, "417");
  sub_25B561750((uint64_t)&v3->_height_estimator._outputs_name, &__p, &v23, 2uLL);
  for (uint64_t i = 0; i != -6; i -= 3)
  {
    if (SHIBYTE(v22[i + 2]) < 0) {
      operator delete(*(void **)((char *)&__p + i * 8 + 24));
    }
  }
  v15 = (RSSemanticImage *)sub_25B4FDB1C([RSSemanticImage alloc], 128, 256, 25, 1, v3->_height_estimator.flt_type);
  height_model_input = v3->_height_estimator._height_model_input;
  v3->_height_estimator._height_model_input = v15;

  (*((void (**)(HeightCoreEspV2 *, void **))v3->_height_estimator._vptr$HeightCoreBase + 2))(&v3->_height_estimator, v18);
  if (v19 < 0) {
    operator delete(v18[0]);
  }

  return v3;
}

@end