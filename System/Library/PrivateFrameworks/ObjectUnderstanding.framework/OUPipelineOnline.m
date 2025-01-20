@interface OUPipelineOnline
- (BOOL)updateCameraWithValid:(id)a3 ouframe:(id)a4;
- (BOOL)updateWorldPCWithKeyframes:(id)a3;
- (OUPipelineOnline)init;
- (OUPipelineOnline)initWithConfig:(id)a3;
- (id).cxx_construct;
- (id)getObjectAsset;
- (id)updatePipelineWithKeyframes:(double)a3 currentCameraPose:(double)a4;
- (id)updatePipelineWithKeyframes:(id)a3 ouframe:(id)a4;
- (void)CommonInit;
- (void)clear;
- (void)getPointCloudFromOUFrame:(simd_float4)a3 scenUnderstandingPose:(simd_float4)a4;
- (void)updateObjectAsset;
@end

@implementation OUPipelineOnline

- (OUPipelineOnline)init
{
  v4.receiver = self;
  v4.super_class = (Class)OUPipelineOnline;
  v2 = [(OUPipelineOnline *)&v4 init];
  v2->enable_3dor_ = 1;
  [(OUPipelineOnline *)v2 CommonInit];
  return v2;
}

- (OUPipelineOnline)initWithConfig:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OUPipelineOnline;
  v5 = [(OUPipelineOnline *)&v8 init];
  v6 = v5;
  if (v5)
  {
    -[OU3DObjectDetector setRgbRefinementEnabled:](v5->ou3dod_, "setRgbRefinementEnabled:", [v4 enableRgbRefinement]);
    -[OU3DObjectDetector setObjectRepresentationEnabled:](v6->ou3dod_, "setObjectRepresentationEnabled:", [v4 enable3DOROnline]);
    v6->enable_3dor_ = [v4 enable3DOROnline];
    [(OUPipelineOnline *)v6 CommonInit];
  }

  return v6;
}

- (void)CommonInit
{
  v3 = objc_alloc_init(OUObjectAsset);
  objectAsset = self->objectAsset_;
  self->objectAsset_ = v3;

  *(void *)&self->num_pre_key_frames_ = 0;
  self->depth_confidence_threshold_ = 0.8;
  allObjects = self->allObjects;
  self->allObjects = (NSArray *)MEMORY[0x263EFFA68];

  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  accumulatedPointCloud = self->accumulatedPointCloud_;
  self->accumulatedPointCloud_ = v6;

  objc_super v8 = [[OU3DObjectDetector alloc] init:1];
  ou3dod = self->ou3dod_;
  self->ou3dod_ = v8;

  v10 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237C17000, v10, OS_LOG_TYPE_INFO, "Init 3D Object Detection online [done].", buf, 2u);
  }

  if (self->enable_3dor_) {
    operator new();
  }
  v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v12 = [v11 BOOLForKey:@"com.apple.ObjectUnderstanding.write_debug_data"];

  self->write_debug_output_ = v12;
}

- (void)clear
{
  [(OUPipelineOnline *)self CommonInit];
  [(OU3DObjectDetector *)self->ou3dod_ clear];
  v3 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:128];
  accumulatedPointCloud = self->accumulatedPointCloud_;
  self->accumulatedPointCloud_ = v3;

  *(void *)&self->num_pre_key_frames_ = 0;
}

- (id)getObjectAsset
{
  return self->objectAsset_;
}

- (BOOL)updateCameraWithValid:(id)a3 ouframe:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (!v6) {
    goto LABEL_9;
  }
  v9 = [v7 camera];
  if (v9)
  {
    v10 = [v8 sceneCamera];
    if (v10 && [v8 sceneColorBuffer] && objc_msgSend(v8, "semanticLabelBuffer"))
    {
      uint64_t v11 = [v8 sceneColorBuffer];

      if (v11)
      {
        char v12 = [v8 camera];
        camera = self->camera_;
        self->camera_ = v12;

        v14 = [[_OUFrame alloc] initWithFrame:v8];
        arframe = self->arframe_;
        self->arframe_ = v14;

        [(_OUFrame *)self->arframe_ GetCameraPoseInVisionWorld];
        *(_OWORD *)self->_anon_30 = v16;
        *(_OWORD *)&self->_anon_30[16] = v17;
        *(_OWORD *)&self->_anon_30[32] = v18;
        *(_OWORD *)&self->_anon_30[48] = v19;
        [(_OUFrame *)self->arframe_ GetSceneCameraPoseInVisionWorld];
        *(_OWORD *)self->_anon_70 = v20;
        *(_OWORD *)&self->_anon_70[16] = v21;
        LOBYTE(v9) = 1;
        *(_OWORD *)&self->_anon_70[32] = v22;
        *(_OWORD *)&self->_anon_70[48] = v23;
        goto LABEL_10;
      }
    }
    else
    {
    }
LABEL_9:
    LOBYTE(v9) = 0;
  }
