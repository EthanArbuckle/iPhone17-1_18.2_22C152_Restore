@interface UniKernel
+ (BOOL)_shouldEmulate_sRGBForTexture:(id)a3;
+ (BOOL)shouldWriteDebugTextures;
+ (id)_mtlTextureForImage:(id)a3;
+ (id)_outputTextureForTexture:(id)a3 force:(BOOL)a4;
+ (id)generateCIImage:(id)a3;
- (CGRect)_findOutputRect;
- (CGRect)extentForImage:(id)a3;
- (MTLDevice)device;
- (NSMapTable)inputs;
- (NSNumber)preferredOutputFormat;
- (NSNumber)scale;
- (UniContext)context;
- (UniKernel)init;
- (UniKernel)initWithName:(id)a3 library:(id)a4;
- (UniKernel)initWithName:(id)a3 library:(id)a4 constants:(id)a5;
- (UniKernel)initWithName:(id)a3 metalLibrary:(id)a4 coreImageLibrary:(id)a5 pipelineLibrary:(id)a6 constants:(id)a7;
- (UniKernelInternal)kernel;
- (UniRunInfo)runInfo;
- (id)_ciImageForInput:(id)a3;
- (id)_findKernelInCache:(id)a3 library:(id)a4 constants:(id)a5;
- (id)_findKernelInCache:(id)a3 metalLibrary:(id)a4 coreImageLibrary:(id)a5 pipelineLibrary:(id)a6 constants:(id)a7;
- (id)_flattenDict:(id)a3;
- (id)_inputOrOutputArray:(BOOL)a3;
- (id)_inputOrOutputBufferArray:(BOOL)a3;
- (id)_intputOrOutputNameArray:(BOOL)a3;
- (id)_mtlTextureForImage:(id)a3;
- (id)_populateStruct:(id)a3 values:(id)a4;
- (id)_regionForTexture:(id)a3 name:(id)a4;
- (id)ck;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getContext;
- (id)getRenderOrder;
- (id)imageByApplyingParameters:(id)a3;
- (id)imageByApplyingParameters:(id)a3 extent:(id)a4;
- (id)imageByApplyingParameters:(id)a3 runInfo:(id)a4;
- (id)inputBufferArray;
- (id)inputImageArray;
- (id)inputNameArray;
- (id)makeBufferCpuAccessible:(id)a3;
- (id)mk;
- (id)outputBufferArray;
- (id)outputImage:(id)a3;
- (id)outputImageArray;
- (id)outputImageOfSize:(id)a3;
- (id)outputNameArray;
- (id)roiCallback;
- (id)run:(id)a3;
- (int)_outputFormatForMetalFormat:(unint64_t)a3;
- (int)_promoteFormatForCoreImage:(int)a3;
- (unint64_t)_outputFormatForImage:(id)a3;
- (unsigned)kDebugFlagForKernel;
- (void)_setNumber:(id)a3 forEncoder:(id)a4 atIndex:(unint64_t)a5;
- (void)_setRunInfoBasedOnCoreImage;
- (void)setContext:(id)a3;
- (void)setDevice:(id)a3;
- (void)setInputs:(id)a3;
- (void)setKernel:(id)a3;
- (void)setPreferredOutputFormat:(id)a3;
- (void)setRoiCallback:(id)a3;
- (void)setRunInfo:(id)a3;
- (void)setScale:(id)a3;
- (void)setValues:(id)a3;
- (void)writeDebugTextures:(id)a3 filesWritten:(id)a4;
@end

@implementation UniKernel

- (id)ck
{
  return (id)objc_msgSend_ck(self->kernel, a2, v2);
}

- (id)mk
{
  return (id)objc_msgSend_mk(self->kernel, a2, v2);
}

- (id)getContext
{
  return self->context;
}

- (id)getRenderOrder
{
  context = self->context;
  if (context)
  {
    v5 = objc_msgSend_weakArray(context, a2, v2);
  }
  else
  {
    v5 = objc_msgSend_weakObjectsPointerArray(MEMORY[0x263F08A88], a2, v2);
    objc_msgSend_addPointer_(v5, v6, (uint64_t)self);
  }

  return v5;
}

- (unsigned)kDebugFlagForKernel
{
  kernel = self->kernel;
  if (!kernel) {
    goto LABEL_8;
  }
  v7 = objc_msgSend_mk(kernel, a2, v2);
  if (!v7) {
    return v7;
  }
  v8 = objc_msgSend_mk(self->kernel, v5, v6);
  v11 = objc_msgSend_label(v8, v9, v10);

  if (!v11)
  {
LABEL_8:
    LODWORD(v7) = 0;
    return v7;
  }
  v7 = objc_msgSend_mk(self->kernel, v12, v13);
  v16 = objc_msgSend_label(v7, v14, v15);

  LODWORD(v7) = 822149888;
  if ((objc_msgSend_isEqualToString_(v16, v17, @"slm_calc") & 1) == 0
    && (objc_msgSend_isEqualToString_(v16, v18, @"slm_calc") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v16, v19, @"sparserendering_preprocess"))
    {
      LODWORD(v7) = 822149892;
    }
    else if ((objc_msgSend_isEqualToString_(v16, v20, @"sparserendering_sample_noAlpha") & 1) != 0 {
           || (objc_msgSend_isEqualToString_(v16, v21, @"sparserendering_sample_withAlpha") & 1) != 0
    }
           || (objc_msgSend_isEqualToString_(v16, v22, @"sparserendering_opt2x_sample_noAlpha") & 1) != 0)
    {
      LODWORD(v7) = 822149904;
    }
    else
    {
      LODWORD(v7) = 822149904;
      if ((objc_msgSend_isEqualToString_(v16, v23, @"sparserendering_opt2x_sample_withAlpha") & 1) == 0)
      {
        LODWORD(v7) = 822150004;
        if ((objc_msgSend_isEqualToString_(v16, v25, @"blurmap_x_smoothing") & 1) == 0
          && (objc_msgSend_isEqualToString_(v16, v26, @"blurmap_y_smoothing") & 1) == 0)
        {
          LODWORD(v7) = 822149996;
          if ((objc_msgSend_isEqualToString_(v16, v27, @"sparserendering_antialias_x") & 1) == 0
            && (objc_msgSend_isEqualToString_(v16, v28, @"sparserendering_antialias_y") & 1) == 0)
          {
            LODWORD(v7) = 822150012;
            if ((objc_msgSend_isEqualToString_(v16, v29, @"sparserendering_prefilter_x") & 1) == 0
              && (objc_msgSend_isEqualToString_(v16, v30, @"sparserendering_prefilter_y") & 1) == 0)
            {
              if (objc_msgSend_isEqualToString_(v16, v31, @"segmentation_fusion_apply")) {
                LODWORD(v7) = 822150648;
              }
              else {
                LODWORD(v7) = 0;
              }
            }
          }
        }
      }
    }
  }

  return v7;
}

- (id)_findKernelInCache:(id)a3 library:(id)a4 constants:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = (__CFString *)a5;
  sub_262E3B0FC();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  if (v8)
  {
    uint64_t v15 = objc_msgSend_library(v8, v11, v12);
    if (v15)
    {
      v16 = NSNumber;
      v17 = objc_msgSend_library(v8, v13, v14);
      v20 = objc_msgSend_device(v17, v18, v19);
      uint64_t v23 = objc_msgSend_registryID(v20, v21, v22);
      v25 = objc_msgSend_numberWithUnsignedLongLong_(v16, v24, v23);
    }
    else
    {
      v25 = &unk_270E1E720;
    }
  }
  else
  {
    v25 = &unk_270E1E720;
  }
  v26 = &stru_270E15D18;
  if (v9) {
    v26 = v9;
  }
  v27 = objc_msgSend_stringWithFormat_(NSString, v11, @"%@:%@:%@", v25, v7, v26);
  v29 = objc_msgSend_objectForKeyedSubscript_(v10, v28, (uint64_t)v27);
  v32 = v29;
  if (v29)
  {
    v33 = objc_msgSend_ck(v29, v30, v31);

    v36 = objc_msgSend_coreImageLibrary(v8, v34, v35);
    BOOL v37 = v36 != 0;

    if (((v33 == 0) ^ v37)) {
      goto LABEL_17;
    }
    objc_msgSend_removeAllObjects(v10, v38, v39);
  }
  v40 = [UniKernelInternal alloc];
  v32 = objc_msgSend_initWithName_library_constants_(v40, v41, (uint64_t)v7, v8, v9);
  if (v32)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v42, (uint64_t)v32, v27);
  }
  else
  {
    v43 = uni_logger_compile();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_stringWithFormat_(NSString, v44, @"Unable to find kernel for %@", v7);
      id v46 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315138;
      uint64_t v50 = objc_msgSend_UTF8String(v46, v47, v48);
      _os_log_error_impl(&dword_262E0F000, v43, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    v32 = 0;
  }
LABEL_17:

  objc_sync_exit(v10);

  return v32;
}

- (id)_findKernelInCache:(id)a3 metalLibrary:(id)a4 coreImageLibrary:(id)a5 pipelineLibrary:(id)a6 constants:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (__CFString *)a7;
  sub_262E3B0FC();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v16);
  if (v12)
  {
    uint64_t v19 = NSNumber;
    v20 = objc_msgSend_device(v12, v17, v18);
    uint64_t v23 = objc_msgSend_registryID(v20, v21, v22);
    v25 = objc_msgSend_numberWithUnsignedLongLong_(v19, v24, v23);
  }
  else
  {
    v25 = &unk_270E1E720;
  }
  v26 = &stru_270E15D18;
  if (v15) {
    v26 = v15;
  }
  v27 = objc_msgSend_stringWithFormat_(NSString, v17, @"%@:%@:%@", v25, v11, v26);
  v29 = objc_msgSend_objectForKeyedSubscript_(v16, v28, (uint64_t)v27);
  if (!v29)
  {
    v30 = [UniKernelInternal alloc];
    v29 = objc_msgSend_initWithName_metalLibrary_coreImageLibrary_pipelineLibrary_constants_(v30, v31, (uint64_t)v11, v12, v13, v14, v15);
    if (!v29) {
      __assert_rtn("-[UniKernel _findKernelInCache:metalLibrary:coreImageLibrary:pipelineLibrary:constants:]", "UniKernel.m", 446, "k");
    }
    objc_msgSend_setObject_forKeyedSubscript_(v16, v32, (uint64_t)v29, v27);
  }

  objc_sync_exit(v16);

  return v29;
}

- (UniKernel)initWithName:(id)a3 metalLibrary:(id)a4 coreImageLibrary:(id)a5 pipelineLibrary:(id)a6 constants:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v39.receiver = self;
  v39.super_class = (Class)UniKernel;
  v17 = [(UniKernel *)&v39 init];
  uint64_t v19 = v17;
  if (!v17)
  {
LABEL_7:
    v24 = v19;
    goto LABEL_8;
  }
  v20 = objc_msgSend__findKernelInCache_metalLibrary_coreImageLibrary_pipelineLibrary_constants_(v17, v18, (uint64_t)v12, v13, v14, v15, v16);
  objc_msgSend_setKernel_(v19, v21, (uint64_t)v20);

  objc_msgSend_kernel(v19, v22, v23);
  v24 = (UniKernel *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (v13)
    {
      v27 = objc_msgSend_device(v13, v25, v26);
      objc_msgSend_setDevice_(v19, v28, (uint64_t)v27);
    }
    else
    {
      objc_msgSend_setDevice_(v19, v25, 0);
    }
    uint64_t v31 = objc_msgSend_weakToWeakObjectsMapTable(MEMORY[0x263F08968], v29, v30);
    objc_msgSend_setInputs_(v19, v32, (uint64_t)v31);

    objc_msgSend_setScale_(v19, v33, (uint64_t)&unk_270E1E738);
    objc_msgSend_setRoiCallback_(v19, v34, (uint64_t)&unk_270E12EB8);
    objc_msgSend_setRunInfo_(v19, v35, 0);
    objc_msgSend_setContext_(v19, v36, 0);
    objc_msgSend_setPreferredOutputFormat_(v19, v37, (uint64_t)&unk_270E1E750);
    goto LABEL_7;
  }
LABEL_8:

  return v24;
}

- (UniKernel)initWithName:(id)a3 library:(id)a4 constants:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)UniKernel;
  id v11 = [(UniKernel *)&v36 init];
  id v13 = v11;
  if (!v11) {
    goto LABEL_4;
  }
  id v14 = objc_msgSend__findKernelInCache_library_constants_(v11, v12, (uint64_t)v8, v9, v10);
  objc_msgSend_setKernel_(v13, v15, (uint64_t)v14);

  objc_msgSend_kernel(v13, v16, v17);
  uint64_t v18 = (UniKernel *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v21 = objc_msgSend_library(v9, v19, v20);
    v24 = objc_msgSend_device(v21, v22, v23);
    objc_msgSend_setDevice_(v13, v25, (uint64_t)v24);

    v28 = objc_msgSend_weakToWeakObjectsMapTable(MEMORY[0x263F08968], v26, v27);
    objc_msgSend_setInputs_(v13, v29, (uint64_t)v28);

    objc_msgSend_setScale_(v13, v30, (uint64_t)&unk_270E1E738);
    objc_msgSend_setRoiCallback_(v13, v31, (uint64_t)&unk_270E12ED8);
    objc_msgSend_setRunInfo_(v13, v32, 0);
    objc_msgSend_setContext_(v13, v33, 0);
    objc_msgSend_setPreferredOutputFormat_(v13, v34, (uint64_t)&unk_270E1E750);
LABEL_4:
    uint64_t v18 = v13;
  }

  return v18;
}

- (UniKernel)initWithName:(id)a3 library:(id)a4
{
  return (UniKernel *)objc_msgSend_initWithName_library_constants_(self, a2, (uint64_t)a3, a4, 0);
}

