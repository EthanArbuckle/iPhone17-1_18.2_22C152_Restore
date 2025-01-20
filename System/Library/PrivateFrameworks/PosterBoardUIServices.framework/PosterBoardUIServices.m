void sub_25A043110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 208), 8);
  _Block_object_dispose((const void *)(v41 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_25A045D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

BOOL PREditingAcceptButtonTypeForPRUISPosterEditingAcceptButtonType(BOOL result)
{
  if (result != 2) {
    return result == 1;
  }
  return result;
}

void sub_25A047D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_25A04A5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_25A04AA20(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x25A2F4350](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

id PRUISAnalysisSet()
{
  if (PRUISAnalysisSet_onceToken != -1) {
    dispatch_once(&PRUISAnalysisSet_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)PRUISAnalysisSet_validOps;

  return v0;
}

uint64_t __PRUISAnalysisSet_block_invoke()
{
  PRUISAnalysisSet_validOps = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"PRUISAnalysis_DETERMINE_PROMINENT_COLOR", 0);

  return MEMORY[0x270F9A758]();
}

uint64_t PRUISAnalysisIsValid(void *a1)
{
  id v1 = a1;
  v2 = PRUISAnalysisSet();
  uint64_t v3 = [v2 containsObject:v1];

  return v3;
}

void PRUISAnalysisEnumerate(void *a1)
{
  id v1 = a1;
  PRUISAnalysisSet();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 enumerateObjectsUsingBlock:v1];
}

id PRUISAnalysisResultClassForPRUISAnalysis(void *a1)
{
  if ([a1 isEqualToString:@"PRUISAnalysis_DETERMINE_PROMINENT_COLOR"])
  {
    id v1 = self;
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

id PRUISAnalysisResultClasses()
{
  if (PRUISAnalysisResultClasses_onceToken != -1) {
    dispatch_once(&PRUISAnalysisResultClasses_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)PRUISAnalysisResultClasses_resultClasses;

  return v0;
}

void __PRUISAnalysisResultClasses_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __PRUISAnalysisResultClasses_block_invoke_2;
  v4[3] = &unk_26546B4E8;
  id v5 = v0;
  id v1 = v0;
  PRUISAnalysisEnumerate(v4);
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)PRUISAnalysisResultClasses_resultClasses;
  PRUISAnalysisResultClasses_resultClasses = v2;
}

uint64_t __PRUISAnalysisResultClasses_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = PRUISAnalysisResultClassForPRUISAnalysis(a2);
  v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "bs_safeAddObject:", v3);
}

uint64_t PRUISExecuteProminentColorAnalysisOnImage(uint64_t a1, void *a2)
{
  v95[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void (**)(void, void, void))v3;
  if (a1)
  {
    int v5 = PRUISExecuteProminentColorAnalysisOnImage_count++;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v7 = PRUISLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v5;
      LOWORD(v90) = 2082;
      *(void *)((char *)&v90 + 2) = "BOOL PRUISExecuteProminentColorAnalysisOnImage(CGImageRef _Nonnull, void (^__stron"
                                      "g _Nonnull)(UIColor *__strong, NSError *__strong))";
      _os_log_impl(&dword_25A03F000, v7, OS_LOG_TYPE_INFO, "(%d) start %{public}s", buf, 0x12u);
    }

    uint64_t v8 = PRUISLogCommon();
    os_signpost_id_t v9 = os_signpost_id_generate(v8);

    uint64_t v10 = PRUISLogCommon();
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25A03F000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "prominent color", (const char *)&unk_25A06FDDA, buf, 2u);
    }

    *(void *)buf = 0;
    *(void *)&long long v90 = buf;
    *((void *)&v90 + 1) = 0x3032000000;
    v91 = __Block_byref_object_copy__2;
    v92 = __Block_byref_object_dispose__2;
    uint64_t v74 = 0;
    uint64_t v75 = (uint64_t)&v74;
    uint64_t v76 = 0x2050000000;
    uint64_t v12 = (void *)getNURenderContextClass_softClass;
    v77 = (void *)getNURenderContextClass_softClass;
    if (!getNURenderContextClass_softClass)
    {
      uint64_t v68 = MEMORY[0x263EF8330];
      uint64_t v69 = 3221225472;
      uint64_t v70 = (uint64_t)__getNURenderContextClass_block_invoke;
      v71 = (uint64_t (*)(uint64_t, uint64_t))&unk_26546B610;
      v72 = (void (*)(uint64_t))&v74;
      __getNURenderContextClass_block_invoke((uint64_t)&v68);
      uint64_t v12 = *(void **)(v75 + 24);
    }
    uint64_t v13 = v12;
    _Block_object_dispose(&v74, 8);
    id v93 = (id)[[v13 alloc] initWithPurpose:1];
    uint64_t v68 = 0;
    uint64_t v69 = (uint64_t)&v68;
    uint64_t v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__2;
    v72 = __Block_byref_object_dispose__2;
    id v73 = 0;
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __PRUISExecuteProminentColorAnalysisOnImage_block_invoke;
    v60[3] = &unk_26546B510;
    v62 = &v68;
    v63 = buf;
    v61 = v4;
    os_signpost_id_t v64 = v9;
    char v67 = 1;
    int v66 = v5;
    CFAbsoluteTime v65 = Current;
    uint64_t v14 = (void (**)(void, void, void))MEMORY[0x25A2F4350](v60);
    if (PRUISExecuteProminentColorAnalysisOnImage_onceToken != -1) {
      dispatch_once(&PRUISExecuteProminentColorAnalysisOnImage_onceToken, &__block_literal_global_24);
    }
    if (PRUISExecuteProminentColorAnalysisOnImage_compositionIdentifier && *(void *)(v90 + 40))
    {
      uint64_t v15 = [objc_alloc(MEMORY[0x263F00650]) initWithCGImage:a1];
      uint64_t v16 = *(void **)(v69 + 40);
      *(void *)(v69 + 40) = v15;

      if (*(void *)(v69 + 40))
      {
        v17 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
        uint64_t v18 = [*(id *)(v69 + 40) imageByColorMatchingWorkingSpaceToColorSpace:v17];
        v19 = *(void **)(v69 + 40);
        *(void *)(v69 + 40) = v18;

        CGColorSpaceRelease(v17);
        if (*(void *)(v69 + 40))
        {
          if (PRUISExecuteProminentColorAnalysisOnImage_onceToken_32 != -1) {
            dispatch_once(&PRUISExecuteProminentColorAnalysisOnImage_onceToken_32, &__block_literal_global_34);
          }
          uint64_t v79 = 0;
          v80 = &v79;
          uint64_t v81 = 0x2050000000;
          v20 = (void *)getNUCIImageSourceDefinitionClass_softClass;
          uint64_t v82 = getNUCIImageSourceDefinitionClass_softClass;
          if (!getNUCIImageSourceDefinitionClass_softClass)
          {
            uint64_t v74 = MEMORY[0x263EF8330];
            uint64_t v75 = 3221225472;
            uint64_t v76 = (uint64_t)__getNUCIImageSourceDefinitionClass_block_invoke;
            v77 = &unk_26546B610;
            v78 = &v79;
            __getNUCIImageSourceDefinitionClass_block_invoke((uint64_t)&v74);
            v20 = (void *)v80[3];
          }
          v21 = v20;
          _Block_object_dispose(&v79, 8);
          id v22 = [v21 alloc];
          v23 = (void *)[v22 initWithCIImage:*(void *)(v69 + 40) orientation:1];
          uint64_t v79 = 0;
          v80 = &v79;
          uint64_t v81 = 0x2050000000;
          v24 = (void *)getNUGenericCompositionClass_softClass;
          uint64_t v82 = getNUGenericCompositionClass_softClass;
          if (!getNUGenericCompositionClass_softClass)
          {
            uint64_t v74 = MEMORY[0x263EF8330];
            uint64_t v75 = 3221225472;
            uint64_t v76 = (uint64_t)__getNUGenericCompositionClass_block_invoke;
            v77 = &unk_26546B610;
            v78 = &v79;
            __getNUGenericCompositionClass_block_invoke((uint64_t)&v74);
            v24 = (void *)v80[3];
          }
          v25 = v24;
          _Block_object_dispose(&v79, 8);
          id v26 = [v25 alloc];
          v27 = (void *)[v26 initWithIdentifier:PRUISExecuteProminentColorAnalysisOnImage_compositionIdentifier];
          uint64_t v79 = 0;
          v80 = &v79;
          uint64_t v81 = 0x2050000000;
          v28 = (void *)getNUSourceClass_softClass;
          uint64_t v82 = getNUSourceClass_softClass;
          if (!getNUSourceClass_softClass)
          {
            uint64_t v74 = MEMORY[0x263EF8330];
            uint64_t v75 = 3221225472;
            uint64_t v76 = (uint64_t)__getNUSourceClass_block_invoke;
            v77 = &unk_26546B610;
            v78 = &v79;
            __getNUSourceClass_block_invoke((uint64_t)&v74);
            v28 = (void *)v80[3];
          }
          v29 = v28;
          _Block_object_dispose(&v79, 8);
          id v30 = objc_alloc_init(v29);
          v31 = [MEMORY[0x263F08C38] UUID];
          v32 = [v31 UUIDString];
          [v30 setAssetIdentifier:v32];

          [v30 setDefinition:v23];
          [v27 setObject:v30 forKeyedSubscript:@"source"];
          v33 = dispatch_group_create();
          dispatch_group_enter(v33);
          id v34 = objc_alloc_init(MEMORY[0x263F29BD8]);
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_3;
          v56[3] = &unk_26546B538;
          id v35 = v34;
          id v57 = v35;
          v59 = v14;
          v36 = v33;
          v58 = v36;
          v37 = (void *)MEMORY[0x25A2F4350](v56);
          v38 = (void *)MEMORY[0x25A2F4150]();
          v39 = (void *)PRUISExecuteProminentColorAnalysisOnImage_txQueue;
          v51[0] = MEMORY[0x263EF8330];
          v51[1] = 3221225472;
          v51[2] = __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_4;
          v51[3] = &unk_26546B5E8;
          id v40 = v27;
          id v52 = v40;
          v55 = buf;
          id v41 = v37;
          id v54 = v41;
          v42 = v36;
          v53 = v42;
          [v39 dispatchAsync:v51];
        }
        else
        {
          v49 = (void *)MEMORY[0x263F087E8];
          uint64_t v83 = *MEMORY[0x263F08338];
          v84 = @"source image deallocated before prominent color analysis could be run.";
          v23 = [NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
          id v40 = [v49 errorWithDomain:@"com.apple.PosterBoardUIServices" code:-1 userInfo:v23];
          ((void (**)(void, void, id))v14)[2](v14, 0, v40);
        }
        uint64_t v44 = 1;
        goto LABEL_32;
      }
      v48 = (void *)MEMORY[0x263F087E8];
      uint64_t v85 = *MEMORY[0x263F08338];
      v86 = @"source image deallocated before prominent color analysis could be run.";
      v23 = [NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
      id v40 = [v48 errorWithDomain:@"com.apple.PosterBoardUIServices" code:-1 userInfo:v23];
      ((void (**)(void, void, id))v14)[2](v14, 0, v40);
    }
    else
    {
      v43 = (void *)MEMORY[0x263F087E8];
      uint64_t v87 = *MEMORY[0x263F08338];
      v88 = @"PhotosImaging was unable to register schema information.";
      v23 = [NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
      id v40 = [v43 errorWithDomain:@"com.apple.PosterBoardUIServices" code:-1 userInfo:v23];
      ((void (**)(void, void, id))v14)[2](v14, 0, v40);
    }
    uint64_t v44 = 0;
LABEL_32:

    _Block_object_dispose(&v68, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_33;
  }
  if (v3)
  {
    v45 = (void *)MEMORY[0x263F087E8];
    uint64_t v94 = *MEMORY[0x263F08338];
    v95[0] = @"nil input image";
    v46 = [NSDictionary dictionaryWithObjects:v95 forKeys:&v94 count:1];
    v47 = [v45 errorWithDomain:@"com.apple.PosterBoardUIServices" code:-1 userInfo:v46];
    ((void (**)(void, void, void *))v4)[2](v4, 0, v47);
  }
  uint64_t v44 = 0;
LABEL_33:

  return v44;
}

void sub_25A04BF14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v45 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __PRUISExecuteProminentColorAnalysisOnImage_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v32[1] = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  uint64_t v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) cancelAllRequests];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  if (!(v5 | v6))
  {
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08338];
    v32[0] = @"prominent color was nil";
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    uint64_t v6 = [v11 errorWithDomain:@"com.apple.PosterBoardUIServices" code:-1 userInfo:v12];
  }
  uint64_t v13 = PRUISLogAnalysis();
  uint64_t v14 = v13;
  if (v6)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_cold_1(v6, v14);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(v24[0]) = 0;
    _os_log_impl(&dword_25A03F000, v14, OS_LOG_TYPE_INFO, "_determineProminentColor ran successfully", (uint8_t *)v24, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v15 = PRUISLogCommon();
  uint64_t v16 = v15;
  os_signpost_id_t v17 = *(void *)(a1 + 56);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v24[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_25A03F000, v16, OS_SIGNPOST_INTERVAL_END, v17, "prominent color", (const char *)&unk_25A06FDDA, (uint8_t *)v24, 2u);
  }

  uint64_t v18 = PRUISLogCommon();
  v19 = v18;
  os_log_type_t v20 = OS_LOG_TYPE_ERROR;
  if (v5 && !v6) {
    os_log_type_t v20 = *(unsigned char *)(a1 + 76);
  }
  if (os_log_type_enabled(v18, v20))
  {
    int v21 = *(_DWORD *)(a1 + 72);
    double v22 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
    if (v6) {
      uint64_t v23 = v6;
    }
    else {
      uint64_t v23 = v5;
    }
    v24[0] = 67109890;
    v24[1] = v21;
    __int16 v25 = 2082;
    id v26 = "BOOL PRUISExecuteProminentColorAnalysisOnImage(CGImageRef _Nonnull, void (^__strong _Nonnull)(UIColor *__stron"
          "g, NSError *__strong))_block_invoke";
    __int16 v27 = 2048;
    double v28 = v22;
    __int16 v29 = 2114;
    uint64_t v30 = v23;
    _os_log_impl(&dword_25A03F000, v19, v20, "(%d) end %{public}s; completed in %.4f / %{public}@",
      (uint8_t *)v24,
      0x26u);
  }
}

