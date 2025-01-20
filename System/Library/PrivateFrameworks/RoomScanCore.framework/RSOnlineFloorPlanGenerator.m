@interface RSOnlineFloorPlanGenerator
- (RSOnlineFloorPlanGenerator)init;
- (void)clear;
- (void)generateFloorPlanWithInputDir:(id)a3 outputDir:(id)a4 debug:(BOOL)a5;
- (void)generateFloorPlanWithInputPath:(id)a3 outputPath:(id)a4 debug:(BOOL)a5;
@end

@implementation RSOnlineFloorPlanGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floorPlanDebug, 0);
  objc_storeStrong((id *)&self->_floorPlanForOffline, 0);
  objc_storeStrong((id *)&self->_markerSignal, 0);
  objc_storeStrong((id *)&self->_markerCoaching, 0);
  objc_storeStrong((id *)&self->_floorEstimator, 0);
  objc_storeStrong((id *)&self->_parentAssociation, 0);
  objc_storeStrong((id *)&self->_recessedAreaReconstructor, 0);
  objc_storeStrong((id *)&self->_openingHeightAlignment, 0);
  objc_storeStrong((id *)&self->_heightEstimator, 0);
  objc_storeStrong((id *)&self->_projector, 0);
  objc_storeStrong((id *)&self->_scanUiFormatter, 0);
  objc_storeStrong((id *)&self->_geometryEstimator, 0);
  objc_storeStrong((id *)&self->_accumulator, 0);
  objc_storeStrong((id *)&self->_wallOpeningDetector, 0);
  objc_storeStrong((id *)&self->_mirrorDetector, 0);
  objc_storeStrong((id *)&self->_onlineDoorWindow, 0);

  objc_storeStrong((id *)&self->_onlineWallOpeningConsistency, 0);
}

