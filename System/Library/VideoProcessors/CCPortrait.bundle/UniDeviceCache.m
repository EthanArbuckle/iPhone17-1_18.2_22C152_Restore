@interface UniDeviceCache
+ (id)bufferFromData:(id)a3 device:(id)a4;
+ (id)findComputeKernel:(id)a3 library:(id)a4 constants:(id)a5;
+ (id)findComputeKernel:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 constants:(id)a6;
+ (id)findKernel:(id)a3 device:(id)a4;
+ (void)clearAllCaches;
@end

@implementation UniDeviceCache

+ (id)bufferFromData:(id)a3 device:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_11;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v9 = 0;
  if (!v6 || (isKindOfClass & 1) == 0) {
    goto LABEL_12;
  }
  if (!objc_msgSend_conformsToProtocol_(v6, v8, (uint64_t)&unk_270E2B628))
  {
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  if (qword_26A997610 != -1) {
    dispatch_once(&qword_26A997610, &unk_270E12DF8);
  }
  v9 = sub_262E2FB90(v5, v6, (void *)qword_26A997618);
  if (!v9)
  {
    v10 = uni_activity();
    os_activity_t v11 = _os_activity_create(&dword_262E0F000, "create buffer", v10, OS_ACTIVITY_FLAG_DEFAULT);

    id v12 = v5;
    uint64_t v15 = objc_msgSend_bytes(v12, v13, v14);
    uint64_t v18 = objc_msgSend_length(v12, v16, v17);
    uint64_t v20 = objc_msgSend_newBufferWithBytes_length_options_(v6, v19, v15, v18, 0);
    if (!v20) {
      sub_262E4C668();
    }
    v9 = (void *)v20;
    id v21 = (id)qword_26A997618;
    objc_sync_enter(v21);
    v22 = (void *)qword_26A997618;
    v23 = NSNumber;
    uint64_t v26 = objc_msgSend_registryID(v6, v24, v25);
    v28 = objc_msgSend_numberWithUnsignedLongLong_(v23, v27, v26);
    v30 = objc_msgSend_objectForKeyedSubscript_(v22, v29, (uint64_t)v28);

    if (!v30) {
      __assert_rtn("+[UniDeviceCache bufferFromData:device:]", "UniDeviceCache.m", 71, "deviceDict");
    }
    objc_msgSend_setObject_forKeyedSubscript_(v30, v31, (uint64_t)v9, v12);

    objc_sync_exit(v21);
  }
LABEL_12:

  return v9;
}