- (UniKernel)init
{
  v15.receiver = self;
  v15.super_class = (Class)UniKernel;
  uint64_t v2 = [(UniKernel *)&v15 init];
  v4 = v2;
  if (v2)
  {
    objc_msgSend_setKernel_(v2, v3, 0);
    id v7 = objc_msgSend_weakToWeakObjectsMapTable(MEMORY[0x263F08968], v5, v6);
    objc_msgSend_setInputs_(v4, v8, (uint64_t)v7);

    objc_msgSend_setScale_(v4, v9, (uint64_t)&unk_270E1E738);
    objc_msgSend_setRoiCallback_(v4, v10, (uint64_t)&unk_270E12EF8);
    objc_msgSend_setRunInfo_(v4, v11, 0);
    objc_msgSend_setContext_(v4, v12, 0);
    objc_msgSend_setPreferredOutputFormat_(v4, v13, (uint64_t)&unk_270E1E750);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  id v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  if (!v7)
  {
    id v16 = 0;
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend_device(self, v8, v9), id v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    id v11 = v7;
    id v14 = objc_msgSend_device(self, v12, v13);
    id v16 = objc_msgSend_initWithDevice_(v11, v15, (uint64_t)v14);

    if (!v16) {
      goto LABEL_13;
    }
  }
  else
  {
    id v19 = v7;
    id v16 = objc_msgSend_init(v19, v20, v21);
    if (!v16) {
      goto LABEL_13;
    }
  }
  uint64_t v22 = objc_msgSend_inputs(self, v17, v18);
  v24 = objc_msgSend_copyWithZone_(v22, v23, (uint64_t)a3);
  objc_msgSend_setInputs_(v16, v25, (uint64_t)v24);

  v28 = objc_msgSend_device(self, v26, v27);
  objc_msgSend_setDevice_(v16, v29, (uint64_t)v28);

  v32 = objc_msgSend_scale(self, v30, v31);
  objc_msgSend_setScale_(v16, v33, (uint64_t)v32);

  objc_super v36 = objc_msgSend_roiCallback(self, v34, v35);
  objc_msgSend_setRoiCallback_(v16, v37, (uint64_t)v36);

  v40 = objc_msgSend_kernel(self, v38, v39);
  objc_msgSend_setKernel_(v16, v41, (uint64_t)v40);

  id v46 = objc_msgSend_runInfo(self, v42, v43);
  if (v46)
  {
    v47 = objc_msgSend_runInfo(self, v44, v45);
    uint64_t v50 = objc_msgSend_copy(v47, v48, v49);
    objc_msgSend_setRunInfo_(v16, v51, (uint64_t)v50);
  }
  else
  {
    objc_msgSend_setRunInfo_(v16, v44, 0);
  }

  v54 = objc_msgSend_context(self, v52, v53);
  objc_msgSend_setContext_(v16, v55, (uint64_t)v54);

  v58 = objc_msgSend_preferredOutputFormat(self, v56, v57);
  objc_msgSend_setPreferredOutputFormat_(v16, v59, (uint64_t)v58);

  v62 = objc_msgSend_context(v16, v60, v61);

  if (v62)
  {
    v65 = objc_msgSend_context(v16, v63, v64);
    objc_sync_enter(v65);
    v68 = objc_msgSend_context(v16, v66, v67);
    v71 = objc_msgSend_weakArray(v68, v69, v70);
    objc_msgSend_addPointer_(v71, v72, (uint64_t)v16);

    objc_sync_exit(v65);
  }
LABEL_13:

  return v16;
}

- (id)_flattenDict:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v5 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v4, (uint64_t)v3);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = v3;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v40, v45, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v41;
    uint64_t v31 = *(void *)v41;
    id v32 = v6;
    do
    {
      uint64_t v12 = 0;
      uint64_t v33 = v10;
      do
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v40 + 1) + 8 * v12);
        id v14 = objc_msgSend_objectForKeyedSubscript_(v6, v9, v13);
        if (v14)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v35 = v12;
            objc_msgSend_removeObjectForKey_(v5, v15, v13);
            v34 = v14;
            id v16 = v14;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v36, v44, 16);
            if (v18)
            {
              uint64_t v20 = v18;
              uint64_t v21 = *(void *)v37;
              do
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v37 != v21) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * i);
                  v24 = objc_msgSend_stringWithFormat_(NSString, v19, @"%@_%@", v13, v23);
                  uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v16, v25, v23);
                  objc_msgSend_setObject_forKeyedSubscript_(v5, v27, (uint64_t)v26, v24);
                }
                uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v36, v44, 16);
              }
              while (v20);
            }

            uint64_t v11 = v31;
            id v6 = v32;
            uint64_t v10 = v33;
            id v14 = v34;
            uint64_t v12 = v35;
          }
        }

        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v40, v45, 16);
    }
    while (v10);
  }

  v29 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v28, (uint64_t)v5);

  return v29;
}

- (id)_populateStruct:(id)a3 values:(id)a4
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_bufferDataType(v6, v8, v9) != 1) {
    goto LABEL_16;
  }
  size_t v12 = objc_msgSend_bufferDataSize(v6, v10, v11);
  uint64_t v13 = (void *)v12;
  if (!v12)
  {
    v58 = 0;
    goto LABEL_18;
  }
  id v14 = malloc_type_malloc(v12, 0x3E46312CuLL);
  if (!v14)
  {
LABEL_16:
    v58 = 0;
    uint64_t v13 = 0;
LABEL_18:
    uint64_t v51 = 0;
    goto LABEL_19;
  }
  uint64_t v17 = v14;
  v104 = v13;
  uint64_t v13 = objc_msgSend_bufferStructType(v6, v15, v16);

  if (v13)
  {
    uint64_t v20 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v21 = objc_msgSend_bufferStructType(v6, v18, v19);
    v24 = objc_msgSend_members(v21, v22, v23);
    uint64_t v27 = objc_msgSend_count(v24, v25, v26);
    uint64_t v13 = objc_msgSend_setWithCapacity_(v20, v28, v27);

    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    v106 = v6;
    uint64_t v31 = objc_msgSend_bufferStructType(v6, v29, v30);
    v34 = objc_msgSend_members(v31, v32, v33);

    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v119, v125, 16);
    if (v36)
    {
      uint64_t v39 = v36;
      uint64_t v40 = *(void *)v120;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v120 != v40) {
            objc_enumerationMutation(v34);
          }
          long long v42 = objc_msgSend_name(*(void **)(*((void *)&v119 + 1) + 8 * i), v37, v38);
          objc_msgSend_addObject_(v13, v43, (uint64_t)v42);
        }
        uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v119, v125, 16);
      }
      while (v39);
    }

    uint64_t v45 = objc_msgSend__flattenDict_(self, v44, (uint64_t)v7);

    uint64_t v46 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v49 = objc_msgSend_allKeys(v45, v47, v48);
    uint64_t v51 = objc_msgSend_setWithArray_(v46, v50, (uint64_t)v49);

    objc_msgSend_minusSet_(v13, v52, (uint64_t)v51);
    if (objc_msgSend_count(v13, v53, v54))
    {
      uni_logger_compile();
      uint64_t v57 = (char *)objc_claimAutoreleasedReturnValue();
      id v6 = v106;
      if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_ERROR)) {
        sub_262E4D86C((uint64_t)v13, v57);
      }

LABEL_50:
      v58 = 0;
    }
    else
    {
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      id v6 = v106;
      uint64_t v61 = objc_msgSend_bufferStructType(v106, v55, v56);
      uint64_t v64 = objc_msgSend_members(v61, v62, v63);

      obuint64_t j = v64;
      uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v115, v124, 16);
      if (v66)
      {
        uint64_t v69 = v66;
        uint64_t v70 = *(void *)v116;
        v101 = v45;
        v102 = v51;
        uint64_t v100 = *(void *)v116;
        while (2)
        {
          uint64_t v71 = 0;
          uint64_t v103 = v69;
          do
          {
            if (*(void *)v116 != v70) {
              objc_enumerationMutation(obj);
            }
            uint64_t v107 = v71;
            v72 = *(void **)(*((void *)&v115 + 1) + 8 * v71);
            v73 = objc_msgSend_name(v72, v67, v68);
            v75 = objc_msgSend_objectForKeyedSubscript_(v45, v74, (uint64_t)v73);

            v108 = v75;
            if (!v75) {
              goto LABEL_49;
            }
            uint64_t v78 = objc_msgSend_dataType(v72, v76, v77);
            uint64_t v113 = 0;
            uint64_t v114 = 0;
            uint64_t v79 = numComponentsForType(v78, &v114, &v113);
            if (!v114 || !v113) {
              goto LABEL_48;
            }
            uint64_t v80 = v79;
            if (v79 == 1)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_48;
              }
              uint64_t v83 = objc_msgSend_offset(v72, v81, v82);
              v84 = v75;
              packSingleValue(v75, 0, v83, v114, (uint64_t)v17);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_48;
              }
              id v85 = v75;
              if (objc_msgSend_count(v85, v86, v87) != v80)
              {

LABEL_48:
LABEL_49:

                goto LABEL_50;
              }
              long long v111 = 0u;
              long long v112 = 0u;
              long long v109 = 0u;
              long long v110 = 0u;
              id v88 = v85;
              uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v89, (uint64_t)&v109, v123, 16);
              if (v90)
              {
                uint64_t v93 = v90;
                uint64_t v94 = 0;
                uint64_t v95 = *(void *)v110;
                do
                {
                  for (uint64_t j = 0; j != v93; ++j)
                  {
                    if (*(void *)v110 != v95) {
                      objc_enumerationMutation(v88);
                    }
                    v97 = *(void **)(*((void *)&v109 + 1) + 8 * j);
                    uint64_t v98 = objc_msgSend_offset(v72, v91, v92);
                    packSingleValue(v97, v94 + j, v98, v114, (uint64_t)v17);
                  }
                  uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v91, (uint64_t)&v109, v123, 16);
                  v94 += j;
                }
                while (v93);

                id v6 = v106;
                uint64_t v45 = v101;
                uint64_t v51 = v102;
                uint64_t v70 = v100;
              }
              else
              {
              }
              uint64_t v69 = v103;
              v84 = v108;
            }

            uint64_t v71 = v107 + 1;
          }
          while (v107 + 1 != v69);
          uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v67, (uint64_t)&v115, v124, 16);
          if (v69) {
            continue;
          }
          break;
        }
      }

      v58 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v99, (uint64_t)v17, v104);
    }
  }
  else
  {
    v58 = 0;
    uint64_t v51 = 0;
    uint64_t v45 = v7;
  }
  free(v17);
  id v7 = v45;
LABEL_19:
  id v59 = v58;

  return v59;
}

+ (id)_mtlTextureForImage:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend_texture(v3, v4, v5);

    id v7 = objc_opt_class();
    objc_msgSend__mtlTextureForImage_(v7, v8, v6);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = (id)v6;
    goto LABEL_9;
  }
  if (objc_msgSend_conformsToProtocol_(v3, v4, (uint64_t)&unk_270E2A1A0))
  {
    id v9 = v3;
    id v3 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v11);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_8:
    id v9 = 0;
  }
LABEL_9:

  return v9;
}

- (id)_mtlTextureForImage:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend__mtlTextureForImage_(v4, v5, (uint64_t)v3);

  return v6;
}

- (void)_setNumber:(id)a3 forEncoder:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 || (id v9 = v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    sub_262E4D910();
  }
  if (!v9) {
    sub_262E4D93C();
  }
  id v10 = v7;
  uint64_t v13 = (const char *)objc_msgSend_objCType(v10, v11, v12);
  if (!v13 || (id v14 = (char *)v13, strlen(v13) != 1)) {
    sub_262E4D968();
  }
  float v35 = 0.0;
  int v17 = *v14;
  if (v17 <= 80)
  {
    if (v17 <= 72)
    {
      if (v17 == 66)
      {
        char v18 = objc_msgSend_BOOLValue(v10, v15, v16);
      }
      else
      {
        if (v17 != 67) {
          goto LABEL_41;
        }
        char v18 = objc_msgSend_unsignedCharValue(v10, v15, v16);
      }
LABEL_21:
      LOBYTE(v35) = v18;
      objc_msgSend_setBytes_length_atIndex_(v9, v19, (uint64_t)&v35, 1, a5);
      goto LABEL_36;
    }
    if (v17 == 73)
    {
      LODWORD(v25) = objc_msgSend_unsignedIntValue(v10, v15, v16);
LABEL_27:
      float v35 = v25;
    }
    else
    {
      if (v17 != 76) {
        goto LABEL_41;
      }
      LODWORD(v35) = objc_msgSend_unsignedLongValue(v10, v15, v16);
      if ((unint64_t)objc_msgSend_unsignedLongValue(v10, v20, v21) >> 32) {
        sub_262E4DA7C();
      }
    }
LABEL_35:
    objc_msgSend_setBytes_length_atIndex_(v9, v22, (uint64_t)&v35, 4, a5);
    goto LABEL_36;
  }
  switch(*v14)
  {
    case 'c':
      char v18 = objc_msgSend_charValue(v10, v15, v16);
      goto LABEL_21;
    case 'd':
      objc_msgSend_doubleValue(v10, v15, v16);
      float v27 = v26;
      goto LABEL_25;
    case 'e':
    case 'g':
    case 'h':
    case 'j':
    case 'k':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'r':
      goto LABEL_41;
    case 'f':
      objc_msgSend_floatValue(v10, v15, v16);
LABEL_25:
      float v35 = v27;
      goto LABEL_35;
    case 'i':
      LODWORD(v25) = objc_msgSend_intValue(v10, v15, v16);
      goto LABEL_27;
    case 'l':
      LODWORD(v35) = objc_msgSend_longValue(v10, v15, v16);
      if (objc_msgSend_longValue(v10, v28, v29) >= 0x80000000) {
        sub_262E4DA24();
      }
      goto LABEL_35;
    case 'q':
      LODWORD(v35) = objc_msgSend_longLongValue(v10, v15, v16);
      if (objc_msgSend_longLongValue(v10, v30, v31) >= 0x80000000) {
        sub_262E4DA50();
      }
      goto LABEL_35;
    case 's':
      __int16 v23 = objc_msgSend_shortValue(v10, v15, v16);
      goto LABEL_33;
    default:
      if (v17 == 81)
      {
        LODWORD(v35) = objc_msgSend_unsignedLongLongValue(v10, v15, v16);
        if ((unint64_t)objc_msgSend_unsignedLongLongValue(v10, v32, v33) >> 32) {
          sub_262E4DAA8();
        }
        goto LABEL_35;
      }
      if (v17 != 83)
      {
LABEL_41:
        v34 = uni_logger_api();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_262E4D994(v14, v34);
        }

        __assert_rtn("-[UniKernel _setNumber:forEncoder:atIndex:]", "UniKernel.m", 851, "length > 0");
      }
      __int16 v23 = objc_msgSend_unsignedShortValue(v10, v15, v16);