void __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_22()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2050000000;
  uint64_t v0 = (void *)getPISchemaClass_softClass;
  uint64_t v8 = getPISchemaClass_softClass;
  if (!getPISchemaClass_softClass)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getPISchemaClass_block_invoke;
    v4[3] = &unk_26546B610;
    void v4[4] = &v5;
    __getPISchemaClass_block_invoke((uint64_t)v4);
    uint64_t v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  uint64_t v2 = [v1 registerPhotosSchema];
  id v3 = (void *)PRUISExecuteProminentColorAnalysisOnImage_compositionIdentifier;
  PRUISExecuteProminentColorAnalysisOnImage_compositionIdentifier = v2;
}

void sub_25A04C314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_2()
{
  PRUISExecuteProminentColorAnalysisOnImage_txQueue = [objc_alloc(MEMORY[0x263F5F418]) initWithTransactionName:@"ProminentColor"];

  return MEMORY[0x270F9A758]();
}

void __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) signal])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_4(uint64_t a1)
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2050000000;
  uint64_t v2 = (void *)getPIParallaxColorAnalysisRequestClass_softClass;
  uint64_t v23 = getPIParallaxColorAnalysisRequestClass_softClass;
  if (!getPIParallaxColorAnalysisRequestClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    os_signpost_id_t v17 = __getPIParallaxColorAnalysisRequestClass_block_invoke;
    uint64_t v18 = &unk_26546B610;
    v19 = &v20;
    __getPIParallaxColorAnalysisRequestClass_block_invoke((uint64_t)buf);
    uint64_t v2 = (void *)v21[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v20, 8);
  v4 = (void *)[[v3 alloc] initWithComposition:*(void *)(a1 + 32)];
  [v4 setSegmentationMatte:0];
  [v4 setAnalyzeBackground:1];
  [v4 setMaxDominantColors:10];
  [v4 setRenderContext:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_5;
  v13[3] = &unk_26546B5C0;
  id v14 = *(id *)(a1 + 48);
  [v4 submit:v13];
  id v5 = *(NSObject **)(a1 + 40);
  dispatch_time_t v6 = dispatch_time(0, 20000000000);
  BOOL v7 = dispatch_group_wait(v5, v6) == 0;
  uint64_t v8 = PRUISLogAnalysis();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25A03F000, v9, OS_LOG_TYPE_INFO, "determineProminentColorWithCompletion finished", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_4_cold_1(v9);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08338];
    v25[0] = @"Timed out.";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v12 = [v11 errorWithDomain:@"com.apple.PosterBoardUIServices" code:-1 userInfo:v9];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v12);
  }
}

