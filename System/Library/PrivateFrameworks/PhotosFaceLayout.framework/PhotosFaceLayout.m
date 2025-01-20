void PFLGeneratePhotosFace(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void v16[2];

  v16[1] = *MEMORY[0x263EF8340];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x263F14E18]);
  v16[0] = *MEMORY[0x263F15008];
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v8 addFetchPropertySets:v9];

  v10 = (void *)MEMORY[0x263F14D18];
  v15 = v5;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  v12 = [v10 fetchAssetsWithUUIDs:v11 options:v8];

  v13 = [v12 firstObject];

  if (v13)
  {
    PFLGeneratePhotosFaceCommon(v13, v6, 0, v7);
  }
  else
  {
    v14 = [MEMORY[0x263F087E8] errorWithDomain:0x27072E6A0 code:1 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
  }
}

void PFLGeneratePhotosFaceCommon(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  v11 = pfl_layout_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v7;
    __int16 v27 = 2080;
    uint64_t v28 = [v8 fileSystemRepresentation];
    _os_log_impl(&dword_259336000, v11, OS_LOG_TYPE_DEFAULT, "PFLGeneratePhotosFace: Calculate watch face layers for %@ in %s", buf, 0x16u);
  }

  v12 = +[PFLSegmentationCalculator sharedInstance];
  v13 = [[PFLJetsamInfoInterval alloc] initWithLabel:@"bestSegmentationForAsset (allPositions)"];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __PFLGeneratePhotosFaceCommon_block_invoke;
  v19[3] = &unk_26544BCE8;
  id v23 = v7;
  id v24 = v10;
  v20 = v13;
  id v21 = v8;
  id v22 = v9;
  id v14 = v7;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  v18 = v13;
  [v12 bestSegmentationForAsset:v14 completion:v19];
}

void PFLGeneratePhotosFaceWithOptions(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __PFLGeneratePhotosFaceWithOptions_block_invoke;
  v9[3] = &unk_26544BCC0;
  id v10 = v7;
  id v8 = v7;
  PFLGeneratePhotosFaceCommon(a1, a2, a3, v9);
}

void __PFLGeneratePhotosFaceWithOptions_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = 0;
  id v7 = v5;
  if (a2 && !v5)
  {
    v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __PFLGeneratePhotosFaceCommon_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = pfl_layout_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = [v5 count];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_259336000, v7, OS_LOG_TYPE_DEFAULT, "bestSegmentationForAsset returned %ld layouts, error == %@", buf, 0x16u);
  }

  [*(id *)(a1 + 32) logCurrentInterval];
  [*(id *)(a1 + 32) reset];
  if (!v6)
  {
    id v8 = [MEMORY[0x263F08850] defaultManager];
    id v9 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(*(id *)(a1 + 40), "fileSystemRepresentation"));
    id v60 = 0;
    [v8 createDirectoryIfNeededAtPath:v9 error:&v60];
    id v10 = v60;

    if (v10)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_40:

      goto LABEL_41;
    }
    v11 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"PFCLSaveFullsizeMask"];
    int v52 = [v11 BOOLValue];

    v12 = *(void **)(a1 + 40);
    id v13 = *(id *)(a1 + 56);
    id v58 = v5;
    id v57 = v12;
    id v14 = pfl_layout_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v13 localIdentifier];
      uint64_t v16 = [v58 count];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_259336000, v14, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayers: generating layers for %@, %ld layouts", buf, 0x16u);
    }
    char v54 = canEncodeHEIC();
    id v17 = (void *)MEMORY[0x263F14D18];
    v18 = [v13 localIdentifier];
    v56 = [v17 uuidFromLocalIdentifier:v18];

    v19 = objc_opt_new();
    v20 = [v13 localIdentifier];
    [v19 setLocalIdentifier:v20];

    id v21 = objc_msgSend(v13, "pfl_modificationDate");
    [v19 setModificationDate:v21];

    [v19 setParallaxScale:*MEMORY[0x263F5DE98]];
    [v19 setUserEdited:0];
    id v59 = v13;
    id v22 = objc_opt_new();
    [v22 setVersion:0];
    [v22 setDeliveryMode:1];
    [v22 setNetworkAccessAllowed:1];
    [v22 setSynchronous:1];
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x3032000000;
    v74 = __Block_byref_object_copy_;
    v75 = __Block_byref_object_dispose_;
    id v76 = 0;
    uint64_t v67 = 0;
    v68 = &v67;
    uint64_t v69 = 0x2020000000;
    int v70 = 1;
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3032000000;
    uint64_t v64 = (uint64_t)__Block_byref_object_copy_;
    v65 = __Block_byref_object_dispose_;
    id v66 = 0;
    id v23 = [MEMORY[0x263F14E38] defaultManager];
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __imageDataForAsset_block_invoke;
    v78 = &unk_26544BD38;
    v79 = &v71;
    v80 = &v67;
    v81 = &v61;
    [v23 requestImageDataAndOrientationForAsset:v59 options:v22 resultHandler:buf];

    id v24 = (void *)v72[5];
    if (v24 && !v62[5])
    {
      int v53 = *((_DWORD *)v68 + 6);
      id v27 = v24;
    }
    else
    {
      v25 = pfl_layout_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = [v59 localIdentifier];
        __PFLGeneratePhotosFaceCommon_block_invoke_cold_1(v26, (uint64_t)&v62, v89, v25);
      }

      id v27 = 0;
      int v53 = 1;
    }
    id v28 = (id)v62[5];
    _Block_object_dispose(&v61, 8);

    _Block_object_dispose(&v67, 8);
    _Block_object_dispose(&v71, 8);

    id v55 = v27;
    if (v28)
    {
      uint64_t v29 = pfl_layout_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v59;
        _os_log_impl(&dword_259336000, v29, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayers: no data for %@", buf, 0xCu);
      }

      id v30 = v28;
      id v31 = 0;
      goto LABEL_34;
    }
    v32 = [v58 objectAtIndexedSubscript:0];
    BOOL v33 = [v32 foregroundMask] == 0;

    if (v33)
    {
      v39 = 0;
    }
    else
    {
      v51 = [v58 objectAtIndexedSubscript:0];
      uint64_t v34 = [v51 foregroundMask];
      v50 = [v58 objectAtIndexedSubscript:0];
      int v35 = [v50 maskIsInverted];
      v36 = [MEMORY[0x263F00650] imageWithCVPixelBuffer:v34];
      v49 = [MEMORY[0x263F00628] context];
      space = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00248]);
      if (v35)
      {
        v37 = [MEMORY[0x263F00640] filterWithName:@"CIColorInvert"];
        [v37 setValue:v36 forKey:*MEMORY[0x263F00968]];
        v38 = [v37 outputImage];
        [v36 extent];
        v39 = (CGImage *)objc_msgSend(v49, "createCGImage:fromRect:format:colorSpace:", v38, *MEMORY[0x263F00878], space);
      }
      else
      {
        [v36 extent];
        v39 = (CGImage *)objc_msgSend(v49, "createCGImage:fromRect:format:colorSpace:", v36, *MEMORY[0x263F00878], space);
      }
      CGColorSpaceRelease(space);

      if (!v39)
      {
        v41 = pfl_layout_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_259336000, v41, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayers: cannot create a CGImage mask from CVPixelBuffer", buf, 2u);
        }
        goto LABEL_32;
      }
      if (v52)
      {
        v40 = pfl_layout_log();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v57;
          _os_log_impl(&dword_259336000, v40, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayers: also saving full size mask in %@", buf, 0xCu);
        }

        v41 = pngDataFromImage(v39);
        if (v41)
        {
          v42 = [v57 URLByAppendingPathComponent:@"FullSizeMask.png" isDirectory:0];
          id v43 = saveDataToFile(v41, v42);
        }
LABEL_32:
      }
    }
    v44 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v58, "count", space));
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    v74 = (uint64_t (*)(uint64_t, uint64_t))0xBFF0000000000000;
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    uint64_t v64 = -1;
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __generateWatchLayers_block_invoke;
    v78 = &unk_26544BD10;
    v84 = &v71;
    v85 = &v61;
    v86 = v39;
    v79 = (uint64_t *)v59;
    v80 = (uint64_t *)v55;
    int v87 = v53;
    v81 = (uint64_t *)v57;
    id v82 = v56;
    char v88 = v54;
    id v45 = v44;
    id v83 = v45;
    [v58 enumerateObjectsUsingBlock:buf];
    CGImageRelease(v39);
    [v19 setLayouts:v45];
    [v19 setPreferredLayout:v62[3]];
    id v31 = v19;

    _Block_object_dispose(&v61, 8);
    _Block_object_dispose(&v71, 8);