LABEL_33:
      LOWORD(v35) = v23;
      objc_msgSend_setBytes_length_atIndex_(v9, v24, (uint64_t)&v35, 2, a5);
LABEL_36:

      return;
  }
}

- (void)writeDebugTextures:(id)a3 filesWritten:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    if (v6)
    {
      id v7 = objc_opt_class();
      if (objc_msgSend_shouldWriteDebugTextures(v7, v8, v9)) {
        objc_msgSend__writeDebugTextures_filesWritten_(self, v10, (uint64_t)v11, v6);
      }
    }
  }
}

+ (BOOL)shouldWriteDebugTextures
{
  return 0;
}

- (id)_regionForTexture:(id)a3 name:(id)a4
{
  v36[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v8 = a4;
  if (!v5)
  {
    uint64_t v29 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_9;
  }
  uint64_t v9 = objc_msgSend_buffer(v5, v6, v7);
  uint64_t v12 = objc_msgSend_heap(v5, v10, v11);
  uint64_t v15 = objc_msgSend_height(v5, v13, v14);
  uint64_t v20 = objc_msgSend_bufferBytesPerRow(v5, v16, v17) * v15;
  if (v9)
  {
    v36[0] = v9;
    uint64_t v21 = NSNumber;
    uint64_t v22 = objc_msgSend_bufferOffset(v5, v18, v19);
    v24 = objc_msgSend_numberWithUnsignedInteger_(v21, v23, v22);
    v36[1] = v24;
    float v27 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v25, v20);
    v36[2] = v27;
    v28 = v36;
  }
  else
  {
    if (!v12)
    {
      uint64_t v29 = (void *)MEMORY[0x263EFFA68];
      goto LABEL_8;
    }
    v35[0] = v12;
    uint64_t v30 = NSNumber;
    uint64_t v31 = objc_msgSend_heapOffset(v5, v18, v19);
    v24 = objc_msgSend_numberWithUnsignedInteger_(v30, v32, v31);
    v35[1] = v24;
    float v27 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v33, v20);
    v35[2] = v27;
    v28 = v35;
  }
  v28[3] = v8;
  uint64_t v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v26, (uint64_t)v28, 4);

LABEL_8:
LABEL_9:

  return v29;
}

- (id)run:(id)a3
{
  uint64_t v275 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v257 = self;
  uint64_t v7 = objc_msgSend_mk(self, v5, v6);

  if (v7)
  {
    if (v4)
    {
      id v12 = v4;
      uint64_t v13 = v257;
    }
    else
    {
      uint64_t v13 = v257;
      uint64_t v15 = objc_msgSend_device(v257, v8, v9);
      id v12 = (id)objc_msgSend_newCommandQueue(v15, v16, v17);
    }
    char v18 = objc_msgSend_commandBuffer(v12, v10, v11);
    uint64_t v21 = objc_msgSend_mk(v13, v19, v20);
    v24 = objc_msgSend_label(v21, v22, v23);
    float v25 = v24;
    if (v24)
    {
      id v26 = v24;
    }
    else
    {
      float v27 = objc_opt_class();
      objc_msgSend_description(v27, v28, v29);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v30 = (uint64_t)v26;

    objc_msgSend_setLabel_(v18, v31, v30);
    v255 = v18;
    v34 = objc_msgSend_computeCommandEncoder(v18, v32, v33);
    v254 = (void *)v30;
    objc_msgSend_setLabel_(v34, v35, v30);
    uint64_t v38 = objc_msgSend_mk(v13, v36, v37);
    objc_msgSend_setComputePipelineState_(v34, v39, (uint64_t)v38);

    char shouldEmulate_sRGBForTexture = 0;
    long long v267 = 0u;
    long long v268 = 0u;
    long long v269 = 0u;
    long long v270 = 0u;
    long long v42 = objc_msgSend_kernel(v13, v40, v41);
    uint64_t v45 = objc_msgSend_arguments(v42, v43, v44);

    uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v267, v274, 16);
    if (v47)
    {
      uint64_t v50 = v47;
      id v252 = v12;
      id v253 = v4;
      uint64_t v51 = 0;
      v52 = 0;
      uint64_t v262 = -1;
      uint64_t v264 = *(void *)v268;
      v256 = v34;
      uint64_t v53 = v257;
      v261 = v45;
      while (1)
      {
        uint64_t v54 = 0;
        do
        {
          if (*(void *)v268 != v264) {
            objc_enumerationMutation(v45);
          }
          v55 = *(void **)(*((void *)&v267 + 1) + 8 * v54);
          uint64_t v56 = objc_msgSend_name(v55, v48, v49);
          int isEqualToString = objc_msgSend_isEqualToString_(v56, v57, @"emulate_sRGB");

          if (isEqualToString)
          {
            uint64_t v262 = objc_msgSend_index(v55, v59, v60);
            goto LABEL_38;
          }
          if (objc_msgSend_type(v55, v59, v60) == 2)
          {
            inputs = v53->inputs;
            uint64_t v64 = objc_msgSend_name(v55, v61, v62);
            uint64_t v66 = objc_msgSend_objectForKeyedSubscript_(inputs, v65, (uint64_t)v64);

            if (v66)
            {
              uint64_t v69 = objc_msgSend__mtlTextureForImage_(UniKernel, v67, (uint64_t)v66);
              if (v69)
              {
                uint64_t v70 = v69;
                if (objc_msgSend_access(v55, v67, v68) == 1) {
                  sub_262E4DB00();
                }
                if (objc_msgSend_access(v55, v71, v72) == 2)
                {
                  v74 = v70;

                  char shouldEmulate_sRGBForTexture = objc_msgSend__shouldEmulate_sRGBForTexture_(UniKernel, v75, (uint64_t)v74);
                  uint64_t v51 = v74;
                  uint64_t v45 = v261;
                }
                if (objc_msgSend_conformsToProtocol_(v70, v73, (uint64_t)&unk_270E2A1A0))
                {
                  uint64_t v78 = objc_msgSend_index(v55, v76, v77);
                  objc_msgSend_setTexture_atIndex_(v34, v79, (uint64_t)v70, v78);
                }
                if (!v52)
                {
                  uint64_t v70 = v70;
                  v52 = v70;
                }
                goto LABEL_36;
              }
            }
            uint64_t v98 = objc_msgSend_access(v55, v67, v68);
            uint64_t v70 = uni_logger_render();
            BOOL v99 = os_log_type_enabled(v70, OS_LOG_TYPE_INFO);
            if (v98 == 2)
            {
              v219 = v52;
              if (v99)
              {
                v226 = NSString;
                v227 = objc_msgSend_name(v55, v100, v101);
                objc_msgSend_stringWithFormat_(v226, v228, @"Output texture for %@ is missing (which may be ok)", v227);
                id v229 = objc_claimAutoreleasedReturnValue();
                uint64_t v232 = objc_msgSend_UTF8String(v229, v230, v231);
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = v232;
                _os_log_impl(&dword_262E0F000, v70, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
              }
LABEL_95:
              id v12 = v252;
              id v4 = v253;
              v192 = v255;

              goto LABEL_96;
            }
            if (v99)
            {
              v102 = NSString;
              uint64_t v103 = objc_msgSend_name(v55, v100, v101);
              objc_msgSend_stringWithFormat_(v102, v104, @"Input texture for %@ is missing (which may be ok)", v103);
              id v105 = objc_claimAutoreleasedReturnValue();
              uint64_t v108 = objc_msgSend_UTF8String(v105, v106, v107);
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = v108;
              _os_log_impl(&dword_262E0F000, v70, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
            }
            uint64_t v70 = 0;
LABEL_35:
            uint64_t v45 = v261;
LABEL_36:

            goto LABEL_37;
          }
          if (!objc_msgSend_type(v55, v61, v62))
          {
            long long v109 = v53->inputs;
            long long v110 = objc_msgSend_name(v55, v80, v81);
            uint64_t v66 = objc_msgSend_objectForKeyedSubscript_(v109, v111, (uint64_t)v110);

            if (!v66)
            {
              uint64_t v114 = objc_msgSend_name(v55, v112, v113);
              int v116 = objc_msgSend_isEqualToString_(v114, v115, @"kernelScale");

              if (!v116)
              {
                uint64_t v66 = uni_logger_api();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                {
                  v250 = NSString;
                  v251 = objc_msgSend_name(v55, v160, v161);
                  v259 = objc_msgSend_kernel(v53, v162, v163);
                  v166 = objc_msgSend_mk(v259, v164, v165);
                  v169 = objc_msgSend_label(v166, v167, v168);
                  objc_msgSend_stringWithFormat_(v250, v170, @"missing object for input parameter %@ on kernel %@", v251, v169);
                  id v171 = objc_claimAutoreleasedReturnValue();
                  uint64_t v174 = objc_msgSend_UTF8String(v171, v172, v173);
                  *(_DWORD *)buf = 136446466;
                  *(void *)&uint8_t buf[4] = "-[UniKernel run:]";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = v174;
                  _os_log_error_impl(&dword_262E0F000, v66, OS_LOG_TYPE_ERROR, "%{public}s %s", buf, 0x16u);

                  uint64_t v45 = v261;
                }
                goto LABEL_37;
              }
              uint64_t v66 = objc_msgSend_scale(v53, v117, v118);
            }
            if (objc_msgSend_bufferDataType(v55, v112, v113) == 1)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v122 = objc_msgSend__populateStruct_values_(v53, v121, (uint64_t)v55, v66);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  && !objc_msgSend_conformsToProtocol_(v66, v134, (uint64_t)&unk_270E2BE00))
                {
                  v219 = v52;
                  uint64_t v70 = uni_logger_api();
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                    sub_262E4DCAC();
                  }
                  goto LABEL_95;
                }
                long long v122 = v66;
              }
              uint64_t v70 = v122;
              if (!v122)
              {
                v219 = v52;
                uint64_t v70 = uni_logger_api();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                  sub_262E4DB2C();
                }
                goto LABEL_95;
              }
              v258 = v52;
              v135 = v51;
              int v136 = objc_msgSend_conformsToProtocol_(v122, v123, (uint64_t)&unk_270E2BE00);
              uint64_t v139 = objc_msgSend_length(v70, v137, v138);
              uint64_t v142 = objc_msgSend_bufferDataSize(v55, v140, v141);
              if (v136)
              {
                if (v139 != v142) {
                  sub_262E4DC28();
                }
                uint64_t v51 = v135;
                uint64_t v145 = objc_msgSend_index(v55, v143, v144);
                objc_msgSend_setBuffer_offset_atIndex_(v34, v146, (uint64_t)v70, 0, v145);
              }
              else
              {
                if (v139 != v142) {
                  sub_262E4DC80();
                }
                if ((unint64_t)objc_msgSend_length(v70, v143, v144) <= 0x1000)
                {
                  uint64_t v70 = v70;
                  uint64_t v181 = objc_msgSend_bytes(v70, v179, v180);
                  uint64_t v184 = objc_msgSend_length(v70, v182, v183);
                  uint64_t v187 = objc_msgSend_index(v55, v185, v186);
                  objc_msgSend_setBytes_length_atIndex_(v34, v188, v181, v184, v187);
                }
                else
                {
                  v153 = objc_msgSend_device(v53, v151, v152);
                  v155 = objc_msgSend_bufferFromData_device_(UniDeviceCache, v154, (uint64_t)v70, v153);

                  if (!v155) {
                    sub_262E4DC54();
                  }
                  uint64_t v158 = objc_msgSend_index(v55, v156, v157);
                  v34 = v256;
                  objc_msgSend_setBuffer_offset_atIndex_(v256, v159, (uint64_t)v155, 0, v158);
                }
                uint64_t v51 = v135;
              }
              v52 = v258;
            }
            else
            {
              uint64_t v124 = objc_msgSend_bufferDataType(v55, v119, v120);
              if (!isSupportedType(v124))
              {
                v219 = v52;
                uint64_t v70 = uni_logger_render();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                {
                  v235 = v51;
                  v236 = NSString;
                  uint64_t v237 = objc_msgSend_bufferDataType(v55, v233, v234);
                  v239 = MTLDataTypeAsString(v237, v238);
                  v242 = objc_msgSend_name(v55, v240, v241);
                  objc_msgSend_stringWithFormat_(v236, v243, @"Unhandled Metal buffer data type %@ for argument: %@", v239, v242);
                  id v244 = objc_claimAutoreleasedReturnValue();
                  uint64_t v247 = objc_msgSend_UTF8String(v244, v245, v246);
                  *(_DWORD *)buf = 136315138;
                  *(void *)&uint8_t buf[4] = v247;
                  _os_log_impl(&dword_262E0F000, v70, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);

                  uint64_t v51 = v235;
                }
                goto LABEL_95;
              }
              uint64_t v70 = v66;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v149 = objc_msgSend_index(v55, v147, v148);
                  objc_msgSend__setNumber_forEncoder_atIndex_(v53, v150, (uint64_t)v70, v34, v149);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v219 = v52;
                    v248 = uni_logger_api();
                    if (os_log_type_enabled(v248, OS_LOG_TYPE_ERROR)) {
                      sub_262E4DB2C();
                    }

                    uint64_t v66 = v70;
                    goto LABEL_95;
                  }
                  *(_DWORD *)buf = 0;
                  uint64_t v177 = objc_msgSend_index(v55, v175, v176);
                  objc_msgSend_setBytes_length_atIndex_(v34, v178, (uint64_t)buf, 4, v177);
                }
                goto LABEL_36;
              }
              v127 = objc_msgSend_device(v53, v125, v126);
              v129 = objc_msgSend_bufferFromData_device_(UniDeviceCache, v128, (uint64_t)v70, v127);

              if (!v129) {
                sub_262E4DDA8();
              }
              uint64_t v132 = objc_msgSend_index(v55, v130, v131);
              v34 = v256;
              objc_msgSend_setBuffer_offset_atIndex_(v256, v133, (uint64_t)v129, 0, v132);

              uint64_t v53 = v257;
            }
            goto LABEL_35;
          }
          if (objc_msgSend_type(v55, v80, v81) != 1) {
            goto LABEL_38;
          }
          uint64_t v82 = v53->inputs;
          uint64_t v83 = objc_msgSend_name(v55, v48, v49);
          uint64_t v66 = objc_msgSend_objectForKeyedSubscript_(v82, v84, (uint64_t)v83);

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            sub_262E4DE00();
          }
          uint64_t v87 = objc_msgSend_unsignedIntegerValue(v66, v85, v86);
          uint64_t v90 = v87 + objc_msgSend_threadgroupMemoryAlignment(v55, v88, v89) - 1;
          uint64_t v95 = v90 & -objc_msgSend_threadgroupMemoryAlignment(v55, v91, v92);
          if (!v95) {
            sub_262E4DDD4();
          }
          uint64_t v96 = objc_msgSend_index(v55, v93, v94);
          objc_msgSend_setThreadgroupMemoryLength_atIndex_(v34, v97, v95, v96);
