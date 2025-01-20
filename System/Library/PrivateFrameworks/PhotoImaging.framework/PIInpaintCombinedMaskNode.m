@interface PIInpaintCombinedMaskNode
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (PIInpaintCombinedMaskNode)initWithSettings:(id)a3 inputs:(id)a4;
- (PIInpaintCombinedMaskNode)initWithSettings:(id)a3 inputs:(id)a4 mode:(unint64_t)a5;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_evaluateImageProperties:(id *)a3;
- (id)_scaleImage:(id)a3 toSize:(CGSize)a4;
- (id)inputNode;
- (id)maskImageForIdentifier:(id)a3 error:(id *)a4;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (unint64_t)mode;
@end

@implementation PIInpaintCombinedMaskNode

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PIInpaintCombinedMaskNode;
  v6 = [(NURenderNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  return v6;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (id)_scaleImage:(id)a3 toSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  [v6 extent];
  if (v8 == width && v7 == height)
  {
    id v13 = v6;
  }
  else
  {
    [v6 extent];
    CGFloat v11 = width / v10;
    [v6 extent];
    memset(&v17, 0, sizeof(v17));
    CGAffineTransformMakeScale(&v17, v11, height / v12);
    CGAffineTransform v16 = v17;
    id v13 = [v6 imageByApplyingTransform:&v16];
  }
  v14 = v13;

  return v14;
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v57 = NUAssertLogger_5469();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(v116.a) = 138543362;
      *(void *)((char *)&v116.a + 4) = v58;
      _os_log_error_impl(&dword_1A9680000, v57, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v116, 0xCu);
    }
    v59 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v61 = NUAssertLogger_5469();
    BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v62)
      {
        v65 = dispatch_get_specific(*v59);
        v66 = (void *)MEMORY[0x1E4F29060];
        id v67 = v65;
        v68 = [v66 callStackSymbols];
        v69 = [v68 componentsJoinedByString:@"\n"];
        LODWORD(v116.a) = 138543618;
        *(void *)((char *)&v116.a + 4) = v65;
        WORD2(v116.b) = 2114;
        *(void *)((char *)&v116.b + 6) = v69;
        _os_log_error_impl(&dword_1A9680000, v61, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v116, 0x16u);
      }
    }
    else if (v62)
    {
      v63 = [MEMORY[0x1E4F29060] callStackSymbols];
      v64 = [v63 componentsJoinedByString:@"\n"];
      LODWORD(v116.a) = 138543362;
      *(void *)((char *)&v116.a + 4) = v64;
      _os_log_error_impl(&dword_1A9680000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v116, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v3 = a3;
  v5 = [(NURenderNode *)self settings];
  id v6 = [v5 objectForKeyedSubscript:@"operations"];

  double v7 = [(NURenderNode *)self outputImageGeometry:v3];
  double v8 = v7;
  if (v7)
  {
    [v7 extent];
    NUPixelRectToCGRect();
    double v10 = v9;
    double v12 = v11;
    [v8 scaledExtent];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    memset(&v116, 0, sizeof(v116));
    CGAffineTransformMakeScale(&v116, v17 / v10, v19 / v12);
    v21 = [MEMORY[0x1E4F1E050] blackImage];
    objc_msgSend(v21, "imageByCroppingToRect:", v14, v16, v18, v20);
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    unint64_t v23 = [(PIInpaintCombinedMaskNode *)self mode];
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __44__PIInpaintCombinedMaskNode__evaluateImage___block_invoke;
    v109[3] = &unk_1E5D7F260;
    id v25 = v24;
    id v110 = v25;
    v111 = self;
    CGAffineTransform v112 = v116;
    v26 = (void *)MEMORY[0x1AD0F8FE0](v109);
    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __44__PIInpaintCombinedMaskNode__evaluateImage___block_invoke_2;
    v106[3] = &unk_1E5D7F288;
    unint64_t v108 = v23;
    id v27 = v26;
    id v107 = v27;
    v28 = (void (**)(void, void *, void *, id *))MEMORY[0x1AD0F8FE0](v106);
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v29 = v6;
    uint64_t v92 = [v29 countByEnumeratingWithState:&v102 objects:v115 count:16];
    if (v92)
    {
      uint64_t v30 = *(void *)v103;
      id v89 = v25;
      v90 = v8;
      v94 = v28;
      id v91 = v29;
      uint64_t v84 = *(void *)v103;
LABEL_5:
      uint64_t v31 = 0;
      while (1)
      {
        if (*(void *)v103 != v30) {
          objc_enumerationMutation(v29);
        }
        v32 = *(void **)(*((void *)&v102 + 1) + 8 * v31);
        unint64_t v33 = [v32 mode];
        if (v33 - 3 >= 2) {
          break;
        }
        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        v34 = [v32 maskIdentifiers];
        uint64_t v35 = [v34 countByEnumeratingWithState:&v97 objects:v113 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          id obj = v34;
          uint64_t v85 = v31;
          v87 = v3;
          v88 = v6;
          id v37 = 0;
          uint64_t v38 = *(void *)v98;
          uint64_t v39 = (uint64_t)v22;
          id v22 = 0;
          while (2)
          {
            uint64_t v40 = 0;
            id v41 = (id)v39;
            do
            {
              if (*(void *)v98 != v38) {
                objc_enumerationMutation(obj);
              }
              uint64_t v42 = *(void *)(*((void *)&v97 + 1) + 8 * v40);
              id v96 = v22;
              v43 = (*((void (**)(id, uint64_t, id *))v27 + 2))(v27, v42, &v96);
              id v44 = v96;

              if (!v43)
              {
                v55 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to generate mask" object:v32 underlyingError:v44];
LABEL_40:
                id *v87 = v55;

                id v37 = v44;
                id v6 = v88;
                id v25 = v89;
                double v8 = v90;
                id v29 = v91;
                goto LABEL_41;
              }
              if (+[PIInpaintRendering shouldDilateMaskForOperation:v32])
              {
                v45 = +[PIGlobalSettings globalSettings];
                int v46 = [v45 inpaintFillsMaskHoles];

                if (v46)
                {
                  uint64_t v47 = +[PIInpaintRendering maskByFillingHolesInMask:v43];

                  v43 = (void *)v47;
                }
                uint64_t v48 = +[PIInpaintRendering maskByDilatingMask:fullExtent:](PIInpaintRendering, "maskByDilatingMask:fullExtent:", v43, v14, v16, v18, v20);

                v43 = (void *)v48;
              }
              id v95 = v44;
              v94[2](v94, v43, v32, &v95);
              id v37 = (id)objc_claimAutoreleasedReturnValue();
              id v22 = v95;

              if (!v37)
              {
                v55 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to apply exclusion mask" object:v32 underlyingError:v22];
                id v44 = v22;
                goto LABEL_40;
              }
              uint64_t v39 = +[PIInpaintRendering maskByAddingMask:v37 toMask:v41];

              ++v40;
              id v41 = (id)v39;
            }
            while (v36 != v40);
            uint64_t v36 = [obj countByEnumeratingWithState:&v97 objects:v113 count:16];
            if (v36) {
              continue;
            }
            break;
          }
          v3 = v87;
          id v6 = v88;
          id v29 = v91;
          uint64_t v31 = v85;
          v34 = obj;
LABEL_32:

          id v22 = (id)v39;
          uint64_t v30 = v84;
          goto LABEL_33;
        }
        id v29 = v91;
LABEL_33:

LABEL_34:
        if (++v31 == v92)
        {
          id v25 = v89;
          double v8 = v90;
          v28 = v94;
          uint64_t v92 = [v29 countByEnumeratingWithState:&v102 objects:v115 count:16];
          if (v92) {
            goto LABEL_5;
          }
          goto LABEL_36;
        }
      }
      if (v33 != 2)
      {
        if (v33 < 2)
        {
          v70 = NUAssertLogger_5469();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            v72 = [NSString stringWithFormat:@"Invalid operation: %@", v32];
            LODWORD(buf.a) = 138543362;
            *(void *)((char *)&buf.a + 4) = v72;
            _os_log_error_impl(&dword_1A9680000, v70, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
          }
          v73 = (const void **)MEMORY[0x1E4F7A308];
          v74 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
          v75 = NUAssertLogger_5469();
          BOOL v76 = os_log_type_enabled(v75, OS_LOG_TYPE_ERROR);
          if (v74)
          {
            if (v76)
            {
              v79 = dispatch_get_specific(*v73);
              v80 = (void *)MEMORY[0x1E4F29060];
              id v81 = v79;
              v82 = [v80 callStackSymbols];
              v83 = [v82 componentsJoinedByString:@"\n"];
              LODWORD(buf.a) = 138543618;
              *(void *)((char *)&buf.a + 4) = v79;
              WORD2(buf.b) = 2114;
              *(void *)((char *)&buf.b + 6) = v83;
              _os_log_error_impl(&dword_1A9680000, v75, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
            }
          }
          else if (v76)
          {
            v77 = [MEMORY[0x1E4F29060] callStackSymbols];
            v78 = [v77 componentsJoinedByString:@"\n"];
            LODWORD(buf.a) = 138543362;
            *(void *)((char *)&buf.a + 4) = v78;
            _os_log_error_impl(&dword_1A9680000, v75, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
          }
          _NUAssertFailHandler();
          return NUAssertLogger_5469();
        }
        goto LABEL_34;
      }
      unint64_t v49 = ((unint64_t)[v32 options] >> 4) & 1;
      v50 = [v32 brushStroke];
      v51 = [v50 ciImageTiled:0 closed:1 pressureMode:1 filled:v49];
      CGAffineTransform buf = v116;
      v52 = [v51 imageByApplyingTransform:&buf];

      if ([v32 options])
      {
        [MEMORY[0x1E4F1E050] whiteImage];
        v53 = uint64_t v86 = v31;
        [v52 extent];
        v34 = objc_msgSend(v53, "imageByCroppingToRect:");

        id v37 = 0;
        v52 = v53;
        uint64_t v31 = v86;
      }
      else
      {
        id v101 = 0;
        v34 = v94[2](v94, v52, v32, &v101);
        id v37 = v101;
      }

      if (!v34)
      {
        id *v3 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to apply exclusion mask" object:v32 underlyingError:v37];
        id v41 = v22;
        id v25 = v89;
        double v8 = v90;
LABEL_41:
        v28 = v94;

        v54 = 0;
        goto LABEL_42;
      }
      uint64_t v39 = +[PIInpaintRendering maskByAddingMask:v34 toMask:v22];
      goto LABEL_32;
    }
LABEL_36:

    id v41 = v22;
    v54 = v41;
LABEL_42:
  }
  else
  {
    v54 = 0;
  }

  return v54;
}

id __44__PIInpaintCombinedMaskNode__evaluateImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!v6)
  {
    double v7 = [*(id *)(a1 + 40) maskImageForIdentifier:v5 error:a3];
    long long v8 = *(_OWORD *)(a1 + 64);
    v10[0] = *(_OWORD *)(a1 + 48);
    v10[1] = v8;
    v10[2] = *(_OWORD *)(a1 + 80);
    id v6 = [v7 imageByApplyingTransform:v10];

    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }

  return v6;
}

id __44__PIInpaintCombinedMaskNode__evaluateImage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = [v6 exclusionMaskIdentifiers];
  uint64_t v8 = [v7 count];

  uint64_t v9 = *(void *)(a1 + 40);
  if (v8)
  {
    if ((v9 & 1) == 0)
    {
LABEL_3:
      double v10 = [MEMORY[0x1E4F1E050] emptyImage];
      goto LABEL_21;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_3;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v22 = v6;
  double v11 = [v6 exclusionMaskIdentifiers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
LABEL_7:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v24 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      if (!v16)
      {

        double v10 = 0;
        goto LABEL_20;
      }
      double v17 = (void *)v16;
      uint64_t v18 = *(void *)(a1 + 40);
      if ((v18 & 4) != 0) {
        break;
      }
      if ((v18 & 8) != 0)
      {
        uint64_t v19 = +[PIInpaintRendering maskByRemovingMask:v16 fromMask:v5];
LABEL_15:
        double v20 = (void *)v19;

        id v5 = v20;
      }

      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v13) {
          goto LABEL_7;
        }
        goto LABEL_18;
      }
    }
    uint64_t v19 = +[PIInpaintRendering maskByAddingMask:v16 toMask:v5];
    goto LABEL_15;
  }
