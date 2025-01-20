@interface VGHRTFCaptureProcessor
- (VGHRTFCaptureProcessor)initWithConfig:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)processCaptureData:(id)a3 faceData:(id)a4 error:(id *)a5;
- (id)processSingleStepCaptureData:(id)a3 faceData:(id)a4 error:(id *)a5;
@end

@implementation VGHRTFCaptureProcessor

- (VGHRTFCaptureProcessor)initWithConfig:(id)a3 error:(id *)a4
{
  v48[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v45.receiver = self;
  v45.super_class = (Class)VGHRTFCaptureProcessor;
  v8 = [(VGHRTFCaptureProcessor *)&v45 init];
  v9 = v8;
  if (v8)
  {
    p_config = (id *)&v8->_config;
    objc_storeStrong((id *)&v8->_config, a3);
    v11 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.visage"];
    if ([v11 BOOLForKey:@"useLocalHRTFModels"])
    {
      v12 = __VGLogSharedInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_260C8D000, v12, OS_LOG_TYPE_INFO, " Using hrtf models from the Visage framework ", buf, 2u);
      }

      v13 = objc_msgSend(MEMORY[0x263F086E0], "vg_bundle");
      uint64_t v14 = [v13 resourcePath];
      modelsRootPath = v9->_modelsRootPath;
      v9->_modelsRootPath = (NSString *)v14;
    }
    else
    {
      v17 = [*p_config modelsRootPath];
      BOOL v18 = v17 == 0;

      if (v18)
      {
        v43 = __VGLogSharedInstance();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_260C8D000, v43, OS_LOG_TYPE_ERROR, " No ear detection models root path received! ", buf, 2u);
        }

        v35 = @"Failed to initialize VGHRTFCaptureProcessor with nil models path";
        goto LABEL_26;
      }
      v19 = NSString;
      v13 = [*p_config modelsRootPath];
      v48[0] = v13;
      v48[1] = @"EarDetectionModels";
      modelsRootPath = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];
      uint64_t v20 = [v19 pathWithComponents:modelsRootPath];
      v21 = v9->_modelsRootPath;
      v9->_modelsRootPath = (NSString *)v20;
    }
    v22 = __VGLogSharedInstance();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = v9->_modelsRootPath;
      *(_DWORD *)buf = 138412290;
      v47 = v23;
      _os_log_impl(&dword_260C8D000, v22, OS_LOG_TYPE_INFO, " Using EarDetectionModels at path: %@ ", buf, 0xCu);
    }

    v24 = [VGHRTFFaceCaptureProcessor alloc];
    v25 = [*p_config debugDataRootPath];
    uint64_t v26 = [(VGHRTFFaceCaptureProcessor *)v24 initWithDebugDataPath:v25];
    faceCapture = v9->_faceCapture;
    v9->_faceCapture = (VGHRTFFaceCaptureProcessor *)v26;

    if (v9->_faceCapture)
    {
      faceResults = v9->_faceResults;
      v9->_faceResults = 0;

      int v29 = _os_feature_enabled_impl();
      v9->_singleStepEnrollment = v29;
      if (v29)
      {
        v30 = __VGLogSharedInstance();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_260C8D000, v30, OS_LOG_TYPE_DEFAULT, " HRTF enrollment with single step protocol ", buf, 2u);
        }

        v31 = [VGHRTFEarPCACaptureProcessor alloc];
        v32 = [*p_config debugDataRootPath];
        uint64_t v33 = [(VGHRTFEarPCACaptureProcessor *)v31 initWithDebugDataPath:v32 withModelsRootPath:v9->_modelsRootPath];
        earPCACapture = v9->_earPCACapture;
        v9->_earPCACapture = (VGHRTFEarPCACaptureProcessor *)v33;

        if (!v9->_earPCACapture)
        {
          v35 = @"Failed to initialize VGHRTFEarPCACaptureProcessor";
LABEL_26:
          vg::hrtf::setError(a4, v35);
          v16 = 0;
          goto LABEL_27;
        }
      }
      else
      {
        v36 = __VGLogSharedInstance();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_260C8D000, v36, OS_LOG_TYPE_DEFAULT, " HRTF enrollment with three step protocol ", buf, 2u);
        }

        v37 = [VGHRTFEarCaptureProcessor alloc];
        v38 = [*p_config debugDataRootPath];
        uint64_t v39 = [(VGHRTFEarCaptureProcessor *)v37 initWithDebugDataPath:v38 withModelsRootPath:v9->_modelsRootPath];
        earCapture = v9->_earCapture;
        v9->_earCapture = (VGHRTFEarCaptureProcessor *)v39;

        if (!v9->_earCapture)
        {
          v35 = @"Failed to initialize VGHRTFEarCaptureProcessor";
          goto LABEL_26;
        }
      }
      atomic_store(0, (unsigned __int8 *)&v9->_faceCaptureFinished);
      v41 = [[VGHRTFCaptureUpdateData alloc] initEmpty];
      updateData = v9->_updateData;
      v9->_updateData = v41;

      [(VGHRTFCaptureUpdateData *)v9->_updateData setFaceCaptureUpdateData:0];
      [(VGHRTFCaptureUpdateData *)v9->_updateData setEarCaptureUpdateData:0];
      v16 = v9;