+ (id)findKernel:(id)a3 device:(id)a4
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_12;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v9 = 0;
  if (v6 && (isKindOfClass & 1) != 0)
  {
    if (objc_msgSend_conformsToProtocol_(v6, v8, (uint64_t)&unk_270E2B628))
    {
      if (qword_26A997620 != -1) {
        dispatch_once(&qword_26A997620, &unk_270E12E18);
      }
      v99 = objc_msgSend_objectForKeyedSubscript_(v5, v10, @"name");
      if (!v99) {
        sub_262E4C6C0();
      }
      v9 = sub_262E2FB90(v5, v6, (void *)qword_26A997628);
      if (v9) {
        goto LABEL_22;
      }
      if (objc_msgSend_isEqualToString_(v99, v11, @"MPSImageGaussianBlur"))
      {
        v13 = objc_msgSend_objectForKeyedSubscript_(v5, v12, @"inputRadius");
        objc_msgSend_floatValue(v13, v14, v15);
        float v17 = v16;

        if (v17 <= 0.0001) {
          sub_262E4C6EC();
        }
        id v18 = objc_alloc(MEMORY[0x263F13288]);
        *(float *)&double v19 = v17;
        id v21 = objc_msgSend_initWithDevice_sigma_(v18, v20, (uint64_t)v6, v19);
      }
      else
      {
        if (objc_msgSend_isEqualToString_(v99, v12, @"MPSImageAreaMin"))
        {
          v24 = objc_msgSend_objectForKeyedSubscript_(v5, v23, @"radius");
          uint64_t v27 = objc_msgSend_unsignedIntValue(v24, v25, v26);

          v28 = (objc_class *)MEMORY[0x263F13238];
        }
        else
        {
          if (!objc_msgSend_isEqualToString_(v99, v23, @"MPSImageAreaMax"))
          {
            if (!objc_msgSend_isEqualToString_(v99, v29, @"MPSImageSpatioTemporalGuidedFilter"))
            {
              uni_logger_api();
              v35 = (char *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR)) {
                sub_262E4C7C8((uint64_t)v99, v35);
              }
              v9 = 0;
              goto LABEL_21;
            }
            v98 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v47, (uint64_t)&unk_270E1F128);
            long long v102 = 0u;
            long long v103 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            id v48 = v5;
            uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v100, v104, 16);
            if (v51)
            {
              uint64_t v52 = *(void *)v101;
              do
              {
                for (uint64_t i = 0; i != v51; ++i)
                {
                  if (*(void *)v101 != v52) {
                    objc_enumerationMutation(v48);
                  }
                  v54 = *(void **)(*((void *)&v100 + 1) + 8 * i);
                  if ((objc_msgSend_isEqualToString_(v54, v50, @"name") & 1) == 0
                    && (objc_msgSend_isEqualToString_(v54, v50, @"imageExtents") & 1) == 0
                    && (objc_msgSend_isEqualToString_(v54, v50, @"iterations") & 1) == 0
                    && (objc_msgSend_containsObject_(v98, v50, (uint64_t)v54) & 1) == 0)
                  {
                    sub_262E4C79C();
                  }
                }
                uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v50, (uint64_t)&v100, v104, 16);
              }
              while (v51);
            }

            v56 = objc_msgSend_objectForKeyedSubscript_(v48, v55, @"subsampleFactor");

            if (v56)
            {
              v58 = objc_msgSend_objectForKeyedSubscript_(v48, v57, @"subsampleFactor");
              unint64_t v61 = objc_msgSend_unsignedIntegerValue(v58, v59, v60);
            }
            else
            {
              unint64_t v61 = 8;
            }
            v62 = objc_msgSend_objectForKeyedSubscript_(v48, v57, @"width");

            if (v62)
            {
              v64 = objc_msgSend_objectForKeyedSubscript_(v48, v63, @"width");
              unint64_t v67 = objc_msgSend_unsignedIntegerValue(v64, v65, v66);

              uint64_t v68 = v67 / v61;
            }
            else
            {
              uint64_t v68 = 252;
            }
            v69 = objc_msgSend_objectForKeyedSubscript_(v48, v63, @"height");

            if (v69)
            {
              v71 = objc_msgSend_objectForKeyedSubscript_(v48, v70, @"height");
              unint64_t v74 = objc_msgSend_unsignedIntegerValue(v71, v72, v73);

              uint64_t v75 = v74 / v61;
            }
            else
            {
              uint64_t v75 = 189;
            }
            v76 = objc_msgSend_objectForKeyedSubscript_(v48, v70, @"spatialDiameter");

            if (v76)
            {
              v78 = objc_msgSend_objectForKeyedSubscript_(v48, v77, @"spatialDiameter");
              uint64_t v81 = objc_msgSend_unsignedIntegerValue(v78, v79, v80);
            }
            else
            {
              uint64_t v81 = 5;
            }
            v82 = objc_msgSend_objectForKeyedSubscript_(v48, v77, @"epsilon");

            if (v82)
            {
              v85 = objc_msgSend_objectForKeyedSubscript_(v48, v83, @"epsilon");
              objc_msgSend_floatValue(v85, v86, v87);
              int v89 = v88;
            }
            else
            {
              int v89 = 953267991;
            }
            LODWORD(v84) = v89;
            v90 = objc_msgSend_filterDescriptorWithWidth_height_arrayLength_kernelSpatialDiameter_kernelTemporalDiameter_epsilon_sourceChannels_guideChannels_preallocateIntermediates_(MEMORY[0x263F132D0], v83, v68, v75, 1, v81, 1, 1, v84, 4, 1);
            if (!v90) {
              sub_262E4C744();
            }
            id v91 = objc_alloc(MEMORY[0x263F132C8]);
            v93 = objc_msgSend_initWithDevice_filterDescriptor_(v91, v92, (uint64_t)v6, v90);
            v9 = v93;
            if (!v93) {
              sub_262E4C770();
            }
            uint64_t v96 = objc_msgSend_options(v93, v94, v95);
            objc_msgSend_setOptions_(v9, v97, v96 | 1);

LABEL_19:
            v35 = (char *)(id)qword_26A997628;
            objc_sync_enter(v35);
            v36 = (void *)qword_26A997628;
            v37 = NSNumber;
            uint64_t v40 = objc_msgSend_registryID(v6, v38, v39);
            v42 = objc_msgSend_numberWithUnsignedLongLong_(v37, v41, v40);
            v44 = objc_msgSend_objectForKeyedSubscript_(v36, v43, (uint64_t)v42);

            if (!v44) {
              __assert_rtn("+[UniDeviceCache findKernel:device:]", "UniDeviceCache.m", 173, "deviceDict");
            }
            objc_msgSend_setObject_forKeyedSubscript_(v44, v45, (uint64_t)v9, v5);

            objc_sync_exit(v35);
LABEL_21:

LABEL_22:
            goto LABEL_23;
          }
          v30 = objc_msgSend_objectForKeyedSubscript_(v5, v29, @"radius");
          uint64_t v27 = objc_msgSend_unsignedIntValue(v30, v31, v32);

          v28 = (objc_class *)MEMORY[0x263F13230];
        }
        id v33 = [v28 alloc];
        id v21 = objc_msgSend_initWithDevice_kernelWidth_kernelHeight_(v33, v34, (uint64_t)v6, v27, v27);
      }
      v9 = v21;
      objc_msgSend_setEdgeMode_(v21, v22, 1);
      if (!v9) {
        sub_262E4C718();
      }
      goto LABEL_19;
    }
