@interface OU3DObjectDetector
- (BOOL)IsValidLShapePair:(const void *)a3 l_shape_pair:(const void *)a4;
- (BOOL)ObjectRepresentationEnabled;
- (BOOL)RgbRefinementEnabled;
- (BOOL)preprocess;
- (NSArray)allObjects;
- (NSSet)supportedObjectTypes;
- (OUPointCloud)frustumPointCloud;
- (OUPointCloud)worldPointCloud;
- (double)maxDetectionInterval;
- (double)minDetectionInterval;
- (float)depthConfidenceThreshold;
- (float)frustumFOV;
- (float)rotationalSensitivity;
- (float)translationalSensitivity;
- (id).cxx_construct;
- (id)FindNeedRefineBoxUUID:(id)a3 withOldObjects:(id)a4;
- (id)MergeLShapeObjects:(id)a3 isLastFrame:(BOOL)a4;
- (id)combineBoxTypeAndEmbeddingByUUID:(id)a3;
- (id)generateOfflineObjects:(id)a3 onlineObjects:(id)a4;
- (id)getObjectAsset;
- (id)init:(BOOL)a3;
- (id)regulateObjectSize:(id)a3 withOldObjects:(id)a4;
- (id)run;
- (id)updateWithAccumulatePC:(__n128)a3 currentCameraPose:(__n128)a4;
- (id)updateWithAccumulatePC:(id)a3 ouframe:(id)a4;
- (int)assignIdentifiersForNewObjects:(uint64_t)a3 withOldObjects:(uint64_t)a4;
- (signed)offline_model_;
- (signed)online_model_;
- (unint64_t)worldPointCloudCapacity;
- (vector<unsigned)runwithinClassNMS:(OU3DObjectDetector *)self ids:(SEL)a3 ori_iou:(const void *)a4 nms_iou:(void *)a5;
- (void)CopyObjectEmbedding:(id)a3 fromOldObjects:(id)a4;
- (void)CopyRefineHistory:(id)a3 fromOldObjects:(id)a4;
- (void)InitializeRGBRefinement:(id)a3;
- (void)OfflineModelInitialization;
- (void)ResestObjectSizeHistoryIfSizeChange:(id)a3 withOldObjects:(id)a4;
- (void)ValidateRawDetections:(void *)a3;
- (void)assignIdentifiersForNewObjects:(id)a3 withOldObjects:(id)a4;
- (void)assignParentId:(id)a3 isOffline:(BOOL)a4;
- (void)buildFrustumPointCloudFromWorldPointCloud;
- (void)clear;
- (void)initialization;
- (void)modelProcess;
- (void)postprocess;
- (void)regulateObjectCornerOrders:(id)a3 withOldObjects:(id)a4;
- (void)reviseObjectsUponParentId:(id)a3;
- (void)run;
- (void)runAssignParentID:(id)a3;
- (void)setDepthConfidenceThreshold:(float)a3;
- (void)setFrustumFOV:(float)a3;
- (void)setMaxDetectionInterval:(double)a3;
- (void)setMinDetectionInterval:(double)a3;
- (void)setObjectRepresentationEnabled:(BOOL)a3;
- (void)setRgbRefinementEnabled:(BOOL)a3;
- (void)setRotationalSensitivity:(float)a3;
- (void)setTranslationalSensitivity:(float)a3;
- (void)setWorldPointCloudCapacity:(unint64_t)a3;
@end

@implementation OU3DObjectDetector

- (id)init:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  self->isOnline_ = a3;
  v5 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [MEMORY[0x263F08B88] isMainThread];
    v7 = "Offline";
    if (v3) {
      v7 = "Online";
    }
    v8 = "Yes";
    if (!v6) {
      v8 = "No";
    }
    *(_DWORD *)buf = 136315394;
    v20 = v7;
    __int16 v21 = 2080;
    v22 = v8;
    _os_log_impl(&dword_237C17000, v5, OS_LOG_TYPE_INFO, "[3DOD] %s OD session is initialized in the main thread: %s.", buf, 0x16u);
  }

  v18.receiver = self;
  v18.super_class = (Class)OU3DObjectDetector;
  v9 = [(OU3DObjectDetector *)&v18 init];
  *(_DWORD *)(v9 + 946) = 0;
  [v9 initialization];
  *((_WORD *)v9 + 472) = 257;
  *((void *)v9 + 113) = 0;
  v10 = objc_alloc_init(OUInternalInfoDumper);
  v11 = (void *)*((void *)v9 + 116);
  *((void *)v9 + 116) = v10;

  id v12 = objc_alloc_init(MEMORY[0x263F08790]);
  [v12 setDateFormat:@"MM_dd_yyyy_HH_mm_ss_SSS"];
  v13 = NSString;
  v14 = [MEMORY[0x263EFF910] date];
  v15 = [v12 stringFromDate:v14];
  uint64_t v16 = [v13 stringWithFormat:@"%@%@", @"/var/mobile/Documents/Rooms/ObjectUnderstanding/", v15];

  [*((id *)v9 + 116) setUpInternalDumpWithLogDir:v16 enable:0];
  [*((id *)v9 + 116) setEnableARFrameDump:0];
  [*((id *)v9 + 116) setEnableLiveDump:0];
  [*((id *)v9 + 116) setEnableARFrameRGB:0];
  [*((id *)v9 + 116) setEnableARFrameDepth:0];
  operator new();
}

- (void)setRgbRefinementEnabled:(BOOL)a3
{
  self->_RgbRefinementEnabled = a3;
}

- (NSSet)supportedObjectTypes
{
  BOOL v3 = [MEMORY[0x263EFF9C0] setWithCapacity:self->det_params->var0];
  det_params = self->det_params;
  if (det_params->var0)
  {
    unint64_t v5 = 0;
    do
    {
      [v3 addObject:det_params->var2[v5++]];
      det_params = self->det_params;
    }
    while (v5 < det_params->var0);
  }
  int v6 = (void *)[v3 copy];

  return (NSSet *)v6;
}

- (id)updateWithAccumulatePC:(__n128)a3 currentCameraPose:(__n128)a4
{
  *(__n128 *)(a1 + 160) = a2;
  *(__n128 *)(a1 + 176) = a3;
  *(__n128 *)(a1 + 192) = a4;
  *(__n128 *)(a1 + 208) = a5;
  objc_storeStrong((id *)(a1 + 144), a7);
  v8 = [(id)a1 run];
  return v8;
}

- (id)updateWithAccumulatePC:(id)a3 ouframe:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 camera];
  camera = self->camera_;
  self->camera_ = v9;

  objc_storeStrong((id *)&self->arframe_, a4);
  [(_OUFrame *)self->arframe_ GetCameraPoseInVisionWorld];
  *(_OWORD *)self->_anon_a0 = v11;
  *(_OWORD *)&self->_anon_a0[16] = v12;
  *(_OWORD *)&self->_anon_a0[32] = v13;
  *(_OWORD *)&self->_anon_a0[48] = v14;
  [(_OUFrame *)self->arframe_ GetSceneCameraPoseInVisionWorld];
  *(_OWORD *)self->_anon_e0 = v15;
  *(_OWORD *)&self->_anon_e0[16] = v16;
  *(_OWORD *)&self->_anon_e0[32] = v17;
  *(_OWORD *)&self->_anon_e0[48] = v18;
  objc_storeStrong((id *)&self->keyframesPointCloud_, a3);
  v19 = [(OU3DObjectDetector *)self run];

  return v19;
}

- (id)getObjectAsset
{
  return self->objectAsset_;
}

- (id)generateOfflineObjects:(id)a3 onlineObjects:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v46 = a3;
  int v6 = (OUVizTool *)a4;
  id v7 = (OUVizTool *)OUVizTool::Get(v6);
  OUVizTool::StartNewFrame(v7);
  if (v46 && [v46 count])
  {
    if (!self->offline_detector_.__ptr_.__value_) {
      [(OU3DObjectDetector *)self OfflineModelInitialization];
    }
    v44 = v6;
    v45 = self;
    id v8 = objc_alloc_init(OUPointCloud);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v9 = v46;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v59 != v11) {
            objc_enumerationMutation(v9);
          }
          long long v13 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v58 + 1) + 8 * i)];
          long long v14 = (const void *)[v13 pointsToWorld];
          uint64_t v15 = [v13 pointsToWorld];
          uint64_t v16 = [v13 count];
          *(void *)buf = 0;
          uint64_t v64 = 0;
          uint64_t v65 = 0;
          _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(buf, v14, v15 + 16 * v16, (v15 + 16 * v16 - (uint64_t)v14) >> 4);
          uint64_t v17 = [v13 count];
          -[OUPointCloud append:points:semanticLabels:semanticVotes:](v8, "append:points:semanticLabels:semanticVotes:", v17, *(void *)buf, [v13 semanticLabels], objc_msgSend(v13, "semanticVotes"));
          if (*(void *)buf)
          {
            uint64_t v64 = *(void *)buf;
            operator delete(*(void **)buf);
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v58 objects:v66 count:16];
      }
      while (v10);
    }

    unint64_t v18 = [(OUPointCloud *)v8 count];
    v19 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v20 = v19;
    if (v18 > 0x3E7)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_237C17000, v20, OS_LOG_TYPE_INFO, "[3DOU] Running ios train pipeline.", buf, 2u);
      }

      ou3dod::OU3DODInterface::Process((OUDnnInferenceInterface **)v45->offline_detector_.__ptr_.__value_, (const OUPointCloudCpp *)[(OUPointCloud *)v8 getCpp]);
      value = v45->offline_detector_.__ptr_.__value_;
      uint64_t v64 = 0;
      uint64_t v65 = 0;
      *(void *)buf = 0;
      std::vector<OUBox3d>::__init_with_size[abi:ne180100]<OUBox3d*,OUBox3d*>(buf, *((void *)value + 1), *((void *)value + 2), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)value + 2) - *((void *)value + 1)) >> 5));
      ou3dod::OU3DODInterface::GetDetectedBoxes((ou3dod::OU3DODInterface *)v45->offline_detector_.__ptr_.__value_, &cfstr_Cabinet.isa, (uint64_t *)v57);
      v47 = [MEMORY[0x263EFF980] array];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v23 = v44;
      uint64_t v24 = [(OUVizTool *)v23 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v54 != v25) {
              objc_enumerationMutation(v23);
            }
            v27 = *(void **)(*((void *)&v53 + 1) + 8 * j);
            v28 = objc_msgSend(v27, "detection_source");
            if ([v28 isEqualToString:@"online"])
            {
              int v29 = [v27 hasBoxesDict:@"raw_postprocess"];

              if (v29) {
                [v47 addObject:v27];
              }
            }
            else
            {
            }
          }
          uint64_t v24 = [(OUVizTool *)v23 countByEnumeratingWithState:&v53 objects:v62 count:16];
        }
        while (v24);
      }

      boxesFromObjects(v47, @"raw_postprocess", 0, (uint64_t *)v52);
      OU3DKitchenObjectMerger::SetDetectionAndPointCloud((uint64_t)&v45->offline_merger_, (const OUBox3d **)v52, (const OUBox3d **)v57, (void *)([(OUPointCloud *)v8 getCpp] + 24));
      OU3DKitchenObjectMerger::Merge(&v45->offline_merger_);
      OU3DKitchenObjectMerger::GetOutput(&v45->offline_merger_, (uint64_t *)v51);
      merger = v45->merger;
      if (merger) {
        [(OU3DObjectMerger *)merger removeLowHeightStairObjects:v51];
      }
      else {
        memset(v50, 0, sizeof(v50));
      }
      v31 = boxesToObjects((uint64_t *)v50, @"rawdetection", 1u);
      v43 = boxesToObjects((uint64_t *)buf, @"raw_offline", 1u);
      id v32 = v47;
      updateObjectsWithBoxes((uint64_t *)v52, v32, @"raw_online");
      for (unint64_t k = 0; [v32 count] > k; ++k)
      {
        v34 = [v32 objectAtIndexedSubscript:k];
        v35 = objc_msgSend(v34, "corners_status");
        v36 = (void *)[v35 copy];
        v37 = [v32 objectAtIndexedSubscript:k];
        objc_msgSend(v37, "setCorners_status:", v36);
      }
      [(OU3DObjectDetector *)v45 assignIdentifiersForNewObjects:v31 withOldObjects:v32];
      v38 = (void *)[v31 mutableCopy];
      [v38 addObjectsFromArray:v32];
      [v38 addObjectsFromArray:v43];
      v39 = [(OU3DObjectDetector *)v45 combineBoxTypeAndEmbeddingByUUID:v38];
      [(OU3DObjectDetector *)v45 assignParentId:v39 isOffline:1];
      [(OU3DObjectDetector *)v45 reviseObjectsUponParentId:v39];
      v40 = [(OU3DObjectDetector *)v45 MergeLShapeObjects:v39 isLastFrame:1];

      __int16 v21 = v40;
      if (v45->_ObjectRepresentationEnabled) {
        ou3dor::OU3DObjectRepresentation::AddObjectRepresentation((uint64_t)v45->ou3dor_.__ptr_.__value_, v8, v40);
      }
      v41 = OUVizTool::Get((OUVizTool *)[(OUObjectAsset *)v45->objectAsset_ setObjects:v40]);
      std::string::basic_string[abi:ne180100]<0>(__p, "offline_objects");
      OUVizTool::SaveObjects((uint64_t)v41, (uint64_t)__p, v40, @"rawdetection");
      if (v49 < 0) {
        operator delete(__p[0]);
      }
      CheckOutputValidation(v40);

      __p[0] = v50;
      std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      v50[0] = (void **)v51;
      std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](v50);
      v51[0] = (void **)v52;
      std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](v51);

      v52[0] = (void **)v57;
      std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](v52);
      v57[0] = (void **)buf;
      std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](v57);
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[OU3DObjectDetector generateOfflineObjects:onlineObjects:](buf, [(OUPointCloud *)v8 count], v20);
      }

      __int16 v21 = v44;
    }

    int v6 = v44;
  }
  else
  {
    __int16 v21 = v6;
  }

  return v21;
}

- (id)combineBoxTypeAndEmbeddingByUUID:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v36 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v3);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v3;
  uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        unint64_t v5 = [v4 identifier];
        int v6 = [v36 objectForKey:v5];
        BOOL v7 = v6 == 0;

        if (v7)
        {
          id v9 = [v4 identifier];
          [v36 setObject:v4 forKey:v9];
          goto LABEL_32;
        }
        id v8 = [v4 identifier];
        id v9 = [v36 objectForKey:v8];

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v10 = [v4 boxesDict];
        uint64_t v11 = [v10 allKeys];

        uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v42;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v42 != v13) {
                objc_enumerationMutation(v11);
              }
              uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * j);
              uint64_t v16 = [v9 boxesDict];
              uint64_t v17 = [v16 objectForKey:v15];
              BOOL v18 = v17 == 0;

              if (v18)
              {
                memset(v38, 0, sizeof(v38));
                v20 = [v4 boxesDict];
                __int16 v21 = [v20 objectForKeyedSubscript:v15];
                box3dFromNSArray(v21, (uint64_t)v38);

                [v9 addBoxesDict:v38 forDictKey:v15];
              }
              else
              {
                v19 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
                  [(OU3DObjectDetector *)&buf combineBoxTypeAndEmbeddingByUUID:v19];
                }
              }
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v12);
        }

        v22 = [v9 embedding2d];
        if (![v22 count])
        {
          uint64_t v23 = [v4 embedding2d];
          BOOL v24 = [v23 count] == 0;

          if (v24) {
            goto LABEL_23;
          }
          v22 = [v4 embedding2d];
          [v9 setEmbedding2d:v22];
        }

