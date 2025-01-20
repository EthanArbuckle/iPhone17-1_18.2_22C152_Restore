@interface PIWhiteBalanceAutoCalculator
- ($7CC5A320EBB83734983E5E759578C212)_chooseNeutralGrayForNonSushi:(id *)a3;
- ($7CC5A320EBB83734983E5E759578C212)_correctedRGBResultFromResult:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_chooseTempTintForSushi:(id *)a3 RAWProperties:(id)a4 brightness:(double)a5;
- (BOOL)_useTempTint:(id)a3;
- (void)submit:(id)a3;
@end

@implementation PIWhiteBalanceAutoCalculator

- ($F24F406B2B787EFB06265DBA3D28CBD5)_chooseTempTintForSushi:(id *)a3 RAWProperties:(id)a4 brightness:(double)a5
{
  p_var1 = &a3->var1;
  id v8 = a4;
  v9 = [v8 inputNeutralXYFromRGB:p_var1];
  v10 = [v9 objectAtIndexedSubscript:0];
  [v10 doubleValue];
  double v12 = v11;
  double v42 = v11;

  v13 = [v9 objectAtIndexedSubscript:1];
  [v13 doubleValue];
  double v15 = v14;
  double v41 = v14;

  v16 = [v8 inputNeutralXYFromRGB:a3];

  v17 = [v16 objectAtIndexedSubscript:0];
  [v17 doubleValue];
  double v19 = v18;
  double v40 = v18;

  v20 = [v16 objectAtIndexedSubscript:1];
  [v20 doubleValue];
  double v22 = v21;
  double v39 = v21;

  double v23 = angular_error(v19, v22);
  double v24 = angular_error(v12, v15);
  if (v24 >= v23 || vabdd_f64(v24, v23) <= 0.01)
  {
    v26 = &v39;
    v27 = &v40;
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_303);
    }
    v25 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A9680000, v25, OS_LOG_TYPE_DEBUG, "Choosing gray world instead of gray edge", buf, 2u);
    }
    v26 = &v41;
    v27 = &v42;
    double v22 = v15;
    double v19 = v12;
  }
  double v28 = sqrt((v22 + -0.358500004) * (v22 + -0.358500004) + (v19 + -0.345699996) * (v19 + -0.345699996));
  if (v28 <= 0.0) {
    double v29 = 1.0;
  }
  else {
    double v29 = 0.112999998 / v28;
  }
  double v30 = pow(fmin(v29, 1.0), 0.330000013);
  if (v30 < 0.5) {
    double v30 = 0.5;
  }
  double v31 = v30 + (1.0 - v30) * 0.125;
  double *v27 = (1.0 - v31) * 0.345699996 + v31 * v19;
  double *v26 = (1.0 - v31) * 0.358500004 + v31 * v22;
  *(double *)buf = 0.0;
  nu_xy_to_tempTint();
  if (a5 + -5.0 <= 0.0) {
    double v32 = 0.0;
  }
  else {
    double v32 = (a5 + -5.0) / 5.0;
  }
  double v33 = fmax(fmin(1.0 - pow(v32, 0.330000013), 1.0), 0.0);
  double v34 = (1.0 - v33) * dbl_1A980B970[*(double *)buf > 6500.0] + v33 * *v27;
  double v35 = (1.0 - v33) * dbl_1A980B980[*(double *)buf > 6500.0] + v33 * *v26;

  double v36 = v34;
  double v37 = v35;
  result.var1 = v37;
  result.var0 = v36;
  return result;
}

- ($7CC5A320EBB83734983E5E759578C212)_chooseNeutralGrayForNonSushi:(id *)a3
{
  double v3 = a3->var0.var0[0];
  double v4 = a3->var0.var0[1];
  double v5 = a3->var0.var0[2];
  double v6 = a3->var0.var0[3];
  double v7 = a3->var1.var0[0];
  double v8 = a3->var1.var0[1];
  double v9 = a3->var1.var0[2];
  double v10 = sqrt((v4 + -1.0) * (v4 + -1.0) + (a3->var0.var0[0] + -1.0) * (a3->var0.var0[0] + -1.0) + (v5 + -1.0)
                                                                                               * (v5 + -1.0));
  double v11 = sqrt((v8 + -1.0) * (v8 + -1.0) + (v7 + -1.0) * (v7 + -1.0) + (v9 + -1.0) * (v9 + -1.0));
  if (v11 < v10 && vabdd_f64(v11, v10) > 0.01)
  {
    double v6 = a3->var1.var0[3];
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_303);
    }
    double v12 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)double v14 = 0;
      _os_log_debug_impl(&dword_1A9680000, v12, OS_LOG_TYPE_DEBUG, "Choosing gray world instead of gray edge", v14, 2u);
    }
    double v5 = v9;
    double v4 = v8;
    double v3 = v7;
  }
  double v13 = v6;
  result.var0[3] = v13;
  result.var0[2] = v5;
  result.var0[1] = v4;
  result.var0[0] = v3;
  return result;
}