LABEL_34:
    id v46 = v28;
    [*(id *)(a1 + 32) logCurrentInterval];
    if (v28)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      v47 = pfl_layout_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v31;
        _os_log_impl(&dword_259336000, v47, OS_LOG_TYPE_DEFAULT, "PFLGeneratePhotosFace: Returning photo %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }

    goto LABEL_40;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_41:
}

void sub_259338C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void __generateWatchLayers_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  [v5 cropScore];
  if (v6 > *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    [v5 cropScore];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v7;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = a3;
  }
  if ([v5 usesMask]) {
    id v8 = *(CGImage **)(a1 + 88);
  }
  else {
    id v8 = 0;
  }
  id v10 = *(void **)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  uint64_t v11 = *(unsigned int *)(a1 + 96);
  id v13 = *(void **)(a1 + 48);
  v12 = *(void **)(a1 + 56);
  int v14 = *(unsigned __int8 *)(a1 + 100);
  id v15 = v5;
  id v16 = v12;
  id v17 = v13;
  id v18 = v9;
  id v19 = v10;
  v20 = pfl_layout_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = 138412290;
    id v36 = v15;
    _os_log_impl(&dword_259336000, v20, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayout: generating layout %@", (uint8_t *)&v35, 0xCu);
  }

  unint64_t v21 = [v15 timePosition];
  [v15 visibleRect];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  [v15 timeRect];
  uint64_t v34 = PFLGenerateWatchLayout(v19, v18, v11, v8, v21, v17, v16, v14 != 0, v23, v25, v27, v29, v30, v31, v32, v33);

  if (v34) {
    [*(id *)(a1 + 64) addObject:v34];
  }
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

