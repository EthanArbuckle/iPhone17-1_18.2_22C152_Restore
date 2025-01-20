@interface PILongExposureFusionAutoCalculator
- (void)_computeCleanAperture:(id)a3;
- (void)submit:(id)a3;
@end

@implementation PILongExposureFusionAutoCalculator

- (void)submit:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v27 = NUAssertLogger_5054();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v28;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v15 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v5 = NUAssertLogger_5054();
    BOOL v29 = os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v30 = dispatch_get_specific(*v15);
        v31 = (void *)MEMORY[0x1E4F29060];
        id specific = v30;
        v15 = [v31 callStackSymbols];
        v32 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v37 = (const void **)v30;
        __int16 v38 = 2114;
        v39 = v32;
        _os_log_error_impl(&dword_1A9680000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      id specific = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v37 = v15;
      _os_log_error_impl(&dword_1A9680000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v5 = (uint64_t)v4;
  v6 = [(NURenderRequest *)self composition];
  uint64_t v7 = [v6 mediaType];

  if (v7 == 3)
  {
    v8 = [(NURenderRequest *)self composition];
    id specific = [v8 objectForKeyedSubscript:@"autoLoop"];

    v10 = [specific objectForKeyedSubscript:@"enabled"];
    int v11 = [v10 BOOLValue];

    v12 = [specific objectForKeyedSubscript:@"flavor"];
    uint64_t v13 = PIAutoLoopFlavorFromString(v12);

    v14 = [specific objectForKeyedSubscript:@"recipe"];
    v15 = v14;
    if (!specific || !v11 || v13 != 3 || !v14)
    {
      v20 = (void *)MEMORY[0x1E4F7A438];
      v21 = (void *)[(PILongExposureFusionAutoCalculator *)self copy];
      v22 = [v20 invalidError:@"PILongExposureFusionAutoCalculator requires a long-exposure adjustment" object:v21];

      v23 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v22];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v23);

      goto LABEL_11;
    }
    if (PIAutoLoopRecipeHasGoodStabilization(v14))
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __45__PILongExposureFusionAutoCalculator_submit___block_invoke;
      v33[3] = &unk_1E5D7F238;
      id v35 = (id)v5;
      v33[4] = self;
      v34 = v15;
      [(PILongExposureFusionAutoCalculator *)self _computeCleanAperture:v33];

LABEL_11:
      goto LABEL_12;
    }
    if (*MEMORY[0x1E4F7A750] == -1)
    {
LABEL_14:
      v24 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9680000, v24, OS_LOG_TYPE_INFO, "AL stabilization failure: not running fusion registration", buf, 2u);
      }
      id v25 = objc_alloc(MEMORY[0x1E4F7A660]);
      v26 = (void *)[v25 initWithResult:MEMORY[0x1E4F1CC08]];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v26);

      goto LABEL_11;
    }
LABEL_25:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_57);
    goto LABEL_14;
  }
  v16 = (void *)MEMORY[0x1E4F7A438];
  v17 = (void *)[(PILongExposureFusionAutoCalculator *)self copy];
  v18 = [v16 invalidError:@"PILongExposureFusionAutoCalculator requires a live-photo composition" object:v17];

  v19 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v18];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v19);

LABEL_12:
}

void __45__PILongExposureFusionAutoCalculator_submit___block_invoke(uint64_t a1, _OWORD *a2, void *a3)
{
  id v5 = a3;
  long long v6 = a2[1];
  v13[2] = *a2;
  v13[3] = v6;
  if (NUPixelRectIsNull())
  {
    uint64_t v7 = [MEMORY[0x1E4F7A438] errorWithCode:2 reason:@"Failed to get clean aperture values" object:0 underlyingError:v5];
    uint64_t v8 = *(void *)(a1 + 48);
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v7];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    uint64_t v7 = [(NURenderRequest *)[PILongExposureRegistrationRequest alloc] initWithRequest:*(void *)(a1 + 32)];
    [(PILongExposureRegistrationRequest *)v7 setRecipe:*(void *)(a1 + 40)];
    long long v10 = a2[1];
    v13[0] = *a2;
    v13[1] = v10;
    [(PILongExposureRegistrationRequest *)v7 setCleanAperture:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__PILongExposureFusionAutoCalculator_submit___block_invoke_2;
    v11[3] = &unk_1E5D81670;
    id v12 = *(id *)(a1 + 48);
    [(PILongExposureRegistrationRequest *)v7 submit:v11];
    v9 = v12;
  }
}