LABEL_37:

LABEL_38:
          ++v54;
        }
        while (v50 != v54);
        uint64_t v189 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v267, v274, 16);
        uint64_t v50 = v189;
        if (!v189)
        {

          if (!v52)
          {
            id v12 = v252;
            id v4 = v253;
            goto LABEL_80;
          }
          id v4 = v253;
          v192 = v255;
          if (v262 != -1) {
            objc_msgSend_setBytes_length_atIndex_(v34, v190, (uint64_t)&shouldEmulate_sRGBForTexture, 1);
          }
          v195 = objc_msgSend_runInfo(v257, v190, v191);
          id v12 = v252;
          if (!v195)
          {
            uint64_t v265 = objc_msgSend_width(v51, v193, v194);
            v260 = v52;
            uint64_t v198 = objc_msgSend_height(v51, v196, v197);
            v201 = objc_msgSend_mk(v257, v199, v200);
            uint64_t v263 = objc_msgSend_threadExecutionWidth(v201, v202, v203);
            objc_msgSend_mk(v257, v204, v205);
            v207 = v206 = v51;
            unint64_t v210 = objc_msgSend_maxTotalThreadsPerThreadgroup(v207, v208, v209);
            v213 = objc_msgSend_mk(v257, v211, v212);
            unint64_t v216 = v210 / objc_msgSend_threadExecutionWidth(v213, v214, v215);

            v34 = v256;
            uint64_t v51 = v206;

            v217 = [UniRunInfo alloc];
            *(void *)buf = v265;
            *(void *)&buf[8] = v198;
            v52 = v260;
            *(void *)&buf[16] = 1;
            v266[0] = v263;
            v266[1] = v216;
            v266[2] = 1;
            v195 = objc_msgSend_initWithGridSize_threadsPerThreadGroup_(v217, v218, (uint64_t)buf, v266);
            if (!v195) {
              sub_262E4DAD4();
            }
          }
          v219 = v52;
          objc_msgSend_dispatchOn_(v195, v193, (uint64_t)v34);
          objc_msgSend_endEncoding(v34, v220, v221);
          objc_msgSend_kDebugFlagForKernel(v257, v222, v223);
          goto LABEL_97;
        }
      }
    }

    uint64_t v51 = 0;
LABEL_80:
    v192 = v255;
    v225 = uni_logger_render();
    if (os_log_type_enabled(v225, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262E0F000, v225, OS_LOG_TYPE_INFO, "First texture unspecified. Error for now", buf, 2u);
    }

    v219 = 0;
LABEL_96:
    v195 = 0;
LABEL_97:
    uint64_t v14 = 0;
    if (v192 && v51)
    {
      v272[0] = v192;
      v272[1] = v51;
      uint64_t v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v224, (uint64_t)v272, 2);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)makeBufferCpuAccessible:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_device(v3, v4, v5);
  uint64_t v9 = objc_msgSend_length(v3, v7, v8);
  uint64_t v11 = objc_msgSend_newBufferWithLength_options_(v6, v10, v9, 0);

  uint64_t v14 = objc_msgSend_device(v3, v12, v13);
  uint64_t v17 = objc_msgSend_newCommandQueue(v14, v15, v16);
  uint64_t v20 = objc_msgSend_commandBuffer(v17, v18, v19);

  uint64_t v23 = objc_msgSend_blitCommandEncoder(v20, v21, v22);
  uint64_t v26 = objc_msgSend_length(v3, v24, v25);
  objc_msgSend_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_(v23, v27, (uint64_t)v3, 0, v11, 0, v26);

  objc_msgSend_endEncoding(v23, v28, v29);
  objc_msgSend_commit(v20, v30, v31);
  objc_msgSend_waitUntilCompleted(v20, v32, v33);
  id v34 = v11;

  return v34;
}

- (int)_outputFormatForMetalFormat:(unint64_t)a3
{
  int v4 = *MEMORY[0x263F00888];
  if ((uint64_t)a3 <= 64)
  {
    if ((uint64_t)a3 > 24)
    {
      if (a3 == 25)
      {
        uint64_t v5 = (int *)MEMORY[0x263F008D0];
        return *v5;
      }
      if (a3 == 30)
      {
        uint64_t v5 = (int *)MEMORY[0x263F00898];
        return *v5;
      }
    }
    else
    {
      if (!a3) {
        return v4;
      }
      if (a3 == 10)
      {
        uint64_t v5 = (int *)MEMORY[0x263F00890];
        return *v5;
      }
    }
  }
  else
  {
    if ((uint64_t)a3 > 70)
    {
      if (a3 != 71)
      {
        if (a3 == 115)
        {
          uint64_t v5 = (int *)MEMORY[0x263F008C0];
          return *v5;
        }
        if (a3 == 125)
        {
          uint64_t v5 = (int *)MEMORY[0x263F008B8];
          return *v5;
        }
        goto LABEL_22;
      }
LABEL_13:
      uint64_t v5 = (int *)MEMORY[0x263F008B0];
      return *v5;
    }
    if (a3 == 65)
    {
      uint64_t v5 = (int *)MEMORY[0x263F008C8];
      return *v5;
    }
    if (a3 == 70) {
      goto LABEL_13;
    }
  }
LABEL_22:
  uint64_t v7 = uni_logger_api();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_262E4DE2C(a3, v7);
  }

  return v4;
}

- (int)_promoteFormatForCoreImage:(int)a3
{
  if (*MEMORY[0x263F00890] == a3)
  {
    id v3 = (int *)MEMORY[0x263F008D0];
    return *v3;
  }
  if (*MEMORY[0x263F00898] == a3)
  {
    id v3 = (int *)MEMORY[0x263F008C8];
    return *v3;
  }
  if (*MEMORY[0x263F008B0] == a3) {
    return *MEMORY[0x263F008C0];
  }
  else {
    return a3;
  }
}

+ (BOOL)_shouldEmulate_sRGBForTexture:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_parentTexture(v3, v4, v5);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_parentTexture(v3, v6, v7);
    if (objc_msgSend_pixelFormat(v9, v10, v11) == 71)
    {
      BOOL v14 = 1;
    }
    else
    {
      uint64_t v15 = objc_msgSend_parentTexture(v3, v12, v13);
      if (objc_msgSend_pixelFormat(v15, v16, v17) == 31)
      {
        BOOL v14 = 1;
      }
      else
      {
        uint64_t v20 = objc_msgSend_parentTexture(v3, v18, v19);
        BOOL v14 = objc_msgSend_pixelFormat(v20, v21, v22) == 11;
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (id)_outputTextureForTexture:(id)a3 force:(BOOL)a4
{
  id v5 = a3;
  uint64_t v8 = v5;
  if (a4)
  {
    uint64_t v9 = objc_msgSend_device(v5, v6, v7, 0, 0, 0, 0, 0, 0, 0);
    objc_msgSend_pixelFormat(v8, v10, v11);
    MTLPixelFormatGetInfoForDevice();

    if ((v22 & 8) != 0)
    {
      if ((objc_msgSend_usage(v8, v12, v13) & 0x10) == 0) {
        sub_262E4DEE0();
      }
      uint64_t v16 = objc_msgSend_pixelFormat(v8, v14, v15);
      switch(v16)
      {
        case 11:
          uint64_t v18 = objc_msgSend_newTextureViewWithPixelFormat_(v8, v17, 10);
          break;
        case 71:
          uint64_t v18 = objc_msgSend_newTextureViewWithPixelFormat_(v8, v17, 70);
          break;
        case 31:
          uint64_t v18 = objc_msgSend_newTextureViewWithPixelFormat_(v8, v17, 30);
          break;
        default:
          sub_262E4DF0C();
      }
      uint64_t v19 = (void *)v18;

      uint64_t v8 = v19;
    }
  }
  id v20 = v8;

  return v20;
}

- (CGRect)extentForImage:(id)a3
{
  id v3 = a3;
  id v5 = v3;
  if (v3)
  {
    if (objc_msgSend_conformsToProtocol_(v3, v4, (uint64_t)&unk_270E2A1A0))
    {
      id v6 = v5;
      uint64_t v9 = objc_msgSend_width(v6, v7, v8);
LABEL_13:
      double v14 = (double)(unint64_t)v9;
      double v15 = (double)(unint64_t)objc_msgSend_height(v6, v10, v11);

      double v12 = 0.0;
      double v13 = 0.0;
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend_texture(v5, v16, v17);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        id v20 = objc_msgSend_image(v5, v18, v19);
        id v6 = v20;
        if (v20)
        {
          objc_msgSend_extent(v20, v18, v19);
          double v12 = v21;
          double v13 = v22;
          double v14 = v23;
          double v15 = v24;

          goto LABEL_14;
        }
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_extent(v5, v18, v19);
        double v12 = v25;
        double v13 = v26;
        double v14 = v27;
        double v15 = v28;
        goto LABEL_14;
      }
      id v6 = 0;
    }
    uint64_t v9 = objc_msgSend_width(v6, v18, v19);
    goto LABEL_13;
  }
  double v12 = *MEMORY[0x263F001A0];
  double v13 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v14 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v15 = *(double *)(MEMORY[0x263F001A0] + 24);
LABEL_14:

  double v29 = v12;
  double v30 = v13;
  double v31 = v14;
  double v32 = v15;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (unint64_t)_outputFormatForImage:(id)a3
{
  id v3 = a3;
  id v5 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  if (objc_msgSend_conformsToProtocol_(v3, v4, (uint64_t)&unk_270E2A1A0))
  {
    uint64_t v8 = objc_msgSend_pixelFormat(v5, v6, v7);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  uint64_t v8 = objc_msgSend_texture(v5, v9, v10);

  if (v8)
  {
    double v13 = objc_msgSend_texture(v5, v11, v12);
    uint64_t v8 = objc_msgSend_pixelFormat(v13, v14, v15);
  }
LABEL_8:

  return (unint64_t)v8;
}

- (id)_ciImageForInput:(id)a3
{
  id v6 = a3;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_emptyImage(MEMORY[0x263F00650], v4, v5);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
    uint64_t v8 = v7;
    goto LABEL_5;
  }
  if (objc_msgSend_conformsToProtocol_(v6, v4, (uint64_t)&unk_270E2A1A0))
  {
    objc_msgSend_imageWithMTLTexture_options_(MEMORY[0x263F00650], v10, (uint64_t)v6, MEMORY[0x263EFFA78]);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend_image(v6, v11, v12);
    if (v8) {
      goto LABEL_5;
    }
    double v14 = objc_msgSend__mtlTextureForImage_(UniKernel, v13, (uint64_t)v6);
    if (v14)
    {
      uint64_t v16 = v14;
      if (objc_msgSend_conformsToProtocol_(v14, v15, (uint64_t)&unk_270E2A1A0)) {
        objc_msgSend_imageWithMTLTexture_options_(MEMORY[0x263F00650], v17, (uint64_t)v16, 0);
      }
      else {
      uint64_t v8 = objc_msgSend__ciImageForInput_(self, v17, (uint64_t)v16);
      }

      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v18 = uni_logger_api();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_262E4DF38(v18);
    }
  }
  uint64_t v8 = 0;
LABEL_5:

  return v8;
}

- (id)outputImageOfSize:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    uint64_t v8 = objc_msgSend_kernel(v4, v5, v6);
    if (!v8) {
      goto LABEL_8;
    }
    uint64_t v11 = (void *)v8;
    uint64_t v12 = objc_msgSend_kernel(v7, v9, v10);
    uint64_t v17 = objc_msgSend_runInfo(v12, v13, v14);
    if (v17)
    {
      uint64_t v18 = objc_msgSend_kernel(v7, v15, v16);
      double v21 = objc_msgSend_runInfo(v18, v19, v20);
      double v24 = objc_msgSend_copy(v21, v22, v23);
    }
    else
    {
      double v24 = 0;
    }

    if (!v24)
    {
LABEL_8:
      double v26 = [UniRunInfo alloc];
      double v24 = objc_msgSend_initWithImage_(v26, v27, (uint64_t)v7);
    }
    objc_msgSend_outputImage_(self, v25, (uint64_t)v24);
  }
  else
  {
    double v24 = 0;
    objc_msgSend_outputImage_(self, v5, 0);
  double v28 = };

  return v28;
}