LABEL_23:
        uint64_t v25 = [v9 embedding3d];
        if ([v25 count]) {
          goto LABEL_26;
        }
        v26 = [v4 embedding3d];
        BOOL v27 = [v26 count] == 0;

        if (!v27)
        {
          uint64_t v25 = [v4 embedding3d];
          [v9 setEmbedding3d:v25];
LABEL_26:
        }
        v28 = [v9 cadModelName];
        if (!v28)
        {
          int v29 = [v4 cadModelName];
          BOOL v30 = v29 == 0;

          if (v30) {
            goto LABEL_32;
          }
          v28 = [v4 cadModelName];
          [v9 setCadModelName:v28];
        }

LABEL_32:
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v35);
  }

  v31 = [v36 allValues];

  return v31;
}

- (void)clear
{
  id v3 = [MEMORY[0x263EFF8C0] array];
  pre_size_refined = self->pre_size_refined_;
  self->pre_size_refined_ = v3;

  unint64_t v5 = [MEMORY[0x263EFF8C0] array];
  pre_rgb_size_refined = self->pre_rgb_size_refined_;
  self->pre_rgb_size_refined_ = v5;

  BOOL v7 = objc_alloc_init(OUPointCloud);
  worldPointCloud = self->worldPointCloud;
  self->worldPointCloud = v7;

  id v9 = objc_alloc_init(OUPointCloud);
  arframePointCloud = self->arframePointCloud_;
  self->arframePointCloud_ = v9;

  self->latestTimestamp = 0.0;
  *(_OWORD *)self->_anon_50 = 0u;
  *(_OWORD *)&self->_anon_50[16] = 0u;
  *(_OWORD *)&self->_anon_50[32] = 0u;
  *(_OWORD *)&self->_anon_50[48] = 0u;
  end = self->acc_box3ds_.__end_;
  begin = self->acc_box3ds_.__begin_;
  while (end != begin)
  {
    end = (OUBox3d *)((char *)end - 224);
    std::__destroy_at[abi:ne180100]<OUBox3d,0>((uint64_t)end);
  }
  self->acc_box3ds_.__end_ = begin;
  uint64_t v13 = self->merged_box3ds_.__end_;
  long long v14 = self->merged_box3ds_.__begin_;
  while (v13 != v14)
  {
    uint64_t v13 = (OUBox3d *)((char *)v13 - 224);
    std::__destroy_at[abi:ne180100]<OUBox3d,0>((uint64_t)v13);
  }
  self->merged_box3ds_.__end_ = v14;
  std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)&self->hist_ori_iou_mat_);
  std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)&self->hist_nms_iou_mat_);
  self->hist_kept_box_ids_.__end_ = self->hist_kept_box_ids_.__begin_;
  allObjects = self->allObjects;
  self->allObjects = (NSArray *)MEMORY[0x263EFFA68];

  self->size_refined_box_ids_.__end_ = self->size_refined_box_ids_.__begin_;
}

- (void)OfflineModelInitialization
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OU3DSSDConfig::OU3DSSDConfig(v3, 33, (__n128)xmmword_237CB5D20, (__n128)vdupq_n_s32(0x3E19999Au), (__n128)xmmword_237CB5D30);
  ou3dod::OU3DAnchorFreeDetector::createForOffline((ou3dod::OU3DAnchorFreeDetector *)v3, v2);
}

- (void)InitializeRGBRefinement:(id)a3
{
  uint64_t v4 = (__CVBuffer *)[a3 sceneColorBuffer];
  unsigned int Width = CVPixelBufferGetWidth(v4);
  uint64_t v14 = 0x3E99999A3D4CCCCDLL;
  char v15 = 1;
  unint64_t v16 = Width | ((unint64_t)CVPixelBufferGetHeight(v4) << 32);
  uint64_t v17 = 0xC000000100;
  std::string::basic_string[abi:ne180100]<0>(&v18, "rgb");
  *(void *)&v12[0] = 0x3A83126F00000000;
  BYTE8(v12[0]) = 1;
  *(int64x2_t *)((char *)v12 + 12) = vdupq_n_s64(0xC000000100uLL);
  std::string::basic_string[abi:ne180100]<0>(&v13, "semantic");
  objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"Screen", 0);
  int v6 = [MEMORY[0x263EFFA08] setWithArray:objc_claimAutoreleasedReturnValue()];
  rgb_refine_supported_types = self->rgb_refine_supported_types_;
  self->rgb_refine_supported_types_ = v6;

  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v8, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
  }
  else {
    std::string v8 = v18;
  }
  v9[0] = v12[0];
  *(_OWORD *)((char *)v9 + 12) = *(_OWORD *)((char *)v12 + 12);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v13;
  }
  uint64_t v11 = self->rgb_refine_supported_types_;
  operator new();
}

- (void)initialization
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (self->isOnline_)
  {
    OU3DSSDConfig::OU3DSSDConfig(buf, 33, (__n128)xmmword_237CB5D40, (__n128)vdupq_n_s32(0x3E19999Au), (__n128)xmmword_237CB5D50);
    ou3dod::OU3DAnchorFreeDetector::createForOnline((ou3dod::OU3DAnchorFreeDetector *)buf, v2);
  }
  id v3 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl(&dword_237C17000, v3, OS_LOG_TYPE_INFO, "============ 3D Object Detector has been initialized. =========", buf, 2u);
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl(&dword_237C17000, v3, OS_LOG_TYPE_INFO, "Start to init 3D Object Representation.", buf, 2u);
  }

  operator new();
}

- (id)run
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v3 = (OUVizTool *)kdebug_trace();
  uint64_t v4 = (OUVizTool *)OUVizTool::Get(v3);
  OUVizTool::StartNewFrame(v4);
  v83 = self;
  BOOL v5 = [(OU3DObjectDetector *)self preprocess];
  int v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v7 = [v6 BOOLForKey:@"3dod_earlyout_preprocess"];

  if (v7)
  {
    std::string v8 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(OU3DObjectDetector *)v8 run];
    }
LABEL_4:

    unint64_t v16 = v83->allObjects;
    goto LABEL_11;
  }
  if (v5)
  {
    [(OU3DObjectDetector *)v83 modelProcess];
    uint64_t v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v18 = [v17 BOOLForKey:@"3dod_earlyout_inference"];

    if (v18)
    {
      std::string v8 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        [(OU3DObjectDetector *)v8 run];
      }
      goto LABEL_4;
    }
    [(OU3DObjectDetector *)v83 postprocess];
    BOOL v27 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v28 = [v27 BOOLForKey:@"3dod_earlyout_post_process"];

    if (v28)
    {
      std::string v8 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        [(OU3DObjectDetector *)v8 run];
      }
      goto LABEL_4;
    }
    v85 = [MEMORY[0x263EFF980] array];
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    v36 = v83->allObjects;
    uint64_t v37 = [(NSArray *)v36 countByEnumeratingWithState:&v103 objects:v118 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v104;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v104 != v38) {
            objc_enumerationMutation(v36);
          }
          v40 = *(void **)(*((void *)&v103 + 1) + 8 * i);
          if ([v40 hasBoxesDict:@"rawdetection"]) {
            [v85 addObject:v40];
          }
        }
        uint64_t v37 = [(NSArray *)v36 countByEnumeratingWithState:&v103 objects:v118 count:16];
      }
      while (v37);
    }

    long long v41 = boxesToObjects((uint64_t *)&v83->merged_box3ds_, @"rawdetection", 1u);
    long long v42 = packBoxesDict(v41, (uint64_t *)&v83->merged_box3ds_, @"raw_postprocess");

    [(OU3DObjectDetector *)v83 assignIdentifiersForNewObjects:v42 withOldObjects:v85];
    v82 = [(OU3DObjectDetector *)v83 regulateObjectSize:v42 withOldObjects:v85];

    [(OU3DObjectDetector *)v83 regulateObjectCornerOrders:v82 withOldObjects:v85];
    [(OU3DObjectDetector *)v83 CopyObjectEmbedding:v82 fromOldObjects:v85];
    long long v44 = [MEMORY[0x263EFF9C0] set];
    if (v83->_RgbRefinementEnabled
      && OU3DObjectRGBSizeRefiner::IsOUFrameValid((OU3DObjectRGBSizeRefiner *)v83->arframe_, v43))
    {
      float floor_height = *((float *)v83->online_detector_.__ptr_.__value_ + 40);
      if (floor_height >= v83->floor_height_) {
        float floor_height = v83->floor_height_;
      }
      v83->floor_height_ = floor_height;
      if (!v83->object_rgb_size_refiner_.__ptr_.__value_) {
        [(OU3DObjectDetector *)v83 InitializeRGBRefinement:v83->arframe_];
      }
      long long v46 = v83->pre_rgb_size_refined_;
      uint64_t v47 = [v82 copy];
      pre_rgb_size_refined = v83->pre_rgb_size_refined_;
      v83->pre_rgb_size_refined_ = (NSArray *)v47;

      [(OU3DObjectDetector *)v83 CopyRefineHistory:v83->pre_rgb_size_refined_ fromOldObjects:v85];
      [(OU3DObjectDetector *)v83 CopyRefineHistory:v82 fromOldObjects:v85];
      [(OU3DObjectDetector *)v83 ResestObjectSizeHistoryIfSizeChange:v82 withOldObjects:v85];
      char v49 = [(OU3DObjectDetector *)v83 FindNeedRefineBoxUUID:v82 withOldObjects:v46];
      uint64_t value = (uint64_t)v83->object_rgb_size_refiner_.__ptr_.__value_;
      *(float *)(value + 352) = v83->floor_height_;
      uint64_t v51 = OU3DObjectRGBSizeRefiner::RefineObjects(value, v82, v83->arframe_, (uint64_t)v83->_anon_e0, (uint64_t)v83->_anon_e0, v85, v49, v44);

      v52 = v83->pre_rgb_size_refined_;
      OU3DObjectRGBSizeRefiner::GetRefinerParams(v83->object_rgb_size_refiner_.__ptr_.__value_, (uint64_t)&v90);
      SmoothRefinedBoxes(v51, v52, (uint64_t)&v90, v44, v85, *((_DWORD *)v83->object_rgb_size_refiner_.__ptr_.__value_ + 49));
      OU3DObjectRGBSizeRefinerParams::~OU3DObjectRGBSizeRefinerParams(&v90.var1);
      v83->num_pre_key_frames_ = v83->num_cur_key_frames_;

      v82 = v51;
    }
    long long v53 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v54 = [v53 BOOLForKey:@"3dod_earlyout_size_refinement"];

    p_allObjects = (id *)&v83->allObjects;
    if (v54)
    {
      long long v55 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
        [(OU3DObjectDetector *)v55 run];
      }

      unint64_t v16 = (NSArray *)*p_allObjects;
    }
    else
    {
      kdebug_trace();
      -[OUObjectCompleteness updateRawCornersStatusNoTimer:withOldObjects:cameraPose:camera:](v83->object_completeness_, "updateRawCornersStatusNoTimer:withOldObjects:cameraPose:camera:", v82, v85, v83->camera_, *(double *)v83->_anon_a0, *(double *)&v83->_anon_a0[16], *(double *)&v83->_anon_a0[32], *(double *)&v83->_anon_a0[48]);
      kdebug_trace();
      v84 = [MEMORY[0x263EFF980] array];
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      v63 = v83->pre_rgb_size_refined_;
      uint64_t v64 = [(NSArray *)v63 countByEnumeratingWithState:&v99 objects:v117 count:16];
      if (v64)
      {
        uint64_t v65 = *(void *)v100;
        do
        {
          for (uint64_t j = 0; j != v64; ++j)
          {
            if (*(void *)v100 != v65) {
              objc_enumerationMutation(v63);
            }
            uint64_t v67 = *(void **)(*((void *)&v99 + 1) + 8 * j);
            v68 = [v67 identifier];
            char v69 = [v44 containsObject:v68];

            if (v69)
            {
              v70 = [v67 boxesDict];
              v71 = [v70 objectForKey:@"rawdetection"];

              if (v71)
              {
                memset(v98, 0, sizeof(v98));
                box3dFromNSArray(v71, (uint64_t)v98);
                id v89 = [v67 type];
                [v67 confidence];
                float v73 = v72;
                v74 = [v67 identifier];
                OUBox3d::OUBox3d((uint64_t)&v90, v98, &v89, v74, v73);

                OUBox3d::OUBox3d(&v109, &v90);
                v86 = 0;
                uint64_t v87 = 0;
                v88 = 0;
                v107 = &v86;
                char v108 = 0;
                v86 = (char *)operator new(0xE0uLL);
                uint64_t v87 = (uint64_t)v86;
                v88 = v86 + 224;
                uint64_t v87 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<OUBox3d>,OUBox3d const*,OUBox3d const*,OUBox3d*>((uint64_t)&v88, (uint64_t)&v109, (uint64_t)v117, (uint64_t)v86);
                v75 = boxesToObjects((uint64_t *)&v86, @"others", 1u);
                v76 = [v75 objectAtIndexedSubscript:0];

                v107 = &v86;
                std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&v107);

                if (__p) {
                  operator delete(__p);
                }
                if (v113)
                {
                  v114 = v113;
                  operator delete(v113);
                }

                [v84 addObject:v76];
                if (v96) {
                  operator delete(v96);
                }
                if (v94)
                {
                  v95 = v94;
                  operator delete(v94);
                }
              }
            }
          }
          uint64_t v64 = [(NSArray *)v63 countByEnumeratingWithState:&v99 objects:v117 count:16];
        }
        while (v64);
      }

      v77 = (void *)[v84 mutableCopy];
      [v77 addObjectsFromArray:v82];
      [(OU3DObjectDetector *)v83 assignParentId:v82 isOffline:0];
      objc_storeStrong(p_allObjects, v82);
      v78 = v83;
      [(OUInternalInfoDumper *)v83->debug_dumper_ setFirstARFrame:v83->arframe_];
      [(OUInternalInfoDumper *)v78->debug_dumper_ dumpObjects:v78->allObjects];
      uint64_t v79 = [(OU3DObjectDetector *)v78 MergeLShapeObjects:v78->allObjects isLastFrame:0];
      id v80 = *p_allObjects;
      id *p_allObjects = (id)v79;

      kdebug_trace();
      CheckOutputValidation(*p_allObjects);
      unint64_t v16 = (NSArray *)*p_allObjects;
    }
  }
  else
  {
    kdebug_trace();
    unint64_t v16 = (NSArray *)MEMORY[0x263EFFA68];
  }
LABEL_11:
  return v16;
}

- (BOOL)IsValidLShapePair:(const void *)a3 l_shape_pair:(const void *)a4
{
  memset(v15, 0, sizeof(v15));
  int v16 = 1065353216;
  uint64_t v5 = *(void *)a3;
  uint64_t v6 = *((void *)a3 + 1);
  while (v5 != v6)
  {
    id v7 = [*(id *)(v5 + 144) UUIDString];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)v15, (unsigned __int8 *)__p, (uint64_t)__p);
    if (v14 < 0) {
      operator delete(__p[0]);
    }

    v5 += 224;
  }
  std::string v8 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v15, (unsigned __int8 *)a4);
  uint64_t v9 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v15, (unsigned __int8 *)a4 + 24);
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = !v10;
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v15);
  return v11;
}

