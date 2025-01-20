@interface RSGenerationSession
- (RSGenerationSession)init;
- (RSGenerationSession)initWithConfiguration:(id)a3;
- (id)generatePointListsWithFloorplan:(id)a3;
- (id)getDebugInfo;
- (id)processMultiLevelWithMultiFloorPlan:(id)a3 withKeyframes:(id)a4;
- (id)processWithKeyframes:(id)a3 initialAsset:(id)a4;
- (id)processWithKeyframes:(id)a3 initialAsset:(id)a4 error:(id *)a5;
- (id)processWithMultiFloorPlan:(id)a3;
- (id)processWithMultiFloorPlan:(id)a3 error:(id *)a4;
- (id)standardizeFloorPlan:(id)a3;
- (void)dealloc;
- (void)generatePointListsWithFloorplan:(id)a3 completionHandler:(id)a4;
- (void)processMultiLevelWithMultiFloorPlan:(id)a3 withKeyframes:(id)a4 completionHandler:(id)a5;
- (void)processMultiLevelWithMultiFloorPlan:(id)a3 withKeyframes:(id)a4 completionHandlerWithError:(id)a5;
- (void)processWithKeyframes:(id)a3 initialAsset:(id)a4 completionHandler:(id)a5;
- (void)processWithKeyframes:(id)a3 initialAsset:(id)a4 completionHandlerWithError:(id)a5;
- (void)processWithMultiFloorPlan:(id)a3 completionHandler:(id)a4;
- (void)processWithMultiFloorPlan:(id)a3 completionHandlerWithError:(id)a4;
- (void)processWithMultiFloorPlanDict:(id)a3 completionHandler:(id)a4;
- (void)processWithMultiFloorPlanDict:(id)a3 completionHandlerWithError:(id)a4;
- (void)setupOfflineDumpWithLogDir:(id)a3;
- (void)updateLcnnParams:(id)a3;
@end

@implementation RSGenerationSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineInfoDumper, 0);
  objc_storeStrong((id *)&self->_logDir, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_fpGenerator, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_generationSemaphore, 0);
}

- (void)generatePointListsWithFloorplan:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_generationSemaphore, 0xFFFFFFFFFFFFFFFELL))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_25B4D85F0;
    v9[3] = &unk_265495210;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (id)generatePointListsWithFloorplan:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(RSPointLists);
  id v7 = objc_msgSend_walls(v3, v5, v6);
  objc_msgSend_generateRSPointListsWithWalls_(v4, v8, (uint64_t)v7);

  return v4;
}

- (void)processWithMultiFloorPlanDict:(id)a3 completionHandlerWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_generationSemaphore, 0xFFFFFFFFFFFFFFFELL))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_25B4D88A4;
    v9[3] = &unk_265495210;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)processWithMultiFloorPlanDict:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_generationSemaphore, 0xFFFFFFFFFFFFFFFELL))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_25B4D8B0C;
    v9[3] = &unk_265495210;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)processWithMultiFloorPlan:(id)a3 completionHandlerWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_generationSemaphore, 0xFFFFFFFFFFFFFFFELL))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_25B4D8D64;
    v9[3] = &unk_265495210;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)processWithMultiFloorPlan:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_generationSemaphore, 0xFFFFFFFFFFFFFFFELL))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_25B4D8F18;
    v9[3] = &unk_265495210;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (id)processWithMultiFloorPlan:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(RSMultiRoom);
  id v7 = sub_25B5A5E54((float *)v6, v5, a4);

  return v7;
}

- (id)processWithMultiFloorPlan:(id)a3
{
  uint64_t v5 = 0;
  id v3 = objc_msgSend_processWithMultiFloorPlan_error_(self, a2, (uint64_t)a3, &v5);

  return v3;
}

