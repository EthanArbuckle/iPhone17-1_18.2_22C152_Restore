@interface VIEspressoRunner
- (BOOL)isImageRequired;
- (BOOL)setFeatures:(id)a3 error:(id *)a4;
- (BOOL)setFrame:(__CVBuffer *)a3 error:(id *)a4;
- (VIEspressoRunner)initWithMLNetURL:(id)a3 expectedInputSize:(CGSize)a4 imageInputName:(id)a5 featureNames:(id)a6 outputNames:(id)a7 preferredMetalDevice:(id)a8 usesCPUOnly:(BOOL)a9;
- (id)classificationErrorWithDescription:(id)a3;
- (id)processWithError:(id *)a3;
- (void)dealloc;
- (void)setIsImageRequired:(BOOL)a3;
@end

@implementation VIEspressoRunner

- (id)classificationErrorWithDescription:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = a3;
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.argos.espresso.classification" code:-1 userInfo:v5];

  return v6;
}

- (VIEspressoRunner)initWithMLNetURL:(id)a3 expectedInputSize:(CGSize)a4 imageInputName:(id)a5 featureNames:(id)a6 outputNames:(id)a7 preferredMetalDevice:(id)a8 usesCPUOnly:(BOOL)a9
{
  BOOL v9 = a9;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v60 = a5;
  id v58 = a6;
  id v57 = a7;
  id v17 = a8;
  v68.receiver = self;
  v68.super_class = (Class)VIEspressoRunner;
  v18 = [(VIEspressoRunner *)&v68 init];
  v19 = v18;
  if (v18)
  {
    v18->_expectedInputSize.CGFloat width = width;
    v18->_expectedInputSize.CGFloat height = height;
    p_imageInputName = (id *)&v18->_imageInputName;
    objc_storeStrong((id *)&v18->_imageInputName, a5);
    [(VIEspressoRunner *)v19 setIsImageRequired:v60 != 0];
    p_outputNames = (id *)&v19->_outputNames;
    objc_storeStrong((id *)&v19->_outputNames, a7);
    if (v17)
    {
      if (+[VILogger shouldLogVerboseMessage])
      {
        v21 = +[VILogger verboseLog];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DCCF9000, v21, OS_LOG_TYPE_DEBUG, "VIEspressoRunner().init(): preferredMetalDevice", buf, 2u);
        }
      }
      espresso_device_id_for_metal_device();
    }
    BOOL v22 = +[VILogger shouldLogVerboseMessage];
    if (v9)
    {
      if (v22)
      {
        v23 = +[VILogger verboseLog];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DCCF9000, v23, OS_LOG_TYPE_DEBUG, "VIEspressoRunner().init(): only cpu", buf, 2u);
        }
      }
    }
    else
    {
      if (v22)
      {
        v25 = +[VILogger verboseLog];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DCCF9000, v25, OS_LOG_TYPE_DEBUG, "VIEspressoRunner().init(): trying ane", buf, 2u);
        }
      }
      uint64_t context = espresso_create_context();
      v19->_uint64_t context = (void *)context;
      if (context) {
        goto LABEL_25;
      }
      if (+[VILogger shouldLogVerboseMessage])
      {
        v27 = +[VILogger verboseLog];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DCCF9000, v27, OS_LOG_TYPE_DEBUG, "VIEspressoRunner().init(): trying mps", buf, 2u);
        }
      }
      uint64_t v28 = espresso_create_context();
      v19->_uint64_t context = (void *)v28;
      if (v28) {
        goto LABEL_25;
      }
      if (+[VILogger shouldLogVerboseMessage])
      {
        v44 = +[VILogger verboseLog];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DCCF9000, v44, OS_LOG_TYPE_DEBUG, "VIEspressoRunner().init(): trying cpu", buf, 2u);
        }
      }
    }
    uint64_t v24 = espresso_create_context();
    v19->_uint64_t context = (void *)v24;
    if (!v24)
    {
      if (+[VILogger shouldLogMessage])
      {
        v35 = +[VILogger log];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = -1;
          LOWORD(v75) = 2114;
          *(void *)((char *)&v75 + 2) = @"context creation failed";
          _os_log_impl(&dword_1DCCF9000, v35, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", buf, 0x12u);
        }
        goto LABEL_44;
      }
      goto LABEL_69;
    }
