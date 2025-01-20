@interface _UIEventSessionDynamicAccumulator
+ (id)accumulatorWithName:(id)a3 depth:(unint64_t)a4 block:(id)a5 delegate:(id)a6 allowedActionSourceTypes:(id)a7;
- (_UIEventSessionDynamicAccumulatorDelegate)delegate;
- (void)performIncreaseWithActions:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _UIEventSessionDynamicAccumulator

+ (id)accumulatorWithName:(id)a3 depth:(unint64_t)a4 block:(id)a5 delegate:(id)a6 allowedActionSourceTypes:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = a6;
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &accumulatorWithName_depth_block_delegate_allowedActionSourceTypes____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v19 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "_UIEventSessionDynamicAccumulator: Created new accumulator!", v20, 2u);
      }
    }
  }
  objc_msgSend(a1, "accumulatorWithName:depthRange:block:allowedActionSourceTypes:", v12, a4, 0, v13, v14);
  v16 = (id *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(v16 + 8, v15);

  return v16;
}

- (void)performIncreaseWithActions:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &performIncreaseWithActions____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v16 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "_UIEventSessionDynamicAccumulator: increaseWithActions() called!", buf, 2u);
      }
    }
  }
  v5 = [(_UIEventSessionAccumulator *)self block];
  uint64_t v6 = ((uint64_t (**)(void, id))v5)[2](v5, v4);

  if (v6)
  {
    v7 = [(_UIEventSessionDynamicAccumulator *)self delegate];

    if (v7)
    {
      v8 = [MEMORY[0x1E4F28E78] string];
      v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count") + 3);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __64___UIEventSessionDynamicAccumulator_performIncreaseWithActions___block_invoke;
      v17[3] = &unk_1E52F0910;
      id v18 = v8;
      id v19 = v9;
      id v20 = v4;
      id v10 = v9;
      id v11 = v8;
      [v20 enumerateObjectsWithOptions:2 usingBlock:v17];
      [v10 setObject:v11 forKey:@"Sequence"];
      id v12 = [(_UIEventSessionAccumulator *)self name];
      [v10 setObject:v12 forKey:@"Action"];

      id v13 = [(_UIEventSessionDynamicAccumulator *)self delegate];
      id v14 = [(_UIEventSessionAccumulator *)self name];
      [v13 writeEventWithFields:v10 andName:v14];
    }
  }
}

- (_UIEventSessionDynamicAccumulatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIEventSessionDynamicAccumulatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end