void __imageDataForAsset_block_invoke(void *a1, void *a2, uint64_t a3, int a4, void *a5)
{
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  id v13 = a2;
  id v9 = a5;
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a4;
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F150B0]];

  uint64_t v11 = *(void *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id pfl_photo_log()
{
  if (pfl_photo_log_onceToken != -1) {
    dispatch_once(&pfl_photo_log_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)pfl_photo_log___logger;
  return v0;
}

uint64_t __pfl_photo_log_block_invoke()
{
  pfl_photo_log___logger = (uint64_t)os_log_create("com.apple.photosfacelayout", "photo");
  return MEMORY[0x270F9A758]();
}

id pfl_layout_log()
{
  if (pfl_layout_log_onceToken != -1) {
    dispatch_once(&pfl_layout_log_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)pfl_layout_log___logger;
  return v0;
}

uint64_t __pfl_layout_log_block_invoke()
{
  pfl_layout_log___logger = (uint64_t)os_log_create("com.apple.photosfacelayout", "layout");
  return MEMORY[0x270F9A758]();
}

id pfl_jetsam_log()
{
  if (pfl_jetsam_log_onceToken != -1) {
    dispatch_once(&pfl_jetsam_log_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)pfl_jetsam_log___logger;
  return v0;
}

uint64_t __pfl_jetsam_log_block_invoke()
{
  pfl_jetsam_log___logger = (uint64_t)os_log_create("com.apple.photosfacelayout", "jetsam");
  return MEMORY[0x270F9A758]();
}

void sub_25933C4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
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

uint64_t getImageOrientationFromSource(CGImageSource *a1)
{
  CFDictionaryRef v1 = CGImageSourceCopyPropertiesAtIndex(a1, 0, 0);
  uint64_t v2 = 1;
  if (v1)
  {
    CFDictionaryRef v3 = v1;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x263F0F4C8]);
    unsigned int valuePtr = 1;
    if (Value)
    {
      if (CFNumberGetValue(Value, kCFNumberIntType, &valuePtr)) {
        uint64_t v2 = valuePtr;
      }
      else {
        uint64_t v2 = 1;
      }
    }
    CFRelease(v3);
  }
  return v2;
}

uint64_t getImageOrientationFromData(const __CFData *a1)
{
  CFDictionaryRef v1 = CGImageSourceCreateWithData(a1, 0);
  uint64_t ImageOrientationFromSource = getImageOrientationFromSource(v1);
  CFRelease(v1);
  return ImageOrientationFromSource;
}

uint64_t makePresentationTransform@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  switch((int)result)
  {
    case 1:
      *(void *)a4 = 0x3FF0000000000000;
      *(void *)(a4 + 8) = 0;
      *(void *)(a4 + 16) = 0;
      *(void *)(a4 + 24) = 0x3FF0000000000000;
      *(void *)(a4 + 32) = 0;
      *(void *)(a4 + 40) = 0;
      return result;
    case 2:
      double v6 = (double)a2;
      *(void *)a4 = 0xBFF0000000000000;
      *(void *)(a4 + 8) = 0;
      *(void *)(a4 + 16) = 0;
      *(void *)(a4 + 24) = 0x3FF0000000000000;
      goto LABEL_9;
    case 3:
      double v7 = (double)a2;
      double v8 = (double)a3;
      *(void *)a4 = 0xBFF0000000000000;
      *(void *)(a4 + 8) = 0;
      *(void *)(a4 + 16) = 0;
      *(void *)(a4 + 24) = 0xBFF0000000000000;
      goto LABEL_11;
    case 4:
      double v9 = (double)a3;
      *(void *)a4 = 0x3FF0000000000000;
      *(void *)(a4 + 8) = 0;
      *(void *)(a4 + 16) = 0;
      *(void *)(a4 + 24) = 0xBFF0000000000000;
      goto LABEL_13;
    case 5:
      __asm { FMOV            V0.2D, #1.0; jumptable 000000025933CC14 case 5 }
      *(_OWORD *)(a4 + 8) = _Q0;
      *(void *)(a4 + 32) = 0;
      *(void *)(a4 + 40) = 0;
      *(void *)(a4 + 24) = 0;
      return result;
    case 6:
      double v6 = (double)a3;
      *(_OWORD *)(a4 + 8) = xmmword_25933F5A0;
LABEL_9:
      *(double *)(a4 + 32) = v6;
      return result;
    case 7:
      double v7 = (double)a3;
      double v8 = (double)a2;
      __asm { FMOV            V2.2D, #-1.0 }
      *(_OWORD *)(a4 + 8) = _Q2;
LABEL_11:
      *(double *)(a4 + 32) = v7;
      *(double *)(a4 + 40) = v8;
      break;
    case 8:
      double v9 = (double)a2;
      *(_OWORD *)(a4 + 8) = xmmword_25933F590;
      *(void *)(a4 + 24) = 0;
      *(void *)(a4 + 32) = 0;
LABEL_13:
      *(double *)(a4 + 40) = v9;
      break;
    default:
      uint64_t v4 = MEMORY[0x263F000D0];
      long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)a4 = *MEMORY[0x263F000D0];
      *(_OWORD *)(a4 + 16) = v5;
      *(_OWORD *)(a4 + 32) = *(_OWORD *)(v4 + 32);
      break;
  }
  return result;
}

double storedSizeForOrientation(uint64_t a1, double a2, double a3)
{
  memset(&v7, 0, sizeof(v7));
  makePresentationTransform(a1, 0, 0, (uint64_t)&v6);
  CGAffineTransformInvert(&v7, &v6);
  *(void *)&double result = *(_OWORD *)&vabsq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v7.c, a3), *(float64x2_t *)&v7.a, a2));
  return result;
}

double presentationSizeForOrientation(uint64_t a1, double a2, double a3)
{
  float64x2_t v7 = 0u;
  long long v8 = 0u;
  float64x2_t v6 = 0u;
  makePresentationTransform(a1, 0, 0, (uint64_t)&v6);
  *(void *)&double result = *(_OWORD *)&vabsq_f64(vmlaq_n_f64(vmulq_n_f64(v7, a3), v6, a2));
  return result;
}