void __45__PILongExposureFusionAutoCalculator_submit___block_invoke_2(uint64_t a1, void *a2)
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v26 = 0;
  v3 = [a2 result:&v26];
  id v4 = v26;
  if (v3)
  {
    id v5 = [v3 observation];
    long long v6 = v5;
    if (v5)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v23 = 0u;
      [v5 warpTransform];
      simd_float3x3 v31 = __invert_f3(v30);
      DWORD2(v23) = v31.columns[0].i32[2];
      DWORD2(v24) = v31.columns[1].i32[2];
      *(void *)&long long v23 = v31.columns[0].i64[0];
      *(void *)&long long v24 = v31.columns[1].i64[0];
      DWORD2(v25) = v31.columns[2].i32[2];
      *(void *)&long long v25 = v31.columns[2].i64[0];
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:9];
      for (int i = 0; i != 3; ++i)
      {
        for (uint64_t j = 0; j != 48; j += 16)
        {
          LODWORD(v8) = *(_DWORD *)((char *)&v23 + 4 * (i & 3) + j);
          int v11 = [NSNumber numberWithFloat:v8];
          [v7 addObject:v11];
        }
      }
      long long v21 = 0u;
      long long v22 = 0u;
      [v3 extent];
      id v12 = [NSNumber numberWithInteger:(void)v21];
      v29[0] = v12;
      uint64_t v13 = [NSNumber numberWithInteger:*((void *)&v21 + 1)];
      v29[1] = v13;
      v14 = [NSNumber numberWithInteger:(void)v22];
      v29[2] = v14;
      v15 = [NSNumber numberWithInteger:*((void *)&v22 + 1)];
      v29[3] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];

      id v17 = objc_alloc(MEMORY[0x1E4F7A660]);
      v27[0] = @"transform";
      v27[1] = @"extent";
      v28[0] = v7;
      v28[1] = v16;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
      v19 = (void *)[v17 initWithResult:v18];
    }
    else
    {
      id v20 = objc_alloc(MEMORY[0x1E4F7A660]);
      v19 = (void *)[v20 initWithResult:MEMORY[0x1E4F1CC08]];
    }
  }
  else
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_computeCleanAperture:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A700]) initWithRequest:self];
  [v5 setName:@"PILongExposureFusionAutoCalculator-videoProperties"];
  long long v6 = [MEMORY[0x1E4F7A618] stopAtTagFilter:@"pre-AutoLoop"];
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v5 setPipelineFilters:v7];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PILongExposureFusionAutoCalculator__computeCleanAperture___block_invoke;
  v9[3] = &unk_1E5D81670;
  id v10 = v4;
  id v8 = v4;
  [v5 submit:v9];
}

void __60__PILongExposureFusionAutoCalculator__computeCleanAperture___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F7A320] + 16);
  long long v14 = *MEMORY[0x1E4F7A320];
  long long v15 = v3;
  id v13 = 0;
  id v4 = [a2 result:&v13];
  id v6 = v13;
  if (v4)
  {
    uint64_t v7 = [v4 properties];
    id v8 = v7;
    if (v7)
    {
      [v7 cleanAperture];
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    long long v14 = v11;
    long long v15 = v12;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void (**)(uint64_t, long long *, id, uint64_t))(v9 + 16);
  long long v11 = v14;
  long long v12 = v15;
  v10(v9, &v11, v6, v5);
}

@end