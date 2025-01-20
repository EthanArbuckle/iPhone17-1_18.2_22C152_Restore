@interface PIInpaintRendering
+ ($FD18CD26FAB5729647810B74E671536E)sourceExtentForMaskExtent:(SEL)a3 exclusionMaskExtent:(id *)a4 imageExtent:(id *)a5;
+ (BOOL)renderImage:(id)a3 intoMutableBuffer:(id)a4 destinationBounds:(id *)a5 renderer:(id)a6 error:(id *)a7;
+ (BOOL)shouldDilateMaskForOperation:(id)a3;
+ (double)dilationAmountForMaskSize:(CGSize)a3 fullSize:(CGSize)a4;
+ (float)computeLocalHeadroomForHDRImage:(id)a3 inRect:(CGRect)a4 context:(id)a5;
+ (id)_imageByOverlayingForegroundImage:(id)a3 onImage:(id)a4 withOpacity:(double)a5;
+ (id)imageByOverlayingBoundsRect:(CGRect)a3 onImage:(id)a4;
+ (id)imageByOverlayingMaskImage:(id)a3 onImage:(id)a4 withOpacity:(double)a5;
+ (id)inpaintedImageWithInputImage:(id)a3 maskImage:(id)a4 exclusionMaskImage:(id)a5 headroom:(float)a6;
+ (id)maskByAddingMask:(id)a3 toMask:(id)a4;
+ (id)maskByDilatingMask:(id)a3 fullExtent:(CGRect)a4;
+ (id)maskByFillingHolesInMask:(id)a3;
+ (id)maskByRemovingMask:(id)a3 fromMask:(id)a4;
+ (id)maskByUpscalingMask:(id)a3 withGuideImage:(id)a4;
+ (id)redactedImageWithInputImage:(id)a3 maskImage:(id)a4;
+ (void)addModelsToInpaintFilter:(id)a3;
+ (void)initialize;
@end

@implementation PIInpaintRendering