- ($7CC5A320EBB83734983E5E759578C212)_correctedRGBResultFromResult:(id)a3
{
  double v3 = a3.var0[2];
  double v4 = a3.var0[1];
  double v5 = a3.var0[0];
  a3.var0[0] = a3.var0[1] * -0.0276515931 + a3.var0[0] * 1.02395463 + a3.var0[2] * 0.0029618456;
  int8x16_t v19 = *(int8x16_t *)a3.var0;
  *(double *)v6.i64 = pow(fabs(a3.var0[0]), 0.25);
  v7.f64[0] = NAN;
  v7.f64[1] = NAN;
  int8x16_t v8 = (int8x16_t)vnegq_f64(v7);
  int8x16_t v9 = vbslq_s8(v8, v6, v19);
  v19.i64[0] = v9.i64[0];
  int8x16_t v20 = v8;
  *(double *)v9.i64 = v4 * 0.949478984 + v5 * 0.0207923874 + v3 * 0.0304754861;
  int8x16_t v18 = v9;
  *(double *)v10.i64 = pow(fabs(*(double *)v9.i64), 0.25);
  int8x16_t v11 = vbslq_s8(v20, v10, v18);
  v18.i64[0] = v11.i64[0];
  *(double *)v11.i64 = v4 * -0.00190263637 + v5 * -0.0020549444 + v3 * 1.00394022;
  int8x16_t v17 = v11;
  *(double *)v12.i64 = pow(fabs(*(double *)v11.i64), 0.25);
  *(void *)&double v13 = vbslq_s8(v20, v12, v17).u64[0];
  double v14 = 1.0;
  double v16 = *(double *)v18.i64;
  double v15 = *(double *)v19.i64;
  result.var0[3] = v14;
  result.var0[2] = v13;
  result.var0[1] = v16;
  result.var0[0] = v15;
  return result;
}

- (BOOL)_useTempTint:(id)a3
{
  $7CC5A320EBB83734983E5E759578C212 v7 = a3;
  double v4 = 0.0;
  double v5 = 0.0;
  YIQFromRGB(v7.var0, &v6, &v5, &v4, 0.0, 1.0, 0.0);
  return sqrt(v4 * v4 + v5 * v5) > 0.0399999991;
}

- (void)submit:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    int8x16_t v10 = NUAssertLogger_6606();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int8x16_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int8x16_t v12 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v14 = NUAssertLogger_6606();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        int8x16_t v18 = dispatch_get_specific(*v12);
        int8x16_t v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        double v21 = [v19 callStackSymbols];
        double v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v18;
        __int16 v28 = 2114;
        double v29 = v22;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      double v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      int8x16_t v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v17;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  double v5 = v4;
  double v6 = [(NURenderRequest *)self composition];
  $7CC5A320EBB83734983E5E759578C212 v7 = (void *)[objc_alloc(MEMORY[0x1E4F7A520]) initWithRequest:self];
  [v7 setName:@"PIWhiteBalanceAutoCalculator-imageProperties"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __39__PIWhiteBalanceAutoCalculator_submit___block_invoke;
  v23[3] = &unk_1E5D81180;
  id v24 = v6;
  id v25 = v5;
  v23[4] = self;
  id v8 = v6;
  id v9 = v5;
  [v7 submit:v23];
}