void sub_25A04C6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_5(uint64_t a1, void *a2)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v19 = 0;
  id v3 = [a2 result:&v19];
  id v4 = v19;
  id v5 = v4;
  if (v3)
  {
    if (v4)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      uint64_t v10 = [v3 dominantColors];
      v11 = objc_msgSend(v10, "bs_mapNoNulls:", &__block_literal_global_49);

      uint64_t v12 = objc_msgSend(v11, "bs_filter:", &__block_literal_global_52);

      uint64_t v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_55];
      uint64_t v14 = [v13 count];
      uint64_t v15 = *(void *)(a1 + 32);
      if (v14)
      {
        uint64_t v16 = [v13 firstObject];
        (*(void (**)(uint64_t, void *, void))(v15 + 16))(v15, v16, 0);
      }
      else
      {
        os_signpost_id_t v17 = (void *)MEMORY[0x263F087E8];
        uint64_t v20 = *MEMORY[0x263F08338];
        int v21 = @"PhotoImaging did not return any colors.";
        uint64_t v16 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        uint64_t v18 = [v17 errorWithDomain:@"com.apple.PosterBoardUIServices" code:-1 userInfo:v16];
        (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v18);
      }
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    BOOL v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08338];
    v23[0] = @"PhotoImaging did not return a result.";
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    uint64_t v9 = [v7 errorWithDomain:@"com.apple.PosterBoardUIServices" code:-1 userInfo:v8];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v9);
  }
}