CGFloat uprightCTM@<D0>(CGImage *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  CGFloat Height = (double)CGImageGetHeight(a1);
  uint64_t v6 = MEMORY[0x263F000D0];
  long long v7 = *MEMORY[0x263F000D0];
  long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)a3 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a3 + 16) = v8;
  long long v9 = *(_OWORD *)(v6 + 32);
  *(_OWORD *)(a3 + 32) = v9;
  *(_OWORD *)&t1.a = v7;
  *(_OWORD *)&t1.c = v8;
  *(_OWORD *)&t1.tx = v9;
  t2.b = 0.0;
  t2.c = 0.0;
  t2.a = 1.0;
  *(_OWORD *)&t2.d = xmmword_25933F5B0;
  t2.ty = Height;
  CGAffineTransformConcat((CGAffineTransform *)a3, &t1, &t2);
  long long v10 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a3;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a3 + 32);
  long long v11 = a2[1];
  *(_OWORD *)&v16.a = *a2;
  *(_OWORD *)&v16.c = v11;
  *(_OWORD *)&v16.tx = a2[2];
  CGAffineTransformConcat(&t1, &t2, &v16);
  long long v12 = *(_OWORD *)&t1.c;
  *(_OWORD *)a3 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a3 + 16) = v12;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&t1.tx;
  long long v13 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a3;
  *(_OWORD *)&t2.c = v13;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a3 + 32);
  v16.b = 0.0;
  v16.c = 0.0;
  v16.a = 1.0;
  *(_OWORD *)&v16.d = xmmword_25933F5B0;
  v16.ty = Height;
  CGAffineTransformConcat(&t1, &t2, &v16);
  long long v14 = *(_OWORD *)&t1.c;
  *(_OWORD *)a3 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a3 + 16) = v14;
  CGFloat result = t1.tx;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&t1.tx;
  return result;
}

double flipYNormalizedRect(double a1, double a2, double a3, double a4)
{
  v5.b = 0.0;
  v5.c = 0.0;
  v5.a = 1.0;
  *(_OWORD *)&v5.d = xmmword_25933F5B0;
  v5.ty = 1.0;
  *(void *)&double result = (unint64_t)CGRectApplyAffineTransform(*(CGRect *)&a1, &v5);
  return result;
}

id flipYNormalizedRects(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && [v1 count])
  {
    CFDictionaryRef v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v11 = v2;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) rectValue];
          v17.a = 1.0;
          v17.b = 0.0;
          v17.c = 0.0;
          *(_OWORD *)&v17.d = xmmword_25933F5B0;
          v17.ty = 1.0;
          CGRect v12 = CGRectApplyAffineTransform(v21, &v17);
          long long v9 = [MEMORY[0x263F08D40] valueWithBytes:&v12 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v6);
    }

    uint64_t v2 = v11;
  }
  else
  {
    CFDictionaryRef v3 = 0;
  }

  return v3;
}

double renormalizeRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7, CGFloat a8)
{
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, a7, a8);
  CGAffineTransform v14 = v15;
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  return a5 + COERCE_DOUBLE(CGRectApplyAffineTransform(v16, &v14));
}

double reduceRectToAspectRatioAndCenter(double a1, double a2, double a3, double a4, double a5)
{
  return reduceRectToAspectRatio(a1, a2, a3, a4, a5, a3 * 0.5);
}

double reduceRectToAspectRatio(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a4 * a5;
  if (a4 * a5 >= a3) {
    double v6 = a3;
  }
  double v7 = v6 * 0.5;
  if (a1 + v6 * 0.5 >= a6) {
    a6 = a1 + v6 * 0.5;
  }
  double v8 = a1 + a3 - v7;
  if (v8 >= a6) {
    double v8 = a6;
  }
  return v8 - v7;
}

double reduceRectToAspectRatioWithCushion(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return reduceRectToAspectRatio(a1 + a3 * a6, a2 + a4 * a6, a3 * (a6 * -2.0 + 1.0), a4 * (a6 * -2.0 + 1.0), a5, a7);
}

uint64_t canEncodeHEIC()
{
  if (canEncodeHEIC_onceToken != -1) {
    dispatch_once(&canEncodeHEIC_onceToken, &__block_literal_global_1);
  }
  return canEncodeHEIC_isSupported;
}

void __canEncodeHEIC_block_invoke()
{
  CFArrayRef v1 = CGImageDestinationCopyTypeIdentifiers();
  v0 = [(id)*MEMORY[0x263F1DAE8] identifier];
  canEncodeHEIC_isSupported = [(__CFArray *)v1 containsObject:v0];
}

id saveDataToFile(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v7 = 0;
  [a1 writeToURL:v3 options:0 error:&v7];
  id v4 = v7;
  if (v4)
  {
    uint64_t v5 = pfl_layout_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_259336000, v5, OS_LOG_TYPE_DEFAULT, "saveDataToFile: cannot save data to %@, error = %@\n", buf, 0x16u);
    }
  }
  return v4;
}