LABEL_18:

  id v5 = v5;
  double v10 = v5;
LABEL_20:
  id v6 = v22;
LABEL_21:

  return v10;
}

- (id)_evaluateImageProperties:(id *)a3
{
  v4 = [(PIInpaintCombinedMaskNode *)self inputNode];
  id v5 = [v4 imageProperties:a3];

  return v5;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  v4 = [(PIInpaintCombinedMaskNode *)self inputNode];
  id v5 = [v4 outputImageGeometry:a3];

  return v5;
}

- (id)maskImageForIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    double v17 = NUAssertLogger_5469();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "maskIdentifier != nil");
      uint64_t v18 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGAffineTransform buf = 138543362;
      id v41 = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v19 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v21 = NUAssertLogger_5469();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        uint64_t v30 = dispatch_get_specific(*v19);
        uint64_t v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        uint64_t v19 = [v31 callStackSymbols];
        unint64_t v33 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGAffineTransform buf = 138543618;
        id v41 = (const void **)v30;
        __int16 v42 = 2114;
        v43 = v33;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      long long v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v19 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGAffineTransform buf = 138543362;
      id v41 = v19;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v27 = _NUAssertFailHandler();
    goto LABEL_25;
  }
  if (!a4)
  {
    long long v24 = NUAssertLogger_5469();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      long long v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGAffineTransform buf = 138543362;
      id v41 = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v19 = (const void **)MEMORY[0x1E4F7A308];
    long long v26 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v21 = NUAssertLogger_5469();
    int v27 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!v26)
    {
      if (v27)
      {
        uint64_t v28 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGAffineTransform buf = 138543362;
        id v41 = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_27;
    }
LABEL_25:
    if (v27)
    {
      v34 = dispatch_get_specific(*v19);
      uint64_t v35 = (void *)MEMORY[0x1E4F29060];
      id v36 = v34;
      id v37 = [v35 callStackSymbols];
      uint64_t v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGAffineTransform buf = 138543618;
      id v41 = (const void **)v34;
      __int16 v42 = 2114;
      v43 = v38;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_27:

    _NUAssertFailHandler();
  }
  double v7 = v6;
  uint64_t v8 = [(NURenderNode *)self inputs];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    id v39 = 0;
    double v10 = [v9 outputImage:&v39];
    double v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F7A438];
      id v14 = v39;
      id v15 = [v13 errorWithCode:1 reason:@"Failed to get mask image" object:v9 underlyingError:v14];

      *a4 = v15;
    }
  }
  else
  {
    [MEMORY[0x1E4F7A438] missingError:@"Missing mask input" object:v7];
    double v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (unint64_t)mode
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"mode"];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