- (void)clear
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  v128.receiver = self;
  v128.super_class = (Class)RSOnlineFloorPlanGenerator;
  [(RSFloorPlanGeneratorBase *)&v128 clear];
  onlineWallOpeningConsistency = (std::string *)self->_onlineWallOpeningConsistency;
  if (onlineWallOpeningConsistency)
  {
    std::string::size_type size = onlineWallOpeningConsistency[31].__r_.__value_.__l.__size_;
    std::string::pointer data = onlineWallOpeningConsistency[31].__r_.__value_.__l.__data_;
    if ((std::string::pointer)size != data)
    {
      std::string::size_type v9 = size - 176;
      v10 = (void (***)(void))(size - 176);
      v11 = (void (***)(void))(size - 176);
      do
      {
        v12 = *v11;
        v11 -= 22;
        (*v12)(v10);
        v9 -= 176;
        _ZF = v10 == (void (***)(void))data;
        v10 = v11;
      }
      while (!_ZF);
    }
    onlineWallOpeningConsistency[31].__r_.__value_.__l.__size_ = (std::string::size_type)data;
    std::string::size_type v14 = onlineWallOpeningConsistency[32].__r_.__value_.__l.__size_;
    std::string::pointer v15 = onlineWallOpeningConsistency[32].__r_.__value_.__l.__data_;
    if ((std::string::pointer)v14 != v15)
    {
      std::string::size_type v16 = v14 - 176;
      v17 = (void (***)(void))(v14 - 176);
      v18 = (void (***)(void))(v14 - 176);
      do
      {
        v19 = *v18;
        v18 -= 22;
        (*v19)(v17);
        v16 -= 176;
        _ZF = v17 == (void (***)(void))v15;
        v17 = v18;
      }
      while (!_ZF);
    }
    onlineWallOpeningConsistency[32].__r_.__value_.__l.__size_ = (std::string::size_type)v15;
    std::string::size_type v20 = onlineWallOpeningConsistency[33].__r_.__value_.__l.__size_;
    std::string::pointer v21 = onlineWallOpeningConsistency[33].__r_.__value_.__l.__data_;
    if ((std::string::pointer)v20 != v21)
    {
      std::string::size_type v22 = v20 - 176;
      v23 = (void (***)(void))(v20 - 176);
      v24 = (void (***)(void))(v20 - 176);
      do
      {
        v25 = *v24;
        v24 -= 22;
        (*v25)(v23);
        v22 -= 176;
        _ZF = v23 == (void (***)(void))v21;
        v23 = v24;
      }
      while (!_ZF);
    }
    onlineWallOpeningConsistency[33].__r_.__value_.__l.__size_ = (std::string::size_type)v21;
    std::string::size_type v26 = onlineWallOpeningConsistency[34].__r_.__value_.__l.__size_;
    std::string::pointer v27 = onlineWallOpeningConsistency[34].__r_.__value_.__l.__data_;
    if ((std::string::pointer)v26 != v27)
    {
      std::string::size_type v28 = v26 - 176;
      v29 = (void (***)(void))(v26 - 176);
      v30 = (void (***)(void))(v26 - 176);
      do
      {
        v31 = *v30;
        v30 -= 22;
        (*v31)(v29);
        v28 -= 176;
        _ZF = v29 == (void (***)(void))v27;
        v29 = v30;
      }
      while (!_ZF);
    }
    onlineWallOpeningConsistency[34].__r_.__value_.__l.__size_ = (std::string::size_type)v27;
    std::string::size_type v32 = onlineWallOpeningConsistency[35].__r_.__value_.__l.__size_;
    std::string::pointer v33 = onlineWallOpeningConsistency[35].__r_.__value_.__l.__data_;
    if ((std::string::pointer)v32 != v33)
    {
      std::string::size_type v34 = v32 - 176;
      v35 = (void (***)(void))(v32 - 176);
      v36 = (void (***)(void))(v32 - 176);
      do
      {
        v37 = *v36;
        v36 -= 22;
        (*v37)(v35);
        v34 -= 176;
        _ZF = v35 == (void (***)(void))v33;
        v35 = v36;
      }
      while (!_ZF);
    }
    onlineWallOpeningConsistency[35].__r_.__value_.__l.__size_ = (std::string::size_type)v33;
    std::string::size_type v38 = onlineWallOpeningConsistency[36].__r_.__value_.__l.__size_;
    std::string::pointer v39 = onlineWallOpeningConsistency[36].__r_.__value_.__l.__data_;
    if ((std::string::pointer)v38 != v39)
    {
      std::string::size_type v40 = v38 - 176;
      v41 = (void (***)(void))(v38 - 176);
      v42 = (void (***)(void))(v38 - 176);
      do
      {
        v43 = *v42;
        v42 -= 22;
        (*v43)(v41);
        v40 -= 176;
        _ZF = v41 == (void (***)(void))v39;
        v41 = v42;
      }
      while (!_ZF);
    }
    onlineWallOpeningConsistency[36].__r_.__value_.__l.__size_ = (std::string::size_type)v39;
    std::string::size_type v44 = onlineWallOpeningConsistency[37].__r_.__value_.__l.__size_;
    std::string::pointer v45 = onlineWallOpeningConsistency[37].__r_.__value_.__l.__data_;
    while ((std::string::pointer)v44 != v45)
    {
      v46 = *(void **)(v44 - 8);
      v44 -= 8;
    }
    onlineWallOpeningConsistency[37].__r_.__value_.__l.__size_ = (std::string::size_type)v45;
    sub_25B5935B4(onlineWallOpeningConsistency[38].__r_.__value_.__r.__words);
    std::string::pointer v48 = onlineWallOpeningConsistency[61].__r_.__value_.__l.__data_;
    v49 = (void (***)(void))onlineWallOpeningConsistency[60].__r_.__value_.__r.__words[2];
    if (v48 != (std::string::pointer)v49)
    {
      std::string::pointer v50 = v48 - 320;
      v51 = (void (***)(void))(v48 - 320);
      do
      {
        (**v51)(v51);
        v50 -= 320;
        _ZF = v51 == v49;
        v51 -= 40;
      }
      while (!_ZF);
    }
    onlineWallOpeningConsistency[61].__r_.__value_.__r.__words[0] = (std::string::size_type)v49;
    std::string::pointer v52 = onlineWallOpeningConsistency[62].__r_.__value_.__l.__data_;
    std::string::size_type v53 = onlineWallOpeningConsistency[61].__r_.__value_.__r.__words[2];
    while (v52 != (std::string::pointer)v53)
    {
      v54 = (void *)*((void *)v52 - 1);
      v52 -= 8;
    }
    onlineWallOpeningConsistency[62].__r_.__value_.__r.__words[0] = v53;
    onlineWallOpeningConsistency[66].__r_.__value_.__s.__data_[8] = 0;
    std::string::pointer v55 = onlineWallOpeningConsistency[67].__r_.__value_.__l.__data_;
    std::string::size_type v56 = onlineWallOpeningConsistency[66].__r_.__value_.__r.__words[2];
    if (v55 != (std::string::pointer)v56)
    {
      std::string::pointer v57 = v55 - 176;
      v58 = (void (***)(void))(v55 - 176);
      v59 = (void (***)(void))(v55 - 176);
      do
      {
        v60 = *v59;
        v59 -= 22;
        (*v60)(v58);
        v57 -= 176;
        _ZF = v58 == (void (***)(void))v56;
        v58 = v59;
      }
      while (!_ZF);
    }
    onlineWallOpeningConsistency[67].__r_.__value_.__r.__words[0] = v56;
    onlineWallOpeningConsistency[29].__r_.__value_.__l.__size_ = onlineWallOpeningConsistency[29].__r_.__value_.__r.__words[0];
    v129[0] = 0;
    char v130 = 0;
    sub_25B4ADFB8(onlineWallOpeningConsistency + 14, (uint64_t)v129, v47);
    if (v130) {
      sub_25B3F5FE8((uint64_t)v129);
    }
    v61 = objc_alloc_init(RSFloorPlan);
    std::string::pointer v62 = onlineWallOpeningConsistency[68].__r_.__value_.__l.__data_;
    onlineWallOpeningConsistency[68].__r_.__value_.__r.__words[0] = (std::string::size_type)v61;

    sub_25B52F9E0(onlineWallOpeningConsistency[69].__r_.__value_.__r.__words);
  }
  onlineDoorWindow = self->_onlineDoorWindow;
  if (onlineDoorWindow)
  {
    sub_25B4801A8((uint64_t)&onlineDoorWindow->_merger_for_close_door_window);
    sub_25B4801A8((uint64_t)&onlineDoorWindow->_merger_for_open_door);
    objc_msgSend_removeAllObjects(onlineDoorWindow->_wall_selector_for_door_window._infer_wall_openings, v64, v65);
    objc_msgSend_removeAllObjects(onlineDoorWindow->_wall_selector_for_door_window._target_infer_wall_openings, v66, v67);
    onlineDoorWindow->_wall_selector_for_door_window._infer_wall_openings_attributes.__end_ = onlineDoorWindow->_wall_selector_for_door_window._infer_wall_openings_attributes.__begin_;
    onlineDoorWindow->_wall_selector_for_door_window._target_infer_wall_openings_attributes.__end_ = onlineDoorWindow->_wall_selector_for_door_window._target_infer_wall_openings_attributes.__begin_;
    objc_msgSend_removeAllObjects(onlineDoorWindow->_open_selector_for_door_window._infer_wall_openings, v68, v69);
    objc_msgSend_removeAllObjects(onlineDoorWindow->_open_selector_for_door_window._target_infer_wall_openings, v70, v71);
    onlineDoorWindow->_open_selector_for_door_window._infer_wall_openings_attributes.__end_ = onlineDoorWindow->_open_selector_for_door_window._infer_wall_openings_attributes.__begin_;
    onlineDoorWindow->_open_selector_for_door_window._target_infer_wall_openings_attributes.__end_ = onlineDoorWindow->_open_selector_for_door_window._target_infer_wall_openings_attributes.__begin_;
  }
  mirrorDetector = self->_mirrorDetector;
  if (mirrorDetector) {
    objc_msgSend_removeAllObjects(mirrorDetector->_mirrorPoints, v3, v4);
  }
  accumulator = self->_accumulator;
  if (accumulator)
  {
    objc_msgSend_removeAllObjects(accumulator->_metas, v3, v4);
    objc_msgSend_removeAllObjects(accumulator->_diffKeyframes, v74, v75);
    objc_msgSend_removeAllObjects(accumulator->_newKeyframes, v76, v77);
    objc_msgSend_removeAllObjects(accumulator->_keyframeOrderDict, v78, v79);
    objc_msgSend_reset(accumulator->_worldpc, v80, v81);
    sub_25B4D4040((uint64_t)accumulator->_accMeta, v82, v83);
    accumulator->_skipCnt = 0;
  }
  geometryEstimator = self->_geometryEstimator;
  if (geometryEstimator)
  {
    geoMeta = geometryEstimator->_geoMeta;
    if (geoMeta)
    {
      geoMeta->_isCenterScaleUpdated = 0;
      v86 = geometryEstimator->_geoMeta;
      if (v86)
      {
        v86->_pixelSize = geometryEstimator->_initParam.pixel_sz;
        v87 = geometryEstimator->_geoMeta;
        if (v87)
        {
          v5.f64[0] = geometryEstimator->_initParam.z_slice_pixel;
          __asm { FMOV            V2.2D, #1.0 }
          *(float64x2_t *)&v87->_scale[4] = vdivq_f64(_Q2, (float64x2_t)vdupq_lane_s64(COERCE__INT64(v87->_pixelSize), 0));
          *(float64x2_t *)&v87->_scale[20] = vdivq_f64(_Q2, v5);
          v92 = geometryEstimator->_geoMeta;
          if (v92)
          {
            *(_OWORD *)&v92->_center[4] = 0u;
            v93 = geometryEstimator->_geoMeta;
            if (v93)
            {
              *(void *)&v93->_shift[4] = 0;
              *(void *)&v93->_shift[12] = 0;
              *(_OWORD *)&v93->_shift[20] = 0uLL;
              v94 = geometryEstimator->_geoMeta;
              if (v94)
              {
                v94->_floorHeight = 0.0;
                v95 = geometryEstimator->_geoMeta;
                if (v95)
                {
                  v95->_ceilingHeight = 0.0;
                  v96 = geometryEstimator->_geoMeta;
                  if (v96)
                  {
                    v96->_supportHeight = 0.0;
                    v97 = geometryEstimator->_geoMeta;
                    if (v97)
                    {
                      uint64_t v98 = 28;
                      if (!geometryEstimator->_initParam.use_dynamic_img_sz) {
                        uint64_t v98 = 20;
                      }
                      v97->_imageSize = *(_DWORD *)((char *)&geometryEstimator->super.isa + v98);
                      v99 = geometryEstimator->_geoMeta;
                      if (v99)
                      {
                        *(void *)&v99->_floorCeilingCount[4] = 0;
                        v100 = geometryEstimator->_geoMeta;
                        if (v100) {
                          v100->_zSlice = geometryEstimator->_initParam.z_slice;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    int img_sz_step = geometryEstimator->_initParam.img_sz_step;
    geometryEstimator->_output_count = 0;
    geometryEstimator->_int img_sz_step = img_sz_step;
  }
  sub_25B51F628((uint64_t)self->_scanUiFormatter);
  projector = self->_projector;
  if (projector)
  {
    uint64_t image = (uint64_t)projector->_image;
    if (image) {
      sub_25B4FDD60(image);
    }
    uint64_t bufferImage = (uint64_t)projector->_bufferImage;
    if (bufferImage) {
      sub_25B4FDD60(bufferImage);
    }
    uint64_t heightImage = (uint64_t)projector->_heightImage;
    if (heightImage) {
      sub_25B4FDD60(heightImage);
    }
    uint64_t bufferHeightImage = (uint64_t)projector->_bufferHeightImage;
    if (bufferHeightImage) {
      sub_25B4FDD60(bufferHeightImage);
    }
    uint64_t doorImage = (uint64_t)projector->_doorImage;
    if (doorImage) {
      sub_25B4FDD60(doorImage);
    }
    uint64_t bufferDoorImage = (uint64_t)projector->_bufferDoorImage;
    if (bufferDoorImage) {
      sub_25B4FDD60(bufferDoorImage);
    }
    *(int32x2_t *)&projector->_maxDensity2d = vcvt_s32_f32(*(float32x2_t *)&projector->_initParam.global_max_density);
  }
  markerCoaching = self->_markerCoaching;
  if (markerCoaching)
  {
    markerCoaching->_generator._pool.__end_ = markerCoaching->_generator._pool.__begin_;
    sub_25B413CCC((uint64_t *)&markerCoaching->_generator._all_major_convex_hulls);
    markerCoaching->_all_major_view_lines.__end_ = markerCoaching->_all_major_view_lines.__begin_;
    markerCoaching[1]._generator._vptr$MarkerProposal = (void **)markerCoaching[1].super.isa;
  }
  sub_25B4137C0((uint64_t *)self->_heightEstimator);
  openingHeightAlignment = self->_openingHeightAlignment;
  if (openingHeightAlignment)
  {
    sub_25B4011C0((uint64_t)&openingHeightAlignment->_openingHeightAlignment._opening_fixed);
    openingHeightAlignment->_openingHeightAlignment._floor_v = 1.0;
  }
  recessedAreaReconstructor = self->_recessedAreaReconstructor;
  if (recessedAreaReconstructor)
  {
    objc_msgSend_removeAllObjects(recessedAreaReconstructor->_current_frame_recessed_area_list, v110, v111);
    objc_msgSend_removeAllObjects(recessedAreaReconstructor->_recessed_area_pool, v114, v115);
    if (recessedAreaReconstructor->_last_frame_recall_idx.__table_.__p2_.__value_)
    {
      next = recessedAreaReconstructor->_last_frame_recall_idx.__table_.__p1_.__value_.__next_;
      if (next)
      {
        do
        {
          v117 = (void *)*next;
          operator delete(next);
          next = v117;
        }
        while (v117);
      }
      recessedAreaReconstructor->_last_frame_recall_idx.__table_.__p1_.__value_.__next_ = 0;
      unint64_t value = recessedAreaReconstructor->_last_frame_recall_idx.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        for (uint64_t i = 0; i != value; ++i)
          recessedAreaReconstructor->_last_frame_recall_idx.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
      }
      recessedAreaReconstructor->_last_frame_recall_idx.__table_.__p2_.__value_ = 0;
    }
  }
  sub_25B5A4ADC((uint64_t)self->_floorEstimator);
  v120 = objc_alloc_init(RSFloorPlan);
  floorPlanForOffline = self->_floorPlanForOffline;
  self->_floorPlanForOffline = v120;

  v122 = objc_alloc_init(RSMarkerSignal);
  markerSignal = self->_markerSignal;
  self->_markerSignal = v122;

  objc_msgSend_array(MEMORY[0x263EFF980], v124, v125);
  v126 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  floorPlanDebug = self->_floorPlanDebug;
  self->_floorPlanDebug = v126;
}

- (RSOnlineFloorPlanGenerator)init
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  v83.receiver = self;
  v83.super_class = (Class)RSOnlineFloorPlanGenerator;
  v2 = [(RSFloorPlanGeneratorBase *)&v83 init];
  if (!v2) {
    goto LABEL_40;
  }
  v3 = objc_alloc_init(RSWallOpeningOnlineOptimizer);
  onlineWallOpeningConsistency = v2->_onlineWallOpeningConsistency;
  v2->_onlineWallOpeningConsistency = v3;

  float64x2_t v5 = objc_alloc_init(RSDoorWindowOnlineDetector);
  onlineDoorWindow = v2->_onlineDoorWindow;
  v2->_onlineDoorWindow = v5;

  v7 = objc_alloc_init(RSMirrorDetection);
  mirrorDetector = v2->_mirrorDetector;
  v2->_mirrorDetector = v7;

  std::string::size_type v9 = objc_alloc_init(RSProjection2DZ);
  projector = v2->_projector;
  v2->_projector = v9;

  v11 = [RSWallOpeningOnlineDetector alloc];
  uint64_t v12 = sub_25B400D94((id *)&v2->_projector->super.isa);
  uint64_t v81 = (void *)v12;
  if (v12 && *(void *)(v12 + 64) == 1) {
    v78 = *(__CVBuffer **)(v12 + 8);
  }
  else {
    v78 = 0;
  }
  if (!v11)
  {
    std::string::pointer v45 = 0;
LABEL_36:
    v46 = 0;
    goto LABEL_38;
  }
  v104.receiver = v11;
  v104.super_class = (Class)RSWallOpeningOnlineDetector;
  v13 = [(RSFloorPlanGeneratorBase *)&v104 init];
  if (v13)
  {
    std::string::size_type v14 = (void *)MEMORY[0x263F086E0];
    uint64_t v79 = v13;
    uint64_t v15 = objc_opt_class();
    v82 = objc_msgSend_bundleForClass_(v14, v16, v15);
    uint64_t v77 = objc_msgSend_stringByAppendingPathComponent_(@"PrecompiledModels", v17, @"lcnn_floorplan_model.bundle");
    sub_25B5C99C8(v77, 0, v82);
    id v80 = (id)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      sub_25B403500(buf, "0_weight.npy");
      sub_25B403500((void *)&v106 + 1, "1_weight.npy");
      sub_25B403500(v108, "2_weight.npy");
      sub_25B403500(v109, "0_bias.npy");
      sub_25B403500(v110, "1_bias.npy");
      sub_25B403500(v111, "2_bias.npy");
      v101 = 0;
      v102 = 0;
      v103 = 0;
      __p[0] = &v101;
      LOBYTE(__p[1]) = 0;
      v101 = (char *)operator new(0x90uLL);
      v102 = v101;
      v103 = v101 + 144;
      uint64_t v18 = 0;
      v102 = sub_25B4FF578((uint64_t)&v103, (long long *)buf, &v112, v101);
      do
      {
        if (SHIBYTE(v111[v18 + 2]) < 0) {
          operator delete((void *)v111[v18]);
        }
        v18 -= 3;
      }
      while (v18 != -18);
      uint64_t v98 = 0;
      v99 = 0;
      unint64_t v100 = 0;
      std::string::size_type v20 = v101;
      if (v102 == v101)
      {
LABEL_32:
        memset(v88, 0, sizeof(v88));
        v90[0] = 0;
        v90[1] = 0;
        v89 = v90;
        uint64_t v91 = 70;
        uint64_t v92 = 0x42C800003C23D70ALL;
        long long v94 = xmmword_25B5F1280;
        long long v95 = xmmword_25B5F1290;
        int v93 = 0;
        int v96 = 1008981770;
        char v97 = 1;
        v87[0] = 1;
        *(_OWORD *)buf = xmmword_25B5F20E0;
        long long v106 = unk_25B5F20F0;
        sub_25B4FF638((char *)v88, (char *)buf, (uint64_t)&v107, 4uLL);
        sub_25B4FF734((uint64_t *)&v89);
        uint64_t v91 = 70;
        uint64_t v92 = 0x42C800003C23D70ALL;
        long long v94 = xmmword_25B5F1280;
        long long v95 = xmmword_25B5F1290;
        int v93 = 0;
        int v96 = 1008981770;
        char v97 = 1;
        sub_25B44B288((uint64_t)buf);
        sub_25B4FF7A0((uint64_t)buf, 1);
        sub_25B44B288((uint64_t)__p);
        sub_25B50066C((uint64_t)__p, 1);
        id v41 = v80;
        std::string::size_type v44 = (char *)objc_msgSend_UTF8String(v41, v42, v43);
        sub_25B403500(v84, v44);
        sub_25B44CD00((uint64_t)&v79->super._inputSemanticsVersion, (const void **)v84, &v98, v78, (uint64_t)v87, (uint64_t)buf, (uint64_t)__p);
      }
      uint64_t v21 = 0;
      unint64_t v22 = 0;
      while (1)
      {
        v23 = &v20[v21];
        if (v20[v21 + 23] < 0) {
          v23 = *(char **)v23;
        }
        v24 = objc_msgSend_stringWithUTF8String_(NSString, v19, (uint64_t)v23);
        std::string::size_type v26 = objc_msgSend_stringByAppendingString_(@"lcnn_floorplan_fc2_", v25, (uint64_t)v24);
        std::string::pointer v27 = sub_25B5C99C8(v26, 0, v82);

        if (!v27) {
          break;
        }
        id v28 = v27;
        v31 = (char *)objc_msgSend_UTF8String(v28, v29, v30);
        sub_25B403500(__p, v31);
        std::string::size_type v32 = v99;
        if ((unint64_t)v99 >= v100)
        {
          unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * ((v99 - v98) >> 3);
          unint64_t v35 = v34 + 1;
          if (v34 + 1 > 0xAAAAAAAAAAAAAAALL) {
            sub_25B3FBC4C();
          }
          if (0x5555555555555556 * ((uint64_t)(v100 - (void)v98) >> 3) > v35) {
            unint64_t v35 = 0x5555555555555556 * ((uint64_t)(v100 - (void)v98) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v100 - (void)v98) >> 3) >= 0x555555555555555) {
            unint64_t v36 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v36 = v35;
          }
          v107 = &v100;
          if (v36) {
            unint64_t v36 = (unint64_t)sub_25B413D74(v36);
          }
          else {
            uint64_t v37 = 0;
          }
          unint64_t v38 = v36 + 24 * v34;
          *(void *)buf = v36;
          *(void *)&buf[8] = v38;
          *((void *)&v106 + 1) = v36 + 24 * v37;
          long long v39 = *(_OWORD *)__p;
          *(void *)(v38 + 16) = v86;
          *(_OWORD *)unint64_t v38 = v39;
          __p[1] = 0;
          uint64_t v86 = 0;
          __p[0] = 0;
          *(void *)&long long v106 = v38 + 24;
          sub_25B4A2F38((uint64_t *)&v98, buf);
          std::string::size_type v40 = v99;
          sub_25B4A2FBC((uint64_t)buf);
          v99 = v40;
          if (SHIBYTE(v86) < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v33 = *(_OWORD *)__p;
          *((void *)v99 + 2) = v86;
          *std::string::size_type v32 = v33;
          v99 = (char *)v32 + 24;
        }

        ++v22;
        std::string::size_type v20 = v101;
        v21 += 24;
        if (v22 >= 0xAAAAAAAAAAAAAAABLL * ((v102 - v101) >> 3)) {
          goto LABEL_32;
        }
      }
      *(void *)buf = &v98;
      sub_25B41032C((void ***)buf);
      *(void *)buf = &v101;
      sub_25B41032C((void ***)buf);
    }

    std::string::pointer v45 = (RSWallOpeningOnlineDetector *)v79;
    goto LABEL_36;
  }
  std::string::pointer v45 = (RSWallOpeningOnlineDetector *)0;
  v46 = v45;
LABEL_38:

  wallOpeningDetector = v2->_wallOpeningDetector;
  v2->_wallOpeningDetector = v46;

  if (v2->_wallOpeningDetector)
  {
    std::string::pointer v48 = objc_alloc_init(RSKeyframeAccumulation);
    accumulator = v2->_accumulator;
    v2->_accumulator = v48;

    std::string::pointer v50 = objc_alloc_init(RSGeometryCalculation);
    geometryEstimator = v2->_geometryEstimator;
    v2->_geometryEstimator = v50;

    std::string::pointer v52 = objc_alloc_init(RSScanUIFormatter);
    scanUiFormatter = v2->_scanUiFormatter;
    v2->_scanUiFormatter = v52;

    v54 = objc_alloc_init(RSMarkerCoaching);
    markerCoaching = v2->_markerCoaching;
    v2->_markerCoaching = v54;

    std::string::size_type v56 = objc_alloc_init(RSNonUniformHeightEstimation);
    heightEstimator = v2->_heightEstimator;
    v2->_heightEstimator = v56;

    v58 = objc_alloc_init(RSOpeningHeightAlignment);
    openingHeightAlignment = v2->_openingHeightAlignment;
    v2->_openingHeightAlignment = v58;

    v60 = objc_alloc_init(RSParentAssociation);
    parentAssociation = v2->_parentAssociation;
    v2->_parentAssociation = v60;

    std::string::pointer v62 = objc_alloc_init(RSRecessedAreaReconstructor);
    recessedAreaReconstructor = v2->_recessedAreaReconstructor;
    v2->_recessedAreaReconstructor = v62;

    v64 = objc_alloc_init(RSFloorEstimation);
    floorEstimator = v2->_floorEstimator;
    v2->_floorEstimator = v64;

    v2->_isMarkerCoachingEnabled = 0;
    v2->_isNonUniformHeightEnabled = 1;
    v2->_isOpeningReplaceOpendoorEnabled = 1;
    v2->_isOpendoorReplaceOpeningEnabled = 0;
    v2->_isDoorReplaceOpeningEnabled = 1;
    v2->_isBayWindowRecessedAreaEnabled = 0;
    v66 = objc_alloc_init(RSFloorPlan);
    floorPlanForOffline = v2->_floorPlanForOffline;
    v2->_floorPlanForOffline = v66;

    v68 = objc_alloc_init(RSMarkerSignal);
    markerSignal = v2->_markerSignal;
    v2->_markerSignal = v68;

    uint64_t v72 = objc_msgSend_array(MEMORY[0x263EFF980], v70, v71);
    floorPlanDebug = v2->_floorPlanDebug;
    v2->_floorPlanDebug = (NSMutableArray *)v72;

    v2->_enableLiveDump = 0;
LABEL_40:
    v74 = v2;
    goto LABEL_46;
  }
  if (qword_26A5020E0 != -1) {
    dispatch_once(&qword_26A5020E0, &unk_2708F1278);
  }
  uint64_t v75 = (id)qword_26A5020D8;
  if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_25B3F3000, v75, OS_LOG_TYPE_ERROR, "Detector init failed", buf, 2u);
  }

  v74 = 0;
LABEL_46:

  return v74;
}

- (void)generateFloorPlanWithInputDir:(id)a3 outputDir:(id)a4 debug:(BOOL)a5
{
  BOOL v97 = a5;
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v98 = a4;
  int v96 = v6;
  std::string::size_type v9 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v7, v8);
  v11 = objc_msgSend_contentsOfDirectoryAtPath_error_(v9, v10, (uint64_t)v6, 0);

  long long v94 = v11;
  objc_super v104 = objc_msgSend_sortedArrayUsingComparator_(v11, v12, (uint64_t)&unk_2708F13B8);
  uint64_t v15 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v13, v14);
  objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v15, v16, (uint64_t)v98, 1, 0, 0);

  if (v97) {
    self->_enableLiveDump = 1;
  }
  uint64_t v21 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v17, v18);
  unint64_t v22 = 0;
  uint64_t v102 = 0;
  while (v22 < objc_msgSend_count(v104, v19, v20))
  {
    v24 = objc_msgSend_objectAtIndexedSubscript_(v104, v23, v22);
    uint64_t v103 = v22;
    char hasSuffix = objc_msgSend_hasSuffix_(v24, v25, @"fp_input.plist");

    if (hasSuffix)
    {
      std::string::pointer v27 = objc_msgSend_objectAtIndexedSubscript_(v104, v19, v103);
      v101 = objc_msgSend_stringByAppendingPathComponent_(v96, v28, (uint64_t)v27);

      id v29 = objc_alloc(NSDictionary);
      unint64_t v100 = objc_msgSend_initWithContentsOfFile_(v29, v30, (uint64_t)v101);
      std::string::size_type v32 = objc_msgSend_objectForKeyedSubscript_(v100, v31, @"keyframes");
      long long v33 = RSKeyframeSequenceFromDictionary(v32);

      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      unint64_t v36 = objc_msgSend_allKeys(v33, v34, v35);
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v106, v110, 16);
      if (v39)
      {
        uint64_t v40 = *(void *)v107;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v107 != v40) {
              objc_enumerationMutation(v36);
            }
            uint64_t v42 = *(void *)(*((void *)&v106 + 1) + 8 * i);
            uint64_t v43 = objc_msgSend_objectForKeyedSubscript_(v33, v38, v42);
            objc_msgSend_setObject_forKey_(v21, v44, (uint64_t)v43, v42);
          }
          uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v38, (uint64_t)&v106, v110, 16);
        }
        while (v39);
      }

      v105 = sub_25B420FE4(self, v21, MEMORY[0x263EFFA68]);
      v99 = objc_msgSend_walls(v105, v45, v46);
      uint64_t v49 = objc_msgSend_count(v99, v47, v48);
      std::string::pointer v52 = objc_msgSend_openings(v105, v50, v51);
      uint64_t v55 = objc_msgSend_count(v52, v53, v54);
      v58 = objc_msgSend_windows(v105, v56, v57);
      uint64_t v61 = objc_msgSend_count(v58, v59, v60);
      v64 = objc_msgSend_doors(v105, v62, v63);
      uint64_t v67 = objc_msgSend_count(v64, v65, v66);
      v70 = objc_msgSend_opendoors(v105, v68, v69);
      uint64_t v73 = objc_msgSend_count(v70, v71, v72);
      NSLog(&cfstr_RunWithFloorpl.isa, v102, v49, v55, v61, v67, v73);

      uint64_t v75 = objc_msgSend_objectAtIndexedSubscript_(v104, v74, v103);
      uint64_t v77 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v75, v76, @"fp_input.plist", @"fp_output.plist");

      uint64_t v79 = objc_msgSend_stringByAppendingPathComponent_(v98, v78, (uint64_t)v77);
      v82 = objc_msgSend_dictionaryRepresentation(v105, v80, v81);
      objc_msgSend_writeToFile_atomically_(v82, v83, (uint64_t)v79, 1);

      if (v97)
      {
        uint64_t v86 = objc_msgSend_stringByDeletingPathExtension(v79, v84, v85);
        v88 = objc_msgSend_stringByAppendingPathExtension_(v86, v87, @"obj");
        objc_msgSend_writeToObj_(v105, v89, (uint64_t)v88);
      }
      ++v102;
    }
    unint64_t v22 = v103 + 1;
  }
  if (v97)
  {
    v90 = sub_25B42106C(self, v23);
    uint64_t v92 = objc_msgSend_stringByAppendingPathComponent_(v98, v91, @"debug_info.plist");
    objc_msgSend_writeToFile_atomically_(v90, v93, (uint64_t)v92, 1);
  }
}

