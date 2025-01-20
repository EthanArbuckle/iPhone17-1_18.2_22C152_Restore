@interface RSCaptureSession
- (RSCaptureSession)init;
- (RSCaptureSessionDelegate)delegate;
- (id).cxx_construct;
- (id)exportAsset;
- (id)generateFloorPlanWithKeyframes:(id)a3 objects:(id)a4;
- (id)getDebugInfo;
- (id)standardizeFloorPlan:(id)a3;
- (void)_processInfoThermalStateDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)generateMirrorPointWithFrame:(id)a3;
- (void)runWithConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUpInternalDumpWithLogDir:(id)a3 enable:(BOOL)a4;
- (void)stop;
- (void)updateWithFrame:(id)a3;
- (void)updateWithKeyframes:(id)a3;
- (void)updateWithObjects:(id)a3;
@end

@implementation RSCaptureSession

- (id).cxx_construct
{
  *((void *)self + 25) = 850045863;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((void *)self + 32) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self + 35);
  objc_storeStrong((id *)self + 34, 0);
  objc_storeStrong((id *)self + 33, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 200));
  objc_storeStrong((id *)self + 24, 0);
  objc_storeStrong((id *)self + 23, 0);
  objc_storeStrong((id *)self + 22, 0);
  objc_storeStrong((id *)self + 21, 0);
  objc_storeStrong((id *)self + 20, 0);
  objc_storeStrong((id *)self + 19, 0);
  objc_storeStrong((id *)self + 18, 0);
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 16, 0);
  objc_storeStrong((id *)self + 14, 0);
  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);

  objc_storeStrong((id *)self + 1, 0);
}

- (void)setDelegate:(id)a3
{
}

- (RSCaptureSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)self + 35);

  return (RSCaptureSessionDelegate *)WeakRetained;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (qword_26A502100 != -1) {
    dispatch_once(&qword_26A502100, &unk_2708F12B8);
  }
  v3 = (id)qword_26A5020F8;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v11 = self;
    _os_log_impl(&dword_25B3F3000, v3, OS_LOG_TYPE_INFO, "\"%{public}@\": dealloc", buf, 0xCu);
  }

  v6 = *((void *)self + 14);
  if (v6) {
    dispatch_source_cancel(v6);
  }
  v7 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v4, v5);
  objc_msgSend_removeObserver_name_object_(v7, v8, (uint64_t)self, *MEMORY[0x263F08458], 0);

  v9.receiver = self;
  v9.super_class = (Class)RSCaptureSession;
  [(RSCaptureSession *)&v9 dealloc];
}

- (id)standardizeFloorPlan:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = sub_25B4D4150((uint64_t)v16);
  v8 = objc_msgSend_copy(v4, v6, v7, v5);
  objc_super v9 = sub_25B400D94(*(id **)(*((void *)self + 2) + 72));
  uint64_t v10 = *(void *)(*((void *)self + 2) + 56);
  if (v10) {
    uint64_t v11 = v10 + 1968;
  }
  else {
    uint64_t v11 = 0;
  }
  sub_25B479810((uint64_t)v16, v8, v9, v11);

  uint64_t v12 = sub_25B428F7C(*((id ***)self + 2), *((void **)self + 13), v8);
  objc_msgSend_updateObjects_(v8, v13, (uint64_t)v12);

  sub_25B4797CC(v18);
  v14 = __p;
  __p = 0;
  if (v14) {
    operator delete(v14);
  }
  sub_25B4D433C((uint64_t)v16);

  return v8;
}

- (id)exportAsset
{
  v3 = sub_25B429050(*((void *)self + 2));
  v6 = objc_msgSend_floorPlan(v3, v4, v5);
  objc_msgSend_updateObjects_(v6, v7, *((void *)self + 13));

  return v3;
}

- (void)generateMirrorPointWithFrame:(id)a3
{
}

- (id)generateFloorPlanWithKeyframes:(id)a3 objects:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v23, v27, 16);
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v16 = (void *)*((void *)self + 4);
        v17 = objc_msgSend_identifier(v15, v10, v11, (void)v23);
        objc_msgSend_setObject_forKeyedSubscript_(v16, v18, (uint64_t)v15, v17);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v23, v27, 16);
    }
    while (v12);
  }

  objc_storeStrong((id *)self + 13, a4);
  uint64_t v19 = sub_25B420FE4(*((void **)self + 2), *((void **)self + 4), *((void **)self + 13));
  sub_25B41F278(*((void *)self + 19), v19);
  if (v7)
  {
    v20 = sub_25B428F7C(*((id ***)self + 2), *((void **)self + 13), v19);
    objc_msgSend_updateObjects_(v19, v21, (uint64_t)v20);
  }

  return v19;
}