LABEL_10:

  return (char)v9;
}

- (void)getPointCloudFromOUFrame:(simd_float4)a3 scenUnderstandingPose:(simd_float4)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a7;
  kdebug_trace();
  CameraPCFromARFrameSceneCamera(v8, 4u, (void **)&v29);
  v9 = [v8 camera];
  SampleSemantics((uint64_t *)&v29, v9, (__CVBuffer *)[v8 semanticLabelBuffer], (__CVBuffer *)objc_msgSend(v8, "semanticConfidenceBuffer"), v26, a2, a3, a4, a5);

  v10 = v29;
  uint64_t v11 = v30;
  if (v29 == v30)
  {
    char v12 = v29;
  }
  else
  {
    do
    {
      *(float32x4_t *)v10->f32 = vaddq_f32((float32x4_t)a5, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)a2, COERCE_FLOAT(*(_OWORD *)v10->f32)), (float32x4_t)a3, *v10, 1), (float32x4_t)a4, *(float32x4_t *)v10->f32, 2));
      v10 += 2;
    }
    while (v10 != v11);
    v10 = v29;
    char v12 = v30;
  }
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(__p, ((char *)v12 - (char *)v10) >> 4);
  if (v30 != v29)
  {
    unint64_t v13 = 0;
    do
      *((_OWORD *)__p[0] + v13++) = xmmword_237CB44B0;
    while (v13 < ((char *)v30 - (char *)v29) >> 4);
  }
  v14 = [OUPointCloud alloc];
  uint64_t v15 = -[OUPointCloud initWithCount:points:semanticLabels:semanticVotes:colors:](v14, "initWithCount:points:semanticLabels:semanticVotes:colors:", ((char *)v30 - (char *)v29) >> 4);
  long long v16 = *(void **)(a1 + 184);
  *(void *)(a1 + 184) = v15;

  long long v17 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    [v8 timestamp];
    uint64_t v19 = v18;
    uint64_t v20 = [*(id *)(a1 + 184) count];
    *(_DWORD *)buf = 134218240;
    uint64_t v32 = v19;
    __int16 v33 = 2048;
    uint64_t v34 = v20;
    _os_log_impl(&dword_237C17000, v17, OS_LOG_TYPE_INFO, "Updating world point cloud with frame at time %f with %zu points.", buf, 0x16u);
  }

  kdebug_trace();
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v27)
  {
    v28 = v27;
    operator delete(v27);
  }
  if (v26[0])
  {
    v26[1] = v26[0];
    operator delete(v26[0]);
  }
  if (v29)
  {
    v30 = v29;
    operator delete(v29);
  }
}

- (BOOL)updateWorldPCWithKeyframes:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v8 = (const void *)[v7 pointsToWorld];
        uint64_t v9 = [v7 pointsToWorld];
        uint64_t v10 = [v7 count];
        __p = 0;
        long long v23 = 0;
        uint64_t v24 = 0;
        _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&__p, v8, v9 + 16 * v10, (v9 + 16 * v10 - (uint64_t)v8) >> 4);
        uint64_t v11 = [OUPointCloud alloc];
        uint64_t v12 = [v7 count];
        unint64_t v13 = -[OUPointCloud initWithCount:points:semanticLabels:semanticVotes:colors:](v11, "initWithCount:points:semanticLabels:semanticVotes:colors:", v12, __p, [v7 semanticLabels], objc_msgSend(v7, "semanticVotes"), objc_msgSend(v7, "colors"));
        accumulatedPointCloud = self->accumulatedPointCloud_;
        uint64_t v15 = [v7 identifier];
        [(NSMutableDictionary *)accumulatedPointCloud setObject:v13 forKey:v15];

        if (__p)
        {
          long long v23 = __p;
          operator delete(__p);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }

  long long v16 = [(NSMutableDictionary *)self->accumulatedPointCloud_ allKeys];
  self->num_cur_key_frames_ = [v16 count];

  long long v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v18 = [v17 BOOLForKey:@"3dod_earlyout_accumulation"];

  if (v18)
  {
    uint64_t v19 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[OUPipelineOnline updateWorldPCWithKeyframes:](v19);
    }
  }
  return v18 ^ 1;
}