__CFData *pngDataFromImage(CGImage *a1)
{
  uint64_t v2 = [MEMORY[0x263EFF990] data];
  id v3 = [(id)*MEMORY[0x263F1DC08] identifier];
  id v4 = CGImageDestinationCreateWithData(v2, v3, 1uLL, 0);

  if (v4)
  {
    CGImageDestinationAddImage(v4, a1, 0);
    CGImageDestinationFinalize(v4);
    CFRelease(v4);
  }
  else
  {
    uint64_t v5 = pfl_layout_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259336000, v5, OS_LOG_TYPE_DEFAULT, "pngDataFromImage: cannot create imageDestinationRef\n", buf, 2u);
    }
  }
  if (![(__CFData *)v2 length])
  {
    double v6 = pfl_layout_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl(&dword_259336000, v6, OS_LOG_TYPE_DEFAULT, "pngDataFromImage: cannot generate png data for image", v8, 2u);
    }

    uint64_t v2 = 0;
  }
  return v2;
}

id _rectAsString(double a1, double a2, double a3, double a4)
{
  if (a4 <= 1.0 && a3 <= 1.0) {
    uint64_t v5 = @"{ %.5f, %.5f, %.5f, %.5f }";
  }
  else {
    uint64_t v5 = @"{ %.1f, %.1f, %.1f, %.1f }";
  }
  double v6 = objc_msgSend(NSString, "stringWithFormat:", v5, *(void *)&a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
  return v6;
}

id PFLGenerateWatchLayout(void *a1, void *a2, uint64_t a3, CGImage *a4, unint64_t a5, void *a6, void *a7, int a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12, double a13, double a14, double a15, double a16)
{
  uint64_t v177 = *MEMORY[0x263EF8340];
  id v31 = a1;
  id v32 = a2;
  id v33 = a6;
  id v160 = a7;
  uint64_t v34 = @"jpg";
  if (a8)
  {
    uint64_t v34 = @"heic";
    int v35 = (id *)MEMORY[0x263F1DAE8];
  }
  else
  {
    int v35 = (id *)MEMORY[0x263F1DB40];
  }
  v159 = v34;
  id v36 = *v35;
  uint64_t v37 = objc_opt_new();
  [v37 setTimePosition:a5];
  objc_msgSend(v37, "setTimeRect:", a13, a14, a15, a16);
  [v37 setBackgroundZorder:0.0];
  [v37 setTimeElementZorder:1.0];
  double v38 = 2.0;
  if (!a4) {
    double v38 = 0.0;
  }
  [v37 setForegroundZorder:v38];
  double v163 = (double)(unint64_t)[v31 pixelWidth];
  v156 = v31;
  double v39 = (double)(unint64_t)[v31 pixelHeight];
  CGAffineTransformMakeScale(&v175, v163, v39);
  v179.origin.CGFloat x = a9;
  v179.origin.CGFloat y = a10;
  v179.size.width = a11;
  v179.size.CGFloat height = a12;
  CGRect v180 = CGRectApplyAffineTransform(v179, &v175);
  CGFloat x = v180.origin.x;
  CGFloat y = v180.origin.y;
  CGFloat v42 = v180.size.width;
  CGFloat height = v180.size.height;
  CGFloat v44 = *MEMORY[0x263F5DE98] + 1.0;
  CGFloat v45 = v180.origin.x + v180.size.width * 0.5;
  CGFloat v46 = v180.origin.y + v180.size.height * 0.5;
  CGAffineTransformMakeTranslation(&t1, -v45, -v46);
  v181.origin.CGFloat x = x;
  v181.origin.CGFloat y = y;
  v181.size.width = v42;
  v181.size.CGFloat height = height;
  CGRect v182 = CGRectApplyAffineTransform(v181, &t1);
  CGFloat v47 = v182.origin.x;
  CGFloat v48 = v182.origin.y;
  CGFloat v49 = v182.size.width;
  CGFloat v50 = v182.size.height;
  CGAffineTransformMakeScale(&v171, v44, v44);
  v183.origin.CGFloat x = v47;
  v183.origin.CGFloat y = v48;
  v183.size.width = v49;
  v183.size.CGFloat height = v50;
  CGRect v184 = CGRectApplyAffineTransform(v183, &v171);
  CGFloat v51 = v184.origin.x;
  CGFloat v52 = v184.origin.y;
  CGFloat v53 = v184.size.width;
  CGFloat v54 = v184.size.height;
  CGAffineTransformMakeTranslation(&transform, v45, v46);
  v185.origin.CGFloat x = v51;
  v185.origin.CGFloat y = v52;
  v185.size.width = v53;
  v185.size.CGFloat height = v54;
  CGRect v186 = CGRectApplyAffineTransform(v185, &transform);
  double v55 = v186.origin.x;
  double v56 = v186.origin.y;
  double v57 = v186.size.height * (v39 / v186.size.height);
  if (v186.size.width > v163)
  {
    double v58 = v163;
  }
  else
  {
    double v57 = v186.size.height;
    double v58 = v186.size.width;
  }
  if (v186.size.height > v39) {
    double v59 = v39;
  }
  else {
    double v59 = v57;
  }
  if (v186.size.height > v39) {
    double v60 = v163 / v186.size.width * v58;
  }
  else {
    double v60 = v58;
  }
  double v61 = 0.0;
  if (v55 < 0.0 || (double v61 = v55, v55 + v186.size.width > v163))
  {
    if (v61 >= v163 - v186.size.width) {
      double v55 = v163 - v186.size.width;
    }
    else {
      double v55 = v61;
    }
  }
  double v62 = 0.0;
  if (v56 < 0.0 || (double v62 = v56, v56 + v186.size.height > v39))
  {
    if (v62 >= v39 - v186.size.height) {
      double v56 = v39 - v186.size.height;
    }
    else {
      double v56 = v62;
    }
  }
  BOOL v63 = a4 != 0;
  uint64_t v64 = NSString;
  id v158 = v33;
  v161 = objc_msgSend(v64, "stringWithUTF8String:", objc_msgSend(v158, "fileSystemRepresentation"));
  if (a5 > 8) {
    v65 = "HM";
  }
  else {
    v65 = off_26544BF00[a5];
  }
  v162 = [NSString stringWithFormat:@"base_%s_%@.%@", v65, v160, v159];
  v157 = [v161 stringByAppendingPathComponent:v162];
  id v66 = [NSURL fileURLWithPath:v157];
  id v165 = v32;
  id v67 = v36;
  id v68 = v66;
  uint64_t v69 = [PFLImageDataScaler alloc];
  double v70 = rint(v56);
  int64_t v71 = (uint64_t)rint(v55) & (*(void *)&v63 | 0xFFFFFFFFFFFFFFFELL);
  double v72 = *MEMORY[0x263F5DEA0];
  double v73 = *(double *)(MEMORY[0x263F5DEA0] + 8);
  double v74 = (double)v71;
  double v75 = (double)(uint64_t)((uint64_t)v70 & (*(void *)&v63 | 0xFFFFFFFFFFFFFFFELL));
  id v76 = -[PFLImageDataScaler initWithSize:crop:data:orientation:type:outputSize:](v69, "initWithSize:crop:data:orientation:type:outputSize:", v165, a3, v67, v163, v39, (double)v71, v75, v60, v59, *MEMORY[0x263F5DEA0], v73);
  uint64_t v77 = 1;
  if (v76)
  {
    v171.a = 0.0;
    *(void *)&v171.b = &v171;
    *(void *)&v171.c = 0x3032000000;
    *(void *)&v171.d = __Block_byref_object_copy__1;
    *(void *)&v171.tCGFloat x = __Block_byref_object_dispose__1;
    v171.tCGFloat y = 0.0;
    transform.a = 0.0;
    *(void *)&transform.b = &transform;
    *(void *)&transform.c = 0x2020000000;
    LODWORD(transform.d) = 1;
    dispatch_semaphore_t v78 = dispatch_semaphore_create(0);
    *(void *)&t1.a = MEMORY[0x263EF8330];
    *(void *)&t1.b = 3221225472;
    *(void *)&t1.c = __cropScaleSaveToFile_block_invoke;
    *(void *)&t1.d = &unk_26544BEE0;
    *(void *)&t1.tCGFloat x = v68;
    v173 = &v171;
    p_CGAffineTransform transform = &transform;
    v79 = v78;
    *(void *)&t1.tCGFloat y = v79;
    [(PFLImageDataScaler *)v76 cropAndScaleWithCompletion:&t1];
    dispatch_semaphore_wait(v79, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v77 = *(unsigned int *)(*(void *)&transform.b + 24);
    id v164 = *(id *)(*(void *)&v171.b + 40);

    _Block_object_dispose(&transform, 8);
    _Block_object_dispose(&v171, 8);
  }
  else
  {
    id v164 = 0;
  }

  v80 = pfl_layout_log();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(t1.a) = 138412546;
    *(void *)((char *)&t1.a + 4) = v68;
    WORD2(t1.b) = 2112;
    *(void *)((char *)&t1.b + 6) = v164;
    _os_log_impl(&dword_259336000, v80, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayers: saved base image to %@, error == %@", (uint8_t *)&t1, 0x16u);
  }

  if (v164) {
    goto LABEL_34;
  }
  [v37 setBaseImageName:v162];
  objc_msgSend(v37, "setOriginalCrop:", v74, v75, v60, v59);
  [v37 setMaskImageName:0];
  if (a4)
  {
    CGImageRef v82 = CGImageRetain(a4);
    id v83 = v82;
    if (v77 == 1)
    {
      v84 = v82;
    }
    else
    {
      v85 = pfl_layout_log();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(t1.a) = 134218240;
        *(void *)((char *)&t1.a + 4) = 1;
        WORD2(t1.b) = 2048;
        *(void *)((char *)&t1.b + 6) = v77;
        _os_log_impl(&dword_259336000, v85, OS_LOG_TYPE_DEFAULT, "saved photo has changed orientation; adjusting the mask from %ld to %ld",
          (uint8_t *)&t1,
          0x16u);
      }

      if (!v83) {
        goto LABEL_45;
      }
      size_t v86 = CGImageGetWidth(v83);
      size_t v87 = CGImageGetHeight(v83);
      double v88 = presentationSizeForOrientation(1, (double)v86, (double)v87);
      double v90 = storedSizeForOrientation(v77, v88, v89);
      double v92 = v91;
      ColorSpace = CGImageGetColorSpace(v83);
      int NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
      memset(&v175.c, 0, 32);
      int v95 = (NumberOfComponents & 0x10000000) != 0 ? 8 * NumberOfComponents + 14 : (8 * NumberOfComponents) | 7;
      *(_OWORD *)&v175.a = 0uLL;
      makePresentationTransform(1, v86, v87, (uint64_t)&v175);
      memset(&v170, 0, sizeof(v170));
      unint64_t v149 = (int)v92;
      size_t widtha = (int)v90;
      makePresentationTransform(v77, widtha, v149, (uint64_t)&v170);
      CGAffineTransform v169 = v175;
      CGAffineTransform t1 = v170;
      CGAffineTransformInvert(&t2, &t1);
      CGAffineTransform t1 = v175;
      CGAffineTransformConcat(&v169, &t1, &t2);
      int valuea = (v95 >> 3) * (int)v90;
      id v153 = [MEMORY[0x263EFF990] dataWithLength:valuea * (int)v92];
      v96 = (void *)[v153 mutableBytes];
      size_t BitsPerComponent = CGImageGetBitsPerComponent(v83);
      shouldInterpolate = CGImageGetColorSpace(v83);
      uint32_t AlphaInfo = CGImageGetAlphaInfo(v83);
      v100 = CGBitmapContextCreate(v96, widtha, v149, BitsPerComponent, valuea, shouldInterpolate, AlphaInfo);
      CGAffineTransform v167 = v169;
      CGContextSaveGState(v100);
      CGAffineTransform v171 = v167;
      memset(&t1, 0, sizeof(t1));
      uprightCTM(v83, &v171, (uint64_t)&t1);
      memset(&v171, 0, sizeof(v171));
      CGAffineTransform transform = t1;
      CGAffineTransformInvert(&v171, &transform);
      CGAffineTransform transform = t1;
      CGContextConcatCTM(v100, &transform);
      CGAffineTransform transform = v171;
      v187.origin.CGFloat x = 0.0;
      v187.origin.CGFloat y = 0.0;
      v187.size.width = v90;
      v187.size.CGFloat height = v92;
      CGRect v188 = CGRectApplyAffineTransform(v187, &transform);
      CGContextDrawImage(v100, v188, v83);
      CGContextRestoreGState(v100);
      CGContextRelease(v100);
      id v101 = v153;

      CFDataRef v145 = (const __CFData *)v101;
      v154 = CGDataProviderCreateWithCFData(v145);
      size_t v146 = CGImageGetBitsPerComponent(v83);
      size_t BitsPerPixel = CGImageGetBitsPerPixel(v83);
      v143 = CGImageGetColorSpace(v83);
      LODWORD(v101) = CGImageGetBitmapInfo(v83);
      decode = CGImageGetDecode(v83);
      LOBYTE(shouldInterpolate) = CGImageGetShouldInterpolate(v83);
      CGColorRenderingIntent RenderingIntent = CGImageGetRenderingIntent(v83);
      v84 = CGImageCreate(widtha, v149, v146, BitsPerPixel, valuea, v143, (CGBitmapInfo)v101, v154, decode, (BOOL)shouldInterpolate, RenderingIntent);
      CGDataProviderRelease(v154);

      if (!v84)
      {
LABEL_45:
        v104 = pfl_layout_log();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
          PFLGenerateWatchLayout_cold_1((uint64_t)v83, v77, v104);
        }

        v84 = 0;
      }
      CGImageRelease(v83);
    }
    if (v84)
    {
      size_t v105 = CGImageGetWidth(a4);
      unint64_t v106 = [v156 pixelWidth];
      CGAffineTransformMakeScale(&v166, (double)v105 / (double)v106, (double)v105 / (double)v106);
      v189.origin.CGFloat x = v74;
      v189.origin.CGFloat y = v75;
      v189.size.width = v60;
      v189.size.CGFloat height = v59;
      CGRect v190 = CGRectApplyAffineTransform(v189, &v166);
      double v107 = v190.origin.x;
      double v108 = v190.origin.y;
      double v109 = v190.size.width;
      double v110 = v190.size.height;
      v111 = pfl_layout_log();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        v112 = _rectAsString(v107, v108, v109, v110);
        LODWORD(t1.a) = 138412290;
        *(void *)((char *)&t1.a + 4) = v112;
        _os_log_impl(&dword_259336000, v111, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayers: mask crop rect == %@", (uint8_t *)&t1, 0xCu);
      }
      if (a5 > 8) {
        v113 = "HM";
      }
      else {
        v113 = off_26544BF00[a5];
      }
      width = [NSString stringWithFormat:@"mask_%s_%@.png", v113, v160];
      v150 = [v161 stringByAppendingPathComponent:width];
      id v155 = [NSURL fileURLWithPath:v150];
      double v114 = reduceRectToAspectRatioAndCenter(v107, v108, v109, v110, v72 / v73);
      double v116 = v115;
      BOOL v119 = v117 <= v118;
      double v120 = rint(v118);
      double v121 = ceil(v72 * v120 / v73);
      double v122 = rint(v117);
      double v123 = ceil(v73 * v122 / v72);
      if (v119) {
        CGFloat v124 = v120;
      }
      else {
        CGFloat v124 = v123;
      }
      if (v119) {
        CGFloat v125 = v121;
      }
      else {
        CGFloat v125 = v122;
      }
      size_t v126 = CGImageGetWidth(v84);
      size_t v127 = CGImageGetHeight(v84);
      memset(&t1, 0, sizeof(t1));
      makePresentationTransform(v77, v126, v127, (uint64_t)&v171);
      CGAffineTransformInvert(&t1, &v171);
      CGAffineTransform transform = t1;
      v191.origin.CGFloat x = rint(v114);
      v191.origin.CGFloat y = rint(v116);
      v191.size.width = v125;
      v191.size.CGFloat height = v124;
      CGRect v192 = CGRectApplyAffineTransform(v191, &transform);
      v128 = CGImageCreateWithImageInRect(v84, v192);
      if (v128)
      {
        v129 = [MEMORY[0x263EFF990] data];
        v130 = [(id)*MEMORY[0x263F1DC08] identifier];
        v131 = CGImageDestinationCreateWithData(v129, v130, 1uLL, 0);

        if (v131)
        {
          Mutable = CGImageMetadataCreateMutable();
          if (Mutable)
          {
            value = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v77);
            CGImageMetadataSetValueWithPath(Mutable, 0, @"tiff:Orientation", value);
            if (v72 >= v73) {
              double v133 = v72;
            }
            else {
              double v133 = v73;
            }
            v175.a = *(CGFloat *)MEMORY[0x263F0EFE0];
            v134 = [NSNumber numberWithDouble:v133];
            v175.b = *(CGFloat *)MEMORY[0x263F0F020];
            *(void *)&transform.a = v134;
            *(void *)&transform.b = MEMORY[0x263EFFA88];
            CFDictionaryRef v135 = [NSDictionary dictionaryWithObjects:&transform forKeys:&v175 count:2];

            CGImageDestinationAddImageAndMetadata(v131, v128, Mutable, v135);
            CGImageDestinationFinalize(v131);
            CFRelease(Mutable);

            v136 = value;
          }
          else
          {

            v136 = pfl_photo_log();
            if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(transform.a) = 0;
              _os_log_impl(&dword_259336000, v136, OS_LOG_TYPE_DEFAULT, "cropScaleMask: cannot create metadataRef", (uint8_t *)&transform, 2u);
            }
            v129 = 0;
          }

          CFRelease(v131);
        }
        else
        {

          v138 = pfl_photo_log();
          if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(transform.a) = 0;
            _os_log_impl(&dword_259336000, v138, OS_LOG_TYPE_DEFAULT, "cropScaleMask: cannot create imageDestinationRef", (uint8_t *)&transform, 2u);
          }

          v129 = 0;
        }
        CFRelease(v128);
      }
      else
      {
        v137 = pfl_photo_log();
        if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(transform.a) = 0;
          _os_log_impl(&dword_259336000, v137, OS_LOG_TYPE_DEFAULT, "cropScaleMask: cannot create croppedImageRef", (uint8_t *)&transform, 2u);
        }

        v129 = 0;
      }
      v139 = pfl_layout_log();
      if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v140 = [(__CFData *)v129 length];
        LODWORD(t1.a) = 134218242;
        *(void *)((char *)&t1.a + 4) = v140;
        WORD2(t1.b) = 2112;
        *(void *)((char *)&t1.b + 6) = v155;
        _os_log_impl(&dword_259336000, v139, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayout: saving %ld bytes of mask data to %@", (uint8_t *)&t1, 0x16u);
      }

      v141 = saveDataToFile(v129, v155);
      if (v141)
      {

LABEL_34:
        id v81 = 0;
        goto LABEL_85;
      }
      [v37 setMaskImageName:width];
      CGImageRelease(v84);
    }
  }
  [v37 setImageAOTBrightness:0.0];
  [v37 setUserEdited:0];
  id v81 = v37;
