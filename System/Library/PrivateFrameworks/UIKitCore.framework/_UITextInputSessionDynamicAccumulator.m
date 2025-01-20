@interface _UITextInputSessionDynamicAccumulator
+ (id)accumulatorWithName:(id)a3 depthRange:(_NSRange)a4 block:(id)a5;
- (NSArray)lastResults;
- (id)dynamicAccumulatorIncreaseBlock;
- (void)increaseWithActions:(id)a3;
- (void)setDynamicAccumulatorIncreaseBlock:(id)a3;
@end

@implementation _UITextInputSessionDynamicAccumulator

+ (id)accumulatorWithName:(id)a3 depthRange:(_NSRange)a4 block:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = UITextInputSessionLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v9;
    _os_log_debug_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEBUG, "[UITextInputSessionDynamicAccumulator] Created new accumulator with name %@!", buf, 0xCu);
  }

  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS____UITextInputSessionDynamicAccumulator;
  v12 = objc_msgSendSuper2(&v14, sel_accumulatorWithName_type_depthRange_block_, v9, 0, location, length, &__block_literal_global_560);
  [v12 setDynamicAccumulatorIncreaseBlock:v10];

  return v12;
}

- (void)increaseWithActions:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = UITextInputSessionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = [(_UITextInputSessionAccumulator *)self name];
    int v8 = 138412290;
    id v9 = v7;
    _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "[UITextInputSessionDynamicAccumulator] increaseWithActions() called on %@!", (uint8_t *)&v8, 0xCu);
  }
  v6 = (*((void (**)(void))self->_dynamicAccumulatorIncreaseBlock + 2))();

  if ([v6 count]) {
    objc_storeStrong((id *)&self->_lastResults, v6);
  }
}

- (NSArray)lastResults
{
  return self->_lastResults;
}

- (id)dynamicAccumulatorIncreaseBlock
{
  return self->_dynamicAccumulatorIncreaseBlock;
}

- (void)setDynamicAccumulatorIncreaseBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dynamicAccumulatorIncreaseBlock, 0);
  objc_storeStrong((id *)&self->_lastResults, 0);
}

@end