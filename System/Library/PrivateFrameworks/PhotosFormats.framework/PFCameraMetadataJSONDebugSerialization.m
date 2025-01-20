@interface PFCameraMetadataJSONDebugSerialization
+ (id)vnObjectPlaceholderForObject:(id)a3;
- (PFCameraMetadataJSONDebugSerialization)init;
- (id)JSONDebugData;
- (void)addObject:(id)a3 forKey:(id)a4;
@end

@implementation PFCameraMetadataJSONDebugSerialization

- (void).cxx_destruct
{
}

- (id)JSONDebugData
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [PFJSONDebugDumpConverter alloc];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PFCameraMetadataJSONDebugSerialization_JSONDebugData__block_invoke;
  v10[3] = &unk_1E5B2E720;
  v10[4] = self;
  v4 = [(PFJSONDebugDumpConverter *)v3 initWithUnknownTypeHandler:v10];
  debugInfo = self->_debugInfo;
  id v9 = 0;
  v6 = [(PFJSONDebugDumpConverter *)v4 JSONForObject:debugInfo error:&v9];
  id v7 = v9;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v7;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to serialize camera metadata to JSON: %@", buf, 0xCu);
  }

  return v6;
}

id __55__PFCameraMetadataJSONDebugSerialization_JSONDebugData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  getVNObservationClass();
  if (objc_opt_isKindOfClass() & 1) != 0 || (getVNEspressoModelImageprintClass(), (objc_opt_isKindOfClass()))
  {
    v3 = [(id)objc_opt_class() vnObjectPlaceholderForObject:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)addObject:(id)a3 forKey:(id)a4
{
}

- (PFCameraMetadataJSONDebugSerialization)init
{
  v6.receiver = self;
  v6.super_class = (Class)PFCameraMetadataJSONDebugSerialization;
  id v2 = [(PFCameraMetadataJSONDebugSerialization *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    debugInfo = v2->_debugInfo;
    v2->_debugInfo = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)vnObjectPlaceholderForObject:(id)a3
{
  v126[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1CA60];
  v125[0] = @"ObjectDescription";
  v5 = [v3 description];
  v125[1] = @"ClassName";
  v126[0] = v5;
  objc_super v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v126[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:v125 count:2];
  id v9 = [v4 dictionaryWithDictionary:v8];

  if ([v3 conformsToProtocol:&unk_1EF7E77D8])
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "requestRevision"));
    [v9 setObject:v10 forKeyedSubscript:@"requestRevision"];
  }
  getVNObservationClass();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v3;
    id v12 = [v11 uuid];
    uint64_t v13 = [v12 UUIDString];
    [v9 setObject:v13 forKeyedSubscript:@"uuid"];

    v14 = NSNumber;
    [v11 confidence];
    v15 = objc_msgSend(v14, "numberWithFloat:");
    [v9 setObject:v15 forKeyedSubscript:@"confidence"];

    v123[0] = @"start";
    v16 = NSNumber;
    if (v11)
    {
      [v11 timeRange];
    }
    else
    {
      long long v100 = 0u;
      long long v101 = 0u;
      long long v99 = 0u;
    }
    *(_OWORD *)&time.value = v99;
    time.epoch = v100;
    v17 = [v16 numberWithDouble:CMTimeGetSeconds(&time)];
    v123[1] = @"duration";
    v124[0] = v17;
    v18 = NSNumber;
    if (v11)
    {
      [v11 timeRange];
    }
    else
    {
      memset(v97, 0, sizeof(v97));
      long long v96 = 0u;
    }
    CMTime v98 = *(CMTime *)((char *)v97 + 8);
    v19 = [v18 numberWithDouble:CMTimeGetSeconds(&v98)];
    v124[1] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v124 forKeys:v123 count:2];
    [v9 setObject:v20 forKeyedSubscript:@"timeRange"];
  }
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x2050000000;
  v21 = (void *)getVNFeaturePrintObservationClass_softClass;
  uint64_t v111 = getVNFeaturePrintObservationClass_softClass;
  if (!getVNFeaturePrintObservationClass_softClass)
  {
    uint64_t v103 = MEMORY[0x1E4F143A8];
    uint64_t v104 = 3221225472;
    v105 = __getVNFeaturePrintObservationClass_block_invoke;
    v106 = &unk_1E5B2E0D8;
    v107 = &v108;
    __getVNFeaturePrintObservationClass_block_invoke((uint64_t)&v103);
    v21 = (void *)v109[3];
  }
  id v22 = v21;
  _Block_object_dispose(&v108, 8);
  if (objc_opt_isKindOfClass())
  {
    v23 = NSNumber;
    id v24 = v3;
    v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "elementType"));
    [v9 setObject:v25 forKeyedSubscript:@"elementType"];

    v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "elementCount"));
    [v9 setObject:v26 forKeyedSubscript:@"elementCount"];

    v27 = [v24 data];

    [v9 setObject:v27 forKeyedSubscript:@"data"];
  }
  getVNSceneObservationClass();
  if (objc_opt_isKindOfClass())
  {
    v28 = [v3 sceneprints];
    [v9 setObject:v28 forKeyedSubscript:@"sceneprints"];
  }
  getVNClassificationObservationClass();
  if (objc_opt_isKindOfClass())
  {
    v29 = [v3 identifier];
    [v9 setObject:v29 forKeyedSubscript:@"identifier"];
  }
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x2050000000;
  v30 = (void *)getVNPixelBufferObservationClass_softClass;
  uint64_t v111 = getVNPixelBufferObservationClass_softClass;
  if (!getVNPixelBufferObservationClass_softClass)
  {
    uint64_t v103 = MEMORY[0x1E4F143A8];
    uint64_t v104 = 3221225472;
    v105 = __getVNPixelBufferObservationClass_block_invoke;
    v106 = &unk_1E5B2E0D8;
    v107 = &v108;
    __getVNPixelBufferObservationClass_block_invoke((uint64_t)&v103);
    v30 = (void *)v109[3];
  }
  id v31 = v30;
  _Block_object_dispose(&v108, 8);
  if (objc_opt_isKindOfClass())
  {
    v32 = [v3 featureName];
    [v9 setObject:v32 forKeyedSubscript:@"featureName"];
  }
  getVNSaliencyImageObservationClass();
  if (objc_opt_isKindOfClass())
  {
    v33 = [v3 salientObjects];
    [v9 setObject:v33 forKeyedSubscript:@"salientObjects"];
  }
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x2050000000;
  v34 = (void *)getVNDetectedObjectObservationClass_softClass;
  uint64_t v111 = getVNDetectedObjectObservationClass_softClass;
  if (!getVNDetectedObjectObservationClass_softClass)
  {
    uint64_t v103 = MEMORY[0x1E4F143A8];
    uint64_t v104 = 3221225472;
    v105 = __getVNDetectedObjectObservationClass_block_invoke;
    v106 = &unk_1E5B2E0D8;
    v107 = &v108;
    __getVNDetectedObjectObservationClass_block_invoke((uint64_t)&v103);
    v34 = (void *)v109[3];
  }
  id v35 = v34;
  _Block_object_dispose(&v108, 8);
  if (objc_opt_isKindOfClass())
  {
    [v3 boundingBox];
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    v121[0] = @"origin.x";
    v42 = objc_msgSend(NSNumber, "numberWithDouble:");
    v122[0] = v42;
    v121[1] = @"origin.y";
    v43 = [NSNumber numberWithDouble:v37];
    v122[1] = v43;
    v121[2] = @"size.width";
    v44 = [NSNumber numberWithDouble:v39];
    v122[2] = v44;
    v121[3] = @"size.height";
    v45 = [NSNumber numberWithDouble:v41];
    v122[3] = v45;
    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:v121 count:4];
    [v9 setObject:v46 forKeyedSubscript:@"boundingBox"];
  }
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x2050000000;
  v47 = (void *)getVNRectangleObservationClass_softClass;
  uint64_t v111 = getVNRectangleObservationClass_softClass;
  if (!getVNRectangleObservationClass_softClass)
  {
    uint64_t v103 = MEMORY[0x1E4F143A8];
    uint64_t v104 = 3221225472;
    v105 = __getVNRectangleObservationClass_block_invoke;
    v106 = &unk_1E5B2E0D8;
    v107 = &v108;
    __getVNRectangleObservationClass_block_invoke((uint64_t)&v103);
    v47 = (void *)v109[3];
  }
  id v48 = v47;
  _Block_object_dispose(&v108, 8);
  if (objc_opt_isKindOfClass())
  {
    v119[0] = @"x";
    v49 = NSNumber;
    id v50 = v3;
    [v50 topLeft];
    v51 = objc_msgSend(v49, "numberWithDouble:");
    v120[0] = v51;
    v119[1] = @"y";
    v52 = NSNumber;
    [v50 topLeft];
    v54 = [v52 numberWithDouble:v53];
    v120[1] = v54;
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:v119 count:2];
    [v9 setObject:v55 forKeyedSubscript:@"topLeft"];

    v117[0] = @"x";
    v56 = NSNumber;
    [v50 topRight];
    v57 = objc_msgSend(v56, "numberWithDouble:");
    v117[1] = @"y";
    v118[0] = v57;
    v58 = NSNumber;
    [v50 topRight];
    v60 = [v58 numberWithDouble:v59];
    v118[1] = v60;
    v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:v117 count:2];
    [v9 setObject:v61 forKeyedSubscript:@"topRight"];

    v115[0] = @"x";
    v62 = NSNumber;
    [v50 bottomLeft];
    v63 = objc_msgSend(v62, "numberWithDouble:");
    v115[1] = @"y";
    v116[0] = v63;
    v64 = NSNumber;
    [v50 bottomLeft];
    v66 = [v64 numberWithDouble:v65];
    v116[1] = v66;
    v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:2];
    [v9 setObject:v67 forKeyedSubscript:@"bottomLeft"];

    v113[0] = @"x";
    v68 = NSNumber;
    [v50 bottomRight];
    v69 = objc_msgSend(v68, "numberWithDouble:");
    v113[1] = @"y";
    v114[0] = v69;
    v70 = NSNumber;
    [v50 bottomRight];
    double v72 = v71;

    v73 = [v70 numberWithDouble:v72];
    v114[1] = v73;
    v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:2];
    [v9 setObject:v74 forKeyedSubscript:@"bottomRight"];
  }
  getVNRecognizedObjectObservationClass();
  if (objc_opt_isKindOfClass())
  {
    id v75 = v3;
    v76 = [MEMORY[0x1E4F1CA48] array];
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    v77 = objc_msgSend(v75, "labels", 0);
    uint64_t v78 = [v77 countByEnumeratingWithState:&v92 objects:v112 count:16];
    if (v78)
    {
      uint64_t v79 = *(void *)v93;
      do
      {
        for (uint64_t i = 0; i != v78; ++i)
        {
          if (*(void *)v93 != v79) {
            objc_enumerationMutation(v77);
          }
          [v76 addObject:*(void *)(*((void *)&v92 + 1) + 8 * i)];
        }
        uint64_t v78 = [v77 countByEnumeratingWithState:&v92 objects:v112 count:16];
      }
      while (v78);
    }

    [v9 setObject:v76 forKeyedSubscript:@"labels"];
  }
  getVNEspressoModelImageprintClass();
  if (objc_opt_isKindOfClass())
  {
    id v81 = v3;
    v82 = [(id)objc_opt_class() currentVersion];
    [v9 setObject:v82 forKeyedSubscript:@"currentVersion"];

    v83 = [v81 descriptorData];
    [v9 setObject:v83 forKeyedSubscript:@"descriptorData"];

    v84 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v81, "elementCount"));
    [v9 setObject:v84 forKeyedSubscript:@"elementCount"];

    v85 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v81, "lengthInBytes"));
    [v9 setObject:v85 forKeyedSubscript:@"lengthInBytes"];

    v86 = [v81 labelsAndConfidence];
    [v9 setObject:v86 forKeyedSubscript:@"labelsAndConfidence"];

    v87 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v81, "confidenceScoreType"));
    [v9 setObject:v87 forKeyedSubscript:@"confidenceScoreType"];

    v88 = NSNumber;
    uint64_t v89 = [v81 requestRevision];

    v90 = [v88 numberWithUnsignedInteger:v89];
    [v9 setObject:v90 forKeyedSubscript:@"requestRevision"];
  }

  return v9;
}

@end