- (id)_intputOrOutputNameArray:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = objc_msgSend_array(MEMORY[0x263EFF980], a2, a3);
  long long v29 = 0u;
  long long v30 = 0u;
  if (v3) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 2;
  }
  long long v31 = 0uLL;
  long long v32 = 0uLL;
  uint64_t v9 = objc_msgSend_kernel(self, v5, v6, (void)v29);
  uint64_t v12 = objc_msgSend_arguments(v9, v10, v11);

  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v29, v33, 16);
  if (v14)
  {
    uint64_t v17 = v14;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v12);
        }
        uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (v8 == objc_msgSend_access(v20, v15, v16) && objc_msgSend_type(v20, v15, v16) == 2)
        {
          double v21 = objc_msgSend_name(v20, v15, v16);
          if (!v21) {
            sub_262E4DF7C();
          }

          double v24 = objc_msgSend_name(v20, v22, v23);
          objc_msgSend_addObject_(v7, v25, (uint64_t)v24);
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v29, v33, 16);
    }
    while (v17);
  }

  double v27 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v26, (uint64_t)v7);

  return v27;
}

- (id)inputNameArray
{
  return (id)MEMORY[0x270F9A6D0](self, sel__intputOrOutputNameArray_, 1);
}

- (id)outputNameArray
{
  return (id)MEMORY[0x270F9A6D0](self, sel__intputOrOutputNameArray_, 0);
}

- (id)_inputOrOutputArray:(BOOL)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (a3) {
    objc_msgSend_inputNameArray(self, a2, a3);
  }
  else {
  uint64_t v5 = objc_msgSend_outputNameArray(self, a2, a3);
  }
  uint64_t v8 = v5;
  if (v5 && (uint64_t v9 = objc_msgSend_count(v5, v6, v7)) != 0)
  {
    uint64_t v11 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v10, v9);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v36 = v8;
    id v12 = v8;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v37, v41, 16);
    if (v14)
    {
      uint64_t v17 = v14;
      uint64_t v18 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v12);
          }
          uint64_t v20 = *(const char **)(*((void *)&v37 + 1) + 8 * i);
          double v21 = objc_msgSend_inputs(self, v15, v16);
          uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v20);

          if (v23)
          {
            if (objc_msgSend_conformsToProtocol_(v23, v15, (uint64_t)&unk_270E2A1A0))
            {
              uint64_t v25 = rootTexture(v23);

              uint64_t v23 = (void *)v25;
            }
            if (a3 || (uint64_t v26 = objc_opt_class(), v26 == objc_opt_class()))
            {
              objc_msgSend_addObject_(v11, v24, (uint64_t)v23);
            }
            else
            {
              double v28 = objc_msgSend_inputs(self, v24, v27);
              long long v30 = objc_msgSend_objectForKeyedSubscript_(v28, v29, (uint64_t)v20);
              objc_msgSend_addObject_(v11, v31, (uint64_t)v30);
            }
          }
          else if (!a3)
          {
            uint64_t v34 = uni_logger_api();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              sub_262E4DFA8(self, v20, v34);
            }

            uint64_t v33 = (void *)MEMORY[0x263EFFA68];
            goto LABEL_27;
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v37, v41, 16);
        if (v17) {
          continue;
        }
        break;
      }
    }

    uint64_t v33 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v32, (uint64_t)v11);
LABEL_27:
    uint64_t v8 = v36;
  }
  else
  {
    uint64_t v33 = (void *)MEMORY[0x263EFFA68];
  }

  return v33;
}

- (id)_inputOrOutputBufferArray:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v41 = *MEMORY[0x263EF8340];
  float v35 = objc_msgSend_array(MEMORY[0x263EFF980], a2, a3);
  long long v36 = 0u;
  long long v37 = 0u;
  if (v3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 2;
  }
  long long v38 = 0uLL;
  long long v39 = 0uLL;
  uint64_t v8 = objc_msgSend_kernel(self, v5, v6);
  uint64_t v11 = objc_msgSend_arguments(v8, v9, v10);

  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v36, v40, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (v7 == objc_msgSend_access(v19, v14, v15) && !objc_msgSend_type(v19, v14, v15))
        {
          uint64_t v20 = objc_msgSend_inputs(self, v14, v15);
          uint64_t v23 = objc_msgSend_name(v19, v21, v22);
          uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v20, v24, (uint64_t)v23);

          if (objc_msgSend_access(v19, v26, v27) == 2 && v25 == 0)
          {
            uint64_t v33 = uni_logger_api();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              sub_262E4E0AC();
            }

            long long v32 = (void *)MEMORY[0x263EFFA68];
            long long v30 = v35;
            goto LABEL_24;
          }
          if (v25) {
            objc_msgSend_addObject_(v35, v28, (uint64_t)v25);
          }
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v36, v40, 16);
      if (v16) {
        continue;
      }
      break;
    }
  }

  long long v30 = v35;
  long long v32 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v31, (uint64_t)v35);
LABEL_24:

  return v32;
}

- (id)inputImageArray
{
  return (id)MEMORY[0x270F9A6D0](self, sel__inputOrOutputArray_, 1);
}

- (id)outputImageArray
{
  return (id)MEMORY[0x270F9A6D0](self, sel__inputOrOutputArray_, 0);
}

- (id)outputBufferArray
{
  return (id)MEMORY[0x270F9A6D0](self, sel__inputOrOutputBufferArray_, 0);
}

- (id)inputBufferArray
{
  return (id)MEMORY[0x270F9A6D0](self, sel__inputOrOutputBufferArray_, 1);
}

- (CGRect)_findOutputRect
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_kernel(self, a2, v2);
  if (!v4) {
    sub_262E4E1A8();
  }

  uint64_t v7 = objc_msgSend_kernel(self, v5, v6);
  uint64_t v10 = objc_msgSend_arguments(v7, v8, v9);
  if (!v10) {
    sub_262E4E1D4();
  }
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v17 = objc_msgSend_kernel(self, v15, v16, 0);
  uint64_t v20 = objc_msgSend_arguments(v17, v18, v19);

  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v48, v52, 16);
  if (v22)
  {
    uint64_t v25 = v22;
    uint64_t v26 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v49 != v26) {
          objc_enumerationMutation(v20);
        }
        double v28 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (objc_msgSend_access(v28, v23, v24) == 2 && objc_msgSend_type(v28, v23, v24) == 2)
        {
          long long v29 = objc_msgSend_inputs(self, v23, v24);
          long long v32 = objc_msgSend_name(v28, v30, v31);
          uint64_t v34 = objc_msgSend_objectForKeyedSubscript_(v29, v33, (uint64_t)v32);
          objc_msgSend_extentForImage_(self, v35, (uint64_t)v34);
          CGFloat v37 = v36;
          CGFloat v39 = v38;
          CGFloat v41 = v40;
          CGFloat v43 = v42;

          v54.origin.CGFloat x = v37;
          v54.origin.CGFloat y = v39;
          v54.size.CGFloat width = v41;
          v54.size.CGFloat height = v43;
          if (!CGRectIsNull(v54))
          {
            v55.origin.CGFloat x = x;
            v55.origin.CGFloat y = y;
            v55.size.CGFloat width = width;
            v55.size.CGFloat height = height;
            if (CGRectIsNull(v55))
            {
              CGFloat height = v43;
              CGFloat width = v41;
              CGFloat y = v39;
              CGFloat x = v37;
            }
            else
            {
              v56.origin.CGFloat x = x;
              v56.origin.CGFloat y = y;
              v56.size.CGFloat width = width;
              v56.size.CGFloat height = height;
              v59.origin.CGFloat x = v37;
              v59.origin.CGFloat y = v39;
              v59.size.CGFloat width = v41;
              v59.size.CGFloat height = v43;
              CGRect v57 = CGRectUnion(v56, v59);
              CGFloat x = v57.origin.x;
              CGFloat y = v57.origin.y;
              CGFloat width = v57.size.width;
              CGFloat height = v57.size.height;
            }
          }
        }
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v48, v52, 16);
    }
    while (v25);
  }

  double v44 = x;
  double v45 = y;
  double v46 = width;
  double v47 = height;
  result.size.CGFloat height = v47;
  result.size.CGFloat width = v46;
  result.origin.CGFloat y = v45;
  result.origin.CGFloat x = v44;
  return result;
}

+ (id)generateCIImage:(id)a3
{
  uint64_t v612 = *MEMORY[0x263EF8340];
  id v545 = a3;
  uint64_t v7 = objc_msgSend_runInfo(v545, v3, v4);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_runInfo(v545, v5, v6);
    objc_msgSend_outputExtent(v8, v9, v10);
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
  }
  else
  {
    CGFloat v12 = *MEMORY[0x263F001A0];
    CGFloat v14 = *(double *)(MEMORY[0x263F001A0] + 8);
    CGFloat v16 = *(double *)(MEMORY[0x263F001A0] + 16);
    CGFloat v18 = *(double *)(MEMORY[0x263F001A0] + 24);
  }

  objc_msgSend_preferredOutputFormat(v545, v19, v20);
  double v21 = (char *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    uint64_t v24 = objc_msgSend_preferredOutputFormat(v545, v22, v23);
    double v21 = (char *)objc_msgSend_unsignedIntegerValue(v24, v25, v26);
  }
  uint64_t v27 = (void *)MEMORY[0x263EFF9C0];
  double v28 = objc_msgSend_kernel(v545, v22, v23);
  uint64_t v31 = objc_msgSend_arguments(v28, v29, v30);
  uint64_t v34 = objc_msgSend_count(v31, v32, v33);
  double v36 = objc_msgSend_setWithCapacity_(v27, v35, v34);

  long long v592 = 0u;
  long long v593 = 0u;
  long long v590 = 0u;
  long long v591 = 0u;
  CGFloat v39 = objc_msgSend_kernel(v545, v37, v38);
  double v42 = objc_msgSend_arguments(v39, v40, v41);

  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v590, v611, 16);
  if (v46)
  {
    uint64_t v47 = *(void *)v591;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v591 != v47) {
          objc_enumerationMutation(v42);
        }
        long long v49 = objc_msgSend_name(*(void **)(*((void *)&v590 + 1) + 8 * i), v44, v45);
        objc_msgSend_addObject_(v36, v50, (uint64_t)v49);
      }
      uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v44, (uint64_t)&v590, v611, 16);
    }
    while (v46);
  }

  v544 = objc_msgSend_set(MEMORY[0x263EFF9C0], v51, v52);
  CGRect v55 = objc_msgSend_inputs(v545, v53, v54);
  v543 = objc_msgSend_keyEnumerator(v55, v56, v57);

  uint64_t v61 = objc_msgSend_nextObject(v543, v58, v59);
  if (v61)
  {
    do
    {
      objc_msgSend_addObject_(v544, v60, (uint64_t)v61);
      uint64_t v64 = objc_msgSend_nextObject(v543, v62, v63);

      uint64_t v61 = (void *)v64;
    }
    while (v64);
  }
  objc_msgSend_addObject_(v544, v60, @"emulate_sRGB");
  objc_msgSend_addObject_(v544, v65, @"kernelScale");
  objc_msgSend_minusSet_(v36, v66, (uint64_t)v544);
  if (objc_msgSend_count(v36, v67, v68))
  {
    uint64_t v71 = uni_logger_render();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      v74 = NSString;
      v75 = objc_msgSend_mk(v545, v72, v73);
      uint64_t v78 = objc_msgSend_label(v75, v76, v77);
      objc_msgSend_stringWithFormat_(v74, v79, @"For kernel %@, missing kernel arguments = %@", v78, v36);
      id v80 = objc_claimAutoreleasedReturnValue();
      uint64_t v83 = objc_msgSend_UTF8String(v80, v81, v82);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v83;
      _os_log_impl(&dword_262E0F000, v71, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
    }
  }
  char shouldEmulate_sRGBForTexture = 0;
  long long v585 = 0u;
  long long v586 = 0u;
  long long v587 = 0u;
  long long v588 = 0u;
  v84 = objc_msgSend_kernel(v545, v69, v70);
  uint64_t v87 = objc_msgSend_arguments(v84, v85, v86);

  uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v585, v610, 16);
  if (v91)
  {
    uint64_t v92 = *(void *)v586;
    while (2)
    {
      for (uint64_t j = 0; j != v91; ++j)
      {
        if (*(void *)v586 != v92) {
          objc_enumerationMutation(v87);
        }
        uint64_t v94 = *(void **)(*((void *)&v585 + 1) + 8 * j);
        if (objc_msgSend_access(v94, v89, v90) == 2)
        {
          BOOL v99 = objc_msgSend_inputs(v545, v89, v90);
          v102 = objc_msgSend_name(v94, v100, v101);
          v104 = objc_msgSend_objectForKeyedSubscript_(v99, v103, (uint64_t)v102);

          if (objc_msgSend_type(v94, v105, v106) == 2)
          {
            if (!v104) {
              sub_262E4E3A0();
            }
            uint64_t v108 = objc_msgSend__mtlTextureForImage_(UniKernel, v107, (uint64_t)v104);
            long long v110 = v108;
            if (v108 && objc_msgSend_conformsToProtocol_(v108, v109, (uint64_t)&unk_270E2A1A0)) {
              char shouldEmulate_sRGBForTexture = objc_msgSend__shouldEmulate_sRGBForTexture_(UniKernel, v109, (uint64_t)v110);
            }
            objc_msgSend_extentForImage_(v545, v109, (uint64_t)v104);
            double x = v111;
            double y = v112;
            double width = v113;
            double height = v114;
            v614.origin.double x = v12;
            v614.origin.double y = v14;
            v614.size.double width = v16;
            v614.size.double height = v18;
            if (!CGRectIsNull(v614))
            {
              v615.origin.double x = v12;
              v615.origin.double y = v14;
              v615.size.double width = v16;
              v615.size.double height = v18;
              v623.origin.double x = x;
              v623.origin.double y = y;
              v623.size.double width = width;
              v623.size.double height = height;
              CGRect v616 = CGRectUnion(v615, v623);
              double x = v616.origin.x;
              double y = v616.origin.y;
              double width = v616.size.width;
              double height = v616.size.height;
            }
            if (!v21) {
              double v21 = (char *)objc_msgSend__outputFormatForImage_(v545, v115, (uint64_t)v104);
            }
          }
          else
          {
            double height = v18;
            double width = v16;
            double y = v14;
            double x = v12;
          }

          goto LABEL_40;
        }
      }
      uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v89, (uint64_t)&v585, v610, 16);
      if (v91) {
        continue;
      }
      break;
    }
  }
  double height = v18;
  double width = v16;
  double y = v14;
  double x = v12;