- (id)processMultiLevelWithMultiFloorPlan:(id)a3 withKeyframes:(id)a4
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(RSMultiRoom);
  id v6 = v4;
  if (v5)
  {
    uint64_t v9 = 0;
    id v7 = sub_25B5A5E54((float *)v5, v6, &v9);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)processMultiLevelWithMultiFloorPlan:(id)a3 withKeyframes:(id)a4 completionHandlerWithError:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_generationSemaphore, 0xFFFFFFFFFFFFFFFELL))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_25B4D9234;
    v10[3] = &unk_265495210;
    objc_copyWeak(&v13, &location);
    id v11 = v7;
    id v12 = v8;
    dispatch_async(queue, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)processMultiLevelWithMultiFloorPlan:(id)a3 withKeyframes:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_generationSemaphore, 0xFFFFFFFFFFFFFFFELL))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_25B4D9470;
    block[3] = &unk_2654951C0;
    objc_copyWeak(&v16, &location);
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(queue, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (id)getDebugInfo
{
  id v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  if (self->_fpGenerator)
  {
    id v7 = objc_msgSend_dictionaryRepresentation(self->_configuration, v4, v5);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v8, (uint64_t)v7, @"offlineConfig");

    id v10 = sub_25B4BDA48(&self->_fpGenerator->super.super.isa, v9);
    objc_msgSend_addEntriesFromDictionary_(v6, v11, (uint64_t)v10);
  }

  return v6;
}

- (void)updateLcnnParams:(id)a3
{
  id v4 = a3;
  fpGenerator = self->_fpGenerator;
  if (fpGenerator)
  {
    id v73 = v4;
    id v6 = v4;
    wallOpeningDetector = fpGenerator->_wallOpeningDetector;
    id v8 = v6;
    if (wallOpeningDetector)
    {
      sub_25B44B288((uint64_t)v84);
      sub_25B4FF7A0((uint64_t)v84, 0);
      id v10 = objc_msgSend_objectForKeyedSubscript_(v8, v9, @"decision_boundary_cls_delta_wall");

      if (v10)
      {
        id v12 = objc_msgSend_objectForKeyedSubscript_(v8, v11, @"decision_boundary_cls_delta_wall");
        objc_msgSend_floatValue(v12, v13, v14);
        int v89 = v15;
      }
      id v16 = objc_msgSend_objectForKeyedSubscript_(v8, v11, @"decision_boundary_tms_delta_wall");

      if (v16)
      {
        v18 = objc_msgSend_objectForKeyedSubscript_(v8, v17, @"decision_boundary_tms_delta_wall");
        objc_msgSend_floatValue(v18, v19, v20);
        int v90 = v21;
      }
      sub_25B501FF8((uint64_t)v84, 0);
      v23 = objc_msgSend_objectForKeyedSubscript_(v8, v22, @"nms_score_diff_thres_wall");

      if (v23)
      {
        v25 = objc_msgSend_objectForKeyedSubscript_(v8, v24, @"nms_score_diff_thres_wall");
        objc_msgSend_floatValue(v25, v26, v27);
        int v87 = v28;
      }
      v29 = objc_msgSend_objectForKeyedSubscript_(v8, v24, @"opening_score_density_thres_wall");

      if (v29)
      {
        v31 = objc_msgSend_objectForKeyedSubscript_(v8, v30, @"opening_score_density_thres_wall");
        objc_msgSend_floatValue(v31, v32, v33);
        int v92 = v34;
      }
      v35 = objc_msgSend_objectForKeyedSubscript_(v8, v30, @"tm_score_weight_wall");

      if (v35)
      {
        v37 = objc_msgSend_objectForKeyedSubscript_(v8, v36, @"tm_score_weight_wall");
        objc_msgSend_floatValue(v37, v38, v39);
        int v85 = v40;
      }
      sub_25B44DC28((uint64_t)&wallOpeningDetector->_lcnnDetector._wall_postprocess, v84);
      sub_25B44B288((uint64_t)v74);
      sub_25B50066C((uint64_t)v74, 0);
      v42 = objc_msgSend_objectForKeyedSubscript_(v8, v41, @"decision_boundary_cls_delta_opening");

      if (v42)
      {
        v44 = objc_msgSend_objectForKeyedSubscript_(v8, v43, @"decision_boundary_cls_delta_opening");
        objc_msgSend_floatValue(v44, v45, v46);
        int v79 = v47;
      }
      v48 = objc_msgSend_objectForKeyedSubscript_(v8, v43, @"decision_boundary_tms_delta_opening");

      if (v48)
      {
        v50 = objc_msgSend_objectForKeyedSubscript_(v8, v49, @"decision_boundary_tms_delta_opening");
        objc_msgSend_floatValue(v50, v51, v52);
        int v80 = v53;
      }
      sub_25B501620((uint64_t)v74, 0);
      v55 = objc_msgSend_objectForKeyedSubscript_(v8, v54, @"nms_score_diff_thres_opening");

      if (v55)
      {
        v57 = objc_msgSend_objectForKeyedSubscript_(v8, v56, @"nms_score_diff_thres_opening");
        objc_msgSend_floatValue(v57, v58, v59);
        int v77 = v60;
      }
      v61 = objc_msgSend_objectForKeyedSubscript_(v8, v56, @"opening_score_density_thres_opening");

      if (v61)
      {
        v63 = objc_msgSend_objectForKeyedSubscript_(v8, v62, @"opening_score_density_thres_opening");
        objc_msgSend_floatValue(v63, v64, v65);
        int v82 = v66;
      }
      v67 = objc_msgSend_objectForKeyedSubscript_(v8, v62, @"tm_score_weight_opening");

      if (v67)
      {
        v69 = objc_msgSend_objectForKeyedSubscript_(v8, v68, @"tm_score_weight_opening");
        objc_msgSend_floatValue(v69, v70, v71);
        int v75 = v72;
      }
      sub_25B44DC28((uint64_t)&wallOpeningDetector[1]._lcnnDetector._unet_fpn_backbone._lcnn_fc2._fc2_0_weight._buffer_head, v74);
      sub_25B44B10C(v83);
      sub_25B44B168(v81);
      sub_25B44B168(v78);
      sub_25B44B10C(v76);
      sub_25B44B10C(v93);
      sub_25B44B168(v91);
      sub_25B44B168(v88);
      sub_25B44B10C(v86);
    }

    id v4 = v73;
  }
}