- (id)inputNode
{
  return [(NURenderNode *)self inputForKey:@"input"];
}

- (PIInpaintCombinedMaskNode)initWithSettings:(id)a3 inputs:(id)a4 mode:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v9 = (void *)[a3 mutableCopy];
  double v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v12 = v11;

  uint64_t v13 = [NSNumber numberWithUnsignedInteger:a5];
  [v12 setObject:v13 forKeyedSubscript:@"mode"];

  v16.receiver = self;
  v16.super_class = (Class)PIInpaintCombinedMaskNode;
  id v14 = [(NURenderNode *)&v16 initWithSettings:v12 inputs:v8];

  return v14;
}

- (PIInpaintCombinedMaskNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    uint64_t v9 = (os_log_t *)MEMORY[0x1E4F7A748];
    double v10 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      id v11 = NSString;
      id v12 = v10;
      uint64_t v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      id v15 = NSStringFromSelector(a2);
      objc_super v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)CGAffineTransform buf = 138543362;
      uint64_t v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_198_5505);
        }
LABEL_7:
        os_log_t v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = (void *)MEMORY[0x1E4F29060];
          double v20 = v18;
          v21 = [v19 callStackSymbols];
          BOOL v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)CGAffineTransform buf = 138543362;
          uint64_t v31 = v22;
          _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_198_5505);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v23 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      long long v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = specific;
      double v20 = v23;
      int v27 = [v25 callStackSymbols];
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGAffineTransform buf = 138543618;
      uint64_t v31 = specific;
      __int16 v32 = 2114;
      unint64_t v33 = v28;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    id v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_198_5505);
  }
}

@end