LABEL_40:

  unsigned int rect = objc_msgSend__outputFormatForMetalFormat_(v545, v116, (uint64_t)v21);
  int v525 = *MEMORY[0x263F00888];
  if (*MEMORY[0x263F00888] != rect)
  {
    if ((unint64_t)(v21 - 11) <= 0x3C && ((1 << (v21 - 11)) & 0x1000000000100001) != 0) {
      char shouldEmulate_sRGBForTexture = 1;
    }
    else {
      unsigned int rect = objc_msgSend__promoteFormatForCoreImage_(v545, v117, rect);
    }
  }
  long long v119 = objc_msgSend_inputs(v545, v117, v118);
  v531 = objc_msgSend_copy(v119, v120, v121);

  char shouldEmulate_sRGBForTexture = 0;
  v123 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v122, (uint64_t)&shouldEmulate_sRGBForTexture, 1);
  objc_msgSend_setObject_forKeyedSubscript_(v531, v124, (uint64_t)v123, @"emulate_sRGB");

  v127 = objc_msgSend_copy(v531, v125, v126);
  objc_msgSend_setInputs_(v545, v128, (uint64_t)v127);

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v606 = 0x3032000000;
  v607 = sub_262E407F4;
  v608 = sub_262E40804;
  objc_msgSend_array(MEMORY[0x263EFF980], v129, v130);
  id v609 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v579 = 0;
  v580 = &v579;
  uint64_t v581 = 0x3032000000;
  v582 = sub_262E407F4;
  v583 = sub_262E40804;
  objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v131, v132);
  id v584 = (id)objc_claimAutoreleasedReturnValue();
  v135 = objc_msgSend_ck(v545, v133, v134);
  uint64_t v138 = objc_msgSend_parameters(v135, v136, v137);

  uint64_t v139 = (void *)MEMORY[0x263EFF980];
  uint64_t v142 = objc_msgSend_count(v138, v140, v141);
  v547 = objc_msgSend_arrayWithCapacity_(v139, v143, v142);
  uint64_t v144 = (void *)MEMORY[0x263EFF980];
  uint64_t v147 = objc_msgSend_count(v138, v145, v146);
  v546 = objc_msgSend_arrayWithCapacity_(v144, v148, v147);
  for (unint64_t k = 0; k < objc_msgSend_count(v138, v149, v150); ++k)
  {
    v154 = objc_msgSend_null(MEMORY[0x263EFF9D0], v152, v153);
    objc_msgSend_addObject_(v547, v155, (uint64_t)v154);

    objc_msgSend_setObject_atIndexedSubscript_(v546, v156, (uint64_t)&unk_270E1E720, k);
  }
  uint64_t v157 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v158 = objc_msgSend_count(v138, v152, v153);
  v550 = objc_msgSend_dictionaryWithCapacity_(v157, v159, v158);
  v162 = objc_msgSend_alphanumericCharacterSet(MEMORY[0x263F089C0], v160, v161);
  objc_msgSend_addCharactersInString_(v162, v163, @"_");
  v527 = v162;
  v549 = objc_msgSend_invertedSet(v162, v164, v165);
  long long v577 = 0u;
  long long v578 = 0u;
  long long v575 = 0u;
  long long v576 = 0u;
  obuint64_t j = v138;
  uint64_t v168 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v166, (uint64_t)&v575, v604, 16);
  if (v168)
  {
    uint64_t v169 = 0;
    uint64_t v170 = *(void *)v576;
    uint64_t v171 = *MEMORY[0x263F006D8];
    do
    {
      for (uint64_t m = 0; m != v168; ++m)
      {
        if (*(void *)v576 != v170) {
          objc_enumerationMutation(obj);
        }
        uint64_t v173 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v575 + 1) + 8 * m), v167, v171);
        v175 = v173;
        if (!v173) {
          __assert_rtn("+[UniKernel generateCIImage:]", "UniKernel.m", 1893, "str");
        }
        uint64_t v176 = objc_msgSend_componentsSeparatedByCharactersInSet_(v173, v174, (uint64_t)v549);
        v178 = objc_msgSend_componentsJoinedByString_(v176, v177, (uint64_t)&stru_270E15D18);

        uint64_t v180 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v179, v169 + m);
        objc_msgSend_setObject_forKeyedSubscript_(v550, v181, (uint64_t)v180, v178);
      }
      uint64_t v168 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v167, (uint64_t)&v575, v604, 16);
      v169 += m;
    }
    while (v168);
  }

  uint64_t v184 = objc_msgSend_ck(v545, v182, v183);
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

  long long v573 = 0u;
  long long v574 = 0u;
  long long v571 = 0u;
  long long v572 = 0u;
  uint64_t v187 = objc_msgSend_kernel(v545, v185, v186);
  objc_msgSend_arguments(v187, v188, v189);
  id v533 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(v533, v190, (uint64_t)&v571, v603, 16);
  if (!v191)
  {
LABEL_117:

    long long v569 = 0u;
    long long v570 = 0u;
    long long v567 = 0u;
    long long v568 = 0u;
    id v533 = v546;
    uint64_t v334 = objc_msgSend_countByEnumeratingWithState_objects_count_(v533, v331, (uint64_t)&v567, v602, 16);
    if (v334)
    {
      uint64_t v335 = 0;
      uint64_t v336 = *(void *)v568;
LABEL_119:
      uint64_t v337 = 0;
      uint64_t v338 = v335 + v334;
      while (1)
      {
        if (*(void *)v568 != v336) {
          objc_enumerationMutation(v533);
        }
        if ((objc_msgSend_BOOLValue(*(void **)(*((void *)&v567 + 1) + 8 * v337), v332, v333) & 1) == 0) {
          break;
        }
        if (v334 == ++v337)
        {
          uint64_t v334 = objc_msgSend_countByEnumeratingWithState_objects_count_(v533, v332, (uint64_t)&v567, v602, 16);
          uint64_t v335 = v338;
          if (!v334) {
            goto LABEL_125;
          }
          goto LABEL_119;
        }
      }
      v416 = uni_logger_api();
      if (os_log_type_enabled(v416, OS_LOG_TYPE_ERROR)) {
        sub_262E4E200(v335 + v337, v416);
      }

      objc_msgSend_emptyImage(MEMORY[0x263F00650], v417, v418);
      id v419 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_191;
    }
LABEL_125:

    id v533 = (id)MEMORY[0x263EFFA78];
    uint64_t v340 = rect;
    if (v525 != rect && (int)rect >= 1)
    {
      uint64_t v600 = *MEMORY[0x263F009C8];
      v341 = objc_msgSend_numberWithInt_(NSNumber, v339, rect);
      v601 = v341;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v342, (uint64_t)&v601, &v600, 1);
      id v533 = (id)objc_claimAutoreleasedReturnValue();
    }
    v343 = objc_msgSend_runInfo(v545, v339, v340);
    v346 = v343;
    v526 = v343;
    if (v343)
    {
      objc_msgSend_outputExtent(v343, v344, v345);
      if (CGRectIsNull(v620))
      {
        memset(v594, 0, sizeof(v594));
        objc_msgSend_getThreadsPerThreadgroup(v346, v344, v345);
        if (*(void *)v594 && *(void *)&v594[8] && *(void *)&v594[16])
        {
          v349 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v347, (uint64_t)v533);
          v351 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v350, *(uint64_t *)v594);
          v599[0] = v351;
          v353 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v352, *(uint64_t *)&v594[8]);
          v599[1] = v353;
          v355 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v354, *(uint64_t *)&v594[16]);
          v599[2] = v355;
          v357 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v356, (uint64_t)v599, 3);
          objc_msgSend_setObject_forKeyedSubscript_(v349, v358, (uint64_t)v357, @"kCIKernelThreadsPerThreadgroup");

          uint64_t v360 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v359, (uint64_t)v349);

          id v533 = (id)v360;
          v346 = v526;
        }
        uint64_t v557 = 0;
        v558 = 0;
        uint64_t v559 = 0;
        objc_msgSend_getThreadgroupsPerGrid(v346, v347, v348);
      }
    }
    if (v547 && objc_msgSend_count(v547, v344, v345))
    {
      v361 = objc_msgSend_ck(v545, v344, v345);
      v364 = objc_msgSend_parameters(v361, v362, v363);

      uint64_t v367 = objc_msgSend_count(v364, v365, v366);
      if (v367 == objc_msgSend_count(v547, v368, v369))
      {
        long long v565 = 0u;
        long long v566 = 0u;
        long long v564 = 0u;
        long long v563 = 0u;
        id v370 = v364;
        uint64_t v372 = objc_msgSend_countByEnumeratingWithState_objects_count_(v370, v371, (uint64_t)&v563, v598, 16);
        if (!v372) {
          goto LABEL_160;
        }
        uint64_t v541 = 0;
        uint64_t v535 = *MEMORY[0x263F00690];
        uint64_t v538 = *(void *)v564;
        uint64_t recta = *MEMORY[0x263F006D8];
        while (1)
        {
          uint64_t v374 = v372;
          for (uint64_t n = 0; n != v374; ++n)
          {
            if (*(void *)v564 != v538) {
              objc_enumerationMutation(v370);
            }
            v376 = *(void **)(*((void *)&v563 + 1) + 8 * n);
            objc_msgSend_objectForKeyedSubscript_(v376, v373, v535);
            v377 = (NSString *)objc_claimAutoreleasedReturnValue();
            v378 = v377;
            if (v377)
            {
              v380 = NSClassFromString(v377);
              if (v380)
              {
                v381 = objc_msgSend_objectAtIndexedSubscript_(v547, v379, v541);
                if ((objc_class *)objc_opt_class() == v380)
                {
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v392 = NSString;
                      v393 = objc_msgSend_objectForKeyedSubscript_(v376, v391, recta);
                      v394 = (objc_class *)objc_opt_class();
                      v395 = NSStringFromClass(v394);
                      objc_msgSend_stringWithFormat_(v392, v396, @"object named %@ is of incorrect class (%@); expecting an image or sampler.",
                        v393,
                        v395);
                      id v389 = (id)objc_claimAutoreleasedReturnValue();

                      v390 = uni_logger_compile();
                      if (os_log_type_enabled(v390, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_155;
                      }
                      goto LABEL_156;
                    }
                  }
                }
                else if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if ((isKindOfClass & 1) == 0
                    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                    || v380 != (objc_class *)objc_opt_class())
                  {
                    v383 = NSString;
                    v384 = objc_msgSend_objectForKeyedSubscript_(v376, v382, recta);
                    v385 = (objc_class *)objc_opt_class();
                    v386 = NSStringFromClass(v385);
                    v387 = NSStringFromClass(v380);
                    objc_msgSend_stringWithFormat_(v383, v388, @"object named %@ is of incorrect class (%@); expecting %@",
                      v384,
                      v386,
                      v387);
                    id v389 = (id)objc_claimAutoreleasedReturnValue();

                    v390 = uni_logger_compile();
                    if (os_log_type_enabled(v390, OS_LOG_TYPE_ERROR))
                    {
LABEL_155:
                      id v389 = v389;
                      uint64_t v399 = objc_msgSend_UTF8String(v389, v397, v398);
                      *(_DWORD *)v594 = 136446466;
                      *(void *)&v594[4] = "+[UniKernel generateCIImage:]";
                      *(_WORD *)&v594[12] = 2080;
                      *(void *)&v594[14] = v399;
                      _os_log_error_impl(&dword_262E0F000, v390, OS_LOG_TYPE_ERROR, "%{public}s %s", v594, 0x16u);
                    }
LABEL_156:
                  }
                }

                ++v541;
              }
            }
          }
          uint64_t v372 = objc_msgSend_countByEnumeratingWithState_objects_count_(v370, v373, (uint64_t)&v563, v598, 16);
          if (!v372)
          {
LABEL_160:

            goto LABEL_161;
          }
        }
      }
      v440 = uni_logger_api();
      if (os_log_type_enabled(v440, OS_LOG_TYPE_ERROR))
      {
        v512 = NSString;
        uint64_t v513 = objc_msgSend_count(v364, v441, v442);
        uint64_t v516 = objc_msgSend_count(v547, v514, v515);
        v519 = objc_msgSend_ck(v545, v517, v518);
        objc_msgSend_stringWithFormat_(v512, v520, @"Unexpected # of argumetns for kernel (wanted %lu, got %ld). Returning empty image for kernel %@", v513, v516, v519);
        id v521 = objc_claimAutoreleasedReturnValue();
        uint64_t v524 = objc_msgSend_UTF8String(v521, v522, v523);
        *(_DWORD *)v594 = 136315138;
        *(void *)&v594[4] = v524;
        _os_log_error_impl(&dword_262E0F000, v440, OS_LOG_TYPE_ERROR, "%s", v594, 0xCu);
      }
      objc_msgSend_emptyImage(MEMORY[0x263F00650], v443, v444);
      id v419 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_161:
      objc_msgSend__findOutputRect(v545, v344, v345);
      CGFloat v400 = v621.origin.x;
      CGFloat v401 = v621.origin.y;
      CGFloat v402 = v621.size.width;
      CGFloat v403 = v621.size.height;
      if (!CGRectIsNull(v621))
      {
        v408 = objc_msgSend_runInfo(v545, v404, v405);
        if (v408)
        {
          v409 = objc_msgSend_runInfo(v545, v406, v407);
          objc_msgSend_outputExtent(v409, v410, v411);
          CGFloat v539 = v413;
          CGFloat v542 = v412;
          CGFloat v536 = v414;
          CGFloat rectb = v415;
        }
        else
        {
          CGFloat v539 = *(double *)(MEMORY[0x263F001A0] + 8);
          CGFloat v542 = *MEMORY[0x263F001A0];
          CGFloat v536 = *(double *)(MEMORY[0x263F001A0] + 16);
          CGFloat rectb = *(double *)(MEMORY[0x263F001A0] + 24);
        }

        v622.origin.double y = v539;
        v622.origin.double x = v542;
        v622.size.double width = v536;
        v622.size.double height = rectb;
        if (CGRectIsNull(v622))
        {
          double height = v403;
          double width = v402;
          double y = v401;
          double x = v400;
        }
      }
      *(void *)v594 = 0;
      *(void *)&v594[8] = v594;
      *(void *)&v594[16] = 0x3032000000;
      v595 = sub_262E407F4;
      v596 = sub_262E40804;
      v445 = objc_msgSend_kernel(v545, v404, v405);
      objc_msgSend_constants(v445, v446, v447);
      id v597 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v557 = 0;
      v558 = &v557;
      uint64_t v559 = 0x3032000000;
      v560 = sub_262E407F4;
      v561 = sub_262E40804;
      v450 = objc_msgSend_scale(v545, v448, v449);
      id v562 = (id)objc_msgSend_copy(v450, v451, v452);

      v455 = objc_msgSend_ck(v545, v453, v454);
      v551[0] = MEMORY[0x263EF8330];
      v551[1] = 3221225472;
      v551[2] = sub_262E4080C;
      v551[3] = &unk_2655BCD88;
      id v552 = v545;
      v553 = v594;
      v554 = &v579;
      p_long long buf = &buf;
      v556 = &v557;
      v457 = objc_msgSend_applyWithExtent_roiCallback_arguments_options_(v455, v456, (uint64_t)v551, v547, v533, x, y, width, height);

      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v460 = objc_msgSend_imageByCroppingToRect_(v457, v458, v459, x, y, width, height);

        v457 = (void *)v460;
      }
      id v419 = v457;

      _Block_object_dispose(&v557, 8);
      _Block_object_dispose(v594, 8);
    }
    v211 = v526;
    goto LABEL_190;
  }
  uint64_t v537 = v191;
  uint64_t v540 = *(void *)v572;