+ (BOOL)renderImage:(id)a3 intoMutableBuffer:(id)a4 destinationBounds:(id *)a5 renderer:(id)a6 error:(id *)a7
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v13)
  {
    v33 = NUAssertLogger_24119();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "renderer != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v34;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v35 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v37 = NUAssertLogger_24119();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v38)
      {
        v46 = dispatch_get_specific(*v35);
        v47 = (void *)MEMORY[0x1E4F29060];
        id v48 = v46;
        v49 = [v47 callStackSymbols];
        v50 = [v49 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v50;
        _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v38)
    {
LABEL_22:
      v44 = [MEMORY[0x1E4F29060] callStackSymbols];
      v45 = [v44 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v45;
      _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
LABEL_28:

    _NUAssertFailHandler();
    __break(1u);
  }
  if (!a7)
  {
    v39 = NUAssertLogger_24119();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v40;
      _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v41 = (const void **)MEMORY[0x1E4F7A308];
    v42 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v37 = NUAssertLogger_24119();
    BOOL v43 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (!v42)
    {
      if (!v43) {
        goto LABEL_28;
      }
      goto LABEL_22;
    }
    if (v43)
    {
      v51 = dispatch_get_specific(*v41);
      v52 = (void *)MEMORY[0x1E4F29060];
      id v53 = v51;
      v54 = [v52 callStackSymbols];
      v55 = [v54 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v55;
      _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_28;
  }
  v14 = v13;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a5->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf = a5->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16] = var1;
  if (NUPixelRectIsEmpty())
  {
    [MEMORY[0x1E4F7A438] invalidError:@"empty stroke bounds" object:v11];
    BOOL v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = [PIPerfPowerService alloc];
    v18 = +[PIPerfPowerServiceIdentifier genEditIdentifier];
    v19 = [(PIPerfPowerService *)v17 initWithIdentifier:v18 operation:1];

    v20 = (id)s_log_24137;
    v21 = v20;
    os_signpost_id_t v22 = s_signpost_24138;
    if ((unint64_t)(s_signpost_24138 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9680000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PIInpaintRendering.renderImage", "", buf, 2u);
    }

    v23 = [v12 format];
    v24 = [MEMORY[0x1E4F7A448] sharedFactory];
    v25 = [v24 bufferStoragePool];

    v26 = objc_msgSend(v25, "newStorageWithMinimumSize:format:", a5->var1.var0, a5->var1.var1, v23);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    buf[24] = 1;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    $0AC6E346AE4835514AAA8AC86D8F4844 v27 = a5->var1;
    $0AC6E346AE4835514AAA8AC86D8F4844 var0 = a5->var0;
    v57[2] = __85__PIInpaintRendering_renderImage_intoMutableBuffer_destinationBounds_renderer_error___block_invoke;
    v57[3] = &unk_1E5D81220;
    $0AC6E346AE4835514AAA8AC86D8F4844 v64 = v27;
    id v28 = v26;
    id v58 = v28;
    id v59 = v14;
    id v60 = v12;
    v65 = a7;
    id v61 = v11;
    v62 = buf;
    [(PIPerfPowerService *)v19 measureBlock:v57];
    v29 = (id)s_log_24137;
    v30 = v29;
    os_signpost_id_t v31 = s_signpost_24138;
    if ((unint64_t)(s_signpost_24138 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)v56 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9680000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PIInpaintRendering.renderImage", "", v56, 2u);
    }

    [v25 returnStorage:v28];
    BOOL v16 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }

  return v16;
}

void __85__PIInpaintRendering_renderImage_intoMutableBuffer_destinationBounds_renderer_error___block_invoke(uint64_t a1)
{
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__24145;
  id v48 = __Block_byref_object_dispose__24146;
  id v49 = 0;
  uint64_t v2 = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 96);
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __85__PIInpaintRendering_renderImage_intoMutableBuffer_destinationBounds_renderer_error___block_invoke_141;
  v33[3] = &unk_1E5D811D0;
  id v34 = *(id *)(a1 + 48);
  id v35 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 88);
  long long v38 = *(_OWORD *)(a1 + 72);
  long long v39 = v7;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = v2;
  uint64_t v43 = v3;
  id v36 = v6;
  v37 = &v44;
  if ([v4 useAsCIRenderDestinationWithRenderer:v5 block:v33] == 1)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v8 = [*(id *)(a1 + 48) size];
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = v8;
    uint64_t v30 = v9;
    NUPixelRectFlipYOrigin();
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v10 = [*(id *)(a1 + 32) size];
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = v10;
    uint64_t v24 = v11;
    NUPixelRectFlipYOrigin();
    memset(v20, 0, sizeof(v20));
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F7A5F8]) initWithRect:v20];
    id v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__PIInpaintRendering_renderImage_intoMutableBuffer_destinationBounds_renderer_error___block_invoke_2;
    v14[3] = &unk_1E5D811F8;
    id v15 = *(id *)(a1 + 48);
    long long v16 = v31;
    long long v17 = v32;
    long long v18 = v25;
    long long v19 = v26;
    if ([v13 readBufferInRegion:v12 block:v14] != 1)
    {
      **(void **)(a1 + 104) = [MEMORY[0x1E4F7A438] failureError:@"Failed to read buffer" object:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
  else
  {
    **(void **)(a1 + 104) = (id) v45[5];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }

  _Block_object_dispose(&v44, 8);
}

BOOL __85__PIInpaintRendering_renderImage_intoMutableBuffer_destinationBounds_renderer_error___block_invoke_141(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 colorSpace];
  objc_msgSend(v4, "setColorSpace:", objc_msgSend(v5, "CGColorSpace"));

  [v4 setLabel:@"PIInpaintRendering"];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v16 = 0;
  long long v9 = *(_OWORD *)(a1 + 80);
  v15[0] = *(_OWORD *)(a1 + 64);
  v15[1] = v9;
  uint64_t v10 = objc_msgSend(v6, "renderImage:rect:toDestination:atPoint:error:", v7, v15, v4, *(void *)(a1 + 96), *(void *)(a1 + 104), &v16);

  objc_storeStrong(v8, v16);
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v11 + 40);
  id v12 = [v10 waitUntilCompletedAndReturnError:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);

  return v12 != 0;
}

uint64_t __85__PIInpaintRendering_renderImage_intoMutableBuffer_destinationBounds_renderer_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 88);
  v7[0] = *(_OWORD *)(a1 + 72);
  v7[1] = v5;
  return objc_msgSend(MEMORY[0x1E4F7A528], "copyPixelsToImage:atPoint:fromBuffer:inRect:", v2, v3, v4, a2, v7);
}