LABEL_12:
    v9 = 0;
  }
LABEL_23:

  return v9;
}

+ (id)findComputeKernel:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 constants:(id)a6
{
  v40[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = sub_262E3061C();
  uint64_t v14 = (void *)qword_26B425330;
  qword_26B425330 = v13;

  v39[0] = @"name";
  v39[1] = @"constants";
  id v16 = (id)MEMORY[0x263EFFA78];
  if (v12) {
    id v16 = v12;
  }
  v40[0] = v9;
  v40[1] = v16;
  float v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)v40, v39, 2);
  uint64_t v20 = objc_msgSend_device(v10, v18, v19);
  id v21 = sub_262E2FB90(v17, v20, (void *)qword_26B425330);

  if (!v21)
  {
    v22 = [UniKernel alloc];
    id v21 = objc_msgSend_initWithName_metalLibrary_coreImageLibrary_pipelineLibrary_constants_(v22, v23, (uint64_t)v9, v10, 0, v11, v12);
    if (!v21) {
      sub_262E4C898();
    }
    id v24 = (id)qword_26B425330;
    objc_sync_enter(v24);
    uint64_t v25 = (void *)qword_26B425330;
    uint64_t v26 = NSNumber;
    v29 = objc_msgSend_device(v10, v27, v28);
    uint64_t v32 = objc_msgSend_registryID(v29, v30, v31);
    v34 = objc_msgSend_numberWithUnsignedLongLong_(v26, v33, v32);
    v36 = objc_msgSend_objectForKeyedSubscript_(v25, v35, (uint64_t)v34);

    if (!v36) {
      __assert_rtn("+[UniDeviceCache findComputeKernel:library:pipelineLibrary:constants:]", "UniDeviceCache.m", 212, "deviceDict");
    }
    objc_msgSend_setObject_forKeyedSubscript_(v36, v37, (uint64_t)v21, v17);

    objc_sync_exit(v24);
  }

  return v21;
}