- (id)MergeLShapeObjects:(id)a3 isLastFrame:(BOOL)a4
{
  BOOL v4 = a4;
  v87[2] = *MEMORY[0x263EF8340];
  id v58 = a3;
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  int v68 = v4;
  if (v4)
  {
    v87[0] = @"Table";
    v87[1] = @"Cabinet";
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:2];
    uint64_t v57 = [v6 setWithArray:v7];
  }
  else
  {
    v86[0] = @"Table";
    v86[1] = @"Cabinet";
    v86[2] = @"Sofa";
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:3];
    uint64_t v57 = [v6 setWithArray:v7];
  }

  {
    long long v55 = (void *)MEMORY[0x263EFFA08];
    v85 = @"Table";
    uint64_t v56 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v85, 1, v57, v58);
    -[OU3DObjectDetector MergeLShapeObjects:isLastFrame:]::kObjectTypesWithParentId = [v55 setWithArray:v56];
  }
  LODWORD(v77) = 33;
  std::string v8 = std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(ou3dor::k3DORSupportedAttributeTypeMap, (int *)&v77);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v60 = (id)v8[3];
  uint64_t v67 = [(NSDictionary *)self->keyframesPointCloud_ allValues];
  id v64 = objc_alloc_init(MEMORY[0x263EFF980]);
  rawBoxesFromObjects(v58, (uint64_t *)&v77);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obuint64_t j = v57;
  uint64_t v9 = [obj countByEnumeratingWithState:&v73 objects:v84 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v74 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(*((void *)&v73 + 1) + 8 * i);
        uint64_t v13 = (void *)MEMORY[0x263EFFA08];
        id v81 = v12;
        char v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v81 count:1];
        uint64_t v15 = [v13 setWithArray:v14];
        ou3dod::OU3DLShapeObjectMerger::MergeLShape((uint64_t *)&v77, v67, v15, v68, buf);
        std::vector<OUBox3d>::__vdeallocate((void **)&v77);
        long long v77 = *(_OWORD *)buf;
        uint64_t v78 = v83;
        uint64_t v83 = 0;
        memset(buf, 0, sizeof(buf));
        uint64_t v79 = buf;
        std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&v79);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v73 objects:v84 count:16];
    }
    while (v9);
  }

  uint64_t LShapeMergeInfo = ou3dod::OU3DLShapeObjectMerger::GetLShapeMergeInfo((ou3dod::OU3DLShapeObjectMerger *)self->l_shape_merger_.__ptr_.__value_);
  int v16 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  oslog = v16;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[OU3DObjectDetector MergeLShapeObjects:isLastFrame:](v16);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v62 = v58;
  uint64_t v17 = [v62 countByEnumeratingWithState:&v69 objects:v80 count:16];
  if (v17)
  {
    uint64_t v65 = *(void *)v70;
    do
    {
      uint64_t v66 = v17;
      for (uint64_t j = 0; j != v66; ++j)
      {
        if (*(void *)v70 != v65) {
          objc_enumerationMutation(v62);
        }
        uint64_t v19 = *(void **)(*((void *)&v69 + 1) + 8 * j);
        if (objc_msgSend(v19, "hasBoxesDict:", @"rawdetection", v57))
        {
          uint64_t v20 = *((void *)&v77 + 1);
          for (uint64_t k = v77; k != v20; k += 224)
          {
            uint64_t v22 = [v19 identifier];
            uint64_t v23 = [v22 UUIDString];
            uint64_t v24 = [*(id *)(k + 144) UUIDString];
            int v25 = [v23 isEqualToString:v24];

            if (v25)
            {
              [v19 addBoxesDict:k forDictKey:@"lshaped"];
              for (m = *(uint64_t **)(LShapeMergeInfo + 16); m; m = (uint64_t *)*m)
              {
                if (*((unsigned char *)m + 64)
                  && [(OU3DObjectDetector *)self IsValidLShapePair:&v77 l_shape_pair:m + 2])
                {
                  BOOL v27 = [v19 identifier];
                  int v28 = [v27 UUIDString];
                  id v29 = [NSString alloc];
                  if (*((char *)m + 39) < 0) {
                    uint64_t v30 = m[2];
                  }
                  else {
                    uint64_t v30 = (uint64_t)(m + 2);
                  }
                  uint64_t v31 = (void *)[v29 initWithUTF8String:v30];
                  int v32 = [v28 isEqualToString:v31];

                  uint64_t v33 = [v19 identifier];
                  uint64_t v34 = [v33 UUIDString];
                  id v35 = [NSString alloc];
                  v36 = m + 5;
                  if (*((char *)m + 63) < 0) {
                    v36 = (void *)*v36;
                  }
                  uint64_t v37 = (void *)[v35 initWithUTF8String:v36];
                  int v38 = [v34 isEqualToString:v37];

                  if (v32 | v38) == 1 && (v68)
                  {
                    v39 = [v19 type];
                    int v40 = [v39 isEqualToString:@"Table"];

                    if (v40)
                    {
                      long long v41 = oslog;
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
                      {
                        long long v48 = [v19 identifier];
                        char v49 = [v48 UUIDString];
                        *(_DWORD *)uint8_t buf = 138412290;
                        *(void *)&uint8_t buf[4] = v49;
                        _os_log_debug_impl(&dword_237C17000, oslog, OS_LOG_TYPE_DEBUG, "[3DOD] Add L shape attribute %@", buf, 0xCu);

                        long long v41 = oslog;
                      }

                      [v19 addObjectPartAttribute:v60];
                    }
                    if (v38)
                    {
                      long long v42 = (void *)-[OU3DObjectDetector MergeLShapeObjects:isLastFrame:]::kObjectTypesWithParentId;
                      long long v43 = [v19 type];
                      LODWORD(v42) = [v42 containsObject:v43];

                      if (v42)
                      {
                        id v44 = objc_alloc(MEMORY[0x263F08C38]);
                        if (*((char *)m + 39) >= 0) {
                          uint64_t v45 = (uint64_t)(m + 2);
                        }
                        else {
                          uint64_t v45 = m[2];
                        }
                        long long v46 = [NSString stringWithUTF8String:v45];
                        uint64_t v47 = (void *)[v44 initWithUUIDString:v46];

                        objc_msgSend(v19, "setParent_id:", v47);
                      }
                    }
                  }
                }
              }
              goto LABEL_47;
            }
          }
        }
        else
        {
LABEL_47:
          [v64 addObject:v19];
        }
      }
      uint64_t v17 = [v62 countByEnumeratingWithState:&v69 objects:v80 count:16];
    }
    while (v17);
  }

  uint64_t v51 = OUVizTool::Get(v50);
  std::string::basic_string[abi:ne180100]<0>(buf, "before_l_shape");
  OUVizTool::SaveObjects((uint64_t)v51, (uint64_t)buf, v64, @"rawdetection");
  if (SHIBYTE(v83) < 0) {
    operator delete(*(void **)buf);
  }
  long long v53 = OUVizTool::Get(v52);
  std::string::basic_string[abi:ne180100]<0>(buf, "after_l_shape");
  OUVizTool::SaveObjects((uint64_t)v53, (uint64_t)buf, v64, @"lshaped");
  if (SHIBYTE(v83) < 0) {
    operator delete(*(void **)buf);
  }
  *(void *)uint8_t buf = &v77;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

  return v64;
}

- (void)buildFrustumPointCloudFromWorldPointCloud
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  kdebug_trace();
  *(void *)&self->_anon_1c0[8] = *(void *)self->_anon_1c0;
  *(void *)&self->_anon_1c0[32] = *(void *)&self->_anon_1c0[24];
  *(void *)&self->_anon_1c0[56] = *(void *)&self->_anon_1c0[48];
  *(void *)&self->_anon_1c0[80] = *(void *)&self->_anon_1c0[72];
  OUPointCloudCpp::Reserve((OUPointCloudCpp *)self->_anon_1c0, 0x1ADB0uLL);
  [(OUPointCloud *)self->worldPointCloud reset];
  double v3 = tan(self->frustumFOV * 0.5);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obuint64_t j = self->keyframesPointCloud_;
  uint64_t v4 = [(NSDictionary *)obj countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v4)
  {
    int v54 = &self->_anon_1c0[48];
    long long v55 = &self->_anon_1c0[24];
    long long v53 = &self->_anon_1c0[72];
    float v5 = v3;
    uint64_t v56 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v59 != v56) {
          objc_enumerationMutation(obj);
        }
        id v7 = [(NSDictionary *)self->keyframesPointCloud_ objectForKey:*(void *)(*((void *)&v58 + 1) + 8 * i)];
        uint64_t v8 = [v7 count];
        uint64_t v9 = [v7 semanticLabels];
        uint64_t v10 = [v7 points];
        uint64_t v11 = [v7 semanticVotes];
        if (v8)
        {
          uint64_t v13 = v11;
          for (uint64_t j = 0; j != v8; ++j)
          {
            v12.i32[0] = *(_DWORD *)(v9 + 4 * j);
            *(int16x4_t *)v12.f32 = vceq_s16((int16x4_t)(vmovl_u8(*(uint8x8_t *)v12.f32).u64[0] & 0xFF00FF00FF00FFLL), (int16x4_t)0xA000A000A000ALL);
            if ((vmaxv_u16(*(uint16x4_t *)v12.f32) & 1) == 0)
            {
              float32x4_t v12 = *(float32x4_t *)(v10 + 16 * j);
              float32x4_t v15 = vaddq_f32(*(float32x4_t *)&self->_anon_140[48], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)self->_anon_140, v12.f32[0]), *(float32x4_t *)&self->_anon_140[16], *(float32x2_t *)v12.f32, 1), *(float32x4_t *)&self->_anon_140[32], v12, 2));
              if (v15.f32[0] <= 3.6
                && v15.f32[0] >= -3.6
                && v15.f32[1] <= 4.8
                && v15.f32[1] >= 0.0
                && fabsf(v15.f32[0] / v15.f32[1]) <= v5)
              {
                float32x4_t v57 = v15;
                uint64_t v17 = *(float32x4_t **)&self->_anon_1c0[32];
                unint64_t v16 = *(void *)&self->_anon_1c0[40];
                if ((unint64_t)v17 >= v16)
                {
                  uint64_t v19 = ((uint64_t)v17 - *(void *)v55) >> 4;
                  if ((unint64_t)(v19 + 1) >> 60) {
                    std::vector<float>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v20 = v16 - *(void *)v55;
                  uint64_t v21 = v20 >> 3;
                  if (v20 >> 3 <= (unint64_t)(v19 + 1)) {
                    uint64_t v21 = v19 + 1;
                  }
                  if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
                    unint64_t v22 = 0xFFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v22 = v21;
                  }
                  if (v22) {
                    uint64_t v23 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_anon_1c0[40], v22);
                  }
                  else {
                    uint64_t v23 = 0;
                  }
                  uint64_t v24 = (float32x4_t *)&v23[16 * v19];
                  *uint64_t v24 = v57;
                  f32 = (_OWORD *)v24[1].f32;
                  v26 = *(char **)&self->_anon_1c0[24];
                  int v25 = *(float32x4_t **)&self->_anon_1c0[32];
                  if (v25 != (float32x4_t *)v26)
                  {
                    do
                    {
                      float32x4_t v27 = v25[-1];
                      --v25;
                      v24[-1] = v27;
                      --v24;
                    }
                    while (v25 != (float32x4_t *)v26);
                    int v25 = *(float32x4_t **)v55;
                  }
                  *(void *)&self->_anon_1c0[24] = v24;
                  *(void *)&self->_anon_1c0[32] = f32;
                  *(void *)&self->_anon_1c0[40] = &v23[16 * v22];
                  if (v25) {
                    operator delete(v25);
                  }
                }
                else
                {
                  *uint64_t v17 = v15;
                  f32 = (_OWORD *)v17[1].f32;
                }
                *(void *)&self->_anon_1c0[32] = f32;
                id v29 = *(_DWORD **)&self->_anon_1c0[56];
                unint64_t v28 = *(void *)&self->_anon_1c0[64];
                if ((unint64_t)v29 >= v28)
                {
                  uint64_t v31 = ((uint64_t)v29 - *(void *)v54) >> 2;
                  if ((unint64_t)(v31 + 1) >> 62) {
                    std::vector<float>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v32 = v28 - *(void *)v54;
                  uint64_t v33 = v32 >> 1;
                  if (v32 >> 1 <= (unint64_t)(v31 + 1)) {
                    uint64_t v33 = v31 + 1;
                  }
                  if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v34 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v34 = v33;
                  }
                  if (v34) {
                    id v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&self->_anon_1c0[64], v34);
                  }
                  else {
                    id v35 = 0;
                  }
                  v36 = &v35[4 * v31];
                  *(_DWORD *)v36 = *(_DWORD *)(v9 + 4 * j);
                  uint64_t v30 = v36 + 4;
                  int v38 = *(char **)&self->_anon_1c0[48];
                  uint64_t v37 = *(char **)&self->_anon_1c0[56];
                  if (v37 != v38)
                  {
                    do
                    {
                      int v39 = *((_DWORD *)v37 - 1);
                      v37 -= 4;
                      *((_DWORD *)v36 - 1) = v39;
                      v36 -= 4;
                    }
                    while (v37 != v38);
                    uint64_t v37 = *(char **)v54;
                  }
                  *(void *)&self->_anon_1c0[48] = v36;
                  *(void *)&self->_anon_1c0[56] = v30;
                  *(void *)&self->_anon_1c0[64] = &v35[4 * v34];
                  if (v37) {
                    operator delete(v37);
                  }
                }
                else
                {
                  *id v29 = *(_DWORD *)(v9 + 4 * j);
                  uint64_t v30 = v29 + 1;
                }
                *(void *)&self->_anon_1c0[56] = v30;
                int v40 = *(void **)&self->_anon_1c0[80];
                unint64_t v41 = *(void *)&self->_anon_1c0[88];
                if ((unint64_t)v40 >= v41)
                {
                  uint64_t v43 = ((uint64_t)v40 - *(void *)v53) >> 3;
                  if ((unint64_t)(v43 + 1) >> 61) {
                    std::vector<float>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v44 = v41 - *(void *)v53;
                  uint64_t v45 = v44 >> 2;
                  if (v44 >> 2 <= (unint64_t)(v43 + 1)) {
                    uint64_t v45 = v43 + 1;
                  }
                  if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v46 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v46 = v45;
                  }
                  if (v46) {
                    uint64_t v47 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_anon_1c0[88], v46);
                  }
                  else {
                    uint64_t v47 = 0;
                  }
                  long long v48 = &v47[8 * v43];
                  v12.i64[0] = *(void *)(v13 + 8 * j);
                  *(void *)long long v48 = v12.i64[0];
                  long long v42 = v48 + 8;
                  char v49 = *(char **)&self->_anon_1c0[80];
                  v50 = *(char **)&self->_anon_1c0[72];
                  if (v49 != v50)
                  {
                    do
                    {
                      uint64_t v51 = *((void *)v49 - 1);
                      v49 -= 8;
                      v12.i32[1] = HIDWORD(v51);
                      *((void *)v48 - 1) = v51;
                      v48 -= 8;
                    }
                    while (v49 != v50);
                    char v49 = *(char **)v53;
                  }
                  *(void *)&self->_anon_1c0[72] = v48;
                  *(void *)&self->_anon_1c0[80] = v42;
                  *(void *)&self->_anon_1c0[88] = &v47[8 * v46];
                  if (v49) {
                    operator delete(v49);
                  }
                }
                else
                {
                  v12.i64[0] = *(void *)(v13 + 8 * j);
                  void *v40 = v12.i64[0];
                  long long v42 = v40 + 1;
                }
                *(void *)&self->_anon_1c0[80] = v42;
              }
            }
          }
        }
        _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)self->_anon_1c0, (uint64_t)(*(void *)&self->_anon_1c0[32] - *(void *)&self->_anon_1c0[24]) >> 4);
        -[OUPointCloud append:points:semanticLabels:semanticVotes:colors:](self->worldPointCloud, "append:points:semanticLabels:semanticVotes:colors:", [v7 count], objc_msgSend(v7, "points"), objc_msgSend(v7, "semanticLabels"), objc_msgSend(v7, "semanticVotes"), objc_msgSend(v7, "colors"));
      }
      uint64_t v4 = [(NSDictionary *)obj countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v4);
  }

  kdebug_trace();
}