void __39__PIWhiteBalanceAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v58[0] = 0;
  id v4 = [v3 result:v58];
  id v5 = v58[0];
  double v6 = [v4 properties];

  if (v6)
  {
    $7CC5A320EBB83734983E5E759578C212 v7 = [v6 rawProperties];
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = __Block_byref_object_copy__6630;
    v56[4] = __Block_byref_object_dispose__6631;
    id v57 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x3032000000;
    v54[3] = __Block_byref_object_copy__6630;
    v54[4] = __Block_byref_object_dispose__6631;
    id v55 = 0;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3032000000;
    v52[3] = __Block_byref_object_copy__6630;
    v52[4] = __Block_byref_object_dispose__6631;
    id v53 = 0;
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = __Block_byref_object_copy__6630;
    v50[4] = __Block_byref_object_dispose__6631;
    id v51 = 0;
    id v8 = dispatch_group_create();
    id v9 = [[PIFaceBalanceAutoCalculator alloc] initWithRequest:*(void *)(a1 + 32) isRAW:v7 != 0];
    dispatch_queue_t v10 = dispatch_queue_create("PIFaceBalanceAutoCalculator.responseQueue", 0);
    [(NURenderRequest *)v9 setResponseQueue:v10];

    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x3032000000;
    v48[3] = __Block_byref_object_copy__6630;
    v48[4] = __Block_byref_object_dispose__6631;
    id v49 = 0;
    dispatch_group_enter(v8);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_2;
    v43[3] = &unk_1E5D7F5B8;
    v45 = v54;
    v46 = v56;
    v47 = v48;
    int8x16_t v11 = v8;
    v44 = v11;
    [(PIFaceBalanceAutoCalculator *)v9 submit:v43];
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x4010000000;
    v40[3] = &unk_1A984BDE3;
    long long v41 = 0u;
    long long v42 = 0u;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3010000000;
    v39[4] = 0;
    v39[5] = 0;
    v39[3] = &unk_1A984BDE3;
    int8x16_t v12 = [[_PIWhiteColorCalculator alloc] initWithComposition:*(void *)(a1 + 40) useSushi:0];
    dispatch_group_enter(v11);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_3;
    v35[3] = &unk_1E5D7F3E0;
    uint64_t v13 = *(void *)(a1 + 32);
    double v37 = v40;
    v35[4] = v13;
    v38 = v52;
    double v14 = v11;
    double v36 = v14;
    [(_PIWhiteColorCalculator *)v12 calculateColorWithProperties:v6 completion:v35];
    if (v7)
    {
      int8x16_t v19 = v9;
      BOOL v15 = [[_PIWhiteColorCalculator alloc] initWithComposition:*(void *)(a1 + 40) useSushi:1];
      dispatch_group_enter(v14);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_4;
      v30[3] = &unk_1E5D7F430;
      uint64_t v16 = *(void *)(a1 + 32);
      double v33 = v39;
      v30[4] = v16;
      id v31 = v6;
      double v34 = v50;
      double v32 = v14;
      [(_PIWhiteColorCalculator *)v15 calculateColorWithProperties:v31 completion:v30];
    }
    int8x16_t v17 = objc_msgSend(*(id *)(a1 + 32), "responseQueue", v19);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_5;
    block[3] = &unk_1E5D7F458;
    double v22 = v54;
    id v18 = *(id *)(a1 + 48);
    double v23 = v52;
    id v24 = v50;
    block[4] = *(void *)(a1 + 32);
    id v21 = v18;
    id v25 = v40;
    v26 = v56;
    BOOL v29 = v7 != 0;
    v27 = v48;
    __int16 v28 = v39;
    dispatch_group_notify(v14, v17, block);

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(v40, 8);

    _Block_object_dispose(v48, 8);
    _Block_object_dispose(v50, 8);

    _Block_object_dispose(v52, 8);
    _Block_object_dispose(v54, 8);

    _Block_object_dispose(v56, 8);
  }
  else
  {
    $7CC5A320EBB83734983E5E759578C212 v7 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_2(uint64_t a1, void *a2)
{
  id v26 = 0;
  id v3 = [a2 result:&v26];
  id v4 = v26;
  if (!v3)
  {
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
    double v6 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;
    goto LABEL_10;
  }
  uint64_t v5 = [v3 objectForKeyedSubscript:@"OrigI"];
  if (v5)
  {
    double v6 = (void *)v5;
    uint64_t v7 = [v3 objectForKeyedSubscript:@"OrigQ"];
    if (!v7)
    {
LABEL_10:

      goto LABEL_11;
    }
    id v8 = (void *)v7;
    uint64_t v9 = [v3 objectForKeyedSubscript:@"Warmth"];
    if (!v9)
    {

      goto LABEL_10;
    }
    dispatch_queue_t v10 = (void *)v9;
    int8x16_t v11 = [v3 objectForKeyedSubscript:@"Strength"];

    if (v11)
    {
      int8x16_t v12 = [v3 objectForKeyedSubscript:@"OrigI"];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v12 forKeyedSubscript:@"faceI"];

      uint64_t v13 = [v3 objectForKeyedSubscript:@"OrigQ"];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v13 forKeyedSubscript:@"faceQ"];

      double v14 = [v3 objectForKeyedSubscript:@"Warmth"];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v14 forKeyedSubscript:@"faceWarmth"];

      BOOL v15 = [v3 objectForKeyedSubscript:@"Strength"];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v15 forKeyedSubscript:@"faceStrength"];

      uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
      int8x16_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = @"faceBalance";

      uint64_t v18 = [v3 objectForKeyedSubscript:@"WarmTint"];
      if (v18)
      {
        int8x16_t v19 = (void *)v18;
        id v20 = [v3 objectForKeyedSubscript:@"WarmTemp"];

        if (v20)
        {
          id v21 = [v3 objectForKeyedSubscript:@"WarmTemp"];
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v21 forKeyedSubscript:@"warmTemp"];

          double v22 = [v3 objectForKeyedSubscript:@"WarmTint"];
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v22 forKeyedSubscript:@"warmTint"];

          uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
          double v6 = *(void **)(v23 + 40);
          *(void *)(v23 + 40) = @"warmTint";
          goto LABEL_10;
        }
      }
    }
  }
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_3(uint64_t a1, void *a2)
{
  id v21 = 0;
  id v3 = [a2 result:&v21];
  id v4 = v21;
  if (v3)
  {
    uint64_t v20 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    objc_msgSend(v3, "pi_grayColorResultValue");
    uint64_t v5 = *(void **)(a1 + 32);
    v14[2] = v18;
    v14[3] = v19;
    uint64_t v15 = v20;
    v14[0] = v16;
    v14[1] = v17;
    [v5 _chooseNeutralGrayForNonSushi:v14];
    double v6 = *(void **)(*(void *)(a1 + 48) + 8);
    v6[4] = v7;
    v6[5] = v8;
    v6[6] = v9;
    v6[7] = v10;
  }
  else
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_4(uint64_t a1, void *a2)
{
  id v20 = 0;
  id v3 = [a2 result:&v20];
  id v4 = v20;
  if (v3)
  {
    double v19 = 0.0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    objc_msgSend(v3, "pi_grayColorResultValue");
    uint64_t v5 = *(void **)(a1 + 32);
    double v6 = [*(id *)(a1 + 40) rawProperties];
    v13[2] = v17;
    v13[3] = v18;
    double v14 = v19;
    v13[0] = v15;
    v13[1] = v16;
    [v5 _chooseTempTintForSushi:v13 RAWProperties:v6 brightness:v19];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    *(void *)(v7 + 32) = v8;
    *(void *)(v7 + 40) = v9;
  }
  else
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_5(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    && !*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_correctedRGBResultFromResult:", *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 56));
    id v3 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRGBResult:");
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setObject:v3 forKeyedSubscript:@"grayColor"];

    nu_rgb_to_tempTint();
    uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8);
    if (*(void *)(v4 + 40))
    {
LABEL_14:
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithDouble:");
      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setObject:v8 forKeyedSubscript:@"temperature"];

      uint64_t v9 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(fmin(0.0, 150.0), -150.0));
      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setObject:v9 forKeyedSubscript:@"tint"];

      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) forKeyedSubscript:@"colorType"];
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

      return;
    }
    if (*(unsigned char *)(a1 + 104))
    {
      nu_xy_to_tempTint();
      int v5 = objc_msgSend(*(id *)(a1 + 32), "_useTempTint:", *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 56));
      uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8);
      double v6 = *(void **)(v4 + 40);
      if (v5)
      {
        uint64_t v7 = @"tempTint";
LABEL_13:
        *(void *)(v4 + 40) = v7;

        goto LABEL_14;
      }
    }
    else
    {
      double v6 = 0;
    }
    uint64_t v7 = @"neutralGray";
    goto LABEL_13;
  }
  v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  v2();
}

@end