LABEL_58:
  uint64_t v194 = 0;
  while (1)
  {
    if (*(void *)v572 != v540) {
      objc_enumerationMutation(v533);
    }
    v195 = *(void **)(*((void *)&v571 + 1) + 8 * v194);
    if (objc_msgSend_access(v195, v192, v193) != 2) {
      break;
    }
LABEL_108:
    if (v537 == ++v194)
    {
      uint64_t v330 = objc_msgSend_countByEnumeratingWithState_objects_count_(v533, v192, (uint64_t)&v571, v603, 16);
      uint64_t v537 = v330;
      if (!v330) {
        goto LABEL_117;
      }
      goto LABEL_58;
    }
  }
  if (objc_msgSend_type(v195, v192, v193) != 2)
  {
    uint64_t v198 = objc_msgSend_inputs(v545, v196, v197);
    v201 = objc_msgSend_name(v195, v199, v200);
    uint64_t v203 = objc_msgSend_objectForKeyedSubscript_(v198, v202, (uint64_t)v201);

    if (v203)
    {
      v206 = (void *)v580[5];
      v207 = objc_msgSend_name(v195, v204, v205);
      objc_msgSend_setObject_forKeyedSubscript_(v206, v208, (uint64_t)v203, v207);
    }
  }
  uint64_t v209 = objc_msgSend_name(v195, v196, v197);
  v211 = objc_msgSend_objectForKeyedSubscript_(v550, v210, (uint64_t)v209);

  if (v211)
  {
    unsigned int v214 = objc_msgSend_unsignedIntValue(v211, v212, v213);
    if (objc_msgSend_count(obj, v215, v216) <= (unint64_t)v214)
    {
      v426 = uni_logger_api();
      if (os_log_type_enabled(v426, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_name(v195, v427, v428);
        id v493 = objc_claimAutoreleasedReturnValue();
        uint64_t v496 = objc_msgSend_UTF8String(v493, v494, v495);
        *(_DWORD *)v594 = 136315394;
        *(void *)&v594[4] = v496;
        *(_WORD *)&v594[12] = 2048;
        *(void *)&v594[14] = v214;
        _os_log_error_impl(&dword_262E0F000, v426, OS_LOG_TYPE_ERROR, "Index out of range for argument %s (%ld).", v594, 0x16u);
      }
    }
    else
    {
      if (objc_msgSend_type(v195, v217, v218) == 2)
      {
        uint64_t v221 = objc_msgSend_inputs(v545, v219, v220);
        v224 = objc_msgSend_name(v195, v222, v223);
        objc_msgSend_objectForKeyedSubscript_(v221, v225, (uint64_t)v224);
        id v226 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend__ciImageForInput_(v545, v227, (uint64_t)v226);
        id v230 = (id)objc_claimAutoreleasedReturnValue();
        if (!v230)
        {
          uint64_t v231 = NSString;
          uint64_t v232 = objc_msgSend_name(v195, v228, v229);
          objc_msgSend_stringWithFormat_(v231, v233, @"input image for texture named %@ is nil", v232);
          id v234 = objc_claimAutoreleasedReturnValue();
          uint64_t v237 = objc_msgSend_UTF8String(v234, v235, v236);

          v238 = uni_logger_api();
          if (os_log_type_enabled(v238, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v594 = 136315138;
            *(void *)&v594[4] = v237;
            _os_log_error_impl(&dword_262E0F000, v238, OS_LOG_TYPE_ERROR, "%s", v594, 0xCu);
          }

          objc_msgSend_emptyImage(MEMORY[0x263F00650], v239, v240);
          id v230 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v241 = objc_msgSend_runInfo(v545, v228, v229);
        BOOL v242 = v241 == 0;

        if (v242)
        {
          v617.origin.double x = x;
          v617.origin.double y = y;
          v617.size.double width = width;
          v617.size.double height = height;
          if (CGRectIsNull(v617))
          {
            objc_msgSend_extent(v230, v245, v246);
          }
          else
          {
            objc_msgSend_extent(v230, v245, v246);
            v624.origin.double x = v265;
            v624.origin.double y = v266;
            v624.size.double width = v267;
            v624.size.double height = v268;
            v618.origin.double x = x;
            v618.origin.double y = y;
            v618.size.double width = width;
            v618.size.double height = height;
            *(CGRect *)&double v247 = CGRectUnion(v618, v624);
          }
          double x = v247;
          double y = v248;
          double width = v249;
          double height = v250;
        }
        objc_msgSend_extent(v230, v243, v244);
        IsEmptdouble y = CGRectIsEmpty(v619);
        long long v270 = *(void **)(*((void *)&buf + 1) + 40);
        v271 = (void *)MEMORY[0x263F00680];
        objc_msgSend_extent(v230, v272, v273);
        v276 = objc_msgSend_vectorWithCGRect_(v271, v274, v275);
        objc_msgSend_addObject_(v270, v277, (uint64_t)v276);

        uint64_t v279 = (uint64_t)v230;
        if (((IsEmpty | isKindOfClass) & 1) == 0)
        {
          v534 = objc_msgSend_imageByClampingToExtent(v230, v278, (uint64_t)v230);
          uint64_t v279 = (uint64_t)v534;
        }
        objc_msgSend_setObject_atIndexedSubscript_(v547, v278, v279, v214);
        if (((IsEmpty | isKindOfClass) & 1) == 0) {

        }
        objc_msgSend_setObject_atIndexedSubscript_(v546, v280, (uint64_t)&unk_270E1E738, v214);
        uint64_t v281 = v214 + 1;
        objc_msgSend_setObject_atIndexedSubscript_(v546, v282, (uint64_t)&unk_270E1E738, v281);
        v285 = (void *)MEMORY[0x263F00680];
        if (IsEmpty)
        {
          objc_msgSend_vectorWithCGRect_(MEMORY[0x263F00680], v283, v284, 0.0, 0.0, 0.0, 0.0);
        }
        else
        {
          objc_msgSend_extent(v230, v283, v284);
          objc_msgSend_vectorWithCGRect_(v285, v288, v289);
        v286 = };
        objc_msgSend_setObject_atIndexedSubscript_(v547, v287, (uint64_t)v286, v281);

        goto LABEL_107;
      }
      if (!objc_msgSend_type(v195, v219, v220) || objc_msgSend_type(v195, v251, v252) == 1)
      {
        id v253 = objc_msgSend_inputs(v545, v251, v252);
        v256 = objc_msgSend_name(v195, v254, v255);
        objc_msgSend_objectForKeyedSubscript_(v253, v257, (uint64_t)v256);
        id v226 = (id)objc_claimAutoreleasedReturnValue();

        if (!v226)
        {
          v260 = objc_msgSend_name(v195, v258, v259);
          int isEqualToString = objc_msgSend_isEqualToString_(v260, v261, @"kernelScale");

          if (isEqualToString)
          {
            objc_msgSend_scale(v545, v263, v264);
            id v226 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v290 = objc_msgSend_name(v195, v263, v264);
            int v292 = objc_msgSend_isEqualToString_(v290, v291, @"emulate_sRGB");

            if (!v292)
            {
              v462 = NSString;
              v463 = objc_msgSend_name(v195, v293, v294);
              v466 = objc_msgSend_ck(v545, v464, v465);
              objc_msgSend_stringWithFormat_(v462, v467, @"Missing parameter for input named %@ for kernel %@; returning empty image.",
                v463,
                v466);
              id v468 = objc_claimAutoreleasedReturnValue();
              uint64_t v471 = objc_msgSend_UTF8String(v468, v469, v470);

              v420 = uni_logger_api();
              if (os_log_type_enabled(v420, OS_LOG_TYPE_ERROR)) {
                sub_262E4E2E4(v471, v420);
              }
              goto LABEL_170;
            }
            v594[0] = 0;
            objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v293, (uint64_t)v594, 1);
            id v226 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        if (objc_msgSend_type(v195, v258, v259))
        {
          if (objc_msgSend_type(v195, v295, v296) != 1) {
            goto LABEL_175;
          }
          uint64_t v299 = objc_msgSend_threadgroupMemoryDataSize(v195, v297, v298);
          uint64_t v302 = objc_msgSend_arrayLength(v195, v300, v301);
          uint64_t v305 = objc_msgSend_threadgroupMemoryAlignment(v195, v303, v304);
          uint64_t v308 = objc_msgSend_threadgroupMemoryAlignment(v195, v306, v307);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v311 = objc_msgSend_unsignedIntegerValue(v226, v309, v310);
            uint64_t v314 = objc_msgSend_threadgroupMemoryAlignment(v195, v312, v313);
            uint64_t v317 = objc_msgSend_threadgroupMemoryAlignment(v195, v315, v316);
            uint64_t v318 = v311 + v314 - 1;
            uint64_t v319 = -v317;
          }
          else
          {
            uint64_t v318 = v305 + v302 * v299 - 1;
            uint64_t v319 = -v308;
          }
          uint64_t v325 = v318 & v319;
          v326 = uni_logger_render();
          if (os_log_type_enabled(v326, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v594 = 136315394;
            *(void *)&v594[4] = "threadgroup memory size = ";
            *(_WORD *)&v594[12] = 2048;
            *(void *)&v594[14] = v325;
            _os_log_impl(&dword_262E0F000, v326, OS_LOG_TYPE_INFO, "%s %ld", v594, 0x16u);
          }

          objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v327, v325);
          id v323 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend_bufferDataType(v195, v295, v296) != 1)
          {
            uint64_t v329 = objc_msgSend_bufferDataType(v195, v320, v321);
            if (!isSupportedType(v329))
            {
              v431 = uni_logger_api();
              if (os_log_type_enabled(v431, OS_LOG_TYPE_ERROR))
              {
                v474 = NSString;
                uint64_t v475 = objc_msgSend_bufferDataType(v195, v472, v473);
                v477 = MTLDataTypeAsString(v475, v476);
                objc_msgSend_stringWithFormat_(v474, v478, @"Don't know how to set type %@", v477);
                id v479 = objc_claimAutoreleasedReturnValue();
                uint64_t v482 = objc_msgSend_UTF8String(v479, v480, v481);
                *(_DWORD *)v594 = 136315138;
                *(void *)&v594[4] = v482;
                _os_log_error_impl(&dword_262E0F000, v431, OS_LOG_TYPE_ERROR, "%s", v594, 0xCu);
              }
              goto LABEL_177;
            }
            id v230 = v226;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                __assert_rtn("+[UniKernel generateCIImage:]", "UniKernel.m", 2006, "[object isKindOfClass:[NSData class]] || [object isKindOfClass:[NSNumber class]]");
              }
            }
            goto LABEL_105;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend__populateStruct_values_(v545, v322, (uint64_t)v195, v226);
            id v323 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v431 = uni_logger_api();
              if (os_log_type_enabled(v431, OS_LOG_TYPE_ERROR))
              {
                v499 = NSString;
                v500 = objc_msgSend_name(v195, v497, v498);
                v503 = objc_msgSend_kernel(v545, v501, v502);
                v506 = objc_msgSend_ck(v503, v504, v505);
                objc_msgSend_stringWithFormat_(v499, v507, @"For argument %@ on kernel %@ we expect either NSData or a NSDictionary.", v500, v506);
                id v508 = objc_claimAutoreleasedReturnValue();
                uint64_t v511 = objc_msgSend_UTF8String(v508, v509, v510);
                *(_DWORD *)v594 = 136315138;
                *(void *)&v594[4] = v511;
                _os_log_error_impl(&dword_262E0F000, v431, OS_LOG_TYPE_ERROR, "%s", v594, 0xCu);
              }
              goto LABEL_177;
            }
            id v323 = v226;
          }
        }
        id v230 = v323;
LABEL_105:
        if (v230)
        {
          objc_msgSend_setObject_atIndexedSubscript_(v547, v324, (uint64_t)v230, v214);
          objc_msgSend_setObject_atIndexedSubscript_(v546, v328, (uint64_t)&unk_270E1E738, v214);
LABEL_107:

          goto LABEL_108;
        }
LABEL_175:
        v431 = uni_logger_api();
        if (os_log_type_enabled(v431, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_name(v195, v432, v433);
          id v434 = objc_claimAutoreleasedReturnValue();
          uint64_t v437 = objc_msgSend_UTF8String(v434, v435, v436);
          sub_262E4E278(v437, v594, v431, v434);
        }
LABEL_177:

        objc_msgSend_emptyImage(MEMORY[0x263F00650], v438, v439);
        id v419 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_190;
      }
      v426 = uni_logger_api();
      if (os_log_type_enabled(v426, OS_LOG_TYPE_ERROR)) {
        sub_262E4E35C(v426);
      }
    }

    uint64_t v425 = objc_msgSend_emptyImage(MEMORY[0x263F00650], v429, v430);
    goto LABEL_174;
  }
  v420 = uni_logger_api();
  if (os_log_type_enabled(v420, OS_LOG_TYPE_ERROR))
  {
    v483 = NSString;
    v484 = objc_msgSend_name(v195, v421, v422);
    v487 = objc_msgSend_allKeys(v550, v485, v486);
    objc_msgSend_stringWithFormat_(v483, v488, @"Unable to find matching Core Image kernel parameter for name %@.Available names are %@", v484, v487);
    id v489 = objc_claimAutoreleasedReturnValue();
    uint64_t v492 = objc_msgSend_UTF8String(v489, v490, v491);
    *(_DWORD *)v594 = 136315138;
    *(void *)&v594[4] = v492;
    _os_log_error_impl(&dword_262E0F000, v420, OS_LOG_TYPE_ERROR, "%s", v594, 0xCu);
  }