+ (id)_imageByOverlayingForegroundImage:(id)a3 onImage:(id)a4 withOpacity:(double)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    long long v18 = NUAssertLogger_24119();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "foregroundImage != nil");
      long long v19 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v22 = NUAssertLogger_24119();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        id v36 = dispatch_get_specific(*v20);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        v20 = [v37 callStackSymbols];
        long long v39 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = (const void **)v36;
        __int16 v51 = 2114;
        v52 = v39;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v20;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v28 = _NUAssertFailHandler();
    goto LABEL_26;
  }
  long long v9 = v8;
  if (!v8)
  {
    long long v25 = NUAssertLogger_24119();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "backgroundImage != nil");
      long long v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v26;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v27 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v22 = NUAssertLogger_24119();
    int v28 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!v27)
    {
      if (v28)
      {
        uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
        v20 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v50 = v20;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_28:

      int v33 = _NUAssertFailHandler();
      goto LABEL_29;
    }
LABEL_26:
    if (v28)
    {
      uint64_t v40 = dispatch_get_specific(*v20);
      uint64_t v41 = (void *)MEMORY[0x1E4F29060];
      id v42 = v40;
      v20 = [v41 callStackSymbols];
      uint64_t v43 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v50 = (const void **)v40;
      __int16 v51 = 2114;
      v52 = v43;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_28;
  }
  if (a5 < 0.0 || a5 > 1.0)
  {
    uint64_t v30 = NUAssertLogger_24119();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "0.0 <= strength && strength <= 1.0");
      long long v31 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v31;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    long long v32 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v22 = NUAssertLogger_24119();
    int v33 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!v32)
    {
      if (v33)
      {
        id v34 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v50 = v35;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_31;
    }
LABEL_29:
    if (v33)
    {
      uint64_t v44 = dispatch_get_specific(*v20);
      v45 = (void *)MEMORY[0x1E4F29060];
      id v46 = v44;
      v47 = [v45 callStackSymbols];
      id v48 = [v47 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v50 = (const void **)v44;
      __int16 v51 = 2114;
      v52 = v48;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_31:

    _NUAssertFailHandler();
  }
  uint64_t v10 = [MEMORY[0x1E4F1E040] colorMatrixFilter];
  [v10 setInputImage:v7];
  uint64_t v11 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:1.0];
  [v10 setRVector:v11];

  id v12 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:a5];
  [v10 setAVector:v12];

  id v13 = [v10 outputImage];
  v14 = [MEMORY[0x1E4F1E040] sourceOverCompositingFilter];
  [v14 setInputImage:v13];
  [v14 setBackgroundImage:v9];
  id v15 = [v14 outputImage];
  [v9 extent];
  id v16 = objc_msgSend(v15, "imageByCroppingToRect:");

  return v16;
}

+ (id)imageByOverlayingBoundsRect:(CGRect)a3 onImage:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v43.origin.double x = x;
  v43.origin.double y = y;
  v43.size.double width = width;
  v43.size.double height = height;
  if (CGRectIsEmpty(v43))
  {
    uint64_t v24 = NUAssertLogger_24119();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      long long v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "CGRectIsEmpty(bounds) == false");
      *(_DWORD *)buf = 138543362;
      id v38 = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v26 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    int v28 = NUAssertLogger_24119();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        long long v32 = dispatch_get_specific(*v26);
        int v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        id v35 = [v33 callStackSymbols];
        id v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v38 = v32;
        __int16 v39 = 2114;
        uint64_t v40 = v36;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      uint64_t v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v38 = v31;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  [v9 extent];
  double v11 = v10;
  [v9 extent];
  if (v11 >= v12) {
    double v13 = v11;
  }
  else {
    double v13 = v12;
  }
  CGFloat v14 = fmax(v13 * 0.001, 1.0);
  id v15 = [MEMORY[0x1E4F1E040] roundedRectangleStrokeGeneratorFilter];
  objc_msgSend(v15, "setExtent:", x, y, width, height);
  [v15 setRadius:0.0];
  *(float *)&double v16 = v14;
  [v15 setWidth:v16];
  long long v17 = [MEMORY[0x1E4F1E008] whiteColor];
  [v15 setColor:v17];

  long long v18 = [v15 outputImage];
  long long v19 = [a1 _imageByOverlayingForegroundImage:v18 onImage:v9 withOpacity:1.0];
  v44.origin.double x = x;
  v44.origin.double y = y;
  v44.size.double width = width;
  v44.size.double height = height;
  CGRect v45 = CGRectInset(v44, v14, v14);
  objc_msgSend(v15, "setExtent:", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
  v20 = [MEMORY[0x1E4F1E008] grayColor];
  [v15 setColor:v20];

  uint64_t v21 = [v15 outputImage];

  uint64_t v22 = [a1 _imageByOverlayingForegroundImage:v21 onImage:v19 withOpacity:1.0];

  return v22;
}