uint64_t __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263F1C550];
  uint64_t v3 = [a2 CGColor];

  return [v2 colorWithCGColor:v3];
}

BOOL __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "pui_hslValues");
  [v2 luminance];
  BOOL v4 = v3 > 0.25;

  return v4;
}

uint64_t __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_msgSend(a2, "pui_hsbValues");
  uint64_t v6 = objc_msgSend(v4, "pui_hsbValues");

  [v5 saturation];
  double v8 = v7;
  [v6 saturation];
  if (v8 > v9) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = v8 < v9;
  }

  return v10;
}

Class __getNURenderContextClass_block_invoke(uint64_t a1)
{
  NeutrinoCoreLibrary();
  Class result = objc_getClass("NURenderContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getNURenderContextClass_block_invoke_cold_1();
  }
  getNURenderContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void NeutrinoCoreLibrary()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0[0] = 0;
  if (!NeutrinoCoreLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x263EF8330];
    v0[2] = (void *)3221225472;
    v0[3] = __NeutrinoCoreLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_26546B630;
    uint64_t v2 = 0;
    NeutrinoCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NeutrinoCoreLibraryCore_frameworkLibrary) {
    NeutrinoCoreLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __NeutrinoCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NeutrinoCoreLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPISchemaClass_block_invoke(uint64_t a1)
{
  PhotoImagingLibrary();
  Class result = objc_getClass("PISchema");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPISchemaClass_block_invoke_cold_1();
  }
  getPISchemaClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void PhotoImagingLibrary()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0[0] = 0;
  if (!PhotoImagingLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x263EF8330];
    v0[2] = (void *)3221225472;
    v0[3] = __PhotoImagingLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_26546B668;
    uint64_t v2 = 0;
    PhotoImagingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotoImagingLibraryCore_frameworkLibrary) {
    PhotoImagingLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __PhotoImagingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotoImagingLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getNUCIImageSourceDefinitionClass_block_invoke(uint64_t a1)
{
  NeutrinoCoreLibrary();
  Class result = objc_getClass("NUCIImageSourceDefinition");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getNUCIImageSourceDefinitionClass_block_invoke_cold_1();
  }
  getNUCIImageSourceDefinitionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNUGenericCompositionClass_block_invoke(uint64_t a1)
{
  NeutrinoCoreLibrary();
  Class result = objc_getClass("NUGenericComposition");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getNUGenericCompositionClass_block_invoke_cold_1();
  }
  getNUGenericCompositionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNUSourceClass_block_invoke(uint64_t a1)
{
  NeutrinoCoreLibrary();
  Class result = objc_getClass("NUSource");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getNUSourceClass_block_invoke_cold_1();
  }
  getNUSourceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPIParallaxColorAnalysisRequestClass_block_invoke(uint64_t a1)
{
  PhotoImagingLibrary();
  Class result = objc_getClass("PIParallaxColorAnalysisRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPIParallaxColorAnalysisRequestClass_block_invoke_cold_1();
  }
  getPIParallaxColorAnalysisRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_25A050BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
}

void sub_25A051E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25A052808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_25A0537B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
}