- (void)setUpInternalDumpWithLogDir:(id)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v8 = *((void *)self + 2);
  if (v8) {
    *(unsigned char *)(v8 + 184) = v4;
  }
  uint64_t v9 = *((void *)self + 19);
  id v12 = v7;
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 24), a3);
    *(unsigned char *)(v9 + 177) = v4;
    if (v12)
    {
      if (v4)
      {
        uint64_t v11 = objc_msgSend_stringByAppendingPathComponent_(v12, v10, @"Live");
        sub_25B41D9AC(v9, v11);
      }
    }
  }
}

- (id)getDebugInfo
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  char v37 = *((unsigned char *)self + 120);
  *((unsigned char *)self + 120) = 1;
  uint64_t v4 = *((void *)self + 19);
  uint64_t v5 = objc_msgSend_dictionaryRepresentation(*((void **)self + 1), a2, v2);
  id v7 = sub_25B42106C(*((void **)self + 2), v6);
  id v8 = v5;
  id v9 = v7;
  uint64_t v11 = v9;
  if (v4)
  {
    if (*(unsigned char *)(v4 + 177))
    {
      id v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"floorPlanDebug");
      v17 = objc_msgSend_array(MEMORY[0x263EFF980], v13, v14);
      for (unint64_t i = 0; i < objc_msgSend_count(*(void **)(v4 + 40), v15, v16); ++i)
      {
        v21 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v19, v20);
        long long v23 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(v4 + 40), v22, i);
        objc_msgSend_addEntriesFromDictionary_(v21, v24, (uint64_t)v23);

        long long v26 = objc_msgSend_objectAtIndexedSubscript_(v12, v25, i);
        objc_msgSend_addEntriesFromDictionary_(v21, v27, (uint64_t)v26);

        objc_msgSend_addObject_(v17, v28, (uint64_t)v21);
      }
      v29 = *(NSObject **)(v4 + 16);
      dispatch_time_t v30 = dispatch_time(0, 30000000000);
      dispatch_group_wait(v29, v30);
      v38[0] = @"config";
      v38[1] = @"keyframeDebug";
      uint64_t v31 = *(void *)(v4 + 32);
      v39[0] = v8;
      v39[1] = v31;
      v39[2] = v17;
      v38[2] = @"floorPlanDebug";
      v38[3] = @"coachingDebug";
      long long v40 = *(_OWORD *)(v4 + 48);
      v38[4] = @"driftDebug";
      v38[5] = @"sysDebug";
      uint64_t v41 = *(void *)(v4 + 64);
      v38[6] = @"firstARFrameTime";
      v34 = objc_msgSend_numberWithDouble_(NSNumber, v32, v33, *(double *)(v4 + 72));
      v42 = v34;
      uint64_t v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)v39, v38, 7);
    }
    else
    {
      uint64_t v4 = MEMORY[0x263EFFA78];
    }
  }

  *((unsigned char *)self + 120) = v37;

  return (id)v4;
}