+ (id)imageByOverlayingMaskImage:(id)a3 onImage:(id)a4 withOpacity:(double)a5
{
  id v8 = (void *)MEMORY[0x1E4F1E040];
  id v9 = a4;
  id v10 = a3;
  double v11 = [v8 maskToAlphaFilter];
  [v11 setInputImage:v10];

  double v12 = [v11 outputImage];
  double v13 = [a1 _imageByOverlayingForegroundImage:v12 onImage:v9 withOpacity:a5];

  return v13;
}

+ (id)redactedImageWithInputImage:(id)a3 maskImage:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 extent];
  if (v7 >= v8) {
    double v9 = v7;
  }
  else {
    double v9 = v8;
  }
  double v10 = round(v9 / 25.0);
  [v5 extent];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  if (v16 >= v18) {
    double v19 = v16;
  }
  else {
    double v19 = v18;
  }
  double v20 = round(v19 * 0.125);
  if (v10 >= v20) {
    double v10 = v20;
  }
  uint64_t v21 = [MEMORY[0x1E4F1E040] filterWithName:@"CIPixellate"];
  [v21 setValue:v6 forKey:@"inputImage"];
  uint64_t v22 = [NSNumber numberWithDouble:v10];
  [v21 setValue:v22 forKey:@"inputScale"];

  BOOL v23 = [v21 outputImage];
  uint64_t v24 = objc_msgSend(v23, "imageByCroppingToRect:", v12, v14, v16, v18);

  long long v25 = [MEMORY[0x1E4F1E040] sourceOverCompositingFilter];
  [v25 setBackgroundImage:v6];

  [v25 setInputImage:v24];
  long long v26 = [v25 outputImage];

  return v26;
}

+ (id)inpaintedImageWithInputImage:(id)a3 maskImage:(id)a4 exclusionMaskImage:(id)a5 headroom:(float)a6
{
  double v39 = *(double *)&a6;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [MEMORY[0x1E4F1E040] filterWithName:@"CIInpaintFilter"];
  if (!v12)
  {
    long long v26 = NUAssertLogger_24119();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = [NSString stringWithFormat:@"Couldn't find CIInpaintFilter."];
      *(_DWORD *)buf = 138543362;
      id v42 = v27;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int v28 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v30 = NUAssertLogger_24119();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        id v34 = dispatch_get_specific(*v28);
        id v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v37 = [v35 callStackSymbols];
        id v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v42 = v34;
        __int16 v43 = 2114;
        CGRect v44 = v38;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      long long v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v42 = v33;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  double v13 = (void *)v12;
  double v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F7A4A0], "inpaintShowsSurroundOutline"));
  [v13 setValue:v14 forKey:@"inputShowSurround"];

  [v13 setValue:v9 forKey:@"inputImage"];
  [v13 setValue:v10 forKey:@"inputMaskImage"];
  LODWORD(v15) = 1.0;
  double v16 = v39;
  if (*(float *)&v39 > 1.0)
  {
    LODWORD(v17) = 0;
    *((float *)&v17 + 1) = 1.0 / *(float *)&v39;
    double v18 = [v9 _imageByApplyingColorMatrixRed:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0 / *(float *)&v39)) green:v17 blue:0.0 bias:0.0];

    id v9 = [v18 _imageByApplyingGamma:0.833333313];

    [v13 setValue:v9 forKey:@"inputImage"];
  }
  objc_msgSend(a1, "addModelsToInpaintFilter:", v13, v15, v16, *(void *)&v39);
  double v19 = [v13 inputKeys];
  if ([v19 containsObject:@"inputRefinementModel"])
  {
    int v20 = [MEMORY[0x1E4F7A4A0] inpaintEnablesRefinementPass];

    if (!v20) {
      goto LABEL_8;
    }
    double v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F7A4A0], "inpaintEnablesRefinementPass"));
    [v13 setValue:v19 forKey:@"inputRefinementModel"];
  }