void sub_25A05441C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A0544A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

__CFString *PRUISStringForRenderingMode(uint64_t a1)
{
  long long v1 = @"default";
  if (a1 == 1) {
    long long v1 = @"paused";
  }
  if (a1 == 2) {
    return @"live";
  }
  else {
    return v1;
  }
}

BOOL PRUISIsValidRenderingMode(unint64_t a1)
{
  return a1 < 3;
}

void sub_25A056CA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25A057EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t PRUISDefaultServiceQuality()
{
  return [MEMORY[0x263F3F410] userInitiated];
}

id PRUISExternallyHostedPosterEditingServiceInterface()
{
  if (PRUISExternallyHostedPosterEditingServiceInterface_onceToken != -1) {
    dispatch_once(&PRUISExternallyHostedPosterEditingServiceInterface_onceToken, &__block_literal_global_11);
  }
  uint64_t v0 = (void *)PRUISExternallyHostedPosterEditingServiceInterface___interface;

  return v0;
}

void __PRUISExternallyHostedPosterEditingServiceInterface_block_invoke()
{
  id v4 = [MEMORY[0x263F3F3E0] interfaceWithIdentifier:@"com.apple.posterboardui.externalEditing"];
  uint64_t v0 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_27081A6E0];
  [v4 setServer:v0];

  long long v1 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_27081A510];
  [v4 setClient:v1];

  uint64_t v2 = [v4 copy];
  uint64_t v3 = (void *)PRUISExternallyHostedPosterEditingServiceInterface___interface;
  PRUISExternallyHostedPosterEditingServiceInterface___interface = v2;
}

id _PRUISIncomingCallPosterSnapshotDefinitionLevelSetsForIdentifier(void *a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 isEqualToString:PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView])
  {
    id v2 = objc_alloc(MEMORY[0x263F5F4F0]);
    uint64_t v3 = objc_msgSend(v2, "initWithNumberOfLevels:", 5, *MEMORY[0x263F5F550], *MEMORY[0x263F5F558], *MEMORY[0x263F5F560], *MEMORY[0x263F5F540], +[PRUISPosterAppearanceObservingAttachmentProvider obscurableContentAttachmentLevel](PRUISPosterAppearanceObservingAttachmentProvider, "obscurableContentAttachmentLevel"));
    v20[0] = v3;
    id v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = (void **)v20;
  }
  else if ([v1 isEqualToString:PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithOverlay])
  {
    id v6 = objc_alloc(MEMORY[0x263F5F4F0]);
    uint64_t v3 = objc_msgSend(v6, "initWithNumberOfLevels:", 5, *MEMORY[0x263F5F550], *MEMORY[0x263F5F558], *MEMORY[0x263F5F560], *MEMORY[0x263F5F540], +[PRUISPosterAppearanceObservingAttachmentProvider overlayContentAttachmentLevel](PRUISPosterAppearanceObservingAttachmentProvider, "overlayContentAttachmentLevel"));
    id v19 = v3;
    id v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = &v19;
  }
  else if ([v1 isEqualToString:PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly])
  {
    id v7 = objc_alloc(MEMORY[0x263F5F4F0]);
    uint64_t v3 = objc_msgSend(v7, "initWithNumberOfLevels:", 4, *MEMORY[0x263F5F550], *MEMORY[0x263F5F558], *MEMORY[0x263F5F560], *MEMORY[0x263F5F540]);
    uint64_t v18 = v3;
    id v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = &v18;
  }
  else if ([v1 isEqualToString:PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsExcludingBackground])
  {
    id v8 = objc_alloc(MEMORY[0x263F5F4F0]);
    uint64_t v3 = objc_msgSend(v8, "initWithNumberOfLevels:", 3, *MEMORY[0x263F5F550], *MEMORY[0x263F5F558], *MEMORY[0x263F5F560]);
    os_signpost_id_t v17 = v3;
    id v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = &v17;
  }
  else
  {
    int v9 = [v1 isEqualToString:PRPosterSnapshotDefinitionIdentifierIncomingCallComposite];
    uint64_t v10 = [MEMORY[0x263F5F4F0] compositeLevelSet];
    uint64_t v3 = (void *)v10;
    if (v9)
    {
      v16[0] = v10;
      id v11 = objc_alloc(MEMORY[0x263F5F4F0]);
      uint64_t v12 = objc_msgSend(v11, "initWithNumberOfLevels:", 4, *MEMORY[0x263F5F550], *MEMORY[0x263F5F558], *MEMORY[0x263F5F560], *MEMORY[0x263F5F540]);
      v16[1] = v12;
      uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];

      goto LABEL_13;
    }
    uint64_t v15 = v10;
    id v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = (void **)&v15;
  }
  uint64_t v13 = [v4 arrayWithObjects:v5 count:1];