LABEL_170:

  uint64_t v425 = objc_msgSend_emptyImage(MEMORY[0x263F00650], v423, v424);
LABEL_174:
  id v419 = (id)v425;
LABEL_190:

LABEL_191:
  _Block_object_dispose(&v579, 8);

  _Block_object_dispose(&buf, 8);

  return v419;
}

- (void)_setRunInfoBasedOnCoreImage
{
  uint64_t v4 = objc_msgSend_runInfo(self, a2, v2);
  if (v4)
  {
LABEL_2:

    return;
  }
  objc_msgSend_kernel(self, v5, v6);
  id v59 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_ck(v59, v7, v8);
  if (!v9)
  {
    uint64_t v4 = v59;
    goto LABEL_2;
  }
  CGFloat v12 = (void *)v9;
  double v13 = objc_msgSend_kernel(self, v10, v11);
  CGFloat v16 = objc_msgSend_mk(v13, v14, v15);

  if (v16)
  {
    uint64_t v19 = objc_msgSend_kernel(self, v17, v18);
    uint64_t v22 = objc_msgSend_ck(v19, v20, v21);
    objc_msgSend_outputGroupSize(v22, v23, v24);
    double v26 = v25;
    double v28 = v27;

    objc_msgSend__findOutputRect(self, v29, v30);
    double x = v63.origin.x;
    double y = v63.origin.y;
    double width = v63.size.width;
    double height = v63.size.height;
    if (!CGRectIsNull(v63))
    {
      v64.origin.double x = x;
      v64.origin.double y = y;
      v64.size.double width = width;
      v64.size.double height = height;
      if (!CGRectIsEmpty(v64))
      {
        CGFloat v37 = objc_msgSend_kernel(self, v35, v36);
        double v40 = objc_msgSend_mk(v37, v38, v39);

        uint64_t v43 = objc_msgSend_threadExecutionWidth(v40, v41, v42);
        unint64_t v46 = objc_msgSend_maxTotalThreadsPerThreadgroup(v40, v44, v45);
        unint64_t v49 = v46 / objc_msgSend_threadExecutionWidth(v40, v47, v48);
        long long v50 = [UniRunInfo alloc];
        v61[0] = (unint64_t)(width / v26);
        v61[1] = (unint64_t)(height / v28);
        v61[2] = 1;
        v60[0] = v43;
        v60[1] = v49;
        v60[2] = 1;
        uint64_t v52 = objc_msgSend_initWithGridSize_threadsPerThreadGroup_(v50, v51, (uint64_t)v61, v60);
        objc_msgSend_setRunInfo_(self, v53, (uint64_t)v52);

        CGRect v56 = objc_msgSend_runInfo(self, v54, v55);
        objc_msgSend_setCoreImageOutputExtent_(v56, v57, v58, x, y, width, height);
      }
    }
  }
}

- (id)outputImage:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_copy(self, v5, v6);
  if (!v7) {
    sub_262E4E3CC();
  }
  uint64_t v10 = v7;
  objc_msgSend__replace_sRGBTexturesIfNeeded(v7, v8, v9);
  objc_msgSend_setRunInfo_(v10, v11, (uint64_t)v4);
  objc_msgSend__setRunInfoBasedOnCoreImage(v10, v12, v13);
  CGFloat v16 = objc_msgSend_outputImageArray(v10, v14, v15);
  if (!v16
    || (uint64_t v19 = v16, !objc_msgSend_count(v16, v17, v18))
    || (objc_msgSend_objectAtIndexedSubscript_(v19, v20, 0), (uint64_t v21 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    sub_262E4E3F8();
  }

  uint64_t v24 = objc_msgSend_ck(v10, v22, v23);
  if (v24
    && (double v25 = (void *)v24,
        double v26 = objc_opt_class(),
        objc_msgSend_generateCIImage_(v26, v27, (uint64_t)v10),
        double v28 = objc_claimAutoreleasedReturnValue(),
        v25,
        v28))
  {
    uint64_t v30 = objc_msgSend_imageWithCIImage_(UniImage, v29, (uint64_t)v28);
    objc_msgSend_setKernel_(v30, v31, (uint64_t)v10);
  }
  else
  {
    uint64_t v33 = [UniImage alloc];
    uint64_t v30 = objc_msgSend_initWithKernel_(v33, v34, (uint64_t)v10);
    double v28 = 0;
  }
  if (!v30) {
    sub_262E4E424();
  }
  float v35 = objc_msgSend_objectAtIndexedSubscript_(v19, v32, 0);
  objc_msgSend_setTexture_(v30, v36, (uint64_t)v35);

  uint64_t v39 = objc_msgSend_texture(v30, v37, v38);
  if (!v39) {
    goto LABEL_20;
  }
  uint64_t v42 = (void *)v39;
  uint64_t v43 = objc_msgSend_texture(v30, v40, v41);
  if (objc_msgSend_conformsToProtocol_(v43, v44, (uint64_t)&unk_270E2A1A0)) {
    goto LABEL_14;
  }
  uint64_t v47 = objc_msgSend_texture(v30, v45, v46);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_20:
  }
    sub_262E4E450();

LABEL_14:

  return v30;
}

- (void)setValues:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v19, v25, 16);
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v4, v7, (uint64_t)v11);
        if (v13)
        {
          if (objc_msgSend_isEqualToString_(v11, v12, @"_renderContext"))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_msgSend_setContext_(self, v14, (uint64_t)v13);
              goto LABEL_17;
            }
          }
          if (objc_msgSend_isEqualToString_(v11, v14, @"_kernelScale"))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_msgSend_setScale_(self, v15, (uint64_t)v13);
              goto LABEL_17;
            }
          }
          double v17 = objc_msgSend_inputs(self, v15, v16);
          objc_msgSend_setObject_forKeyedSubscript_(v17, v18, (uint64_t)v13, v11);
        }
        else
        {
          double v17 = uni_logger_api();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_262E4E47C(v23, v11, &v24, v17);
          }
        }

LABEL_17:
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v19, v25, 16);
    }
    while (v8);
  }
}

- (id)imageByApplyingParameters:(id)a3 runInfo:(id)a4
{
  id v6 = a4;
  objc_msgSend_setValues_(self, v7, (uint64_t)a3);
  uint64_t v9 = objc_msgSend_outputImage_(self, v8, (uint64_t)v6);

  return v9;
}

- (id)imageByApplyingParameters:(id)a3 extent:(id)a4
{
  id v6 = a4;
  objc_msgSend_setValues_(self, v7, (uint64_t)a3);
  uint64_t v9 = objc_msgSend_outputImageOfSize_(self, v8, (uint64_t)v6);

  return v9;
}

- (id)imageByApplyingParameters:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_imageByApplyingParameters_extent_, a3);
}

- (id)description
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  id v6 = objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p ", v4, self);
  uint64_t v9 = objc_msgSend_mk(self, v7, v8);

  unint64_t v12 = 0x263F08000uLL;
  id v80 = self;
  if (v9)
  {
    uint64_t v13 = NSString;
    CGFloat v14 = objc_msgSend_mk(self, v10, v11);
    double v17 = objc_msgSend_label(v14, v15, v16);
    long long v19 = objc_msgSend_stringWithFormat_(v13, v18, @"MTL pipeline = %@", v17);
    objc_msgSend_appendString_(v6, v20, (uint64_t)v19);

    self = v80;
  }
  long long v21 = objc_msgSend_kernel(self, v10, v11);
  uint64_t v24 = objc_msgSend_constants(v21, v22, v23);

  if (v24)
  {
    uint64_t v26 = objc_msgSend_stringWithFormat_(NSString, v25, @"\n\t<constants = \n\t%@\n\t>", v24);
    objc_msgSend_appendString_(v6, v27, (uint64_t)v26);
  }
  uint64_t v79 = (void *)v24;
  objc_msgSend_appendString_(v6, v25, @"\n\t<inputs = \n");
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = self->inputs;
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v82, v86, 16);
  if (v29)
  {
    uint64_t v31 = v29;
    uint64_t v32 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v83 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = *(void *)(*((void *)&v82 + 1) + 8 * i);
        float v35 = objc_msgSend_objectForKeyedSubscript_(self->inputs, v30, v34);
        CGFloat v37 = objc_msgSend_stringWithFormat_(*(void **)(v12 + 2880), v36, @"\t\t%@ = ", v34);
        objc_msgSend_appendString_(v6, v38, (uint64_t)v37);

        if (objc_msgSend_conformsToProtocol_(v35, v39, (uint64_t)&unk_270E2A1A0)) {
          double v40 = v35;
        }
        else {
          double v40 = 0;
        }
        uint64_t v42 = v35;
        if (v40)
        {
          if (!v35) {
            goto LABEL_28;
          }
LABEL_15:
          if (v42 && objc_msgSend_conformsToProtocol_(v42, v41, (uint64_t)&unk_270E2A1A0))
          {
            uint64_t v43 = shortTextureDescription(v42);
            objc_msgSend_appendString_(v6, v44, (uint64_t)v43);

            self = v80;
            goto LABEL_31;
          }
          goto LABEL_25;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v47 = objc_msgSend_kernel(v35, v41, v46);
          uint64_t v50 = objc_msgSend_mk(v47, v48, v49);
          if (v50)
          {
            uint64_t v53 = (void *)v50;
            uint64_t v54 = objc_msgSend_mk(v47, v51, v52);
            uint64_t v57 = objc_msgSend_label(v54, v55, v56);

            if (v57)
            {
              uint64_t v58 = objc_msgSend_stringWithFormat_(NSString, v51, @"(%@) ", v57);
              objc_msgSend_appendString_(v6, v59, (uint64_t)v58);
            }
          }
          uint64_t v42 = objc_msgSend_texture(v35, v51, v52);

          self = v80;
          unint64_t v12 = 0x263F08000;
          if (!v35)
          {
LABEL_28:
            objc_msgSend_appendString_(v6, v41, @"nil\n");
            goto LABEL_31;
          }
          goto LABEL_15;
        }
        uint64_t v42 = 0;
        if (!v35) {
          goto LABEL_28;
        }
LABEL_25:
        uint64_t v60 = objc_msgSend__mtlTextureForImage_(UniKernel, v41, (uint64_t)v35);
        CGRect v63 = v60;
        if (v60 && objc_msgSend_conformsToProtocol_(v60, v61, (uint64_t)&unk_270E2A1A0))
        {
          uint64_t v64 = shortTextureDescription(v63);
        }
        else
        {
          uint64_t v64 = objc_msgSend_description(v35, v61, v62);
        }
        uint64_t v66 = (void *)v64;
        objc_msgSend_appendString_(v6, v65, v64);

        unint64_t v12 = 0x263F08000uLL;
LABEL_31:
        objc_msgSend_appendString_(v6, v45, @"\n");
      }
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v82, v86, 16);
    }
    while (v31);
  }

  uint64_t v67 = *(void **)(v12 + 2880);
  uint64_t v72 = objc_msgSend_runInfo(self, v68, v69);
  if (v72)
  {
    objc_msgSend_runInfo(self, v70, v71);
    uint64_t v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v67, v74, @"\trunInfo = %@\n", v73);
  }
  else
  {
    uint64_t v73 = @"(Unspecified)";
    objc_msgSend_stringWithFormat_(v67, v70, @"\trunInfo = %@\n", @"(Unspecified)");
  v75 = };
  objc_msgSend_appendString_(v6, v76, (uint64_t)v75);

  if (v72) {
  objc_msgSend_appendString_(v6, v77, @"\t>\n");
  }

  return v6;
}

- (NSMapTable)inputs
{
  return (NSMapTable *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInputs:(id)a3
{
}

- (NSNumber)scale
{
  return self->scale;
}

- (void)setScale:(id)a3
{
}

- (UniKernelInternal)kernel
{
  return (UniKernelInternal *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKernel:(id)a3
{
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDevice:(id)a3
{
}

- (UniRunInfo)runInfo
{
  return (UniRunInfo *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRunInfo:(id)a3
{
}

- (UniContext)context
{
  return (UniContext *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContext:(id)a3
{
}

- (NSNumber)preferredOutputFormat
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPreferredOutputFormat:(id)a3
{
}

- (id)roiCallback
{
  return self->_roiCallback;
}

- (void)setRoiCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_roiCallback, 0);
  objc_storeStrong((id *)&self->preferredOutputFormat, 0);
  objc_storeStrong((id *)&self->context, 0);
  objc_storeStrong((id *)&self->runInfo, 0);
  objc_storeStrong((id *)&self->device, 0);
  objc_storeStrong((id *)&self->kernel, 0);
  objc_storeStrong((id *)&self->scale, 0);

  objc_storeStrong((id *)&self->inputs, 0);
}

@end