LABEL_8:
  if (v11) {
    [v13 setValue:v11 forKey:@"inputExcludeMask"];
  }
  uint64_t v21 = [v13 outputImage];
  uint64_t v22 = v21;
  if (*(float *)&v40 > 1.0)
  {
    BOOL v23 = objc_msgSend(v21, "_imageByApplyingGamma:", 1.20000005, v40);

    LODWORD(v24) = 0;
    HIDWORD(v24) = LODWORD(v40);
    uint64_t v22 = [v23 _imageByApplyingColorMatrixRed:COERCE_DOUBLE((unint64_t)LODWORD(v40)) green:v24 blue:0.0 bias:0.0];
  }
  return v22;
}

+ (float)computeLocalHeadroomForHDRImage:(id)a3 inRect:(CGRect)a4 context:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  if (!v12)
  {
    uint64_t v22 = &v43;
    long long v32 = NUAssertLogger_24119();
    BOOL v23 = "context != nil";
    id v20 = &unk_1A980A000;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      int v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "context != nil");
      LODWORD(v43.a) = 138543362;
      *(void *)((char *)&v43.a + 4) = v33;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v43, 0xCu);
    }
    double v18 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v11 = NUAssertLogger_24119();
    BOOL v34 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        specific = dispatch_get_specific(*v18);
        id v35 = (void *)MEMORY[0x1E4F29060];
        id v20 = specific;
        double v18 = [v35 callStackSymbols];
        id v5 = [v18 componentsJoinedByString:@"\n"];
        LODWORD(v43.a) = 138543618;
        *(void *)((char *)&v43.a + 4) = specific;
        WORD2(v43.b) = 2114;
        *(void *)((char *)&v43.b + 6) = v5;
        _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v43, 0x16u);
      }
    }
    else if (v34)
    {
      specific = [MEMORY[0x1E4F29060] callStackSymbols];
      double v18 = [specific componentsJoinedByString:@"\n"];
      LODWORD(v43.a) = 138543362;
      *(void *)((char *)&v43.a + 4) = v18;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v43, 0xCu);
    }
    _NUAssertFailHandler();
LABEL_19:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24224);
    goto LABEL_8;
  }
  specific = v12;
  double v14 = [v11 imageByApplyingFilter:@"CIMaximumComponent"];
  memset(&v43, 0, sizeof(v43));
  CGAffineTransformMakeScale(&v43, 0.125, 0.125);
  CGAffineTransform v42 = v43;
  double v15 = [v14 imageByApplyingTransform:&v42 highQualityDownsample:1];

  CGAffineTransform v42 = v43;
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  CGRect v46 = CGRectApplyAffineTransform(v45, &v42);
  uint64_t v40 = *MEMORY[0x1E4F1E478];
  double v16 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
  uint64_t v41 = v16;
  double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  double v18 = [v15 imageByApplyingFilter:@"CIAreaMaximum" withInputParameters:v17];

  v39[0] = 0;
  v39[1] = 0;
  id v19 = objc_alloc(MEMORY[0x1E4F1E070]);
  id v20 = (id)[v19 initWithBitmapData:v39 width:1 height:1 bytesPerRow:16 format:*MEMORY[0x1E4F1E310]];
  [v20 setColorSpace:0];
  id v38 = 0;
  id v5 = objc_msgSend(specific, "startTaskToRender:fromRect:toDestination:atPoint:error:", v18, v20, &v38, 0.0, 0.0, 1.0, 1.0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  id v21 = v38;
  id v37 = v21;
  uint64_t v22 = [v5 waitUntilCompletedAndReturnError:&v37];
  BOOL v23 = (char *)v37;

  if (v22)
  {
    float v24 = *(float *)v39;
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24224);
    }
    float v25 = fmaxf(v24, 1.0);
    long long v26 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v42.a) = 134218242;
      *(double *)((char *)&v42.a + 4) = v25;
      WORD2(v42.b) = 2114;
      *(void *)((char *)&v42.b + 6) = v18;
      _os_log_debug_impl(&dword_1A9680000, v26, OS_LOG_TYPE_DEBUG, "local headroom for image: %f, maxImg=%{public}@", (uint8_t *)&v42, 0x16u);
    }
    goto LABEL_10;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_19;
  }