LABEL_13:

  return v13;
}

uint64_t _PRUISIncomingCallPosterSnapshotAttachmentTypeIdentifierIsPredefined(void *a1)
{
  v6[4] = *MEMORY[0x263EF8340];
  v6[0] = PRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel;
  v6[1] = PRUISIncomingCallPosterAttachmentTypeIdentifierInCallUIOverlay;
  v6[2] = PRUISIncomingCallPosterAttachmentTypeIdentifierBoopToMeetNameLabelOverlay;
  v6[3] = PRUISIncomingCallPosterAttachmentTypeIdentifierContactCardNameLabelOverlay;
  id v1 = (void *)MEMORY[0x263EFF8C0];
  id v2 = a1;
  uint64_t v3 = [v1 arrayWithObjects:v6 count:4];
  uint64_t v4 = [v3 containsObject:v2];

  return v4;
}

uint64_t _PRUISIncomingCallPosterSnapshotAttachmentTypeIdentifierWillIncludeName(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v6 = PRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel;
  id v7 = PRUISIncomingCallPosterAttachmentTypeIdentifierBoopToMeetNameLabelOverlay;
  id v8 = PRUISIncomingCallPosterAttachmentTypeIdentifierContactCardNameLabelOverlay;
  id v1 = (void *)MEMORY[0x263EFF8C0];
  id v2 = a1;
  uint64_t v3 = [v1 arrayWithObjects:&v6 count:3];
  uint64_t v4 = objc_msgSend(v3, "containsObject:", v2, v6, v7, v8, v9);

  return v4;
}

__CFString *NSStringFromPRUISSwitcherLayoutMode(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown - %lu)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_26546BB68[a1];
  }

  return v1;
}

id PRUISSwitcherLayoutTransitionAnimationSettings()
{
  uint64_t v0 = [MEMORY[0x263F29C80] settingsWithMass:1.0 stiffness:393.99462 damping:36.52271];
  CAFrameRateRange v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v0, "setPreferredFrameRateRange:", *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
  [v0 setHighFrameRateReason:2490369];

  return v0;
}

id PRUISSwitcherLayoutDeflationAnimationSettings()
{
  uint64_t v0 = [MEMORY[0x263F29C80] settingsWithMass:1.0 stiffness:85.25592 damping:18.46683];
  CAFrameRateRange v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v0, "setPreferredFrameRateRange:", *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
  [v0 setHighFrameRateReason:2490369];

  return v0;
}

id PRUISSwitcherLayoutBouncingAnimationSettings()
{
  uint64_t v0 = [MEMORY[0x263F29C80] settingsWithMass:1.0 stiffness:429.11311 damping:29.00106];
  CAFrameRateRange v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v0, "setPreferredFrameRateRange:", *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
  [v0 setHighFrameRateReason:2490369];

  return v0;
}

uint64_t modeFromPRUISwitcherLayoutMode(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 5) {
    return 0;
  }
  return result;
}

uint64_t modeFromPRUISSwitcherLayoutMode(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 5) {
    return 0;
  }
  return result;
}

void sub_25A05ABF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