LABEL_25:
    uint64_t plan = espresso_create_plan();
    v19->_uint64_t plan = (void *)plan;
    if (!plan)
    {
      if (+[VILogger shouldLogMessage])
      {
        v35 = +[VILogger log];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = -1;
          LOWORD(v75) = 2114;
          *(void *)((char *)&v75 + 2) = @"plan creation failed";
          _os_log_impl(&dword_1DCCF9000, v35, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", buf, 0x12u);
        }
        goto LABEL_44;
      }
LABEL_69:
      v47 = 0;
      goto LABEL_80;
    }
    id v30 = [v59 path];
    [v30 UTF8String];
    BOOL v31 = espresso_plan_add_network() == 0;

    if (!v31)
    {
      if (+[VILogger shouldLogMessage])
      {
        v32 = +[VILogger log];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          id v33 = [v59 path];
          [v33 UTF8String];
          int v34 = espresso_plan_add_network();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v34;
          LOWORD(v75) = 2114;
          *(void *)((char *)&v75 + 2) = @"espresso_plan_add_network";
          _os_log_impl(&dword_1DCCF9000, v32, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", buf, 0x12u);
        }
      }
      goto LABEL_69;
    }
    if (*p_imageInputName)
    {
      [*p_imageInputName UTF8String];
      if (espresso_network_declare_input())
      {
        if (+[VILogger shouldLogMessage])
        {
          v35 = +[VILogger log];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            [(NSString *)v19->_imageInputName UTF8String];
            int v36 = espresso_network_declare_input();
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v36;
            LOWORD(v75) = 2114;
            *(void *)((char *)&v75 + 2) = @"espresso_network_declare_input";
            _os_log_impl(&dword_1DCCF9000, v35, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", buf, 0x12u);
          }
LABEL_44:

          goto LABEL_69;
        }
        goto LABEL_69;
      }
    }
    *(void *)buf = 0;
    *(void *)&long long v75 = buf;
    *((void *)&v75 + 1) = 0x2020000000;
    char v76 = 1;
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __128__VIEspressoRunner_initWithMLNetURL_expectedInputSize_imageInputName_featureNames_outputNames_preferredMetalDevice_usesCPUOnly___block_invoke;
    v65[3] = &unk_1E6CB1A50;
    v37 = v19;
    v66 = v37;
    v67 = buf;
    [v58 enumerateObjectsUsingBlock:v65];
    if (*(unsigned char *)(v75 + 24))
    {
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      v38 = v57;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v61 objects:v73 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v62;
        while (2)
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v62 != v40) {
              objc_enumerationMutation(v38);
            }
            id v42 = *(id *)(*((void *)&v61 + 1) + 8 * i);
            [v42 UTF8String];
            if (espresso_network_declare_output())
            {
              if (+[VILogger shouldLogMessage])
              {
                v45 = +[VILogger log];
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  [v42 UTF8String];
                  int v46 = espresso_network_declare_output();
                  *(_DWORD *)v69 = 67109378;
                  int v70 = v46;
                  __int16 v71 = 2114;
                  v72 = @"espresso_network_declare_output";
                  _os_log_impl(&dword_1DCCF9000, v45, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", v69, 0x12u);
                }
              }
              goto LABEL_67;
            }
          }
          uint64_t v39 = [v38 countByEnumeratingWithState:&v61 objects:v73 count:16];
          if (v39) {
            continue;
          }
          break;
        }
      }

      if (!espresso_plan_build())
      {
        uint64_t v48 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", 168 * -[NSObject count](v38, "count"));
        id v49 = v37[9];
        v37[9] = (id)v48;

        uint64_t v50 = [v37[9] mutableBytes];
        for (unint64_t j = 0; ; ++j)
        {
          if ([*p_outputNames count] <= j)
          {

            _Block_object_dispose(buf, 8);
            goto LABEL_75;
          }
          v38 = [*p_outputNames objectAtIndexedSubscript:j];
          [v38 UTF8String];
          if (espresso_network_bind_buffer()) {
            break;
          }

          v50 += 168;
        }
        if (+[VILogger shouldLogMessage])
        {
          v54 = +[VILogger log];
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            [v38 UTF8String];
            int v55 = espresso_network_bind_buffer();
            *(_DWORD *)v69 = 67109378;
            int v70 = v55;
            __int16 v71 = 2114;
            v72 = @"espresso_network_bind_buffer";
            _os_log_impl(&dword_1DCCF9000, v54, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", v69, 0x12u);
          }
        }
        goto LABEL_67;
      }
      if (+[VILogger shouldLogMessage])
      {
        v38 = +[VILogger log];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          int v43 = espresso_plan_build();
          *(_DWORD *)v69 = 67109378;
          int v70 = v43;
          __int16 v71 = 2114;
          v72 = @"espresso_plan_build";
          _os_log_impl(&dword_1DCCF9000, v38, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", v69, 0x12u);
        }
LABEL_67:
      }
    }

    _Block_object_dispose(buf, 8);
    goto LABEL_69;
  }