- (BOOL)preprocess
{
  kdebug_trace();
  long long v24 = *(_OWORD *)&self->_anon_a0[48];
  unint64_t v3 = vaddq_f32(*(float32x4_t *)&self->_anon_a0[32], vmlaq_f32(vmulq_f32(*(float32x4_t *)self->_anon_a0, (float32x4_t)0), (float32x4_t)0, *(float32x4_t *)&self->_anon_a0[16])).u64[0];
  float v4 = 1.57079633 - atan2f(*((float *)&v3 + 1), *(float *)&v3);
  v5.i64[0] = 0;
  v5.i32[2] = 0;
  *(float *)&v5.i32[3] = -*(float *)&v24;
  v6.i64[0] = 0;
  v6.i32[2] = 0;
  *(float *)&v6.i32[3] = -*((float *)&v24 + 1);
  int32x4_t v21 = vzip2q_s32(v5, (int32x4_t)xmmword_237CB44B0);
  int32x4_t v23 = vzip2q_s32(v6, (int32x4_t)xmmword_237CB4480);
  __float2 v9 = __sincosf_stret(v4);
  *(float *)v8.i32 = v9.__cosval;
  *(__float2 *)v7.i8 = v9;
  uint64_t v10 = 0;
  *(float *)&v8.i32[1] = -v9.__sinval;
  int32x4_t v11 = vzip1q_s32(v8, (int32x4_t)0);
  float32x2x2_t v12 = (float32x2x2_t)vzip1q_s32(v7, (int32x4_t)0);
  float32x4_t v13 = (float32x4_t)vzip1q_s32(v11, (int32x4_t)v12);
  float32x4_t v14 = (float32x4_t)vzip2q_s32(v11, (int32x4_t)v12);
  v26[0] = xmmword_237CB4490;
  v26[1] = xmmword_237CB44A0;
  float32x4_t v15 = (float *)v27;
  v12.val[0] = (float32x2_t)v21.i64[0];
  uint64_t v16 = v23.i64[0];
  vst2_f32(v15, v12);
  v27[1] = vzip2q_s32(v21, v23);
  do
  {
    v28.columns[v10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v13, COERCE_FLOAT(v26[v10])), v14, *(float32x2_t *)&v26[v10], 1), (float32x4_t)xmmword_237CB44B0, (float32x4_t)v26[v10], 2), (float32x4_t)xmmword_237CB4480, (float32x4_t)v26[v10], 3);
    ++v10;
  }
  while (v10 != 4);
  simd_float4 v25 = v28.columns[0];
  simd_float4 v20 = v28.columns[2];
  simd_float4 v22 = v28.columns[1];
  simd_float4 v19 = v28.columns[3];
  simd_float4x4 v29 = __invert_f4(v28);
  *(simd_float4 *)self->_anon_140 = v25;
  *(simd_float4 *)&self->_anon_140[16] = v22;
  *(simd_float4 *)&self->_anon_140[32] = v20;
  *(simd_float4 *)&self->_anon_140[48] = v19;
  *(simd_float4x4 *)self->_anon_180 = v29;
  [(OU3DObjectDetector *)self buildFrustumPointCloudFromWorldPointCloud];
  BOOL v17 = *(void *)&self->_anon_1c0[32] - *(void *)&self->_anon_1c0[24] > 0x3E70uLL;
  kdebug_trace();
  return v17;
}

- (void)modelProcess
{
  ou3dod::OU3DODInterface::Process((OUDnnInferenceInterface **)self->online_detector_.__ptr_.__value_, (const OUPointCloudCpp *)self->_anon_1c0);
  uint64_t value = self->online_detector_.__ptr_.__value_;
  if (&self->cur_box3ds_ != (vector<OUBox3d, std::allocator<OUBox3d>> *)((char *)value + 8))
  {
    float v4 = (long long *)*((void *)value + 1);
    int32x4_t v5 = (long long *)*((void *)value + 2);
    std::vector<OUBox3d>::__assign_with_size[abi:ne180100]<OUBox3d*,OUBox3d*>((uint64_t)&self->cur_box3ds_, v4, v5, 0x6DB6DB6DB6DB6DB7 * (((char *)v5 - (char *)v4) >> 5));
  }
}

- (void)ValidateRawDetections:(void *)a3
{
  float v4 = (long long *)*((void *)a3 + 1);
  uint64_t v5 = *(void *)a3;
  int v6 = -1227133513 * (((unint64_t)v4 - *(void *)a3) >> 5);
  int v7 = v6 - 1;
  if (v6 >= 1)
  {
    int v8 = 0;
    do
    {
      uint64_t v9 = *(void *)a3;
      if ([*(id *)(*(void *)a3 + 224 * v8 + 128) isEqualToString:@"Chair"]
        && (float32x4_t v10 = vsubq_f32(*(float32x4_t *)(v9 + 224 * v8 + 16), *(float32x4_t *)(v9 + 224 * v8 + 32)),
            sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v10, v10))) > 0.9))
      {
        std::swap[abi:ne180100]<OUBox3d>((__n128 *)(*(void *)a3 + 224 * v8), (__n128 *)(*(void *)a3 + 224 * v7--));
      }
      else
      {
        ++v8;
      }
    }
    while (v8 <= v7);
    uint64_t v5 = *(void *)a3;
    float v4 = (long long *)*((void *)a3 + 1);
  }
  std::vector<OUBox3d>::erase((uint64_t)a3, (__n128 *)(v5 + 224 * v7 + 224), v4);
}

- (void)postprocess
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  kdebug_trace();
  [(OU3DObjectDetector *)self ValidateRawDetections:&self->cur_box3ds_];
  unint64_t v3 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = 0x6DB6DB6DB6DB6DB7 * (((char *)self->cur_box3ds_.__end_ - (char *)self->cur_box3ds_.__begin_) >> 5);
    LODWORD(buf.var1) = 134217984;
    *(id *)((char *)&buf.var1 + 4) = (id)v4;
    _os_log_impl(&dword_237C17000, v3, OS_LOG_TYPE_INFO, "[3DOD] Detected new objects: %zu", (uint8_t *)&buf, 0xCu);
  }

  begin = self->cur_box3ds_.__begin_;
  end = self->cur_box3ds_.__end_;
  if (begin != end)
  {
    float32x4_t v7 = *(float32x4_t *)self->_anon_180;
    float32x4_t v8 = *(float32x4_t *)&self->_anon_180[16];
    float32x4_t v9 = *(float32x4_t *)&self->_anon_180[32];
    float32x4_t v10 = *(float32x4_t *)&self->_anon_180[48];
    do
    {
      for (uint64_t i = 0; i != 128; i += 16)
        *(float32x4_t *)((char *)&begin->var1 + i) = vaddq_f32(v10, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(_OWORD *)((char *)&begin->var1 + i))), v8, *(float32x2_t *)((char *)&begin->var1 + i), 1), v9, *(float32x4_t *)((char *)&begin->var1 + i), 2));
      begin = (OUBox3d *)((char *)begin + 224);
    }
    while (begin != end);
  }
  sizeRevision((uint64_t *)&self->cur_box3ds_);
  float32x2x2_t v12 = (long long *)self->cur_box3ds_.__begin_;
  float32x4_t v13 = self->cur_box3ds_.__end_;
  if (v12 != (long long *)v13)
  {
    float32x4_t v14 = std::vector<OUBox3d>::__insert_with_size[abi:ne180100]<std::__wrap_iter<OUBox3d*>,std::__wrap_iter<OUBox3d*>>((uint64_t *)&self->acc_box3ds_, (long long *)self->acc_box3ds_.__end_, v12, (uint64_t)v13, 0x6DB6DB6DB6DB6DB7 * (((char *)v13 - (char *)v12) >> 5));
    float32x4_t v15 = OUVizTool::Get((OUVizTool *)v14);
    std::string::basic_string[abi:ne180100]<0>(&buf, "accumulatedBoxData");
    OUVizTool::SaveBoxes((uint64_t)v15, (uint64_t)&buf, (uint64_t *)&self->acc_box3ds_);
    if (SHIBYTE(buf.var3) < 0) {
      operator delete(buf.var1);
    }
    memset(v36, 0, sizeof(v36));
    p_hist_kept_box_ids = &self->hist_kept_box_ids_;
    withinClassNMS(&self->acc_box3ds_.__begin_, (std::vector<int> *)&self->hist_kept_box_ids_, &self->hist_ori_iou_mat_.__begin_, (uint64_t *)&self->hist_nms_iou_mat_, v36, (unint64_t **)&v34, 0.2);
    uint64_t v33 = 0;
    long long v32 = 0uLL;
    std::vector<OUBox3d>::reserve((uint64_t *)&v32, (v35 - (unsigned char *)v34) >> 3);
    BOOL v17 = v34;
    int v18 = v35;
    memset(&v37, 0, sizeof(v37));
    std::vector<OUBox3d>::__init_with_size[abi:ne180100]<OUBox3d*,OUBox3d*>(&v37, (uint64_t)self->acc_box3ds_.__begin_, (uint64_t)self->acc_box3ds_.__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)self->acc_box3ds_.__end_ - (char *)self->acc_box3ds_.__begin_) >> 5));
    for (; v17 != v18; ++v17)
    {
      OUBox3d::OUBox3d(&buf, (const OUBox3d *)&v37.__begin_[56 * *v17]);
      std::vector<OUBox3d>::push_back[abi:ne180100]((uint64_t *)&v32, (long long *)&buf);

      if (__p) {
        operator delete(__p);
      }
      if (v43)
      {
        uint64_t v44 = v43;
        operator delete(v43);
      }
    }
    buf.var1 = &v37;
    std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
    std::vector<OUBox3d>::__vdeallocate((void **)&self->acc_box3ds_.__begin_);
    *(_OWORD *)&self->acc_box3ds_.__begin_ = v32;
    self->acc_box3ds_.__end_cap_.__value_ = v33;
    uint64_t v33 = 0;
    long long v32 = 0uLL;
    buf.var1 = &v32;
    std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
    memset(&v37, 0, sizeof(v37));
    std::vector<int>::reserve(&v37, (v35 - (unsigned char *)v34) >> 3);
    simd_float4 v19 = v34;
    simd_float4 v20 = v35;
    memset(&buf, 0, 24);
    std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&buf, self->hist_kept_box_ids_.__begin_, (uint64_t)self->hist_kept_box_ids_.__end_, self->hist_kept_box_ids_.__end_ - self->hist_kept_box_ids_.__begin_);
    *(void *)&long long v32 = &v37;
    while (v19 != v20)
    {
      int v38 = *((_DWORD *)buf.var1 + *v19);
      std::back_insert_iterator<std::vector<int>>::operator=[abi:ne180100]((uint64_t *)&v32, &v38);
      ++v19;
    }
    if (buf.var1)
    {
      *(void *)&buf.var2 = buf.var1;
      operator delete(buf.var1);
    }
    int32x4_t v21 = p_hist_kept_box_ids->__begin_;
    if (p_hist_kept_box_ids->__begin_)
    {
      self->hist_kept_box_ids_.__end_ = v21;
      operator delete(v21);
      p_hist_kept_box_ids->__begin_ = 0;
      self->hist_kept_box_ids_.__end_ = 0;
      self->hist_kept_box_ids_.__end_cap_.__value_ = 0;
    }
    self->hist_kept_box_ids_ = (vector<int, std::allocator<int>>)v37;
    simd_float4 v22 = OUVizTool::Get((OUVizTool *)v21);
    std::string::basic_string[abi:ne180100]<0>(&buf, "withinClassNMSBoxData");
    OUVizTool::SaveBoxes((uint64_t)v22, (uint64_t)&buf, (uint64_t *)&self->acc_box3ds_);
    if (SHIBYTE(buf.var3) < 0) {
      operator delete(buf.var1);
    }
    merger = self->merger;
    if (merger) {
      merger = -[OU3DObjectMerger mergeOtherObjects:](merger, "mergeOtherObjects:", &self->acc_box3ds_, (void)v32);
    }
    else {
      memset(&buf, 0, 24);
    }
    long long v24 = OUVizTool::Get((OUVizTool *)merger);
    std::string::basic_string[abi:ne180100]<0>(&v37, "mergeOtherObjectsBoxData");
    OUVizTool::SaveBoxes((uint64_t)v24, (uint64_t)&v37, (uint64_t *)&buf);
    if (SHIBYTE(v37.__end_cap_.__value_) < 0) {
      operator delete(v37.__begin_);
    }
    simd_float4 v25 = self->merger;
    if (v25) {
      [(OU3DObjectMerger *)v25 mergeCabinets:&buf iou_mat:v36];
    }
    else {
      memset(&v37, 0, sizeof(v37));
    }
    std::vector<OUBox3d>::__vdeallocate(&buf.var1);
    *(_OWORD *)&buf.var1 = *(_OWORD *)&v37.__begin_;
    buf.var3 = v37.__end_cap_.__value_;
    memset(&v37, 0, sizeof(v37));
    *(void *)&long long v32 = &v37;
    std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&v32);
    float32x4_t v27 = OUVizTool::Get(v26);
    std::string::basic_string[abi:ne180100]<0>(&v37, "mergeCabinetsBoxData");
    OUVizTool::SaveBoxes((uint64_t)v27, (uint64_t)&v37, (uint64_t *)&buf);
    if (SHIBYTE(v37.__end_cap_.__value_) < 0) {
      operator delete(v37.__begin_);
    }
    simd_float4x4 v28 = self->merger;
    if (v28) {
      [(OU3DObjectMerger *)v28 crossClassNMS:&buf];
    }
    else {
      memset(&v37, 0, sizeof(v37));
    }
    p_merged_box3ds = (uint64_t *)&self->merged_box3ds_;
    std::vector<OUBox3d>::__vdeallocate((void **)&self->merged_box3ds_.__begin_);
    self->merged_box3ds_ = (vector<OUBox3d, std::allocator<OUBox3d>>)v37;
    memset(&v37, 0, sizeof(v37));
    *(void *)&long long v32 = &v37;
    std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&v32);
    uint64_t v31 = OUVizTool::Get(v30);
    std::string::basic_string[abi:ne180100]<0>(&v37, "crossClassNMSBoxData");
    OUVizTool::SaveBoxes((uint64_t)v31, (uint64_t)&v37, p_merged_box3ds);
    if (SHIBYTE(v37.__end_cap_.__value_) < 0) {
      operator delete(v37.__begin_);
    }
    v37.__begin_ = (std::vector<int>::pointer)&buf;
    std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
    if (v34)
    {
      id v35 = v34;
      operator delete(v34);
    }
    buf.var1 = v36;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  }
  kdebug_trace();
}

- (void)ResestObjectSizeHistoryIfSizeChange:(id)a3 withOldObjects:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v25 = a4;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v6)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      uint64_t v27 = v6;
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(obj);
        }
        float32x4_t v7 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        float32x4_t v8 = objc_msgSend(v7, "refined_box_history");
        BOOL v9 = [v8 count] == 0;

        if (!v9)
        {
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v10 = v25;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v33;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v33 != v12) {
                  objc_enumerationMutation(v10);
                }
                float32x4_t v14 = [*(id *)(*((void *)&v32 + 1) + 8 * j) identifier];
                float32x4_t v15 = [v7 identifier];
                char v16 = [v14 isEqual:v15];

                if (v16)
                {
                  BOOL v17 = [v7 boxesDict];
                  int v18 = [v17 objectForKeyedSubscript:@"rawdetection"];
                  box3dFromNSArray(v18, (uint64_t)v30);
                  box3dToCentroidSizeAngle(v30, (uint64_t *)v31);

                  simd_float4 v19 = objc_msgSend(v7, "refined_box_history");
                  simd_float4 v20 = [v19 lastObject];
                  int32x4_t v21 = [v20 preRefinedBox];
                  box3dFromNSArray(v21, (uint64_t)v30);
                  box3dToCentroidSizeAngle(v30, (uint64_t *)__p);

                  simd_float4 v22 = __p[0];
                  if ((float)(vabds_f32(*((float *)v31[0] + 3), *((float *)__p[0] + 3)) / *((float *)__p[0] + 3)) <= 0.25
                    && (float)(vabds_f32(*((float *)v31[0] + 4), *((float *)__p[0] + 4)) / *((float *)__p[0] + 4)) <= 0.25
                    && (float)(vabds_f32(*((float *)v31[0] + 5), *((float *)__p[0] + 5)) / *((float *)__p[0] + 5)) <= 0.25
                    || (int32x4_t v23 = objc_opt_new(),
                        objc_msgSend(v7, "setRefined_box_history:", v23),
                        v23,
                        (simd_float4 v22 = __p[0]) != 0))
                  {
                    __p[1] = v22;
                    operator delete(v22);
                  }
                  if (v31[0])
                  {
                    v31[1] = v31[0];
                    operator delete(v31[0]);
                  }
                }
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v11);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v6);
  }
}