id PRUISLogCommon()
{
  if (PRUISLogCommon_onceToken != -1) {
    dispatch_once(&PRUISLogCommon_onceToken, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)PRUISLogCommon___logObj;

  return v0;
}

uint64_t __PRUISLogCommon_block_invoke()
{
  PRUISLogCommon___logObj = (uint64_t)os_log_create("com.apple.PosterBoardUIServices", "Common");

  return MEMORY[0x270F9A758]();
}

id PRUISLogRendering()
{
  if (PRUISLogRendering_onceToken != -1) {
    dispatch_once(&PRUISLogRendering_onceToken, &__block_literal_global_4_1);
  }
  uint64_t v0 = (void *)PRUISLogRendering___logObj;

  return v0;
}

uint64_t __PRUISLogRendering_block_invoke()
{
  PRUISLogRendering___logObj = (uint64_t)os_log_create("com.apple.PosterBoardUIServices", "Rendering");

  return MEMORY[0x270F9A758]();
}

id PRUISLogSnapshotting()
{
  if (PRUISLogSnapshotting_onceToken != -1) {
    dispatch_once(&PRUISLogSnapshotting_onceToken, &__block_literal_global_7_0);
  }
  uint64_t v0 = (void *)PRUISLogSnapshotting___logObj;

  return v0;
}

uint64_t __PRUISLogSnapshotting_block_invoke()
{
  PRUISLogSnapshotting___logObj = (uint64_t)os_log_create("com.apple.PosterBoardUIServices", "Snapshotting");

  return MEMORY[0x270F9A758]();
}

id PRUISLogSnapshotCache()
{
  if (PRUISLogSnapshotCache_onceToken != -1) {
    dispatch_once(&PRUISLogSnapshotCache_onceToken, &__block_literal_global_10_0);
  }
  uint64_t v0 = (void *)PRUISLogSnapshotCache___logObj;

  return v0;
}

uint64_t __PRUISLogSnapshotCache_block_invoke()
{
  PRUISLogSnapshotCache___logObj = (uint64_t)os_log_create("com.apple.PosterBoardUIServices", "SnapshotCache");

  return MEMORY[0x270F9A758]();
}

id PRUISLogAttachments()
{
  if (PRUISLogAttachments_onceToken != -1) {
    dispatch_once(&PRUISLogAttachments_onceToken, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)PRUISLogAttachments___logObj;

  return v0;
}

uint64_t __PRUISLogAttachments_block_invoke()
{
  PRUISLogAttachments___logObj = (uint64_t)os_log_create("com.apple.PosterBoardUIServices", "Attachments");

  return MEMORY[0x270F9A758]();
}

id PRUISLogEditing()
{
  if (PRUISLogEditing_onceToken != -1) {
    dispatch_once(&PRUISLogEditing_onceToken, &__block_literal_global_16_0);
  }
  uint64_t v0 = (void *)PRUISLogEditing___logObj;

  return v0;
}

uint64_t __PRUISLogEditing_block_invoke()
{
  PRUISLogEditing___logObj = (uint64_t)os_log_create("com.apple.PosterBoardUIServices", "Editing");

  return MEMORY[0x270F9A758]();
}

id PRUISLogRemoteEditing()
{
  if (PRUISLogRemoteEditing_onceToken != -1) {
    dispatch_once(&PRUISLogRemoteEditing_onceToken, &__block_literal_global_19);
  }
  uint64_t v0 = (void *)PRUISLogRemoteEditing___logObj;

  return v0;
}

uint64_t __PRUISLogRemoteEditing_block_invoke()
{
  PRUISLogRemoteEditing___logObj = (uint64_t)os_log_create("com.apple.PosterBoardUIServices", "RemoteEditing");

  return MEMORY[0x270F9A758]();
}

id PRUISLogAnalysisService()
{
  if (PRUISLogAnalysisService_onceToken != -1) {
    dispatch_once(&PRUISLogAnalysisService_onceToken, &__block_literal_global_22);
  }
  uint64_t v0 = (void *)PRUISLogAnalysisService___logObj;

  return v0;
}

uint64_t __PRUISLogAnalysisService_block_invoke()
{
  PRUISLogAnalysisService___logObj = (uint64_t)os_log_create("com.apple.PosterBoardUIServices", "AnalysisService");

  return MEMORY[0x270F9A758]();
}

id PRUISLogAnalysis()
{
  if (PRUISLogAnalysis_onceToken != -1) {
    dispatch_once(&PRUISLogAnalysis_onceToken, &__block_literal_global_25);
  }
  uint64_t v0 = (void *)PRUISLogAnalysis___logObj;

  return v0;
}

uint64_t __PRUISLogAnalysis_block_invoke()
{
  PRUISLogAnalysis___logObj = (uint64_t)os_log_create("com.apple.PosterBoardUIServices", "Analysis");

  return MEMORY[0x270F9A758]();
}

id _findUIWindowSceneForUIScreen(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x263F1CBC8] _applicationKeyWindow];
  uint64_t v3 = [v2 screen];
  int v4 = [v3 isEqual:v1];

  if (v4)
  {
    id v5 = [v2 windowScene];
  }
  else
  {
    id v6 = [MEMORY[0x263F1C408] sharedApplication];
    id v7 = [v6 windows];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___findUIWindowSceneForUIScreen_block_invoke;
    v10[3] = &unk_26546BCB8;
    id v11 = v1;
    id v8 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v10);

    id v5 = [v8 windowScene];
  }

  return v5;
}

