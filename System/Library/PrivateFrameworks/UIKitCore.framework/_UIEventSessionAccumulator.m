@interface _UIEventSessionAccumulator
+ (id)accumulatorWithName:(id)a3 depthRange:(_NSRange)a4 block:(id)a5 allowedActionSourceTypes:(id)a6;
- (BOOL)isActionAllowed:(id)a3;
- (NSDictionary)allowedActionSourceTypes;
- (NSString)name;
- (_NSRange)depthRange;
- (id)block;
- (int64_t)sequenceNumber;
- (void)enumerateAnalytics:(id)a3;
- (void)flushAccumulator;
- (void)increaseWithAction:(id)a3;
- (void)performIncreaseWithActions:(id)a3;
- (void)reset;
- (void)setSequenceNumber:(int64_t)a3;
@end

@implementation _UIEventSessionAccumulator

+ (id)accumulatorWithName:(id)a3 depthRange:(_NSRange)a4 block:(id)a5 allowedActionSourceTypes:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v14 = [v12 copy];

  v15 = (void *)v13[2];
  v13[2] = v14;

  v13[6] = location;
  v13[7] = length;
  uint64_t v16 = [v11 copy];

  v17 = (void *)v13[3];
  v13[3] = v16;

  uint64_t v18 = [v10 copy];
  v19 = (void *)v13[4];
  v13[4] = v18;

  [v13 reset];
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &accumulatorWithName_depthRange_block_allowedActionSourceTypes____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v22 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "_UIEventSessionAccumulator: Created new accumulator!", v23, 2u);
      }
    }
  }
  return v13;
}

- (void)performIncreaseWithActions:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIEventSessionAccumulator.m" lineNumber:45 description:@"_UIEventSessionAccumulator: performIncreaseWithActions() called! Please implement this method or use a child class."];
}

- (BOOL)isActionAllowed:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_allowedActionSourceTypes objectForKeyedSubscript:objc_opt_class()];
  if (v5)
  {
    v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "source"));
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)increaseWithAction:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UIEventSessionAccumulator *)self isActionAllowed:v4])
  {
    id v5 = [(NSMutableOrderedSet *)self->_recentActions firstObject];
    char v7 = v5;
    if (!v5)
    {
LABEL_6:
      objc_msgSend(v4, "setSequenceNumber:", self->_sequenceNumber, v6);
      int64_t sequenceNumber = self->_sequenceNumber;
      if (sequenceNumber >= 999) {
        int64_t sequenceNumber = 999;
      }
      self->_int64_t sequenceNumber = sequenceNumber + 1;
      recentActions = self->_recentActions;
      id v12 = (void *)[v4 copy];
      [(NSMutableOrderedSet *)recentActions insertObject:v12 atIndex:0];

      goto LABEL_9;
    }
    if (![v5 mergeActionIfPossible:v4])
    {
      [(_UIEventSessionAccumulator *)self performIncreaseWithActions:self->_recentActions];
      unint64_t v8 = [(NSMutableOrderedSet *)self->_recentActions count];
      NSUInteger v9 = self->_depthRange.length + self->_depthRange.location;
      unint64_t v6 = v8 - v9;
      if (v8 > v9) {
        -[NSMutableOrderedSet removeObjectsInRange:](self->_recentActions, "removeObjectsInRange:");
      }
      goto LABEL_6;
    }
LABEL_9:

    goto LABEL_11;
  }
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &increaseWithAction____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v14 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        char v7 = v14;
        int v15 = 138412290;
        uint64_t v16 = objc_opt_class();
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "_UIEventSessionAccumulator: increaseWithActions() skipping action of class %@", (uint8_t *)&v15, 0xCu);
        goto LABEL_9;
      }
    }
  }
LABEL_11:
}

- (void)flushAccumulator
{
  if ([(NSMutableOrderedSet *)self->_recentActions count])
  {
    [(_UIEventSessionAccumulator *)self performIncreaseWithActions:self->_recentActions];
    recentActions = self->_recentActions;
    [(NSMutableOrderedSet *)recentActions removeAllObjects];
  }
}

- (void)reset
{
  self->_int64_t sequenceNumber = 0;
  recentActions = self->_recentActions;
  if (recentActions)
  {
    [(NSMutableOrderedSet *)recentActions removeAllObjects];
  }
  else
  {
    id v4 = (NSMutableOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:20];
    id v5 = self->_recentActions;
    self->_recentActions = v4;
  }
}

- (void)enumerateAnalytics:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIEventSessionAccumulator.m" lineNumber:138 description:@"_UIEventSessionAccumulator: enumerateAnalytics() called! Please implement this method or use a child class."];
}

- (NSString)name
{
  return self->_name;
}

- (_NSRange)depthRange
{
  NSUInteger length = self->_depthRange.length;
  NSUInteger location = self->_depthRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)block
{
  return self->_block;
}

- (NSDictionary)allowedActionSourceTypes
{
  return self->_allowedActionSourceTypes;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int64_t)a3
{
  self->_int64_t sequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedActionSourceTypes, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_recentActions, 0);
}

@end