LABEL_27:

      goto LABEL_28;
    }
    v35 = @"Failed to initialize VGHRTFFaceCaptureProcessor";
    goto LABEL_26;
  }
  vg::hrtf::setError(a4, @"Failed to initialize VGHRTFCaptureProcessor.");
  v16 = 0;
LABEL_28:

  return v16;
}

- (id)processCaptureData:(id)a3 faceData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->_singleStepEnrollment)
  {
    id v10 = [(VGHRTFCaptureProcessor *)self processSingleStepCaptureData:v8 faceData:v9 error:a5];
  }
  else
  {
    id v10 = [[VGHRTFCaptureUpdateData alloc] initEmpty];
    [v10 setCaptureData:v8];
    [v10 setFaceData:v9];
    [v10 setFaceCaptureUpdateData:0];
    [v10 setEarCaptureUpdateData:0];
    unsigned __int8 v12 = atomic_load((unsigned __int8 *)&self->_faceCaptureFinished);
    if (v12)
    {
      [v10 setState:1];
      [v10 setFaceCaptureUpdateData:self->_faceResults];
      v19 = [(VGHRTFEarCaptureProcessor *)self->_earCapture processCaptureData:v8 faceData:v9];
      [v10 setEarCaptureUpdateData:v19];

      uint64_t v20 = [v10 earCaptureUpdateData];
      uint64_t v21 = [v20 progressType];

      if (v21 == 3) {
        [v10 setState:2];
      }
    }
    else
    {
      [v10 setState:0];
      v13 = [(VGHRTFFaceCaptureProcessor *)self->_faceCapture processCaptureData:v8 faceData:v9];
      [v10 setFaceCaptureUpdateData:v13];

      uint64_t v14 = [v10 faceCaptureUpdateData];
      uint64_t v15 = [v14 progressType];

      if (v15 == 4)
      {
        faceCapture = self->_faceCapture;
        self->_faceCapture = 0;

        v17 = [v10 faceCaptureUpdateData];
        faceResults = self->_faceResults;
        self->_faceResults = v17;

        atomic_store(1u, (unsigned __int8 *)&self->_faceCaptureFinished);
      }
    }
  }

  return v10;
}