LABEL_8:
  uint64_t v27 = (void *)*MEMORY[0x1E4F7A758];
  float v25 = 0.0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    BOOL v29 = (void *)MEMORY[0x1E4F29238];
    *(CGFloat *)id v36 = x;
    *(CGFloat *)&v36[1] = y;
    *(CGFloat *)&v36[2] = width;
    *(CGFloat *)&v36[3] = height;
    uint64_t v30 = v27;
    BOOL v31 = [v29 valueWithBytes:v36 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    LODWORD(v42.a) = 138543874;
    *(void *)((char *)&v42.a + 4) = v11;
    WORD2(v42.b) = 2114;
    *(void *)((char *)&v42.b + 6) = v31;
    HIWORD(v42.c) = 2114;
    *(void *)&v42.d = v23;
    _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Failed to compute local headroom for image: %{public}@ in rect: %{public}@, error: %{public}@", (uint8_t *)&v42, 0x20u);
  }
LABEL_10:

  return v25;
}

+ (id)maskByFillingHolesInMask:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1E040] filterWithName:@"CIFillHolesInRedMask"];

  if (v4)
  {
    id v5 = [v3 imageByApplyingFilter:@"CIFillHolesInRedMask" withInputParameters:&unk_1F000F008];
  }
  else
  {
    id v5 = v3;
  }
  id v6 = v5;

  return v6;
}

+ (id)maskByRemovingMask:(id)a3 fromMask:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 extent];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v6 extent];
  v27.origin.CGFloat x = v15;
  v27.origin.CGFloat y = v16;
  v27.size.CGFloat width = v17;
  v27.size.CGFloat height = v18;
  v26.origin.CGFloat x = v8;
  v26.origin.CGFloat y = v10;
  v26.size.CGFloat width = v12;
  v26.size.CGFloat height = v14;
  if (CGRectIntersectsRect(v26, v27))
  {
    id v19 = [MEMORY[0x1E4F1E050] blackImage];
    id v20 = [v5 imageByCompositingOverImage:v19];
    [v6 extent];
    id v21 = objc_msgSend(v20, "imageByCroppingToRect:");

    id v5 = [v21 imageByApplyingFilter:@"CIColorInvert"];

    uint64_t v22 = [MEMORY[0x1E4F1E000] componentMin];
    BOOL v23 = [v22 applyWithForeground:v5 background:v6];
  }
  else
  {
    BOOL v23 = v6;
  }

  return v23;
}

+ (id)maskByAddingMask:(id)a3 toMask:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    double v7 = (void *)MEMORY[0x1E4F1E000];
    id v8 = a4;
    double v9 = [v7 componentMax];
    id v10 = [v9 applyWithForeground:v6 background:v8];
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

+ (id)maskByUpscalingMask:(id)a3 withGuideImage:(id)a4
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13[0] = @"inputSmallImage";
  v13[1] = @"inputSpatialSigma";
  v14[0] = a3;
  v14[1] = &unk_1F000A928;
  v13[2] = @"inputLumaSigma";
  v14[2] = &unk_1F000A938;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionaryWithObjects:v14 forKeys:v13 count:3];

  double v9 = [v6 imageByApplyingFilter:@"CIEdgePreserveUpsampleFilter" withInputParameters:v8];

  id v10 = [v9 imageByClampingToExtent];
  [v9 extent];
  double v11 = objc_msgSend(v10, "imageByCroppingToRect:");

  return v11;
}