- (void)generateFloorPlanWithInputPath:(id)a3 outputPath:(id)a4 debug:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  BOOL v77 = v5;
  id v78 = a4;
  v76 = v8;
  NSLog(&cfstr_InputPathOutpu.isa, v8, v78, v5);
  v10 = objc_msgSend_dictionaryWithContentsOfFile_(NSDictionary, v9, (uint64_t)v8);
  self->_enableLiveDump = v5;
  uint64_t v75 = v10;
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"keyframes");
  v13 = RSKeyframeSequenceFromDictionary(v12);

  v74 = v13;
  std::string::size_type v16 = objc_msgSend_array(MEMORY[0x263EFF8C0], v14, v15);
  uint64_t v73 = self;
  v17 = sub_25B420FE4(self, v13, v16);

  uint64_t v20 = objc_msgSend_walls(v17, v18, v19);
  uint64_t v23 = objc_msgSend_count(v20, v21, v22);
  std::string::size_type v26 = objc_msgSend_openings(v17, v24, v25);
  uint64_t v29 = objc_msgSend_count(v26, v27, v28);
  std::string::size_type v32 = objc_msgSend_windows(v17, v30, v31);
  uint64_t v35 = objc_msgSend_count(v32, v33, v34);
  unint64_t v38 = objc_msgSend_doors(v17, v36, v37);
  uint64_t v41 = objc_msgSend_count(v38, v39, v40);
  std::string::size_type v44 = objc_msgSend_opendoors(v17, v42, v43);
  uint64_t v47 = objc_msgSend_count(v44, v45, v46);
  NSLog(&cfstr_OverallWallsLu.isa, v23, v29, v35, v41, v47);

  if (objc_msgSend_hasSuffix_(v78, v48, @".plist"))
  {
    uint64_t v51 = objc_msgSend_dictionaryRepresentation(v17, v49, v50);
    objc_msgSend_writeToFile_atomically_(v51, v52, (uint64_t)v78, 1);
  }
  else if (objc_msgSend_hasSuffix_(v78, v49, @".json"))
  {
    id v55 = v78;
    v58 = (char *)objc_msgSend_UTF8String(v55, v56, v57);
    sub_25B403500(__p, v58);
    sub_25B58C23C(v17, (uint64_t)__p, v59);
    if (v80 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    NSLog(&cfstr_OutputFormatNo.isa, v78);
  }
  if (v77)
  {
    uint64_t v60 = objc_msgSend_stringByDeletingPathExtension(v78, v53, v54);
    std::string::pointer v62 = objc_msgSend_stringByAppendingPathExtension_(v60, v61, @"obj");
    objc_msgSend_writeToObj_(v17, v63, (uint64_t)v62);

    uint64_t v65 = sub_25B42106C(v73, v64);
    uint64_t v66 = NSString;
    uint64_t v69 = objc_msgSend_stringByDeletingPathExtension(v78, v67, v68);
    uint64_t v71 = objc_msgSend_stringWithFormat_(v66, v70, @"%@_debug.plist", v69);
    objc_msgSend_writeToFile_atomically_(v65, v72, (uint64_t)v71, 1);
  }
}

@end