- (id)processSingleStepCaptureData:(id)a3 faceData:(id)a4 error:(id *)a5
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v84 = a3;
  id v85 = a4;
  [(VGHRTFCaptureUpdateData *)self->_updateData setCaptureData:v84];
  [(VGHRTFCaptureUpdateData *)self->_updateData setFaceData:v85];
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_faceCaptureFinished);
  v89 = self;
  updateData = self->_updateData;
  if (v7)
  {
    [(VGHRTFCaptureUpdateData *)updateData setState:2];
    uint64_t v33 = self;
  }
  else
  {
    [(VGHRTFCaptureUpdateData *)updateData setState:0];
    id v9 = [(VGHRTFFaceCaptureProcessor *)self->_faceCapture processCaptureData:v84 faceData:v85];
    [(VGHRTFCaptureUpdateData *)self->_updateData setFaceCaptureUpdateData:v9];

    id v10 = [(VGHRTFCaptureUpdateData *)self->_updateData faceCaptureUpdateData];
    v11 = [v10 trackedData];
    unsigned __int8 v12 = [v11 yawAngle];
    [v85 setYawAngle:v12];

    v13 = [(VGHRTFEarPCACaptureProcessor *)v89->_earPCACapture processCaptureData:v84 faceData:v85];
    [(VGHRTFCaptureUpdateData *)v89->_updateData setEarCaptureUpdateData:v13];

    v88 = objc_opt_new();
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    uint64_t v14 = [(VGHRTFCaptureUpdateData *)v89->_updateData earCaptureUpdateData];
    uint64_t v15 = [v14 rightEarStatusList];
    v16 = [v15 allKeys];
    v17 = objc_msgSend(v16, "sortedArrayUsingSelector:");

    obuint64_t j = v17;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v98 objects:v104 count:16];
    unsigned int v19 = 0;
    uint64_t v20 = v18;
    if (v18)
    {
      uint64_t v21 = *(void *)v99;
      double v22 = 0.0;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v99 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v98 + 1) + 8 * v23);
          v25 = [(VGHRTFCaptureUpdateData *)v89->_updateData earCaptureUpdateData];
          uint64_t v26 = [v25 rightEarStatusList];
          v27 = [v26 objectForKeyedSubscript:v24];
          int v28 = [v27 BOOLValue];

          int v29 = [(VGHRTFCaptureUpdateData *)v89->_updateData earCaptureUpdateData];
          v30 = [v29 rightEarStatusList];
          v31 = [v30 objectForKeyedSubscript:v24];
          v32 = [NSNumber numberWithDouble:v22];
          [v88 setObject:v31 forKeyedSubscript:v32];

          double v22 = v22 + 1.0;
          v19 += v28;
          ++v23;
        }
        while (v20 != v23);
        uint64_t v20 = [obj countByEnumeratingWithState:&v98 objects:v104 count:16];
      }
      while (v20);
    }
    else
    {
      double v22 = 0.0;
    }

    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v34 = [(VGHRTFCaptureUpdateData *)v89->_updateData faceCaptureUpdateData];
    v35 = [v34 poseStatusList];
    v36 = [v35 objectAtIndexedSubscript:0];
    v37 = [v36 allKeys];
    id obja = [v37 sortedArrayUsingSelector:sel_compare_];

    uint64_t v38 = [obja countByEnumeratingWithState:&v94 objects:v103 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v95 != v39) {
            objc_enumerationMutation(obja);
          }
          uint64_t v41 = *(void *)(*((void *)&v94 + 1) + 8 * i);
          v42 = [(VGHRTFCaptureUpdateData *)v89->_updateData faceCaptureUpdateData];
          v43 = [v42 poseStatusList];
          v44 = [v43 objectAtIndexedSubscript:0];
          objc_super v45 = [v44 objectForKeyedSubscript:v41];
          int v46 = [v45 BOOLValue];

          v47 = [(VGHRTFCaptureUpdateData *)v89->_updateData faceCaptureUpdateData];
          v48 = [v47 poseStatusList];
          v49 = [v48 objectAtIndexedSubscript:0];
          v50 = [v49 objectForKeyedSubscript:v41];
          v51 = [NSNumber numberWithDouble:v22];
          [v88 setObject:v50 forKeyedSubscript:v51];

          double v22 = v22 + 1.0;
          v19 += v46;
        }
        uint64_t v38 = [obja countByEnumeratingWithState:&v94 objects:v103 count:16];
      }
      while (v38);
    }

    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    v52 = [(VGHRTFCaptureUpdateData *)v89->_updateData earCaptureUpdateData];
    v53 = [v52 leftEarStatusList];
    v54 = [v53 allKeys];
    v55 = [v54 sortedArrayUsingSelector:sel_compare_];

    uint64_t v56 = [v55 countByEnumeratingWithState:&v90 objects:v102 count:16];
    if (v56)
    {
      uint64_t v57 = *(void *)v91;
      do
      {
        for (uint64_t j = 0; j != v56; ++j)
        {
          if (*(void *)v91 != v57) {
            objc_enumerationMutation(v55);
          }
          uint64_t v59 = *(void *)(*((void *)&v90 + 1) + 8 * j);
          v60 = [(VGHRTFCaptureUpdateData *)v89->_updateData earCaptureUpdateData];
          v61 = [v60 leftEarStatusList];
          v62 = [v61 objectForKeyedSubscript:v59];
          int v63 = [v62 BOOLValue];

          v64 = [(VGHRTFCaptureUpdateData *)v89->_updateData earCaptureUpdateData];
          v65 = [v64 leftEarStatusList];
          v66 = [v65 objectForKeyedSubscript:v59];
          v67 = [NSNumber numberWithDouble:v22];
          [v88 setObject:v66 forKeyedSubscript:v67];

          double v22 = v22 + 1.0;
          v19 += v63;
        }
        uint64_t v56 = [v55 countByEnumeratingWithState:&v90 objects:v102 count:16];
      }
      while (v56);
    }

    unsigned int v68 = [v88 count];
    id v69 = [[VGHRTFFaceCaptureUpdateData alloc] initEmpty];
    v70 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v88, 0);
    [v69 setPoseStatusList:v70];

    v71 = [(VGHRTFCaptureUpdateData *)v89->_updateData faceCaptureUpdateData];
    objc_msgSend(v69, "setProgressType:", objc_msgSend(v71, "progressType"));

    *(float *)&double v72 = (float)v19 / (float)v68;
    [v69 setProgress:v72];
    v73 = [(VGHRTFCaptureUpdateData *)v89->_updateData faceCaptureUpdateData];
    v74 = [v73 trackedData];
    [v69 setTrackedData:v74];

    v75 = [(VGHRTFCaptureUpdateData *)v89->_updateData faceCaptureUpdateData];
    v76 = [v75 result];
    [v69 setResult:v76];

    [(VGHRTFCaptureUpdateData *)v89->_updateData setFaceCaptureUpdateData:v69];
    uint64_t v77 = [v69 progressType];
    v78 = [(VGHRTFCaptureUpdateData *)v89->_updateData earCaptureUpdateData];
    uint64_t v79 = [v78 progressType];

    if (v77 == 4 && v79 == 3)
    {
      faceCapture = v89->_faceCapture;
      v89->_faceCapture = 0;

      earPCACapture = v89->_earPCACapture;
      v89->_earPCACapture = 0;

      objc_storeStrong((id *)&v89->_faceResults, v69);
      atomic_store(1u, (unsigned __int8 *)&v89->_faceCaptureFinished);
    }

    uint64_t v33 = v89;
  }
  v82 = v33->_updateData;

  return v82;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelsRootPath, 0);
  objc_storeStrong((id *)&self->_updateData, 0);
  objc_storeStrong((id *)&self->_earPCACapture, 0);
  objc_storeStrong((id *)&self->_earCapture, 0);
  objc_storeStrong((id *)&self->_faceResults, 0);
  objc_storeStrong((id *)&self->_faceCapture, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 65) = 0;
  return self;
}

@end