- (void)CopyRefineHistory:(id)a3 fromOldObjects:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v21 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v22 = v6;
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        float32x4_t v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v9 = v21;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v24 != v11) {
                objc_enumerationMutation(v9);
              }
              float32x4_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              float32x4_t v14 = [v13 identifier];
              float32x4_t v15 = [v8 identifier];
              char v16 = [v14 isEqual:v15];

              if (v16)
              {
                BOOL v17 = objc_msgSend(v13, "refined_box_history");
                int v18 = (void *)[v17 copy];
                objc_msgSend(v8, "setRefined_box_history:", v18);
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v10);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);
  }
}

- (void)CopyObjectEmbedding:(id)a3 fromOldObjects:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v23 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v24 = v6;
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        float32x4_t v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v9 = v23;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v9);
              }
              float32x4_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              float32x4_t v14 = [v13 identifier];
              float32x4_t v15 = [v8 identifier];
              char v16 = [v14 isEqual:v15];

              if (v16)
              {
                BOOL v17 = [v13 embedding2d];
                int v18 = (void *)[v17 copy];
                [v8 setEmbedding2d:v18];

                simd_float4 v19 = [v13 embedding3d];
                uint64_t v20 = (void *)[v19 copy];
                [v8 setEmbedding3d:v20];
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v10);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }
}

- (id)FindNeedRefineBoxUUID:(id)a3 withOldObjects:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  rawBoxesFromObjects(v5, v37);
  rawBoxesFromObjects(v6, (uint64_t *)&v35);
  long long v30 = [MEMORY[0x263EFF9C0] set];
  long long v29 = v6;
  int v7 = [v5 count];
  if (v7 >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v31 = v7;
    do
    {
      uint64_t v9 = v37[0];
      uint64_t v10 = (float32x4_t *)(v37[0] + 224 * v8);
      if ([(NSSet *)self->rgb_refine_supported_types_ containsObject:v10[8].i64[0]])
      {
        uint64_t v11 = [v5 objectAtIndexedSubscript:v8];
        uint64_t v12 = objc_msgSend(v11, "refined_box_history");
        uint64_t v13 = [v12 count];

        if (!v13) {
          goto LABEL_15;
        }
        if (self->num_pre_key_frames_ != self->num_cur_key_frames_) {
          goto LABEL_11;
        }
        float32x4_t v14 = [v5 objectAtIndexedSubscript:v8];
        float32x4_t v15 = v5;
        char v16 = objc_msgSend(v14, "refined_box_history");
        if (![v16 count])
        {

          id v5 = v15;
LABEL_11:
          uint64_t v22 = v35;
          id v21 = v36;
          if (v35 != (float32x4_t *)v36)
          {
            id v23 = (id *)(v9 + 224 * v8 + 144);
            while (![*v23 isEqual:v22[9].i64[0]])
            {
              v22 += 14;
              if (v22 == (float32x4_t *)v21) {
                goto LABEL_15;
              }
            }
            box3dToCentroidSizeAngle(v22, (uint64_t *)v34);
            box3dToCentroidSizeAngle(v10, (uint64_t *)__p);
            uint64_t v24 = 0;
            char v25 = 0;
            long long v26 = __p[0];
            do
            {
              v25 |= vabds_f32(*(float *)((char *)v34[0] + v24), *(float *)((char *)__p[0] + v24)) > 0.05;
              v24 += 4;
            }
            while (v24 != 24);
            if ((v25 & 1) == 0 || ([v30 addObject:*v23], (long long v26 = __p[0]) != 0))
            {
              __p[1] = v26;
              operator delete(v26);
            }
            if (v34[0])
            {
              v34[1] = v34[0];
              operator delete(v34[0]);
            }
            goto LABEL_23;
          }
LABEL_15:
          [v30 addObject:*(void *)(v9 + 224 * v8 + 144)];
          goto LABEL_23;
        }
        BOOL v17 = [v15 objectAtIndexedSubscript:v8];
        int v18 = objc_msgSend(v17, "refined_box_history");
        simd_float4 v19 = [v18 lastObject];
        uint64_t v20 = [v19 refinedBox];

        id v5 = v15;
        if (!v20) {
          goto LABEL_11;
        }
      }
LABEL_23:
      ++v8;
    }
    while (v8 != v31);
  }
  long long v27 = (void *)[v30 copy];

  v34[0] = &v35;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)v34);
  uint64_t v35 = (float32x4_t *)v37;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);

  return v27;
}

- (id)regulateObjectSize:(id)a3 withOldObjects:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v25 = a4;
  int v6 = 0;
  memset(v33, 0, sizeof(v33));
  int v34 = 1065353216;
  uint64_t v24 = @"rawdetection";
  while (1)
  {
    int v32 = v6;
    if (objc_msgSend(v5, "count", v24) <= (unint64_t)v6) {
      break;
    }
    int v7 = [v5 objectAtIndexedSubscript:v32];
    uint64_t v8 = [v7 type];
    char v9 = [v8 isEqualToString:@"Screen"];

    if (v9)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = v25;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v35 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v29;
LABEL_6:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v10);
          }
          float32x4_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
          float32x4_t v15 = [v7 identifier];
          char v16 = [v14 identifier];
          char v17 = [v15 isEqual:v16];

          if (v17) {
            break;
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v35 count:16];
            if (v11) {
              goto LABEL_6;
            }
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:

        int v18 = [v7 boxesDict];
        id v10 = [v18 objectForKey:v24];

        if (v10)
        {
          memset(v27, 0, sizeof(v27));
          box3dFromNSArray(v10, (uint64_t)v27);
          box3dToCentroidSizeAngle(v27, (uint64_t *)__p);
          simd_float4 v19 = __p[0];
          if (sqrtf((float)(*((float *)__p[0] + 5) * *((float *)__p[0] + 5))+ (float)(*((float *)__p[0] + 3) * *((float *)__p[0] + 3))) >= 0.94|| (std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)v33, &v32, &v32), (simd_float4 v19 = __p[0]) != 0))
          {
            __p[1] = v19;
            operator delete(v19);
          }
        }
      }
    }
    int v6 = v32 + 1;
  }
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (__int32 i = 0; ; __int32 i = v27[0].i32[0] + 1)
  {
    v27[0].i32[0] = i;
    if ([v5 count] <= (unint64_t)i) {
      break;
    }
    if (!std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(v33, (int *)v27))
    {
      uint64_t v22 = [v5 objectAtIndexedSubscript:v27[0].i32[0]];
      [v20 addObject:v22];
    }
  }
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v33);

  return v20;
}

- (void)regulateObjectCornerOrders:(id)a3 withOldObjects:(id)a4
{
  id v5 = a3;
  id v41 = a4;
  uint64_t v44 = v5;
  kdebug_trace();
  rawBoxesFromObjects(v5, &v55);
  rawBoxesFromObjects(v41, &v53);
  int v7 = OUVizTool::Get(v6);
  std::string::basic_string[abi:ne180100]<0>(__p, "regulateObjectCornerOrders");
  OUVizTool::SaveBoxes((uint64_t)v7, (uint64_t)__p, &v55);
  if (SBYTE7(v46) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v8 = v55;
  uint64_t v9 = v56;
  if (v56 != v55)
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = v53;
    uint64_t v13 = v54;
    uint64_t v14 = 64;
    do
    {
      if (v13 == v12)
      {
        uint64_t v13 = v12;
      }
      else
      {
        uint64_t v15 = 0;
        unint64_t v16 = 0;
        char v17 = (long long *)(v8 + 224 * v11);
        uint64_t v42 = v14;
        uint64_t v43 = v10;
        uint64_t v18 = v8 + v10;
        uint64_t v19 = v8 + v14;
        do
        {
          if ([*(id *)(v55 + 224 * v11 + 144) isEqual:*(void *)(v12 + 224 * v16 + 144)])
          {
            int v20 = 0;
            int v21 = 0;
            float v22 = 3.4028e38;
            do
            {
              uint64_t v23 = 0;
              float v24 = 0.0;
              do
              {
                int v25 = (v20 + v23) & 3;
                if (v20 + (int)v23 <= 0) {
                  int v25 = -(-(v20 + v23) & 3);
                }
                float32x4_t v26 = vsubq_f32((float32x4_t)v17[v25], *(float32x4_t *)(v53 + v15 + 16 * v23));
                float32x4_t v27 = vmulq_f32(v26, v26);
                float v24 = v24
                    + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), vaddq_f32(v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1))).f32[0]);
                ++v23;
              }
              while (v23 != 4);
              if (v24 < v22)
              {
                float v22 = v24;
                int v21 = v20;
              }
              ++v20;
            }
            while (v20 != 4);
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            *(_OWORD *)std::string __p = 0u;
            long long v46 = 0u;
            long long v28 = *v17;
            long long v29 = v17[1];
            long long v30 = v17[3];
            long long v47 = v17[2];
            long long v48 = v30;
            *(_OWORD *)std::string __p = v28;
            long long v46 = v29;
            long long v31 = v17[4];
            long long v32 = v17[5];
            long long v33 = v17[7];
            long long v51 = v17[6];
            long long v52 = v33;
            long long v49 = v31;
            long long v50 = v32;
            if (v21 >= 1)
            {
              uint64_t v34 = 0;
              int v35 = 4 - v21;
              do
              {
                if (v35 + (int)v34 <= 0) {
                  int v36 = -(-(v35 + v34) & 3);
                }
                else {
                  int v36 = (v35 + v34) & 3;
                }
                *(_OWORD *)&__p[2 * v36] = *(_OWORD *)(v18 + 16 * v34++);
              }
              while (v34 != 4);
              uint64_t v37 = 0;
              int v38 = 8 - v21;
              do
              {
                if (v38 + (int)v37 <= 0) {
                  int v39 = -(-(v38 + v37) & 3);
                }
                else {
                  int v39 = (v38 + v37) & 3;
                }
                *(_OWORD *)&__p[2 * (v39 + 4)] = *(_OWORD *)(v19 + 16 * v37++);
              }
              while (v37 != 4);
            }
            id v40 = [v44 objectAtIndexedSubscript:v11];
            [v40 addBoxesDict:__p forDictKey:@"rawdetection"];
          }
          ++v16;
          uint64_t v12 = v53;
          uint64_t v13 = v54;
          v15 += 224;
        }
        while (0x6DB6DB6DB6DB6DB7 * ((v54 - v53) >> 5) > v16);
        uint64_t v8 = v55;
        uint64_t v9 = v56;
        uint64_t v14 = v42;
        uint64_t v10 = v43;
      }
      ++v11;
      v10 += 224;
      v14 += 224;
    }
    while (0x6DB6DB6DB6DB6DB7 * ((v9 - v8) >> 5) > v11);
  }
  kdebug_trace();
  __p[0] = &v53;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  __p[0] = &v55;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
}

- (void)reviseObjectsUponParentId:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v29 = a3;
  for (unint64_t i = 0; i < [v29 count]; ++i)
  {
    uint64_t v4 = [v29 objectAtIndexedSubscript:i];
    id v5 = [v4 type];
    if ([v5 isEqualToString:@"Stove"])
    {
      int v6 = [v29 objectAtIndexedSubscript:i];
      int v7 = objc_msgSend(v6, "parent_id");

      if (v7)
      {
        uint64_t v8 = [v29 objectAtIndexedSubscript:i];
        for (unint64_t j = 0; ; ++j)
        {
          if (j >= [v29 count])
          {

            goto LABEL_25;
          }
          long long v28 = [v29 objectAtIndexedSubscript:j];
          uint64_t v10 = [v28 identifier];
          unint64_t v11 = objc_msgSend(v8, "parent_id");
          if ([v10 isEqual:v11])
          {
            uint64_t v12 = [v29 objectAtIndexedSubscript:j];
            char v13 = [v12 hasBoxesDict:@"rawdetection"];

            if ((v13 & 1) == 0) {
              continue;
            }
            uint64_t v14 = [v29 objectAtIndexedSubscript:j];
            long long v37 = 0u;
            memset(v36, 0, sizeof(v36));
            long long v28 = v14;
            uint64_t v15 = [v14 boxesDict];
            unint64_t v16 = [v15 objectForKey:@"rawdetection"];
            box3dFromNSArray(v16, (uint64_t)v36);

            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            char v17 = [v8 boxesDict];
            uint64_t v18 = [v17 allKeys];

            uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v38 count:16];
            if (v19)
            {
              uint64_t v20 = *(void *)v33;
              do
              {
                for (uint64_t k = 0; k != v19; ++k)
                {
                  if (*(void *)v33 != v20) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * k);
                  uint64_t v23 = [v8 boxesDict];
                  float v24 = [v23 objectForKey:v22];
                  box3dFromNSArray(v24, (uint64_t)v30);
                  box3dToCentroidSizeAngle(v30, (uint64_t *)__p);

                  int v25 = (float *)__p[0];
                  *((_DWORD *)__p[0] + 5) = 1028443341;
                  v25[2] = *((float *)&v37 + 2) + 0.025;
                  memset(v30, 0, sizeof(v30));
                  centroidSizeAngleToBox3d((uint64_t *)__p, 1, v30);
                  float32x4_t v26 = [v8 boxesDict];
                  float32x4_t v27 = box3dToNSArray((__n128 *)v30);
                  [v26 setValue:v27 forKey:v22];

                  if (__p[0])
                  {
                    __p[1] = __p[0];
                    operator delete(__p[0]);
                  }
                }
                uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v38 count:16];
              }
              while (v19);
            }
          }
          else
          {
          }
        }
      }
    }
    else
    {
    }
  }
LABEL_25:
}