- (void)setupOfflineDumpWithLogDir:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (self->_fpGenerator)
    {
      id v7 = v5;
      objc_storeStrong((id *)&self->_logDir, a3);
      id v5 = v7;
      fpGenerator = self->_fpGenerator;
      if (fpGenerator) {
        fpGenerator->_enableOfflineDump = 1;
      }
    }
  }
}

- (id)standardizeFloorPlan:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = sub_25B4D4150((uint64_t)v24);
  id v8 = objc_msgSend_copy(v4, v6, v7, v5);
  id v9 = sub_25B400D94((id *)&self->_fpGenerator->_geometryEstimator->super.isa);
  wallOpeningDetector = self->_fpGenerator->_wallOpeningDetector;
  if (wallOpeningDetector) {
    uint64_t p_fc2_0_bias = (uint64_t)&wallOpeningDetector[1]._lcnnDetector._unet_fpn_backbone._lcnn_fc2._fc2_0_bias;
  }
  else {
    uint64_t p_fc2_0_bias = 0;
  }
  sub_25B479810((uint64_t)v24, v8, v9, p_fc2_0_bias);

  fpGenerator = (id **)self->_fpGenerator;
  objc_msgSend_objects(v4, v13, v14);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v8;
  if (fpGenerator)
  {
    v19 = objc_msgSend_render(fpGenerator, v16, v17);
    uint64_t v20 = sub_25B400D94(fpGenerator[6]);
    sub_25B4D46DC((uint64_t)v19, v15, v18, v20);
    fpGenerator = (id **)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_updateObjects_(v18, v21, (uint64_t)fpGenerator);

  sub_25B4797CC(v26);
  v22 = __p;
  __p = 0;
  if (v22) {
    operator delete(v22);
  }
  sub_25B4D433C((uint64_t)v24);

  return v18;
}