LABEL_75:
  if (+[VILogger shouldLogVerboseMessage])
  {
    v52 = +[VILogger verboseLog];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCCF9000, v52, OS_LOG_TYPE_DEBUG, "*** --- VIEspressoRunner.init()", buf, 2u);
    }
  }
  v47 = v19;
LABEL_80:

  return v47;
}

void __128__VIEspressoRunner_initWithMLNetURL_expectedInputSize_imageInputName_featureNames_outputNames_preferredMetalDevice_usesCPUOnly___block_invoke(uint64_t a1, id a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [a2 UTF8String];
  int v6 = espresso_network_declare_input();
  if (v6)
  {
    int v7 = v6;
    if (+[VILogger shouldLogMessage])
    {
      uint64_t v8 = +[VILogger log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9[0] = 67109378;
        v9[1] = v7;
        __int16 v10 = 2114;
        v11 = @"declare input";
        _os_log_impl(&dword_1DCCF9000, v8, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", (uint8_t *)v9, 0x12u);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)dealloc
{
  if (espresso_plan_get_phase() == 1
    && (espresso_plan_build_clean() || espresso_plan_destroy())
    && +[VILogger shouldLogVerboseMessage])
  {
    v3 = +[VILogger verboseLog];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCCF9000, v3, OS_LOG_TYPE_ERROR, "EspressoRunner.dealloc plan clean failed", buf, 2u);
    }
  }
  if (espresso_context_destroy()
    && +[VILogger shouldLogVerboseMessage])
  {
    id v4 = +[VILogger verboseLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCCF9000, v4, OS_LOG_TYPE_ERROR, "EspressoRunner.dealloc context destroy failed", buf, 2u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)VIEspressoRunner;
  [(VIEspressoRunner *)&v5 dealloc];
}

- (BOOL)setFrame:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_imageInputName) {
    return 1;
  }
  if (floor(self->_expectedInputSize.width) != (double)CVPixelBufferGetWidth(a3)
    || floor(self->_expectedInputSize.height) != (double)CVPixelBufferGetHeight(a3))
  {
    int v7 = [(VIEspressoRunner *)self classificationErrorWithDescription:@"setFrame(): Image size mismatch"];
    if (+[VILogger shouldLogVerboseMessage])
    {
      uint64_t v8 = +[VILogger verboseLog];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315394;
        *(void *)v13 = "-[VIEspressoRunner setFrame:error:]";
        *(_WORD *)&v13[8] = 2112;
        *(void *)&v13[10] = v7;
        _os_log_impl(&dword_1DCCF9000, v8, OS_LOG_TYPE_ERROR, "%s failed with error: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    if (a4) {
      *a4 = v7;
    }

    return 0;
  }
  [(NSString *)self->_imageInputName UTF8String];
  if (!espresso_network_bind_cvpixelbuffer()) {
    return 1;
  }
  if (+[VILogger shouldLogMessage])
  {
    __int16 v10 = +[VILogger log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      [(NSString *)self->_imageInputName UTF8String];
      int v12 = 67109378;
      *(_DWORD *)v13 = espresso_network_bind_cvpixelbuffer();
      *(_WORD *)&v13[4] = 2114;
      *(void *)&v13[6] = @"espresso_network_bind_cvpixelbuffer";
      _os_log_impl(&dword_1DCCF9000, v10, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", (uint8_t *)&v12, 0x12u);
    }
  }
  if (!a4) {
    return 0;
  }
  id v11 = [(VIEspressoRunner *)self classificationErrorWithDescription:@"espresso_network_bind_cvpixelbuffer"];
  BOOL result = 0;
  *a4 = v11;
  return result;
}

- (BOOL)setFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__VIEspressoRunner_setFeatures_error___block_invoke;
  v10[3] = &unk_1E6CB1A78;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = &v11;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
  int v7 = *((unsigned __int8 *)v18 + 24);
  if (a4 && !*((unsigned char *)v18 + 24))
  {
    *a4 = (id) v12[5];
    int v7 = *((unsigned __int8 *)v18 + 24);
  }
  BOOL v8 = v7 != 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __38__VIEspressoRunner_setFeatures_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  [a2 UTF8String];
  uint64_t v8 = espresso_network_bind_buffer();
  if (v8)
  {
    BOOL v9 = objc_msgSend(NSString, "stringWithFormat:", @"setFeatures(): bind feature failed. %d", v8);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    uint64_t v10 = [*(id *)(a1 + 32) classificationErrorWithDescription:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
  if ([v7 dataType] != 65568)
  {
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"setFeatures(): unsupported data type. %d", v8);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    uint64_t v14 = [*(id *)(a1 + 32) classificationErrorWithDescription:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *a4 = 1;
  }
  size_t v17 = 4 * [v7 count];
  id v18 = v7;
  memcpy(0, (const void *)[v18 dataPointer], v17);
}

- (id)processWithError:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (espresso_plan_execute_sync())
  {
    if (+[VILogger shouldLogMessage])
    {
      objc_super v5 = +[VILogger log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        int v35 = espresso_plan_execute_sync();
        __int16 v36 = 2114;
        v37 = @"espresso_plan_execute_sync";
        _os_log_impl(&dword_1DCCF9000, v5, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", buf, 0x12u);
      }
    }
    if (a3)
    {
      [(VIEspressoRunner *)self classificationErrorWithDescription:@"espresso_plan_execute_sync"];
      id v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    uint64_t v28 = a3;
    id v7 = objc_opt_new();
    uint64_t v8 = [(NSMutableData *)self->_outputBuffers mutableBytes];
    if ([(NSArray *)self->_outputNames count])
    {
      unint64_t v9 = 0;
      id v30 = v7;
      BOOL v31 = self;
      v29 = v8;
      while (1)
      {
        unint64_t rank = espresso_buffer_get_rank();
        if (rank >= 6) {
          break;
        }
        unint64_t v11 = rank;
        v32 = &v8[168 * v9];
        int v12 = [NSNumber numberWithUnsignedLong:*((void *)v32 + 14)];
        v33[0] = v12;
        uint64_t v13 = [NSNumber numberWithUnsignedLong:*((void *)v32 + 13)];
        v33[1] = v13;
        uint64_t v14 = [NSNumber numberWithUnsignedLong:*((void *)v32 + 12)];
        v33[2] = v14;
        uint64_t v15 = [NSNumber numberWithUnsignedLong:*((void *)v32 + 11)];
        v33[3] = v15;
        id v16 = [NSNumber numberWithUnsignedLong:*((void *)v32 + 10)];
        v33[4] = v16;
        size_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:5];

        id v18 = objc_alloc(MEMORY[0x1E4F1E9A8]);
        uint64_t v19 = objc_msgSend(v17, "subarrayWithRange:", 5 - v11, v11);
        char v20 = (void *)[v18 initWithShape:v19 dataType:65568 error:0];

        if (*((void *)v32 + 19))
        {
          unint64_t v22 = 0;
          uint64_t v23 = *(void *)v32;
          do
          {
            LODWORD(v21) = *(_DWORD *)(v23 + 4 * v22);
            uint64_t v24 = objc_msgSend(NSNumber, "numberWithFloat:", v21, v28);
            [v20 setObject:v24 atIndexedSubscript:v22];

            ++v22;
          }
          while (*((void *)v32 + 19) > v22);
        }
        self = v31;
        v25 = -[NSArray objectAtIndexedSubscript:](v31->_outputNames, "objectAtIndexedSubscript:", v9, v28);
        id v7 = v30;
        [v30 setObject:v20 forKey:v25];

        ++v9;
        uint64_t v8 = v29;
        if ([(NSArray *)v31->_outputNames count] <= v9) {
          goto LABEL_15;
        }
      }
      if (+[VILogger shouldLogMessage])
      {
        v26 = +[VILogger log];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          int v35 = 0;
          __int16 v36 = 2114;
          v37 = @"outputs up to only rank 5 are supported";
          _os_log_impl(&dword_1DCCF9000, v26, OS_LOG_TYPE_ERROR, "VIEspressoRunner: failed (status %d): %{public}@", buf, 0x12u);
        }
      }
      if (v28)
      {
        [(VIEspressoRunner *)self classificationErrorWithDescription:@"outputs up to only rank 5 are supported"];
        id v6 = 0;
        *uint64_t v28 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v6 = 0;
      }
    }
    else
    {
LABEL_15:
      id v6 = v7;
    }
  }
  return v6;
}

- (BOOL)isImageRequired
{
  return self->_isImageRequired;
}

- (void)setIsImageRequired:(BOOL)a3
{
  self->_isImageRequired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBuffers, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_imageInputName, 0);
}

@end