uint64_t ___findUIWindowSceneForUIScreen_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 screen];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_25A05D834(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

__CFString *ShortNSStringFromPRUISPosterLevel(uint64_t a1)
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    if (a1 > 1999)
    {
      if (a1 == 2000)
      {
        id v2 = @"CO6";
        return v2;
      }
      if (a1 == 3000)
      {
        id v2 = @"M7";
        return v2;
      }
    }
    else
    {
      if (!a1)
      {
        id v2 = @"TIME4";
        return v2;
      }
      if (a1 == 1000)
      {
        id v2 = @"FL5";
        return v2;
      }
    }
LABEL_36:
    objc_msgSend(NSString, "stringWithFormat:", @"(UNK%lu)", a1);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (a1 > -1001)
  {
    if (a1 == -1000)
    {
      id v2 = @"FG2";
      return v2;
    }
    if (a1 == -500)
    {
      id v2 = @"FU3";
      return v2;
    }
    goto LABEL_36;
  }
  if (a1 != -3000)
  {
    if (a1 == -2000)
    {
      id v2 = @"BG1";
      return v2;
    }
    goto LABEL_36;
  }
  id v2 = @"BD0";
  return v2;
}

BOOL resultFromPRUISResult(uint64_t a1)
{
  return a1 == 1;
}

BOOL resultFromPRUIResult(uint64_t a1)
{
  return a1 == 1;
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_25A064A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25A064BD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25A03F000, a2, OS_LOG_TYPE_ERROR, "_determineProminentColor failed to run w/ error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __PRUISExecuteProminentColorAnalysisOnImage_block_invoke_4_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_25A03F000, log, OS_LOG_TYPE_FAULT, "determineProminentColorWithCompletion elapsed 20 second timer.", v1, 2u);
}

void __getNURenderContextClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getNURenderContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PRUISAnalyses.m", 36, @"Unable to find class %s", "NURenderContext");

  __break(1u);
}

void NeutrinoCoreLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *NeutrinoCoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PRUISAnalyses.m", 32, @"%s", *a1);

  __break(1u);
}

void __getPISchemaClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPISchemaClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PRUISAnalyses.m", 42, @"Unable to find class %s", "PISchema");

  __break(1u);
}

void PhotoImagingLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PhotoImagingLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PRUISAnalyses.m", 40, @"%s", *a1);

  __break(1u);
}

void __getNUCIImageSourceDefinitionClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getNUCIImageSourceDefinitionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PRUISAnalyses.m", 33, @"Unable to find class %s", "NUCIImageSourceDefinition");

  __break(1u);
}

void __getNUGenericCompositionClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getNUGenericCompositionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PRUISAnalyses.m", 34, @"Unable to find class %s", "NUGenericComposition");

  __break(1u);
}

void __getNUSourceClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getNUSourceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PRUISAnalyses.m", 37, @"Unable to find class %s", "NUSource");

  __break(1u);
}

void __getPIParallaxColorAnalysisRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPIParallaxColorAnalysisRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PRUISAnalyses.m", 41, @"Unable to find class %s", "PIParallaxColorAnalysisRequest");

  __break(1u);
}

uint64_t AMUIAmbientDisplayStyleString()
{
  return MEMORY[0x270F0C160]();
}

uint64_t BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler()
{
  return MEMORY[0x270F10580]();
}

uint64_t BSCurrentUserDirectory()
{
  return MEMORY[0x270F106F0]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x270F10748]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x270F10778]();
}

uint64_t BSEqualDictionaries()
{
  return MEMORY[0x270F107A8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x270F107C8]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x270F10808]();
}

uint64_t BSInterfaceOrientationIsLandscape()
{
  return MEMORY[0x270F10838]();
}

uint64_t BSInterfaceOrientationIsValid()
{
  return MEMORY[0x270F10840]();
}

uint64_t BSRectEqualToRect()
{
  return MEMORY[0x270F108B8]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x270F108D8]();
}

uint64_t BSSettingFlagDescription()
{
  return MEMORY[0x270F10938]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x270F10940]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x270F10948]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x270EFB7B0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CALayerGetRenderId()
{
  return MEMORY[0x270EFB850]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NSStringFromFBSceneContentState()
{
  return MEMORY[0x270F2D100]();
}

uint64_t NSStringFromPUIPosterLevel()
{
  return MEMORY[0x270F55118]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PFFileProtectionNoneAttributes()
{
  return MEMORY[0x270F550E8]();
}

uint64_t PFPosterRoleIsValid()
{
  return MEMORY[0x270F550F8]();
}

uint64_t PRDynamicRotationIsActive()
{
  return MEMORY[0x270F55108]();
}

uint64_t PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet()
{
  return MEMORY[0x270F55110]();
}

uint64_t PRSPosterSnapshotOptionsAllowTransparency()
{
  return MEMORY[0x270F550D0]();
}

uint64_t PRSPosterSnapshotOptionsIsFloatingLayerOnly()
{
  return MEMORY[0x270F550D8]();
}

uint64_t PUIFeatureEnabled()
{
  return MEMORY[0x270F55120]();
}

uint64_t PUIPosterBoundingShapeFromInt()
{
  return MEMORY[0x270F55128]();
}

uint64_t PUIPosterBoundingShapeIsValid()
{
  return MEMORY[0x270F55130]();
}

uint64_t PUIPosterLevelIsDefined()
{
  return MEMORY[0x270F55138]();
}

uint64_t PUIPosterSignificantEventOptionsContainsEvent()
{
  return MEMORY[0x270F55140]();
}

uint64_t SBSTopButtonFramesForPosters()
{
  return MEMORY[0x270F771F8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x270F109A8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}