LABEL_85:

  return v81;
}

void sub_25933E518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose((const void *)(v59 - 224), 8);
  _Block_object_dispose(&a59, 8);
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

void __cropScaleSaveToFile_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pfl_layout_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = [v3 length];
      uint64_t v7 = *(void *)(a1 + 32);
      int v14 = 134218242;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_impl(&dword_259336000, v4, OS_LOG_TYPE_DEFAULT, "cropScaleSaveToFile: saving %ld bytes to %@", (uint8_t *)&v14, 0x16u);
    }

    uint64_t v8 = saveDataToFile(v3, *(void **)(a1 + 32));
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = getImageOrientationFromData((const __CFData *)v3);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_259336000, v4, OS_LOG_TYPE_DEFAULT, "cropScaleSaveToFile: failed to crop", (uint8_t *)&v14, 2u);
    }

    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:0x27072E6A0 code:3 userInfo:0];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __PFLGeneratePhotosFaceCommon_block_invoke_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = v5;
  _os_log_error_impl(&dword_259336000, log, OS_LOG_TYPE_ERROR, "Couldn't retrieve image data for asset %@, error == %@", buf, 0x16u);
}

void PFLGenerateWatchLayout_cold_1(uint64_t a1, unsigned int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 138412802;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = 1;
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_259336000, log, OS_LOG_TYPE_ERROR, "cannot reorient mask image %@ from %ld to %ld", (uint8_t *)&v3, 0x20u);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageAndMetadata(CGImageDestinationRef idst, CGImageRef image, CGImageMetadataRef metadata, CFDictionaryRef options)
{
}

CFArrayRef CGImageDestinationCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x270EF4F18]();
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x270EE67F0](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

CGColorRenderingIntent CGImageGetRenderingIntent(CGImageRef image)
{
  return MEMORY[0x270EE6840](image);
}

BOOL CGImageGetShouldInterpolate(CGImageRef image)
{
  return MEMORY[0x270EE6848](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x270EF4F80]();
}

BOOL CGImageMetadataSetValueWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CFTypeRef value)
{
  return MEMORY[0x270EF4FC0](metadata, parent, path, value);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5028](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

uint64_t PFCRectForTimePosition()
{
  return MEMORY[0x270F53A90]();
}

uint64_t PFLCCalculateLayout()
{
  return MEMORY[0x270F53AA0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void objc_storeStrong(id *location, id obj)
{
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

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x270EDAD68](*(void *)&pid, *(void *)&flavor, buffer);
}

uint64_t proc_reset_footprint_interval()
{
  return MEMORY[0x270EDADA0]();
}