- (void)assignParentId:(id)a3 isOffline:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 count];
  long long v100 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"Dishwasher", @"Washer", @"Oven", 0);
  long long v99 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"Stove", @"Sink", 0);
  if (v4)
  {
    int v7 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[OU3DObjectDetector assignParentId:isOffline:](v7);
    }

    if (!v6) {
      goto LABEL_59;
    }
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v9 = [v5 objectAtIndexedSubscript:i];
      objc_msgSend(v9, "setParent_id:", 0);
    }
  }
  if (v6)
  {
    for (uint64_t j = 0; j != v6; ++j)
    {
      unint64_t v11 = [v5 objectAtIndexedSubscript:j];
      uint64_t v12 = [v11 type];
      if ([v12 isEqualToString:@"Cabinet"])
      {
        char v13 = [v5 objectAtIndexedSubscript:j];
        char v14 = [v13 hasBoxesDict:@"rawdetection"];

        if (v14)
        {
          long long v123 = 0u;
          long long v124 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          float32x4_t v117 = 0u;
          long long v118 = 0u;
          uint64_t v15 = [v5 objectAtIndexedSubscript:j];
          unint64_t v16 = [v15 boxesDict];
          char v17 = [v16 objectForKeyedSubscript:@"rawdetection"];
          box3dFromNSArray(v17, (uint64_t)&v117);

          for (uint64_t k = 0; k != v6; ++k)
          {
            uint64_t v19 = [v5 objectAtIndexedSubscript:k];
            uint64_t v20 = [v19 type];
            if ([v100 containsObject:v20])
            {
              int v21 = [v5 objectAtIndexedSubscript:k];
              char v22 = [v21 hasBoxesDict:@"rawdetection"];

              if (v22)
              {
                long long v115 = 0u;
                long long v116 = 0u;
                long long v113 = 0u;
                long long v114 = 0u;
                long long v111 = 0u;
                long long v112 = 0u;
                float32x4_t v109 = 0u;
                long long v110 = 0u;
                uint64_t v23 = [v5 objectAtIndexedSubscript:k];
                float v24 = [v23 boxesDict];
                int v25 = [v24 objectForKeyedSubscript:@"rawdetection"];
                box3dFromNSArray(v25, (uint64_t)&v109);

                long long v102 = 0u;
                long long v103 = 0u;
                float32x4_t v101 = 0u;
                box3dIou(&v117, &v109, 0, (uint64_t)&v101);
                if (v101.f32[3] >= 0.8)
                {
                  LODWORD(v26) = v102;
                  if (*(float *)&v102 < *((float *)&v102 + 1))
                  {
                    float32x4_t v27 = objc_msgSend(v5, "objectAtIndexedSubscript:", j, v26);
                    long long v28 = [v27 identifier];
                    id v29 = (void *)[v28 copy];
                    long long v30 = [v5 objectAtIndexedSubscript:k];
                    objc_msgSend(v30, "setParent_id:", v29);

                    long long v31 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                    {
                      v95 = [v5 objectAtIndexedSubscript:k];
                      id v97 = [v95 type];
                      long long v32 = [v5 objectAtIndexedSubscript:j];
                      long long v33 = [v32 type];
                      long long v34 = [v5 objectAtIndexedSubscript:k];
                      long long v35 = objc_msgSend(v34, "parent_id");
                      *(_DWORD *)OUBox3d buf = 138412802;
                      *(void *)&uint8_t buf[4] = v97;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v33;
                      *(_WORD *)&buf[22] = 2112;
                      *(void *)&buf[24] = v35;
                      _os_log_debug_impl(&dword_237C17000, v31, OS_LOG_TYPE_DEBUG, "%@ has parent object (%@) with parent_id: %@", buf, 0x20u);
                    }
                  }
                }
              }
            }
            else
            {
            }
          }
        }
      }
      else
      {
      }
    }
    for (uint64_t m = 0; m != v6; ++m)
    {
      long long v37 = [v5 objectAtIndexedSubscript:m];
      int v38 = [v37 type];
      if (v38 == @"Cabinet")
      {
        uint64_t v39 = [v5 objectAtIndexedSubscript:m];
        int v40 = [v39 hasBoxesDict:@"rawdetection"];

        if (v40)
        {
          for (uint64_t n = 0; n != v6; ++n)
          {
            uint64_t v42 = [v5 objectAtIndexedSubscript:n];
            uint64_t v43 = [v42 type];
            if ([v99 containsObject:v43])
            {
              uint64_t v44 = [v5 objectAtIndexedSubscript:n];
              char v45 = [v44 hasBoxesDict:@"rawdetection"];

              if (v45)
              {
                long long v123 = 0u;
                long long v124 = 0u;
                long long v121 = 0u;
                long long v122 = 0u;
                long long v119 = 0u;
                long long v120 = 0u;
                float32x4_t v117 = 0u;
                long long v118 = 0u;
                long long v46 = [v5 objectAtIndexedSubscript:m];
                long long v47 = [v46 boxesDict];
                long long v48 = [v47 objectForKeyedSubscript:@"rawdetection"];
                box3dFromNSArray(v48, (uint64_t)&v117);

                long long v115 = 0u;
                long long v116 = 0u;
                long long v113 = 0u;
                long long v114 = 0u;
                long long v111 = 0u;
                long long v112 = 0u;
                float32x4_t v109 = 0u;
                long long v110 = 0u;
                long long v49 = [v5 objectAtIndexedSubscript:n];
                long long v50 = [v49 boxesDict];
                long long v51 = [v50 objectForKeyedSubscript:@"rawdetection"];
                box3dFromNSArray(v51, (uint64_t)&v109);

                long long v107 = 0u;
                long long v108 = 0u;
                long long v105 = 0u;
                long long v106 = 0u;
                long long v103 = 0u;
                long long v104 = 0u;
                float32x4_t v101 = 0u;
                long long v102 = 0u;
                box3dEnlarge(&v109, 0.0, 0.0, 0.3, &v101);
                *(_OWORD *)v134 = 0u;
                memset(buf, 0, sizeof(buf));
                box3dIou(&v117, &v101, 0, (uint64_t)buf);
                if (*(float *)buf >= 0.000001)
                {
                  *(float *)&double v52 = v134[1];
                  if (v134[1] >= 0.5)
                  {
                    uint64_t v53 = objc_msgSend(v5, "objectAtIndexedSubscript:", m, v52);
                    uint64_t v54 = [v53 identifier];
                    uint64_t v55 = (void *)[v54 copy];
                    uint64_t v56 = [v5 objectAtIndexedSubscript:n];
                    objc_msgSend(v56, "setParent_id:", v55);

                    float32x4_t v57 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                    {
                      v96 = [v5 objectAtIndexedSubscript:n];
                      v98 = [v96 type];
                      long long v58 = [v5 objectAtIndexedSubscript:m];
                      long long v59 = [v58 type];
                      long long v60 = [v5 objectAtIndexedSubscript:n];
                      objc_msgSend(v60, "parent_id");
                      double v61 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                      *(_DWORD *)v125 = 138412802;
                      v126 = v98;
                      __int16 v127 = 2112;
                      v128 = v59;
                      __int16 v129 = 2112;
                      double v130 = v61;
                      _os_log_debug_impl(&dword_237C17000, v57, OS_LOG_TYPE_DEBUG, "%@ has parent object (%@) with parent_id: %@", v125, 0x20u);
                    }
                  }
                }
              }
            }
            else
            {
            }
          }
        }
      }
      else
      {
      }
    }
    uint64_t v62 = 0;
    while (1)
    {
      uint64_t v63 = [v5 objectAtIndexedSubscript:v62];
      id v64 = [v63 type];
      if (![v64 isEqualToString:@"Sink"]) {
        goto LABEL_57;
      }
      uint64_t v65 = [v5 objectAtIndexedSubscript:v62];
      if (([v65 hasBoxesDict:@"rawdetection"] & 1) == 0) {
        break;
      }
      uint64_t v66 = [v5 objectAtIndexedSubscript:v62];
      uint64_t v67 = objc_msgSend(v66, "parent_id");
      BOOL v68 = v67 == 0;

      if (v68)
      {
        uint64_t v69 = 0;
        while (1)
        {
          long long v70 = [v5 objectAtIndexedSubscript:v69];
          long long v71 = [v70 type];
          if ([v71 isEqualToString:@"Cabinet"]) {
            break;
          }
          long long v72 = [v5 objectAtIndexedSubscript:v69];
          long long v73 = [v72 type];
          char v74 = [v73 isEqualToString:@"Table"];

          if (v74) {
            goto LABEL_47;
          }
LABEL_54:
          if (v6 == ++v69) {
            goto LABEL_58;
          }
        }

LABEL_47:
        long long v75 = [v5 objectAtIndexedSubscript:v69];
        char v76 = [v75 hasBoxesDict:@"rawdetection"];

        if (v76)
        {
          long long v123 = 0u;
          long long v124 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          float32x4_t v117 = 0u;
          long long v118 = 0u;
          long long v77 = [v5 objectAtIndexedSubscript:v62];
          uint64_t v78 = [v77 boxesDict];
          uint64_t v79 = [v78 objectForKeyedSubscript:@"rawdetection"];
          box3dFromNSArray(v79, (uint64_t)&v117);

          long long v115 = 0u;
          long long v116 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          float32x4_t v109 = 0u;
          long long v110 = 0u;
          id v80 = [v5 objectAtIndexedSubscript:v69];
          id v81 = [v80 boxesDict];
          v82 = [v81 objectForKeyedSubscript:@"rawdetection"];
          box3dFromNSArray(v82, (uint64_t)&v109);

          float v83 = *((float *)&v121 + 2);
          float v84 = *((float *)&v113 + 2);
          long long v107 = 0u;
          long long v108 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          float32x4_t v101 = 0u;
          long long v102 = 0u;
          box3dEnlarge(&v117, 0.0, 0.0, 0.2, &v101);
          *(_OWORD *)v134 = 0u;
          memset(buf, 0, sizeof(buf));
          box3dIou(&v101, &v109, 0, (uint64_t)buf);
          double v85 = *(float *)buf;
          if (*(float *)buf > 0.01 && v83 > v84)
          {
            *(float *)&double v85 = v134[1];
            if (v134[1] >= 0.5)
            {
              v86 = objc_msgSend(v5, "objectAtIndexedSubscript:", v69, v85);
              uint64_t v87 = [v86 identifier];
              v88 = (void *)[v87 copy];
              id v89 = [v5 objectAtIndexedSubscript:v62];
              objc_msgSend(v89, "setParent_id:", v88);

              OUBox3d v90 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
              {
                id v91 = [v5 objectAtIndexedSubscript:v69];
                id v92 = [v91 type];
                id v93 = [v5 objectAtIndexedSubscript:v62];
                v94 = objc_msgSend(v93, "parent_id");
                *(_DWORD *)v125 = 138413058;
                v126 = v92;
                __int16 v127 = 2112;
                v128 = v94;
                __int16 v129 = 2048;
                double v130 = v134[0];
                __int16 v131 = 2048;
                double v132 = v134[1];
                _os_log_debug_impl(&dword_237C17000, v90, OS_LOG_TYPE_DEBUG, "The sink has parent object (%@) with parent_id: %@, %f, %f", v125, 0x2Au);
              }
            }
          }
        }
        goto LABEL_54;
      }
LABEL_58:
      if (++v62 == v6) {
        goto LABEL_59;
      }
    }

LABEL_57:
    goto LABEL_58;
  }
LABEL_59:
}

- (void)assignIdentifiersForNewObjects:(id)a3 withOldObjects:(id)a4
{
  v132[2] = *(void **)MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  kdebug_trace();
  rawBoxesFromObjects(v5, v128);
  rawBoxesFromObjects(v6, &v126);
  int v7 = @"Cabinet";
  v132[0] = v7;
  v132[1] = @"Shelf";
  std::set<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::set[abi:ne180100]((uint64_t)v124, v132, 2);
  for (uint64_t i = 1; i != -1; --i)

  v131[0] = @"Sofa";
  v131[1] = @"Chair";
  std::set<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::set[abi:ne180100]((uint64_t)v122, v131, 2);
  for (uint64_t j = 1; j != -1; --j)

  v130[0] = @"Dishwasher";
  v130[1] = @"Refrigerator";
  std::set<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::set[abi:ne180100]((uint64_t)v120, v130, 2);
  for (uint64_t k = 1; k != -1; --k)

  v129[0] = v7;
  v129[1] = @"Table";
  std::set<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::set[abi:ne180100]((uint64_t)v118, v129, 2);
  for (uint64_t m = 1; m != -1; --m)

  uint64_t v13 = v128[0];
  uint64_t v12 = v128[1];
  uint64_t v90 = v126;
  uint64_t v91 = v127;
  v100.i32[0] = -1082130432;
  unint64_t v88 = 0x6DB6DB6DB6DB6DB7 * ((v127 - v126) >> 5);
  float v84 = v6;
  std::vector<float>::vector(__p, v88, &v100);
  std::vector<std::vector<float>>::vector(&v116, (v12 - v13) / 224, (uint64_t)__p);
  unint64_t v87 = (v12 - v13) / 224;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  uint64_t v85 = v13;
  uint64_t v86 = v12;
  if (v12 != v13)
  {
    uint64_t v14 = 0;
    if (v88 <= 1) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v88;
    }
    if (v87 <= 1) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = (v12 - v13) / 224;
    }
    while (v91 == v90)
    {
LABEL_40:
      if (++v14 == v16) {
        goto LABEL_41;
      }
    }
    uint64_t v17 = 0;
    uint64_t v18 = 128;
    while (1)
    {
      char v19 = [*(id *)(v128[0] + 224 * v14 + 128) isEqualToString:*(void *)(v126 + v18)];
      uint64_t v20 = (void **)(v128[0] + 224 * v14 + 128);
      if (v19) {
        break;
      }
      if (std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v124, v20)
        && std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v124, (void **)(v126 + v18)))
      {
        box3dIou((float32x4_t *)(v128[0] + 224 * v14), (float32x4_t *)(v126 + v18 - 128), 0, (uint64_t)__p);
        *(_DWORD *)(*(void *)(v116 + 24 * v14) + 4 * v17) = __p[0];
      }
      if (std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v122, (void **)(v128[0] + 224 * v14 + 128))
        && std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v122, (void **)(v126 + v18))
        || std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v120, (void **)(v128[0] + 224 * v14 + 128))
        && std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v120, (void **)(v126 + v18)))
      {
        box3dIou((float32x4_t *)(v128[0] + 224 * v14), (float32x4_t *)(v126 + v18 - 128), 0, (uint64_t)__p);
        if (*(float *)__p > 0.7) {
          *(_DWORD *)(*(void *)(v116 + 24 * v14) + 4 * v17) = __p[0];
        }
      }
      if (!std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v118, (void **)(v128[0] + 224 * v14 + 128))
        || !std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::__count_unique<NSString * {__strong}>((uint64_t)v118, (void **)(v126 + v18)))
      {
        goto LABEL_39;
      }
      box3dIou((float32x4_t *)(v128[0] + 224 * v14), (float32x4_t *)(v126 + v18 - 128), 0, (uint64_t)__p);
      int v21 = (int)__p[0];
      uint64_t v22 = *(void *)(v116 + 24 * v14);
      if (*(float *)__p > 0.3) {
        goto LABEL_38;
      }
      *(_DWORD *)(v22 + 4 * v17) = -1073741824;
LABEL_39:
      ++v17;
      v18 += 224;
      if (v15 == v17) {
        goto LABEL_40;
      }
    }
    if ([*v20 isEqualToString:@"Screen"])
    {
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      *(_OWORD *)std::string __p = 0u;
      long long v109 = 0u;
      box3dEnlarge((float32x4_t *)(v128[0] + 224 * v14), 0.0, 0.5, 0.0, __p);
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      float32x4_t v100 = 0u;
      long long v101 = 0u;
      box3dEnlarge((float32x4_t *)(v126 + v18 - 128), 0.0, 0.5, 0.0, &v100);
      box3dIou((float32x4_t *)__p, &v100, 0, (uint64_t)v99);
      int v21 = v99[0];
    }
    else
    {
      box3dIou((float32x4_t *)(v128[0] + 224 * v14), (float32x4_t *)(v126 + v18 - 128), 0, (uint64_t)__p);
      int v21 = (int)__p[0];
    }
    uint64_t v22 = *(void *)(v116 + 24 * v14);
LABEL_38:
    *(_DWORD *)(v22 + 4 * v17) = v21;
    goto LABEL_39;
  }