+ (id)findComputeKernel:(id)a3 library:(id)a4 constants:(id)a5
{
  v37[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v12 = objc_msgSend_library(v8, v10, v11);
  uint64_t v15 = objc_msgSend_device(v12, v13, v14);

  uint64_t v16 = sub_262E3061C();
  float v17 = (void *)qword_26B425330;
  qword_26B425330 = v16;

  v36[0] = @"name";
  v36[1] = @"constants";
  id v19 = (id)MEMORY[0x263EFFA78];
  if (v9) {
    id v19 = v9;
  }
  v37[0] = v7;
  v37[1] = v19;
  uint64_t v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)v37, v36, 2);
  id v21 = sub_262E2FB90(v20, v15, (void *)qword_26B425330);
  if (!v21)
  {
    v22 = [UniKernel alloc];
    id v21 = objc_msgSend_initWithName_library_constants_(v22, v23, (uint64_t)v7, v8, v9);
    if (!v21) {
      sub_262E4C8C4();
    }
    id v24 = (id)qword_26B425330;
    objc_sync_enter(v24);
    uint64_t v25 = (void *)qword_26B425330;
    uint64_t v26 = NSNumber;
    uint64_t v29 = objc_msgSend_registryID(v15, v27, v28);
    uint64_t v31 = objc_msgSend_numberWithUnsignedLongLong_(v26, v30, v29);
    id v33 = objc_msgSend_objectForKeyedSubscript_(v25, v32, (uint64_t)v31);

    if (!v33) {
      __assert_rtn("+[UniDeviceCache findComputeKernel:library:constants:]", "UniDeviceCache.m", 244, "deviceDict");
    }
    objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)v21, v20);

    objc_sync_exit(v24);
  }

  return v21;
}

+ (void)clearAllCaches
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v2 = uni_activity();
  os_activity_t v3 = _os_activity_create(&dword_262E0F000, "clearAllCaches", v2, OS_ACTIVITY_FLAG_DEFAULT);

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v5 = qword_26A997628;
  if (!qword_26A997628) {
    uint64_t v5 = MEMORY[0x263EFFA78];
  }
  uint64_t v6 = qword_26A997618;
  if (!qword_26A997618) {
    uint64_t v6 = MEMORY[0x263EFFA78];
  }
  v47[0] = v5;
  v47[1] = v6;
  uint64_t v7 = qword_26B425330;
  if (!qword_26B425330) {
    uint64_t v7 = MEMORY[0x263EFFA78];
  }
  v47[2] = v7;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v4, (uint64_t)v47, 3);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v41, v48, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(*((void *)&v41 + 1) + 8 * i);
        objc_sync_enter(v12);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v15 = objc_msgSend_allValues(v12, v13, v14);
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v37, v46, 16);
        if (v17)
        {
          uint64_t v18 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v38 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v37 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend_removeAllObjects(v20, v21, v22);
              }
            }
            uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v21, (uint64_t)&v37, v46, 16);
          }
          while (v17);
        }

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v23 = v12;
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v33, v45, 16);
        if (v26)
        {
          uint64_t v27 = *(void *)v34;
          while (2)
          {
            for (uint64_t k = 0; k != v26; ++k)
            {
              if (*(void *)v34 != v27) {
                objc_enumerationMutation(v23);
              }
              if (*(void *)(*((void *)&v33 + 1) + 8 * k))
              {

                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  objc_msgSend_removeAllObjects(v23, v29, v30);
                }
                goto LABEL_32;
              }
            }
            uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v33, v45, 16);
            if (v26) {
              continue;
            }
            break;
          }
        }

LABEL_32:
        objc_sync_exit(v23);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v41, v48, 16);
    }
    while (v9);
  }
}

@end