- (void)updateObjectAsset
{
  [(OUObjectAsset *)self->objectAsset_ setObjects:self->allObjects];
  v3 = objc_alloc_init(OUPointCloud);
  -[OUObjectAsset setFrustumPointCloud:](self->objectAsset_, "setFrustumPointCloud:");
}

- (id)updatePipelineWithKeyframes:(double)a3 currentCameraPose:(double)a4
{
  id v8 = a7;
  if ([(id)a1 updateWorldPCWithKeyframes:v8])
  {
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 216), "updateWithAccumulatePC:currentCameraPose:", *(void *)(a1 + 176), a2, a3, a4, a5);
    uint64_t v10 = *(void **)(a1 + 208);
    *(void *)(a1 + 208) = v9;

    [(id)a1 updateObjectAsset];
    id v11 = *(id *)(a1 + 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)updatePipelineWithKeyframes:(id)a3 ouframe:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(OUPipelineOnline *)self updateCameraWithValid:v6 ouframe:v7])
  {
    p_arframe = &self->arframe_;
LABEL_11:
    [(_OUFrame *)*p_arframe ReleaseBuffer];
    int v18 = self->objectAsset_;
    goto LABEL_13;
  }
  if ([(OUPipelineOnline *)self updateWorldPCWithKeyframes:v6])
  {
    if (self->write_debug_output_)
    {
      value = self->frame_writer_.__ptr_.__value_;
      if (!value)
      {
        id v9 = objc_alloc_init(MEMORY[0x263F08790]);
        [v9 setDateFormat:@"MM_dd_yyyy_HH_mm_ss_SSS"];
        uint64_t v10 = NSString;
        id v11 = [MEMORY[0x263EFF910] date];
        uint64_t v12 = [v9 stringFromDate:v11];
        unint64_t v13 = [v10 stringWithFormat:@"%@/%@", @"/var/mobile/Documents/Rooms/OU_dump", v12];

        unsigned int v14 = time(0);
        srand(v14);
        [v13 UTF8String];
        rand();
        operator new();
      }
      utils::OUFrameWriter::Write((utils::OUFrameWriter *)value, self->arframe_, v6);
    }
    p_arframe = &self->arframe_;
    long long v16 = [(OU3DObjectDetector *)self->ou3dod_ updateWithAccumulatePC:self->accumulatedPointCloud_ ouframe:self->arframe_];
    allObjects = self->allObjects;
    self->allObjects = v16;

    if (self->enable_3dor_) {
      ou3dor::OU3DObjectRepresentation::AddObjects2DFeatures((ou3dor::OU3DObjectRepresentation *)self->ou3dor_.__ptr_.__value_, self->arframe_, self->allObjects);
    }
    [(OUPipelineOnline *)self updateObjectAsset];
    goto LABEL_11;
  }
  [(_OUFrame *)self->arframe_ ReleaseBuffer];
  int v18 = 0;
LABEL_13:

  return v18;
}

- (void).cxx_destruct
{
  std::unique_ptr<utils::OUFrameWriter>::reset[abi:ne180100]((utils::OUFrameWriter **)&self->frame_writer_, 0);
  std::unique_ptr<ou3dor::OU3DObjectRepresentation>::reset[abi:ne180100]((ou3dor::OU3DObjectRepresentation **)&self->ou3dor_, 0);
  objc_storeStrong((id *)&self->ou3dod_, 0);
  objc_storeStrong((id *)&self->allObjects, 0);
  objc_storeStrong((id *)&self->arframePointCloud_, 0);
  objc_storeStrong((id *)&self->accumulatedPointCloud_, 0);
  objc_storeStrong((id *)&self->arframe_, 0);
  objc_storeStrong((id *)&self->camera_, 0);
  objc_storeStrong((id *)&self->objectAsset_, 0);
}

- (id).cxx_construct
{
  *((void *)self + 28) = 0;
  *((void *)self + 30) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  return self;
}

- (void)updateWorldPCWithKeyframes:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  v2 = @"3dod_earlyout_accumulation";
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "pnp measurement: %@", (uint8_t *)&v1, 0xCu);
}

@end