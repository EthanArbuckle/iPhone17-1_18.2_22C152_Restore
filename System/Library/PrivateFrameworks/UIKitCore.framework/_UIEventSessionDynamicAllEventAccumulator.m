@interface _UIEventSessionDynamicAllEventAccumulator
+ (id)accumulatorWithName:(id)a3 depth:(unint64_t)a4 block:(id)a5 delegate:(id)a6 allowedActionSourceTypes:(id)a7;
- (_UIEventSessionDynamicAccumulatorDelegate)delegate;
- (void)performIncreaseWithActions:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _UIEventSessionDynamicAllEventAccumulator

+ (id)accumulatorWithName:(id)a3 depth:(unint64_t)a4 block:(id)a5 delegate:(id)a6 allowedActionSourceTypes:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = a6;
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &accumulatorWithName_depth_block_delegate_allowedActionSourceTypes____s_category_80);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v19 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "_UIEventSessionDynamicAllEventAccumulator: Created new accumulator!", v20, 2u);
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
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &performIncreaseWithActions____s_category_81);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v22 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "_UIEventSessionDynamicAllEventAccumulator: increaseWithActions() called!", v24, 2u);
      }
    }
  }
  v5 = [v4 firstObject];
  v6 = [(_UIEventSessionAccumulator *)self block];
  uint64_t v7 = ((uint64_t (**)(void, id))v6)[2](v6, v4);

  if (v7)
  {
    v8 = [(_UIEventSessionDynamicAllEventAccumulator *)self delegate];

    if (v8)
    {
      uint64_t v9 = [v4 firstObject];
      if (v9)
      {
        v10 = (void *)v9;
        v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:9];
        id v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "hardwareKeyboardState"));
        [v11 setObject:v12 forKeyedSubscript:@"kbAtt"];

        id v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "magicKeyboardState"));
        [v11 setObject:v13 forKeyedSubscript:@"mkbAtt"];

        id v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "uiInterfaceOrientation"));
        [v11 setObject:v14 forKeyedSubscript:@"uiOrient"];

        id v15 = [v10 sessionID];
        [v11 setObject:v15 forKeyedSubscript:@"sID"];

        if (os_variant_has_internal_diagnostics())
        {
          v23 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "sequenceNumber"));
          [v11 setObject:v23 forKeyedSubscript:@"seqN"];
        }
        v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "source"));
        [v11 setObject:v16 forKeyedSubscript:@"src"];

        v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "actionType"));
        [v11 setObject:v17 forKeyedSubscript:@"aTyp"];

        v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "actionCount"));
        [v11 setObject:v18 forKeyedSubscript:@"aCnt"];

        v19 = [(_UIEventSessionDynamicAllEventAccumulator *)self delegate];
        v20 = [(_UIEventSessionAccumulator *)self name];
        [v19 writeEventWithFields:v11 andName:v20];
      }
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