- (void)stop
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  *((unsigned char *)self + 120) = 1;
  if (qword_26A502100 != -1) {
    dispatch_once(&qword_26A502100, &unk_2708F12B8);
  }
  v3 = (id)qword_26A5020F8;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_25B3F3000, v3, OS_LOG_TYPE_INFO, "\"%{public}@\": listen to available memory stop", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  v15 = sub_25B4DBF98;
  uint64_t v16 = sub_25B4DBFA8;
  objc_msgSend_array(MEMORY[0x263EFF8C0], v4, v5);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = *((void *)self + 33);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25B4DBFB0;
  block[3] = &unk_2654952B0;
  objc_copyWeak(&v11, &location);
  block[4] = &buf;
  dispatch_sync(v6, block);
  id v7 = *((void *)self + 3);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_25B4DC02C;
  v8[3] = &unk_2654952B0;
  objc_copyWeak(&v9, &location);
  v8[4] = &buf;
  dispatch_async(v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

- (void)updateWithFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)self + 19);
  id v35 = v4;
  if (v5 && *(unsigned char *)(v5 + 177) && *(double *)(v5 + 72) == 0.0)
  {
    objc_msgSend_timestamp(v35, v6, v7);
    *(void *)(v5 + 72) = v8;
  }

  if (objc_msgSend_isBoundaryRefinementEnabled(*((void **)self + 1), v9, v10))
  {
    std::mutex::lock((std::mutex *)((char *)self + 200));
    objc_msgSend_removeLastObject(*((void **)self + 24), v13, v14);
    objc_msgSend_addObject_(*((void **)self + 24), v15, (uint64_t)v35);
    std::mutex::unlock((std::mutex *)((char *)self + 200));
  }
  if ((objc_msgSend_isTextCoachingEnabled(*((void **)self + 1), v11, v12, v35) & 1) != 0
    || objc_msgSend_isDriftDetectionEnabled(*((void **)self + 1), v16, v17))
  {
    id v18 = v36;
    if (!dispatch_semaphore_wait(*((dispatch_semaphore_t *)self + 17), 0xFFFFFFFFFFFFFFFELL))
    {
      v21 = objc_msgSend_date(MEMORY[0x263EFF910], v19, v20);
      objc_msgSend_timeIntervalSinceDate_(v21, v22, *((void *)self + 9));
      double v24 = v23;
      uint64_t v25 = *((void *)self + 1);
      if (v25) {
        double v26 = (double)*(unint64_t *)(v25 + 40);
      }
      else {
        double v26 = 0.0;
      }
      double v27 = 1.0 / v26;

      if (v24 >= v27)
      {
        objc_initWeak(&location, self);
        from[0] = 0;
        from[1] = from;
        from[2] = (id)0x3032000000;
        from[3] = sub_25B4DBF98;
        from[4] = sub_25B4DBFA8;
        objc_msgSend_array(MEMORY[0x263EFF8C0], v28, v29);
        id v47 = (id)objc_claimAutoreleasedReturnValue();
        dispatch_time_t v30 = *((void *)self + 33);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_25B4DC640;
        block[3] = &unk_2654952B0;
        objc_copyWeak(&v45, &location);
        block[4] = from;
        dispatch_sync(v30, block);
        uint64_t v31 = *((void *)self + 7);
        uint64_t v37 = MEMORY[0x263EF8330];
        uint64_t v38 = 3221225472;
        v39 = sub_25B4DC6BC;
        long long v40 = &unk_2654952D8;
        objc_copyWeak(&v43, &location);
        v42[0] = self;
        v42[1] = from;
        id v41 = v18;
        dispatch_async(v31, &v37);

        objc_destroyWeak(&v43);
        objc_destroyWeak(&v45);
        _Block_object_dispose(from, 8);

        objc_destroyWeak(&location);
      }
      else
      {
        dispatch_semaphore_signal(*((dispatch_semaphore_t *)self + 17));
      }
    }
  }
  uint64_t v32 = *((void *)self + 1);
  if (v32 && *(unsigned char *)(v32 + 23))
  {
    id v33 = v36;
    if ((sub_25B4DC540((uint64_t)self, v33) & 1) != 0
      && !dispatch_semaphore_wait(*((dispatch_semaphore_t *)self + 18), 0xFFFFFFFFFFFFFFFELL))
    {
      objc_initWeak(from, self);
      v34 = *((void *)self + 11);
      uint64_t v37 = MEMORY[0x263EF8330];
      uint64_t v38 = 3221225472;
      v39 = sub_25B4DC5C8;
      long long v40 = &unk_265495260;
      objc_copyWeak(v42, from);
      id v41 = v33;
      dispatch_async(v34, &v37);

      objc_destroyWeak(v42);
      objc_destroyWeak(from);
    }
  }
}

- (void)updateWithObjects:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = *((void *)self + 33);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25B4DFB70;
  block[3] = &unk_265495260;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)updateWithKeyframes:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = *((void *)self + 33);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25B4DFF4C;
  block[3] = &unk_265495260;
  objc_copyWeak(&v34, &location);
  id v6 = v4;
  id v33 = v6;
  dispatch_async(v5, block);
  if (objc_msgSend_isLiveResultEnabled(*((void **)self + 1), v7, v8))
  {
    if (dispatch_semaphore_wait(*((dispatch_semaphore_t *)self + 16), 0xFFFFFFFFFFFFFFFELL))
    {
      sub_25B41DA70(*((void *)self + 19), v6, 1);
    }
    else
    {
      id v11 = objc_msgSend_date(MEMORY[0x263EFF910], v9, v10);
      objc_msgSend_timeIntervalSinceDate_(v11, v12, *((void *)self + 6));
      double v14 = v13;
      double v17 = 1.0 / (double)(unint64_t)objc_msgSend_maxFramerate(*((void **)self + 1), v15, v16);

      if (v14 >= v17)
      {
        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x3032000000;
        v30[3] = sub_25B4DBF98;
        v30[4] = sub_25B4DBFA8;
        objc_msgSend_dictionary(NSDictionary, v18, v19);
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        v28[0] = 0;
        v28[1] = v28;
        v28[2] = 0x3032000000;
        v28[3] = sub_25B4DBF98;
        v28[4] = sub_25B4DBFA8;
        objc_msgSend_array(MEMORY[0x263EFF8C0], v20, v21);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        v22 = *((void *)self + 33);
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = sub_25B4E00C0;
        v26[3] = &unk_265495288;
        objc_copyWeak(&v27, &location);
        v26[4] = v30;
        v26[5] = v28;
        dispatch_sync(v22, v26);
        double v23 = *((void *)self + 3);
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = sub_25B4E015C;
        v24[3] = &unk_265495288;
        objc_copyWeak(&v25, &location);
        v24[4] = v30;
        v24[5] = v28;
        dispatch_async(v23, v24);
        objc_destroyWeak(&v25);
        objc_destroyWeak(&v27);
        _Block_object_dispose(v28, 8);

        _Block_object_dispose(v30, 8);
      }
      else
      {
        sub_25B41DA70(*((void *)self + 19), v6, 1);
        dispatch_semaphore_signal(*((dispatch_semaphore_t *)self + 16));
      }
    }
  }

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