+ (id)maskByDilatingMask:(id)a3 fullExtent:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  [v9 extent];
  objc_msgSend(a1, "dilationAmountForMaskSize:fullSize:", v10, v11, width, height);
  double v13 = v12;
  CGFloat v14 = [MEMORY[0x1E4F1E040] morphologyMaximumFilter];
  *(float *)&double v15 = v13;
  [v14 setRadius:v15];
  [v14 setInputImage:v9];

  CGFloat v16 = [v14 outputImage];
  [v16 extent];
  CGRect v21 = CGRectIntegral(v20);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  CGRect v22 = CGRectIntersection(v21, v23);
  CGFloat v17 = objc_msgSend(v16, "imageByCroppingToRect:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);

  return v17;
}

+ (double)dilationAmountForMaskSize:(CGSize)a3 fullSize:(CGSize)a4
{
  if (a4.width >= a4.height) {
    double width = a4.width;
  }
  else {
    double width = a4.height;
  }
  return width * 0.01;
}

+ (BOOL)shouldDilateMaskForOperation:(id)a3
{
  id v3 = a3;
  if ([v3 mode] == 2) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = [v3 isFilledBrushStroke] ^ 1;
  }

  return v4;
}

+ ($FD18CD26FAB5729647810B74E671536E)sourceExtentForMaskExtent:(SEL)a3 exclusionMaskExtent:(id *)a4 imageExtent:(id *)a5
{
  double v10 = [MEMORY[0x1E4F1E050] blackImage];
  $FD18CD26FAB5729647810B74E671536E v18 = *a6;
  NUPixelRectToCGRect();
  double v11 = objc_msgSend(v10, "imageByCroppingToRect:", *(_OWORD *)&v18.var0, *(_OWORD *)&v18.var1);

  double v12 = [MEMORY[0x1E4F1E050] whiteImage];
  $FD18CD26FAB5729647810B74E671536E v19 = *a4;
  NUPixelRectToCGRect();
  double v13 = objc_msgSend(v12, "imageByCroppingToRect:", *(_OWORD *)&v19.var0, *(_OWORD *)&v19.var1);

  CGFloat v14 = [MEMORY[0x1E4F1E040] filterWithName:@"CIInpaintFilter"];
  [v14 setValue:v11 forKey:@"inputImage"];
  [v14 setValue:v13 forKey:@"inputMaskImage"];
  $FD18CD26FAB5729647810B74E671536E v20 = *a5;
  if ((NUPixelRectIsNull() & 1) == 0)
  {
    double v15 = objc_msgSend(MEMORY[0x1E4F1E050], "whiteImage", *(_OWORD *)&v20.var0, *(_OWORD *)&v20.var1);
    $0AC6E346AE4835514AAA8AC86D8F4844 var0 = a5->var0;
    $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a5->var1;
    NUPixelRectToCGRect();
    CGFloat v16 = objc_msgSend(v15, "imageByCroppingToRect:", var0, var1);

    [v14 setValue:v16 forKey:@"inputExcludeMask"];
  }
  objc_msgSend(a2, "addModelsToInpaintFilter:", v14, *(_OWORD *)&v20.var0, *(_OWORD *)&v20.var1);
  [v14 outputMaskSurroundExtent];
  NUPixelRectFromCGRect();

  return result;
}

+ (void)addModelsToInpaintFilter:(id)a3
{
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F7A448] sharedFactory];
  id v5 = [v4 modelRegistry];

  id v6 = [v5 modelForKey:PIModelKeyInpaint];
  if (!v6)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24224);
    }
    id v7 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Unable to find registered inpaint model", v9, 2u);
    }
  }
  [v3 setValue:v6 forKey:@"inputModel"];
  id v8 = [v5 modelForKey:PIModelKeyRefinement];
  if (v8) {
    [v3 setValue:v8 forKey:@"inputRefinementModel"];
  }
}

+ (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PIInpaintRendering_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken_24272 != -1) {
    dispatch_once(&initialize_onceToken_24272, block);
  }
}

os_signpost_id_t __32__PIInpaintRendering_initialize__block_invoke(uint64_t a1)
{
  os_log_t v2 = os_log_create("com.apple.photos.PhotoImaging", "inpaint");
  id v3 = (void *)s_log_24137;
  s_log_24137 = (uint64_t)v2;

  os_signpost_id_t result = os_signpost_id_make_with_pointer((os_log_t)s_log_24137, *(const void **)(a1 + 32));
  s_signpost_24138 = result;
  return result;
}

@end