LABEL_41:
  std::vector<std::vector<int>>::vector(v99, v88);
  std::vector<std::vector<int>>::vector(v98, v87);
  if (v12 != v85)
  {
    id v83 = v5;
    uint64_t v23 = 0;
    if (v88 <= 1) {
      uint64_t v24 = 1;
    }
    else {
      uint64_t v24 = v88;
    }
    uint64_t v25 = v87;
    if (v87 <= 1) {
      uint64_t v25 = 1;
    }
    uint64_t v89 = v25;
    do
    {
      if (v91 != v90)
      {
        for (uint64_t n = 0; n != v24; ++n)
        {
          if (*(float *)(*(void *)(v116 + 24 * v23) + 4 * n) > 0.0)
          {
            uint64_t v27 = v99[0] + 24 * n;
            id v29 = (_DWORD **)(v27 + 8);
            long long v28 = *(_DWORD **)(v27 + 8);
            long long v31 = (void *)(v27 + 16);
            unint64_t v30 = *(void *)(v27 + 16);
            if ((unint64_t)v28 >= v30)
            {
              long long v33 = *(_DWORD **)v27;
              uint64_t v34 = ((uint64_t)v28 - *(void *)v27) >> 2;
              unint64_t v35 = v34 + 1;
              if ((unint64_t)(v34 + 1) >> 62) {
                goto LABEL_116;
              }
              uint64_t v36 = v30 - (void)v33;
              if (v36 >> 1 > v35) {
                unint64_t v35 = v36 >> 1;
              }
              if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v37 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v37 = v35;
              }
              if (v37)
              {
                int v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v31, v37);
                long long v28 = *v29;
                long long v33 = *(_DWORD **)v27;
              }
              else
              {
                int v38 = 0;
              }
              uint64_t v39 = &v38[4 * v34];
              *(_DWORD *)uint64_t v39 = v23;
              long long v32 = v39 + 4;
              while (v28 != v33)
              {
                int v40 = *--v28;
                *((_DWORD *)v39 - 1) = v40;
                v39 -= 4;
              }
              *(void *)uint64_t v27 = v39;
              *id v29 = v32;
              void *v31 = &v38[4 * v37];
              if (v33) {
                operator delete(v33);
              }
            }
            else
            {
              _DWORD *v28 = v23;
              long long v32 = v28 + 1;
            }
            *id v29 = v32;
            uint64_t v41 = v98[0] + 24 * v23;
            uint64_t v43 = (_DWORD **)(v41 + 8);
            uint64_t v42 = *(_DWORD **)(v41 + 8);
            char v45 = (void *)(v41 + 16);
            unint64_t v44 = *(void *)(v41 + 16);
            if ((unint64_t)v42 >= v44)
            {
              long long v47 = *(_DWORD **)v41;
              uint64_t v48 = ((uint64_t)v42 - *(void *)v41) >> 2;
              unint64_t v49 = v48 + 1;
              if ((unint64_t)(v48 + 1) >> 62) {
LABEL_116:
              }
                std::vector<float>::__throw_length_error[abi:ne180100]();
              uint64_t v50 = v44 - (void)v47;
              if (v50 >> 1 > v49) {
                unint64_t v49 = v50 >> 1;
              }
              if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v51 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v51 = v49;
              }
              if (v51)
              {
                double v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v45, v51);
                uint64_t v42 = *v43;
                long long v47 = *(_DWORD **)v41;
              }
              else
              {
                double v52 = 0;
              }
              uint64_t v53 = &v52[4 * v48];
              *(_DWORD *)uint64_t v53 = n;
              long long v46 = v53 + 4;
              while (v42 != v47)
              {
                int v54 = *--v42;
                *((_DWORD *)v53 - 1) = v54;
                v53 -= 4;
              }
              *(void *)uint64_t v41 = v53;
              void *v43 = v46;
              void *v45 = &v52[4 * v51];
              if (v47) {
                operator delete(v47);
              }
            }
            else
            {
              *uint64_t v42 = n;
              long long v46 = v42 + 1;
            }
            void *v43 = v46;
          }
        }
      }
      ++v23;
    }
    while (v23 != v89);
    uint64_t v55 = 0;
    uint64_t v56 = 0;
    id v5 = v83;
    do
    {
      float32x4_t v57 = *(int **)(v98[0] + v55);
      long long v58 = *(int **)(v98[0] + v55 + 8);
      memset(v96, 0, sizeof(v96));
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v96, v116, v117, 0xAAAAAAAAAAAAAAABLL * ((v117 - v116) >> 3));
      unint64_t v59 = 126 - 2 * __clz(v58 - v57);
      int v97 = v56;
      if (v58 == v57) {
        uint64_t v60 = 0;
      }
      else {
        uint64_t v60 = v59;
      }
      std::__introsort<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_0 &,int *,false>(v57, v58, (uint64_t)v96, v60, 1);
      __p[0] = v96;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      ++v56;
      v55 += 24;
    }
    while (v89 != v56);
  }
  if (v91 != v90)
  {
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    if (v88 <= 1) {
      uint64_t v63 = 1;
    }
    else {
      uint64_t v63 = v88;
    }
    do
    {
      id v64 = *(int **)(v99[0] + v61);
      uint64_t v65 = *(int **)(v99[0] + v61 + 8);
      memset(v94, 0, sizeof(v94));
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v94, v116, v117, 0xAAAAAAAAAAAAAAABLL * ((v117 - v116) >> 3));
      unint64_t v66 = 126 - 2 * __clz(v65 - v64);
      int v95 = v62;
      if (v65 == v64) {
        uint64_t v67 = 0;
      }
      else {
        uint64_t v67 = v66;
      }
      std::__introsort<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *,false>(v64, v65, (uint64_t)v94, v67, 1);
      __p[0] = v94;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      ++v62;
      v61 += 24;
    }
    while (v63 != v62);
  }
  *(_OWORD *)std::string __p = 0u;
  long long v109 = 0u;
  LODWORD(v110) = 1065353216;
  float32x4_t v100 = 0u;
  long long v101 = 0u;
  LODWORD(v102) = 1065353216;
  int v93 = 0;
  if (v86 == v85)
  {
    long long v70 = v84;
  }
  else
  {
    uint64_t v68 = 0;
    int v69 = 0;
    long long v70 = v84;
    do
    {
      uint64_t v71 = v98[0] + 24 * v68;
      long long v72 = *(int **)v71;
      if (*(void *)v71 != *(void *)(v71 + 8))
      {
        int v92 = 0;
        int v92 = *v72;
        if (**(_DWORD **)(v99[0] + 24 * v92) == v69)
        {
          long long v73 = objc_msgSend(v84, "objectAtIndexedSubscript:");
          char v74 = [v73 identifier];
          long long v75 = [v5 objectAtIndexedSubscript:v93];
          [v75 setIdentifier:v74];

          std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)__p, &v93, &v93);
          std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)&v100, &v92, &v92);
          int v69 = v93;
        }
      }
      int v93 = ++v69;
      uint64_t v68 = v69;
    }
    while (v87 > v69);
    int v93 = 0;
    if (v86 != v85)
    {
      do
      {
        if (!std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(__p, &v93))
        {
          uint64_t v77 = v98[0] + 24 * v93;
          uint64_t v78 = *(int **)v77;
          uint64_t v79 = *(int **)(v77 + 8);
          while (v78 != v79)
          {
            int v92 = 0;
            int v92 = *v78;
            if (!std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(&v100, &v92))
            {
              id v80 = [v84 objectAtIndexedSubscript:v92];
              id v81 = [v80 identifier];
              v82 = [v5 objectAtIndexedSubscript:v93];
              [v82 setIdentifier:v81];

              std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)&v100, &v92, &v92);
              break;
            }
            ++v78;
          }
        }
        unint64_t v76 = ++v93;
      }
      while (v87 > v76);
    }
  }
  kdebug_trace();
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&v100);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)__p);
  __p[0] = v98;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  __p[0] = v99;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  __p[0] = &v116;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  std::__tree<std::__value_type<NSString * {__strong},float>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},float>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},float>>>::destroy((uint64_t)v118, v119);
  std::__tree<std::__value_type<NSString * {__strong},float>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},float>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},float>>>::destroy((uint64_t)v120, v121);
  std::__tree<std::__value_type<NSString * {__strong},float>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},float>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},float>>>::destroy((uint64_t)v122, v123);
  std::__tree<std::__value_type<NSString * {__strong},float>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},float>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},float>>>::destroy((uint64_t)v124, v125);
  __p[0] = &v126;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  __p[0] = v128;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
}

- (void)setObjectRepresentationEnabled:(BOOL)a3
{
  self->_ObjectRepresentationEnabled = a3;
  if (a3) {
    operator new();
  }
  p_ou3dor = (ou3dor::OU3DObjectRepresentation **)&self->ou3dor_;
  std::unique_ptr<ou3dor::OU3DObjectRepresentation>::reset[abi:ne180100](p_ou3dor, 0);
}

- (signed)online_model_
{
  return self->online_model_;
}

- (signed)offline_model_
{
  return self->offline_model_;
}

- (unint64_t)worldPointCloudCapacity
{
  return self->worldPointCloudCapacity;
}

- (void)setWorldPointCloudCapacity:(unint64_t)a3
{
  self->worldPointCloudCapacity = a3;
}

- (float)frustumFOV
{
  return self->frustumFOV;
}

- (void)setFrustumFOV:(float)a3
{
  self->frustumFOV = a3;
}

- (OUPointCloud)worldPointCloud
{
  return self->worldPointCloud;
}

- (double)minDetectionInterval
{
  return self->minDetectionInterval;
}

- (void)setMinDetectionInterval:(double)a3
{
  self->minDetectionInterval = a3;
}

- (double)maxDetectionInterval
{
  return self->maxDetectionInterval;
}

- (void)setMaxDetectionInterval:(double)a3
{
  self->maxDetectionInterval = a3;
}

- (float)translationalSensitivity
{
  return self->translationalSensitivity;
}

- (void)setTranslationalSensitivity:(float)a3
{
  self->translationalSensitivity = a3;
}

- (float)rotationalSensitivity
{
  return self->rotationalSensitivity;
}

- (void)setRotationalSensitivity:(float)a3
{
  self->rotationalSensitivity = a3;
}

- (float)depthConfidenceThreshold
{
  return self->depthConfidenceThreshold;
}

- (void)setDepthConfidenceThreshold:(float)a3
{
  self->depthConfidenceThreshold = a3;
}

- (NSArray)allObjects
{
  return self->allObjects;
}

- (OUPointCloud)frustumPointCloud
{
  return self->_frustumPointCloud;
}

- (BOOL)RgbRefinementEnabled
{
  return self->_RgbRefinementEnabled;
}

- (BOOL)ObjectRepresentationEnabled
{
  return self->_ObjectRepresentationEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frustumPointCloud, 0);
  objc_storeStrong((id *)&self->allObjects, 0);
  uint64_t value = self->l_shape_merger_.__ptr_.__value_;
  self->l_shape_merger_.__ptr_.__value_ = 0;
  if (value) {
    MEMORY[0x237E2C510](value, 0xC400A2AC0F1);
  }
  objc_storeStrong((id *)&self->debug_dumper_, 0);
  objc_storeStrong((id *)&self->rgb_refine_supported_types_, 0);
  objc_storeStrong((id *)&self->pre_rgb_size_refined_, 0);
  objc_storeStrong((id *)&self->pre_size_refined_, 0);
  begiuint64_t n = self->size_refined_box_ids_.__begin_;
  if (begin)
  {
    self->size_refined_box_ids_.__end_ = begin;
    operator delete(begin);
  }
  id v5 = self->hist_kept_box_ids_.__begin_;
  if (v5)
  {
    self->hist_kept_box_ids_.__end_ = v5;
    operator delete(v5);
  }
  p_begiuint64_t n = &self->hist_nms_iou_mat_.__begin_;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begiuint64_t n = &self->hist_ori_iou_mat_.__begin_;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begiuint64_t n = (void **)&self->merged_box3ds_.__begin_;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begiuint64_t n = (void **)&self->acc_box3ds_.__begin_;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begiuint64_t n = (void **)&self->cur_box3ds_.__begin_;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  objc_storeStrong((id *)&self->objectAsset_, 0);
  objc_storeStrong((id *)&self->object_completeness_, 0);
  objc_storeStrong((id *)&self->merger, 0);
  std::unique_ptr<ou3dor::OU3DObjectRepresentation>::reset[abi:ne180100]((ou3dor::OU3DObjectRepresentation **)&self->ou3dor_, 0);
  p_begiuint64_t n = (void **)&self->offline_merger_.fused_cabinets_.__begin_;
  std::vector<OU3DKitchenObject>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begiuint64_t n = (void **)&self->offline_merger_.other_objects_.__begin_;
  std::vector<OU3DKitchenObject>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begiuint64_t n = (void **)&self->offline_merger_.new_cabinets_.__begin_;
  std::vector<OU3DKitchenObject>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begiuint64_t n = (void **)&self->offline_merger_.old_cabinets_.__begin_;
  std::vector<OU3DKitchenObject>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  id v6 = self->offline_detector_.__ptr_.__value_;
  self->offline_detector_.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(OU3DODInterface *))(*(void *)v6 + 8))(v6);
  }
  int v7 = self->online_detector_.__ptr_.__value_;
  self->online_detector_.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(OU3DODInterface *))(*(void *)v7 + 8))(v7);
  }
  std::unique_ptr<OU3DObjectRGBSizeRefiner>::reset[abi:ne180100](&self->object_rgb_size_refiner_.__ptr_.__value_, 0);
  uint64_t v8 = *(void **)&self->_anon_1c0[72];
  if (v8)
  {
    *(void *)&self->_anon_1c0[80] = v8;
    operator delete(v8);
  }
  uint64_t v9 = *(void **)&self->_anon_1c0[48];
  if (v9)
  {
    *(void *)&self->_anon_1c0[56] = v9;
    operator delete(v9);
  }
  uint64_t v10 = *(void **)&self->_anon_1c0[24];
  if (v10)
  {
    *(void *)&self->_anon_1c0[32] = v10;
    operator delete(v10);
  }
  unint64_t v11 = *(void **)self->_anon_1c0;
  if (v11)
  {
    *(void *)&self->_anon_1c0[8] = v11;
    operator delete(v11);
  }
  objc_storeStrong((id *)&self->arframe_, 0);
  objc_storeStrong((id *)&self->camera_, 0);
  objc_storeStrong((id *)&self->keyframesPointCloud_, 0);
  objc_storeStrong((id *)&self->arframePointCloud_, 0);
  objc_storeStrong((id *)&self->worldPointCloud, 0);
  std::__tree<std::__value_type<NSString * {__strong},float>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},float>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},float>>>::destroy((uint64_t)&self->obj_type_to_index, (void *)self->obj_type_to_index.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 3) = (char *)self + 32;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((void *)self + 85) = 0;
  *((void *)self + 108) = 0;
  *((void *)self + 110) = 0;
  *((void *)self + 109) = 0;
  *((void *)self + 117) = 0;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 32) = 0u;
  *((_OWORD *)self + 33) = 0u;
  *((_OWORD *)self + 30) = 0u;
  *((_OWORD *)self + 31) = 0u;
  *((_OWORD *)self + 28) = 0u;
  *((_OWORD *)self + 29) = 0u;
  *((_OWORD *)self + 26) = 0u;
  *((_OWORD *)self + 27) = 0u;
  *((_OWORD *)self + 24) = 0u;
  *((_OWORD *)self + 25) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((_OWORD *)self + 23) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((void *)self + 83) = 0;
  *(_OWORD *)((char *)self + 632) = 0u;
  *(_OWORD *)((char *)self + 648) = 0u;
  *(_OWORD *)((char *)self + 600) = 0u;
  *(_OWORD *)((char *)self + 616) = 0u;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  *(_OWORD *)((char *)self + 824) = 0u;
  *(_OWORD *)((char *)self + 840) = 0u;
  *(_OWORD *)((char *)self + 792) = 0u;
  *(_OWORD *)((char *)self + 808) = 0u;
  *(_OWORD *)((char *)self + 760) = 0u;
  *(_OWORD *)((char *)self + 776) = 0u;
  *(_OWORD *)((char *)self + 728) = 0u;
  *(_OWORD *)((char *)self + 744) = 0u;
  *(_OWORD *)((char *)self + 712) = 0u;
  return self;
}

- (vector<unsigned)runwithinClassNMS:(OU3DObjectDetector *)self ids:(SEL)a3 ori_iou:(const void *)a4 nms_iou:(void *)a5
{
  memset(v8, 0, sizeof(v8));
  withinClassNMS(a4, (std::vector<int> *)a5, a6, (uint64_t *)a7, v8, &retstr->var0, 0.2);
  uint64_t v9 = (void **)v8;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v9);
  return result;
}

- (void)runAssignParentID:(id)a3
{
}