- (void)runWithConfiguration:(id)a3
{
  uint64_t v185 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_copy(v4, v5, v6);
  uint64_t v8 = (void *)*((void *)self + 1);
  *((void *)self + 1) = v7;

  objc_msgSend_clear(*((void **)self + 2), v9, v10);
  id v11 = (void *)*((void *)self + 2);
  uint64_t isWindowDoorDetectionEnabled = objc_msgSend_isWindowDoorDetectionEnabled(*((void **)self + 1), v12, v13);
  objc_msgSend_setDoorWindowEnable_(v11, v15, isWindowDoorDetectionEnabled);
  uint64_t v16 = (void *)*((void *)self + 2);
  uint64_t isObjectBeautificationEnabled = objc_msgSend_isObjectBeautificationEnabled(*((void **)self + 1), v17, v18);
  objc_msgSend_setObjectBeautificationEnable_(v16, v20, isObjectBeautificationEnabled);
  uint64_t v21 = (void *)*((void *)self + 2);
  uint64_t isStandardizationEnabled = objc_msgSend_isStandardizationEnabled(*((void **)self + 1), v22, v23);
  objc_msgSend_setStandardizationEnable_(v21, v25, isStandardizationEnabled);
  uint64_t v26 = *((void *)self + 2);
  char isMarkerCoachingEnabled = objc_msgSend_isMarkerCoachingEnabled(*((void **)self + 1), v27, v28);
  if (v26) {
    *(unsigned char *)(v26 + 136) = isMarkerCoachingEnabled;
  }
  uint64_t v32 = *((void *)self + 2);
  char isDoorWindowBeautificationEnabled = objc_msgSend_isDoorWindowBeautificationEnabled(*((void **)self + 1), v30, v31);
  if (v32)
  {
    uint64_t v36 = *(void *)(v32 + 40);
    if (v36)
    {
      uint64_t v37 = *(void *)(v36 + 568);
      if (v37) {
        *(unsigned char *)(v37 + 1433) = isDoorWindowBeautificationEnabled;
      }
    }
  }
  uint64_t v38 = (unsigned char *)*((void *)self + 1);
  uint64_t v39 = *((void *)self + 2);
  if (v38)
  {
    BOOL v40 = v38[24] != 0;
    if (!v39) {
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v40 = 0;
    if (!v39) {
      goto LABEL_11;
    }
  }
  uint64_t v41 = *(void *)(v39 + 32);
  if (v41)
  {
    *(unsigned char *)(v41 + 1968) = v40;
    uint64_t v38 = (unsigned char *)*((void *)self + 1);
    uint64_t v39 = *((void *)self + 2);
  }
LABEL_11:
  char isNonUniformHeightEnabled = objc_msgSend_isNonUniformHeightEnabled(v38, v34, v35);
  if (v39)
  {
    uint64_t v45 = *(void *)(v39 + 96);
    if (v45) {
      *(unsigned char *)(v45 + 400) = isNonUniformHeightEnabled;
    }
  }
  uint64_t v46 = *((void *)self + 2);
  char isOpeningReplaceOpendoorEnabled = objc_msgSend_isOpeningReplaceOpendoorEnabled(*((void **)self + 1), v43, v44);
  if (v46) {
    *(unsigned char *)(v46 + 161) = isOpeningReplaceOpendoorEnabled;
  }
  uint64_t v50 = *((void *)self + 2);
  char isOpendoorReplaceOpeningEnabled = objc_msgSend_isOpendoorReplaceOpeningEnabled(*((void **)self + 1), v48, v49);
  if (v50) {
    *(unsigned char *)(v50 + 162) = isOpendoorReplaceOpeningEnabled;
  }
  uint64_t v54 = *((void *)self + 2);
  char isDoorReplaceOpeningEnabled = objc_msgSend_isDoorReplaceOpeningEnabled(*((void **)self + 1), v52, v53);
  if (v54) {
    *(unsigned char *)(v54 + 163) = isDoorReplaceOpeningEnabled;
  }
  uint64_t v58 = *((void *)self + 2);
  char isBayWindowRecessedAreaEnabled = objc_msgSend_isBayWindowRecessedAreaEnabled(*((void **)self + 1), v56, v57);
  if (v58) {
    *(unsigned char *)(v58 + 164) = isBayWindowRecessedAreaEnabled;
  }
  uint64_t v62 = *((void *)self + 1);
  v61 = (void *)*((void *)self + 2);
  if (v62) {
    objc_msgSend_setUniformHeightPolygonEnable_(v61, v60, *(unsigned __int8 *)(v62 + 25) != 0);
  }
  else {
    objc_msgSend_setUniformHeightPolygonEnable_(v61, v60, 0);
  }
  uint64_t v65 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v63, v64);
  v66 = (void *)*((void *)self + 4);
  *((void *)self + 4) = v65;

  uint64_t v69 = objc_msgSend_array(MEMORY[0x263EFF8C0], v67, v68);
  v70 = (void *)*((void *)self + 5);
  *((void *)self + 5) = v69;

  uint64_t v73 = objc_msgSend_array(MEMORY[0x263EFF980], v71, v72);
  v74 = (void *)*((void *)self + 24);
  *((void *)self + 24) = v73;

  v75 = objc_alloc_init(RSFloorPlan);
  v76 = (void *)*((void *)self + 12);
  *((void *)self + 12) = v75;

  uint64_t v79 = objc_msgSend_array(MEMORY[0x263EFF8C0], v77, v78);
  v80 = (void *)*((void *)self + 13);
  *((void *)self + 13) = v79;

  uint64_t v81 = *((void *)self + 8);
  char isOnboardingEnabled = objc_msgSend_isOnboardingEnabled(v4, v82, v83);
  if (v81) {
    *(unsigned char *)(v81 + 928) = isOnboardingEnabled;
  }
  uint64_t v87 = *((void *)self + 8);
  if (v87)
  {
    sub_25B54573C(v87 + 16);
    sub_25B545EB8((void *)(v87 + 288));
    v88 = *(void ***)(v87 + 528);
    uint64_t v89 = *(void *)(v87 + 536);
    *(void *)(v87 + 560) = 0;
    unint64_t v90 = v89 - (void)v88;
    if (v90 >= 0x11)
    {
      do
      {
        operator delete(*v88);
        v88 = (void **)(*(void *)(v87 + 528) + 8);
        *(void *)(v87 + 528) = v88;
        unint64_t v90 = *(void *)(v87 + 536) - (void)v88;
      }
      while (v90 > 0x10);
    }
    if (v90 >> 3 == 1)
    {
      uint64_t v91 = 512;
    }
    else
    {
      if (v90 >> 3 != 2) {
        goto LABEL_34;
      }
      uint64_t v91 = 1024;
    }
    *(void *)(v87 + 552) = v91;
LABEL_34:
    v92 = *(void ***)(v87 + 480);
    uint64_t v93 = *(void *)(v87 + 488);
    *(void *)(v87 + 512) = 0;
    unint64_t v94 = v93 - (void)v92;
    if (v94 >= 0x11)
    {
      do
      {
        operator delete(*v92);
        uint64_t v95 = *(void *)(v87 + 488);
        v92 = (void **)(*(void *)(v87 + 480) + 8);
        *(void *)(v87 + 480) = v92;
        unint64_t v94 = v95 - (void)v92;
      }
      while (v94 > 0x10);
    }
    if (v94 >> 3 == 1)
    {
      uint64_t v96 = 512;
    }
    else
    {
      if (v94 >> 3 != 2) {
        goto LABEL_41;
      }
      uint64_t v96 = 1024;
    }
    *(void *)(v87 + 504) = v96;
LABEL_41:
    *(_DWORD *)(v87 + 568) = 0;
    v97 = *(void **)(v87 + 784);
    *(void *)(v87 + 784) = 0;

    v98 = *(void **)(v87 + 776);
    *(void *)(v87 + 776) = 0;

    v99 = *(void ***)(v87 + 688);
    uint64_t v100 = *(void *)(v87 + 696);
    *(void *)(v87 + 720) = 0;
    unint64_t v101 = v100 - (void)v99;
    if (v101 >= 0x11)
    {
      do
      {
        operator delete(*v99);
        v99 = (void **)(*(void *)(v87 + 688) + 8);
        *(void *)(v87 + 688) = v99;
        unint64_t v101 = *(void *)(v87 + 696) - (void)v99;
      }
      while (v101 > 0x10);
    }
    if (v101 >> 3 == 1)
    {
      uint64_t v102 = 512;
    }
    else
    {
      if (v101 >> 3 != 2) {
        goto LABEL_48;
      }
      uint64_t v102 = 1024;
    }
    *(void *)(v87 + 712) = v102;
LABEL_48:
    v103 = *(void ***)(v87 + 736);
    uint64_t v104 = *(void *)(v87 + 744);
    *(void *)(v87 + 768) = 0;
    unint64_t v105 = v104 - (void)v103;
    if (v105 >= 0x11)
    {
      do
      {
        operator delete(*v103);
        v103 = (void **)(*(void *)(v87 + 736) + 8);
        *(void *)(v87 + 736) = v103;
        unint64_t v105 = *(void *)(v87 + 744) - (void)v103;
      }
      while (v105 > 0x10);
    }
    if (v105 >> 3 == 1)
    {
      uint64_t v106 = 512;
    }
    else
    {
      if (v105 >> 3 != 2)
      {
LABEL_55:
        *(void *)(v87 + 840) = *(void *)(v87 + 832);
        v107 = *(void **)(v87 + 888);
        *(void *)(v87 + 888) = 0;

        v108 = *(void **)(v87 + 896);
        *(void *)(v87 + 896) = 0;

        v109 = [RSTextCoachingSignal alloc];
        if (v109) {
          v109 = (RSTextCoachingSignal *)sub_25B51F704(v109, -1, 1.0);
        }
        v110 = *(void **)(v87 + 856);
        *(void *)(v87 + 856) = v109;

        v111 = [RSTextCoachingSignal alloc];
        if (v111) {
          v111 = (RSTextCoachingSignal *)sub_25B51F704(v111, -1, 1.0);
        }
        v112 = *(void **)(v87 + 864);
        *(void *)(v87 + 864) = v111;

        v113 = *(void **)(v87 + 872);
        *(void *)(v87 + 872) = 0;

        v114 = *(void **)(v87 + 912);
        *(void *)(v87 + 912) = 0;

        v115 = *(void **)(v87 + 904);
        *(void *)(v87 + 904) = 0;

        uint64_t v116 = 3;
        if (*(unsigned char *)(v87 + 928)) {
          uint64_t v116 = -1;
        }
        *(void *)(v87 + 1000) = v116;
        goto LABEL_62;
      }
      uint64_t v106 = 1024;
    }
    *(void *)(v87 + 760) = v106;
    goto LABEL_55;
  }
LABEL_62:
  uint64_t v117 = *((void *)self + 10);
  if (v117)
  {
    *(unsigned char *)(v117 + 20) = 0;
    *(_DWORD *)(v117 + 16) = 0;
    unint64_t v118 = (unint64_t)(float)(*(float *)(v117 + 64) + 1.0);
    *(_OWORD *)(v117 + 104) = xmmword_25B5F1130;
    *(void *)(v117 + 120) = v118;
    *(void *)(v117 + 128) = 0;
    uint64_t v120 = *(void *)(v117 + 24);
    for (uint64_t i = *(void *)(v117 + 32); i != v120; sub_25B469774(i))
      i -= 144;
    *(void *)(v117 + 32) = v120;
  }
  uint64_t v121 = *((void *)self + 19);
  if (v121)
  {
    uint64_t v122 = objc_msgSend_array(MEMORY[0x263EFF980], v85, v86);
    v123 = *(void **)(v121 + 32);
    *(void *)(v121 + 32) = v122;

    uint64_t v126 = objc_msgSend_array(MEMORY[0x263EFF980], v124, v125);
    v127 = *(void **)(v121 + 40);
    *(void *)(v121 + 40) = v126;

    uint64_t v130 = objc_msgSend_array(MEMORY[0x263EFF980], v128, v129);
    v131 = *(void **)(v121 + 48);
    *(void *)(v121 + 48) = v130;

    uint64_t v134 = objc_msgSend_array(MEMORY[0x263EFF980], v132, v133);
    v135 = *(void **)(v121 + 56);
    *(void *)(v121 + 56) = v134;

    uint64_t v138 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v136, v137);
    v139 = *(void **)(v121 + 88);
    *(void *)(v121 + 88) = v138;

    uint64_t v142 = objc_msgSend_array(MEMORY[0x263EFF980], v140, v141);
    v143 = *(void **)(v121 + 64);
    *(void *)(v121 + 64) = v142;

    v146 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v144, v145);
    char v148 = objc_msgSend_BOOLForKey_(v146, v147, @"com.apple.roomscancore.debug_info_image_dump");

    *(unsigned char *)(v121 + 178) = v148;
    v151 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v149, v150);
    char v153 = objc_msgSend_BOOLForKey_(v151, v152, @"com.apple.roomscancore.debug_info_image_dump");

    *(unsigned char *)(v121 + 179) = v153;
    v156 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v154, v155);
    char v158 = objc_msgSend_BOOLForKey_(v156, v157, @"com.apple.roomscancore.debug_info_arframe_dump");

    *(unsigned char *)(v121 + 176) = v158;
    v161 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v159, v160);
    objc_msgSend_doubleForKey_(v161, v162, @"com.apple.roomscancore.debug_info_max_keyframe_fps");
    *(void *)(v121 + 96) = v163;

    *(void *)(v121 + 72) = 0;
    uint64_t v164 = MEMORY[0x263EF89A8];
    long long v165 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
    *(_OWORD *)(v121 + 112) = *MEMORY[0x263EF89A8];
    *(_OWORD *)(v121 + 128) = v165;
    long long v166 = *(_OWORD *)(v164 + 48);
    *(_OWORD *)(v121 + 144) = *(_OWORD *)(v164 + 32);
    *(_OWORD *)(v121 + 160) = v166;
    v167 = *(void **)(v121 + 104);
    *(void *)(v121 + 104) = 0;

    v168 = *(void **)(v121 + 80);
    *(void *)(v121 + 80) = 0;
  }
  v169 = (void *)*((void *)self + 23);
  if (v169)
  {
    uint64_t v170 = v169[1];
    if (v170)
    {
      sub_25B49406C(*(void **)(v170 + 136));
      v171 = *(void **)(v170 + 160);
      *(void *)(v170 + 128) = v170 + 136;
      *(void *)(v170 + 136) = 0;
      *(void *)(v170 + 144) = 0;
      sub_25B494018(v171);
      *(void *)(v170 + 152) = v170 + 160;
      *(void *)(v170 + 160) = 0;
      *(void *)(v170 + 168) = 0;
      v172 = *(void **)(v170 + 120);
      if (v172 && v172[22])
      {
        v173 = (void *)v172[21];
        if (v173)
        {
          do
          {
            v174 = (void *)*v173;
            operator delete(v173);
            v173 = v174;
          }
          while (v174);
        }
        v172[21] = 0;
        uint64_t v175 = v172[20];
        if (v175)
        {
          for (uint64_t j = 0; j != v175; ++j)
            *(void *)(v172[19] + 8 * j) = 0;
        }
        v172[22] = 0;
      }
      *(void *)(v170 + 208) = 0;
    }
    v177 = (void *)v169[3];
    uint64_t v178 = MEMORY[0x263EFFA68];
    v169[3] = MEMORY[0x263EFFA68];

    v179 = (void *)v169[4];
    v169[4] = v178;

    v180 = objc_alloc_init(RSFloorPlan);
    v181 = (void *)v169[5];
    v169[5] = v180;
  }
  *((unsigned char *)self + 120) = 0;
  if (qword_26A502100 != -1) {
    dispatch_once(&qword_26A502100, &unk_2708F12B8);
  }
  v182 = (id)qword_26A5020F8;
  if (os_log_type_enabled(v182, OS_LOG_TYPE_INFO))
  {
    int v183 = 138543362;
    v184 = self;
    _os_log_impl(&dword_25B3F3000, v182, OS_LOG_TYPE_INFO, "\"%{public}@\": Listen to available memory start", (uint8_t *)&v183, 0xCu);
  }
}

- (void)_processInfoThermalStateDidChangeNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_processInfo(MEMORY[0x263F08AB0], a2, (uint64_t)a3);
  uint64_t v7 = objc_msgSend_thermalState(v4, v5, v6);

  if (qword_26A502100 != -1) {
    dispatch_once(&qword_26A502100, &unk_2708F12B8);
  }
  uint64_t v8 = (id)qword_26A5020F8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v17 = 134217984;
    uint64_t v18 = v7;
    _os_log_impl(&dword_25B3F3000, v8, OS_LOG_TYPE_INFO, "Thermal state info in notification: %ld", (uint8_t *)&v17, 0xCu);
  }

  if (v7 == 3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_25B3F3000, v8, OS_LOG_TYPE_ERROR, "RSError: kRSError_Runtime_CriticalThermalState", (uint8_t *)&v17, 2u);
    }

    id v11 = objc_msgSend_delegate(self, v9, v10);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      v15 = objc_msgSend_delegate(self, v13, v14);
      objc_msgSend_session_didFailWithError_(v15, v16, (uint64_t)self, -3);
    }
  }
}

- (RSCaptureSession)init
{
  v61.receiver = self;
  v61.super_class = (Class)RSCaptureSession;
  id v2 = [(RSCaptureSession *)&v61 init];
  if (!v2)
  {
LABEL_6:
    uint64_t v58 = (RSCaptureSession *)v2;
    goto LABEL_12;
  }
  v3 = objc_alloc_init(RSOnlineFloorPlanGenerator);
  id v4 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = v3;

  if (*((void *)v2 + 2))
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(1);
    uint64_t v6 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = v5;

    uint64_t v7 = sub_25B478600();
    uint64_t v8 = (void *)*((void *)v2 + 20);
    *((void *)v2 + 20) = v7;

    uint64_t v9 = sub_25B4784A8("com.apple.RoomScanCore.onlineFloorPlanGeneration", *((void **)v2 + 20));
    uint64_t v10 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v9;

    id v11 = objc_alloc_init(RSScanCoaching);
    char v12 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v11;

    dispatch_semaphore_t v13 = dispatch_semaphore_create(1);
    uint64_t v14 = (void *)*((void *)v2 + 17);
    *((void *)v2 + 17) = v13;

    uint64_t v15 = sub_25B478600();
    uint64_t v16 = (void *)*((void *)v2 + 21);
    *((void *)v2 + 21) = v15;

    uint64_t v17 = sub_25B4784A8("com.apple.RoomScanCore.Coaching", *((void **)v2 + 21));
    uint64_t v18 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v17;

    uint64_t v19 = objc_alloc_init(RSDriftDetection);
    uint64_t v20 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v19;

    dispatch_semaphore_t v21 = dispatch_semaphore_create(1);
    v22 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v21;

    uint64_t v23 = sub_25B478600();
    double v24 = (void *)*((void *)v2 + 22);
    *((void *)v2 + 22) = v23;

    uint64_t v25 = sub_25B4784A8("com.apple.RoomScanCore.mirrorPoint", *((void **)v2 + 22));
    uint64_t v26 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v25;

    id v27 = objc_alloc_init(RSFloorPlanBoundaryRefinement);
    uint64_t v28 = (void *)*((void *)v2 + 23);
    *((void *)v2 + 23) = v27;

    uint64_t v31 = objc_msgSend_array(MEMORY[0x263EFF980], v29, v30);
    uint64_t v32 = (void *)*((void *)v2 + 24);
    *((void *)v2 + 24) = v31;

    id v33 = objc_alloc_init(RSFloorPlan);
    id v34 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v33;

    uint64_t v37 = objc_msgSend_array(MEMORY[0x263EFF8C0], v35, v36);
    uint64_t v38 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v37;

    *((unsigned char *)v2 + 120) = 1;
    uint64_t v41 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v39, v40);
    objc_msgSend_addObserver_selector_name_object_(v41, v42, (uint64_t)v2, sel__processInfoThermalStateDidChangeNotification_, *MEMORY[0x263F08458], 0);

    dispatch_source_t v43 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)v2 + 33));
    uint64_t v44 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v43;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 14), 0, 0x77359400uLL, 0);
    objc_initWeak(&location, v2);
    id v45 = objc_alloc(MEMORY[0x263EFFA40]);
    id v47 = objc_msgSend_initWithSuiteName_(v45, v46, @"com.apple.RoomScanCore");
    objc_msgSend_doubleForKey_(v47, v48, @"RSMemory_load_thr");
    double v50 = v49;

    if (v50 == 0.0) {
      double v50 = 1073741820.0;
    }
    v51 = *((void *)v2 + 14);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_25B4E2DE8;
    handler[3] = &unk_265495238;
    objc_copyWeak(v63, &location);
    v63[1] = *(id *)&v50;
    dispatch_source_set_event_handler(v51, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 14));
    objc_destroyWeak(v63);
    objc_destroyWeak(&location);
    v52 = objc_alloc_init(RSInternalInfoDumper);
    uint64_t v53 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v52;

    uint64_t v54 = sub_25B478600();
    v55 = (void *)*((void *)v2 + 34);
    *((void *)v2 + 34) = v54;

    uint64_t v56 = sub_25B4784A8("com.apple.RoomScanCore.readWrite", *((void **)v2 + 34));
    uint64_t v57 = (void *)*((void *)v2 + 33);
    *((void *)v2 + 33) = v56;

    goto LABEL_6;
  }
  if (qword_26A502100 != -1) {
    dispatch_once(&qword_26A502100, &unk_2708F12B8);
  }
  v59 = (id)qword_26A5020F8;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    LOWORD(handler[0]) = 0;
    _os_log_error_impl(&dword_25B3F3000, v59, OS_LOG_TYPE_ERROR, "Online floorplan generator init failed", (uint8_t *)handler, 2u);
  }

  uint64_t v58 = 0;
LABEL_12:

  return v58;
}

@end