- (void)processWithKeyframes:(id)a3 initialAsset:(id)a4 completionHandlerWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_generationSemaphore, 0xFFFFFFFFFFFFFFFELL))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_25B4D9E54;
    block[3] = &unk_2654951C0;
    objc_copyWeak(&v16, &location);
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(queue, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)processWithKeyframes:(id)a3 initialAsset:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_generationSemaphore, 0xFFFFFFFFFFFFFFFELL))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_25B4DA030;
    block[3] = &unk_2654951C0;
    objc_copyWeak(&v16, &location);
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(queue, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (qword_26A502110 != -1) {
    dispatch_once(&qword_26A502110, &unk_2708F12D8);
  }
  id v3 = (id)qword_26A502108;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = self;
    _os_log_impl(&dword_25B3F3000, v3, OS_LOG_TYPE_INFO, "\"%{public}@\": dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)RSGenerationSession;
  [(RSGenerationSession *)&v4 dealloc];
}

- (id)processWithKeyframes:(id)a3 initialAsset:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_msgSend_clear(self->_fpGenerator, v9, v10);
  sub_25B4DA478((uint64_t)self, self->_configuration);
  id v11 = sub_25B4BDAD8((uint64_t)self->_fpGenerator, v7, v8);
  offlineInfoDumper = self->_offlineInfoDumper;
  id v15 = objc_msgSend_getDebugInfo(self, v13, v14);
  logDir = self->_logDir;
  id v17 = v15;
  id v18 = logDir;
  int v21 = v18;
  if (offlineInfoDumper && v18)
  {
    char v33 = 0;
    v22 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v19, v20);
    char isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v22, v23, (uint64_t)v21, &v33);

    if (v33) {
      char v27 = isDirectory;
    }
    else {
      char v27 = 0;
    }
    if ((v27 & 1) == 0)
    {
      int v28 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v25, v26);
      objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v28, v29, (uint64_t)v21, 1, 0, 0);
    }
    save_log_queue = offlineInfoDumper->_save_log_queue;
    *(void *)&long long block = MEMORY[0x263EF8330];
    *((void *)&block + 1) = 3221225472;
    v35 = sub_25B41F574;
    v36 = &unk_265495068;
    id v37 = v17;
    v38 = v21;
    dispatch_async(save_log_queue, &block);
  }
  if (qword_26A502110 != -1) {
    dispatch_once(&qword_26A502110, &unk_2708F12D8);
  }
  v31 = (id)qword_26A502108;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    LODWORD(block) = 138543362;
    *(void *)((char *)&block + 4) = self;
    _os_log_impl(&dword_25B3F3000, v31, OS_LOG_TYPE_INFO, "\"%{public}@\": processWithKeyframes", (uint8_t *)&block, 0xCu);
  }

  return v11;
}

- (id)processWithKeyframes:(id)a3 initialAsset:(id)a4
{
  uint64_t v6 = 0;
  objc_super v4 = objc_msgSend_processWithKeyframes_initialAsset_error_(self, a2, (uint64_t)a3, a4, &v6);

  return v4;
}

- (RSGenerationSession)init
{
  id v3 = objc_alloc_init(RSGenerationConfiguration);
  double v5 = (RSGenerationSession *)objc_msgSend_initWithConfiguration_(self, v4, (uint64_t)v3);

  return v5;
}

- (RSGenerationSession)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RSGenerationSession;
  id v7 = [(RSGenerationSession *)&v22 init];
  if (!v7) {
    goto LABEL_4;
  }
  uint64_t v8 = objc_msgSend_copy(v4, v5, v6);
  configuration = v7->_configuration;
  v7->_configuration = (RSGenerationConfiguration *)v8;

  uint64_t v10 = objc_alloc_init(RSOfflineFloorPlanGenerator);
  fpGenerator = v7->_fpGenerator;
  v7->_fpGenerator = v10;

  if (v7->_fpGenerator)
  {
    sub_25B4DA478((uint64_t)v7, v7->_configuration);
    dispatch_semaphore_t v12 = dispatch_semaphore_create(1);
    generationSemaphore = v7->_generationSemaphore;
    v7->_generationSemaphore = (OS_dispatch_semaphore *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.RoomScanCore.offlineFloorPlanGeneration", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v14;

    id v16 = objc_alloc_init(RSOfflineInfoDumper);
    offlineInfoDumper = v7->_offlineInfoDumper;
    v7->_offlineInfoDumper = v16;

LABEL_4:
    id v18 = v7;
    goto LABEL_10;
  }
  if (qword_26A502110 != -1) {
    dispatch_once(&qword_26A502110, &unk_2708F12D8);
  }
  v19 = (id)qword_26A502108;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v21 = 0;
    _os_log_error_impl(&dword_25B3F3000, v19, OS_LOG_TYPE_ERROR, "Offline floorplan generator init failed", v21, 2u);
  }

  id v18 = 0;
LABEL_10:

  return v18;
}

@end