- (int)assignIdentifiersForNewObjects:(uint64_t)a3 withOldObjects:(uint64_t)a4
{
  unint64_t v11 = result;
  while (2)
  {
    long long v110 = a2 - 1;
    uint64_t v12 = v11;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          unint64_t v11 = v12;
          uint64_t v13 = (char *)a2 - (char *)v12;
          unint64_t v14 = a2 - v12;
          if (v6 || !v5)
          {
            switch(v14)
            {
              case 0uLL:
              case 1uLL:
                return result;
              case 2uLL:
                int v51 = *(a2 - 1);
                int v52 = *v12;
                if (*(float *)(*(void *)(*(void *)a3 + 24 * v51) + 4 * *(int *)(a3 + 24)) > *(float *)(*(void *)(*(void *)a3 + 24 * *v12) + 4 * *(int *)(a3 + 24)))
                {
                  *uint64_t v12 = v51;
                  *(a2 - 1) = v52;
                }
                break;
              case 3uLL:
                result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(OU3DObjectDetector *)v12 assignIdentifiersForNewObjects:v110 withOldObjects:(uint64_t *)a3];
                break;
              case 4uLL:
                result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *>(v12, v12 + 1, v12 + 2, v110, a3);
                break;
              case 5uLL:
                uint64_t v53 = v12 + 2;
                int v54 = v12 + 3;
                result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *>(v12, v12 + 1, v12 + 2, v12 + 3, a3);
                int v55 = *(a2 - 1);
                int v56 = v12[3];
                uint64_t v57 = *(void *)a3;
                if (*(float *)(*(void *)(*(void *)a3 + 24 * v55) + 4 * *(int *)(a3 + 24)) > *(float *)(*(void *)(*(void *)a3 + 24 * v56) + 4 * *(int *)(a3 + 24)))
                {
                  *int v54 = v55;
                  *(a2 - 1) = v56;
                  int v58 = *v54;
                  int v59 = *v53;
                  uint64_t v60 = *(void *)(v57 + 24 * *v54);
                  if (*(float *)(v60 + 4 * *(int *)(a3 + 24)) > *(float *)(*(void *)(v57 + 24 * *v53)
                                                                            + 4 * *(int *)(a3 + 24)))
                  {
                    *uint64_t v53 = v58;
                    *int v54 = v59;
                    int v61 = v12[1];
                    if (*(float *)(v60 + 4 * *(int *)(a3 + 24)) > *(float *)(*(void *)(v57 + 24 * v61)
                                                                              + 4 * *(int *)(a3 + 24)))
                    {
                      v12[1] = v58;
                      _OWORD v12[2] = v61;
                      int v62 = *v12;
                      if (*(float *)(v60 + 4 * *(int *)(a3 + 24)) > *(float *)(*(void *)(v57 + 24 * *v12)
                                                                                + 4 * *(int *)(a3 + 24)))
                      {
                        *uint64_t v12 = v58;
                        v12[1] = v62;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v13 <= 95)
          {
            if (a5)
            {
              if (v12 != a2)
              {
                uint64_t v63 = v12 + 1;
                if (v12 + 1 != a2)
                {
                  uint64_t v64 = 0;
                  uint64_t v65 = *(void *)a3;
                  unint64_t v66 = v12;
                  do
                  {
                    int v68 = *v66;
                    int v67 = v66[1];
                    unint64_t v66 = v63;
                    uint64_t v69 = *(void *)(v65 + 24 * v67);
                    if (*(float *)(v69 + 4 * *(int *)(a3 + 24)) > *(float *)(*(void *)(v65 + 24 * v68)
                                                                              + 4 * *(int *)(a3 + 24)))
                    {
                      uint64_t v70 = v64;
                      while (1)
                      {
                        *(int *)((char *)v12 + v70 + 4) = v68;
                        if (!v70) {
                          break;
                        }
                        int v68 = *(int *)((char *)v12 + v70 - 4);
                        v70 -= 4;
                        if (*(float *)(v69 + 4 * *(int *)(a3 + 24)) <= *(float *)(*(void *)(v65 + 24 * v68)
                                                                                   + 4 * *(int *)(a3 + 24)))
                        {
                          uint64_t v71 = (int *)((char *)v12 + v70 + 4);
                          goto LABEL_80;
                        }
                      }
                      uint64_t v71 = v12;
LABEL_80:
                      int *v71 = v67;
                    }
                    uint64_t v63 = v66 + 1;
                    v64 += 4;
                  }
                  while (v66 + 1 != a2);
                }
              }
            }
            else if (v12 != a2)
            {
              long long v103 = v12 + 1;
              if (v12 + 1 != a2)
              {
                uint64_t v104 = *(void *)a3;
                do
                {
                  int v106 = *v11;
                  int v105 = v11[1];
                  unint64_t v11 = v103;
                  int v107 = v106;
                  uint64_t v108 = *(void *)(v104 + 24 * v105);
                  if (*(float *)(v108 + 4 * *(int *)(a3 + 24)) > *(float *)(*(void *)(v104 + 24 * v107)
                                                                             + 4 * *(int *)(a3 + 24)))
                  {
                    long long v109 = v11;
                    do
                    {
                      *long long v109 = v107;
                      int v107 = *(v109 - 2);
                      --v109;
                    }
                    while (*(float *)(v108 + 4 * *(int *)(a3 + 24)) > *(float *)(*(void *)(v104 + 24 * v107)
                                                                                  + 4 * *(int *)(a3 + 24)));
                    *long long v109 = v105;
                  }
                  long long v103 = v11 + 1;
                }
                while (v11 + 1 != a2);
              }
            }
            return result;
          }
          if (!a4)
          {
            if (v12 != a2)
            {
              int64_t v72 = (v14 - 2) >> 1;
              uint64_t v73 = *(void *)a3;
              int64_t v74 = v72;
              do
              {
                int64_t v75 = v74;
                if (v72 >= v74)
                {
                  uint64_t v76 = (2 * v74) | 1;
                  uint64_t v77 = &v12[v76];
                  if (2 * v75 + 2 < (uint64_t)v14)
                  {
                    result = (int *)*(int *)(a3 + 24);
                    if (*(float *)(*(void *)(v73 + 24 * *v77) + 4 * (void)result) > *(float *)(*(void *)(v73 + 24 * v77[1]) + 4 * (void)result))
                    {
                      ++v77;
                      uint64_t v76 = 2 * v75 + 2;
                    }
                  }
                  else
                  {
                    result = (int *)*(int *)(a3 + 24);
                  }
                  uint64_t v78 = &v12[v75];
                  int v79 = *v77;
                  int v80 = *v78;
                  uint64_t v81 = *(void *)(v73 + 24 * *v78);
                  if (*(float *)(*(void *)(v73 + 24 * *v77) + 4 * (void)result) <= *(float *)(v81 + 4 * (void)result))
                  {
                    do
                    {
                      result = v77;
                      int *v78 = v79;
                      if (v72 < v76) {
                        break;
                      }
                      uint64_t v82 = 2 * v76;
                      uint64_t v76 = (2 * v76) | 1;
                      uint64_t v77 = &v12[v76];
                      uint64_t v83 = v82 + 2;
                      uint64_t v84 = *(int *)(a3 + 24);
                      if (v83 < (uint64_t)v14
                        && *(float *)(*(void *)(v73 + 24 * *v77) + 4 * v84) > *(float *)(*(void *)(v73 + 24 * v77[1])
                                                                                           + 4 * v84))
                      {
                        ++v77;
                        uint64_t v76 = v83;
                      }
                      int v79 = *v77;
                      float v85 = *(float *)(*(void *)(v73 + 24 * *v77) + 4 * v84);
                      float v86 = *(float *)(v81 + 4 * v84);
                      uint64_t v78 = result;
                    }
                    while (v85 <= v86);
                    vector<unsigned long, std::allocator<unsigned long>> *result = v80;
                  }
                }
                int64_t v74 = v75 - 1;
              }
              while (v75);
              uint64_t v87 = (unint64_t)v13 >> 2;
              do
              {
                uint64_t v88 = 0;
                int v89 = *v12;
                uint64_t v90 = *(void *)a3;
                uint64_t v91 = v12;
                do
                {
                  int v92 = v91;
                  v91 += v88 + 1;
                  uint64_t v93 = 2 * v88;
                  uint64_t v88 = (2 * v88) | 1;
                  uint64_t v94 = v93 + 2;
                  if (v94 < v87)
                  {
                    result = *(int **)(v90 + 24 * v91[1]);
                    if (*(float *)(*(void *)(v90 + 24 * *v91) + 4 * *(int *)(a3 + 24)) > *(float *)&result[*(int *)(a3 + 24)])
                    {
                      ++v91;
                      uint64_t v88 = v94;
                    }
                  }
                  *int v92 = *v91;
                }
                while (v88 <= (uint64_t)((unint64_t)(v87 - 2) >> 1));
                if (v91 == --a2)
                {
                  *uint64_t v91 = v89;
                }
                else
                {
                  *uint64_t v91 = *a2;
                  *a2 = v89;
                  uint64_t v95 = (char *)v91 - (char *)v12 + 4;
                  if (v95 >= 5)
                  {
                    unint64_t v96 = (((unint64_t)v95 >> 2) - 2) >> 1;
                    int v97 = &v12[v96];
                    int v98 = *v97;
                    int v99 = *v91;
                    uint64_t v100 = *(void *)(v90 + 24 * *v91);
                    if (*(float *)(*(void *)(v90 + 24 * *v97) + 4 * *(int *)(a3 + 24)) > *(float *)(v100 + 4 * *(int *)(a3 + 24)))
                    {
                      do
                      {
                        long long v101 = v97;
                        *uint64_t v91 = v98;
                        if (!v96) {
                          break;
                        }
                        unint64_t v96 = (v96 - 1) >> 1;
                        int v97 = &v12[v96];
                        int v98 = *v97;
                        result = (int *)*(int *)(a3 + 24);
                        uint64_t v91 = v101;
                      }
                      while (*(float *)(*(void *)(v90 + 24 * *v97) + 4 * (void)result) > *(float *)(v100 + 4 * (void)result));
                      *long long v101 = v99;
                    }
                  }
                }
              }
              while (v87-- > 2);
            }
            return result;
          }
          unint64_t v15 = v14 >> 1;
          uint64_t v16 = &v12[v14 >> 1];
          if ((unint64_t)v13 >= 0x201)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(OU3DObjectDetector *)v11 assignIdentifiersForNewObjects:v110 withOldObjects:(uint64_t *)a3];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(OU3DObjectDetector *)v11 + 1 assignIdentifiersForNewObjects:a2 - 2 withOldObjects:(uint64_t *)a3];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(OU3DObjectDetector *)v11 + 2 assignIdentifiersForNewObjects:a2 - 3 withOldObjects:(uint64_t *)a3];
            result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(OU3DObjectDetector *)v16 - 1 assignIdentifiersForNewObjects:&v11[v15 + 1] withOldObjects:(uint64_t *)a3];
            int v17 = *v11;
            int *v11 = *v16;
            *uint64_t v16 = v17;
          }
          else
          {
            result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(OU3DObjectDetector *)&v11[v14 >> 1] assignIdentifiersForNewObjects:v110 withOldObjects:(uint64_t *)a3];
          }
          --a4;
          int v18 = *v11;
          int v19 = *v11;
          uint64_t v20 = *(void *)a3;
          uint64_t v21 = *(int *)(a3 + 24);
          if (a5) {
            break;
          }
          uint64_t v22 = *(void *)(v20 + 24 * v19);
          float v23 = *(float *)(v22 + 4 * v21);
          if (*(float *)(*(void *)(v20 + 24 * *(v11 - 1)) + 4 * v21) > v23) {
            goto LABEL_13;
          }
          if (v23 <= *(float *)(*(void *)(v20 + 24 * *v110) + 4 * v21))
          {
            uint64_t v41 = v11 + 1;
            do
            {
              uint64_t v12 = v41;
              if (v41 >= a2) {
                break;
              }
              ++v41;
            }
            while (v23 <= *(float *)(*(void *)(v20 + 24 * *v12) + 4 * v21));
          }
          else
          {
            uint64_t v12 = v11;
            do
            {
              int v40 = v12[1];
              ++v12;
            }
            while (v23 <= *(float *)(*(void *)(v20 + 24 * v40) + 4 * v21));
          }
          uint64_t v42 = a2;
          if (v12 < a2)
          {
            uint64_t v42 = a2;
            do
              int v43 = *--v42;
            while (v23 > *(float *)(*(void *)(v20 + 24 * v43) + 4 * v21));
          }
          if (v12 < v42)
          {
            int v44 = *v12;
            int v45 = *v42;
            do
            {
              *uint64_t v12 = v45;
              *uint64_t v42 = v44;
              uint64_t v46 = *(int *)(a3 + 24);
              float v47 = *(float *)(v22 + 4 * v46);
              do
              {
                int v48 = v12[1];
                ++v12;
                int v44 = v48;
              }
              while (v47 <= *(float *)(*(void *)(v20 + 24 * v48) + 4 * v46));
              do
              {
                int v49 = *--v42;
                int v45 = v49;
              }
              while (v47 > *(float *)(*(void *)(v20 + 24 * v49) + 4 * v46));
            }
            while (v12 < v42);
          }
          uint64_t v50 = v12 - 1;
          BOOL v5 = v12 - 1 >= v11;
          BOOL v6 = v12 - 1 == v11;
          if (v12 - 1 != v11) {
            int *v11 = *v50;
          }
          a5 = 0;
          int *v50 = v18;
        }
        uint64_t v22 = *(void *)(v20 + 24 * v19);
        float v23 = *(float *)(v22 + 4 * v21);
LABEL_13:
        uint64_t v24 = 0;
        do
          int v25 = v11[++v24];
        while (*(float *)(*(void *)(v20 + 24 * v25) + 4 * v21) > v23);
        double v26 = &v11[v24];
        uint64_t v27 = a2;
        if (v24 == 1)
        {
          uint64_t v27 = a2;
          do
          {
            if (v26 >= v27) {
              break;
            }
            int v29 = *--v27;
          }
          while (*(float *)(*(void *)(v20 + 24 * v29) + 4 * v21) <= v23);
        }
        else
        {
          do
            int v28 = *--v27;
          while (*(float *)(*(void *)(v20 + 24 * v28) + 4 * v21) <= v23);
        }
        if (v26 >= v27)
        {
          int v38 = v26 - 1;
        }
        else
        {
          int v30 = *v27;
          int v31 = v25;
          long long v32 = v26;
          long long v33 = v27;
          do
          {
            *long long v32 = v30;
            *long long v33 = v31;
            uint64_t v34 = *(int *)(a3 + 24);
            float v35 = *(float *)(v22 + 4 * v34);
            do
            {
              int v36 = v32[1];
              ++v32;
              int v31 = v36;
            }
            while (*(float *)(*(void *)(v20 + 24 * v36) + 4 * v34) > v35);
            do
            {
              int v37 = *--v33;
              int v30 = v37;
            }
            while (*(float *)(*(void *)(v20 + 24 * v37) + 4 * v34) <= v35);
          }
          while (v32 < v33);
          int v38 = v32 - 1;
        }
        if (v38 != v11) {
          int *v11 = *v38;
        }
        int *v38 = v18;
        if (v26 >= v27) {
          break;
        }
LABEL_34:
        result = (int *)std::__introsort<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *,false>(v11, v38, a3, a4, a5 & 1);
        a5 = 0;
        uint64_t v12 = v38 + 1;
      }
      BOOL v39 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *>(v11, v38, a3);
      uint64_t v12 = v38 + 1;
      result = (int *)std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[OU3DObjectDetector assignIdentifiersForNewObjects:withOldObjects:]::$_1 &,int *>(v38 + 1, a2, a3);
      if (result) {
        break;
      }
      if (!v39) {
        goto LABEL_34;
      }
    }
    a2 = v38;
    if (!v39) {
      continue;
    }
    return result;
  }
}

- (void)generateOfflineObjects:(os_log_t)log onlineObjects:.cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)OUBox3d buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[3DOD] Return online result (might be nil) due to insufficient pc: %zu", buf, 0xCu);
}

- (void)combineBoxTypeAndEmbeddingByUUID:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *OUBox3d buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[3DOD] WARNING: there shouldn't be duplicated object box type in the reference array.", buf, 2u);
}

- (void)run
{
}

- (void)MergeLShapeObjects:(os_log_t)log isLastFrame:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[3DOD] L Shape start", v1, 2u);
}

- (void)assignParentId:(os_log_t)log isOffline:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "In offline, we need to clear online parentid info.", v1, 2u);
}

@end