@interface _UITextInputSessionMetaAccumulator
+ (id)accumulatorWithName:(id)a3 accumulators:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)increaseWithActions:(id)a3;
- (void)reset;
@end

@implementation _UITextInputSessionMetaAccumulator

+ (id)accumulatorWithName:(id)a3 accumulators:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  v7 = [v6 firstObject];
  uint64_t v8 = [v7 depthRange];
  uint64_t v10 = v9;

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = v8;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = v8 + v10;
  v11 = [v6 firstObject];
  uint64_t v12 = [v11 type];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71___UITextInputSessionMetaAccumulator_accumulatorWithName_accumulators___block_invoke;
  v18[3] = &unk_1E530A8B8;
  v18[4] = &v23;
  v18[5] = &v19;
  v18[6] = &v27;
  v18[7] = v12;
  [v6 enumerateObjectsUsingBlock:v18];
  if (*((unsigned char *)v28 + 24) && [v6 count])
  {
    v13 = objc_alloc_init((Class)objc_opt_class());
    v14 = (void *)[v5 copy];
    [v13 setName:v14];

    [v13 setType:v12];
    objc_msgSend(v13, "setDepthRange:", v24[3], v20[3] - v24[3]);
    uint64_t v15 = [v6 copy];
    v16 = (void *)v13[15];
    v13[15] = v15;

    [v13 reset];
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_class();
  id v5 = [(_UITextInputSessionAccumulator *)self name];
  id v6 = [v4 accumulatorWithName:v5 accumulators:self->_accumulators];

  return v6;
}

- (void)increaseWithActions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  accumulators = self->_accumulators;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __58___UITextInputSessionMetaAccumulator_increaseWithActions___block_invoke;
  v18 = &unk_1E530A8E0;
  uint64_t v22 = v5;
  id v7 = v4;
  v20 = self;
  uint64_t v21 = &v23;
  id v19 = v7;
  [(NSArray *)accumulators enumerateObjectsWithOptions:2 usingBlock:&v15];
  if (*((unsigned char *)v24 + 24)) {
    goto LABEL_7;
  }
  ++self->_actionCountWithoutIncrease;
  int64_t lastSuccessfulIndex = self->_lastSuccessfulIndex;
  NSUInteger v9 = [(NSArray *)self->_accumulators count];
  if (lastSuccessfulIndex + 1 < v9 - 1) {
    int64_t v10 = lastSuccessfulIndex + 1;
  }
  else {
    int64_t v10 = v9 - 1;
  }
  v11 = [(NSArray *)self->_accumulators objectAtIndex:v10];
  uint64_t v12 = [v11 depthRange];
  unint64_t v14 = v12 + v13;

  if (self->_actionCountWithoutIncrease >= v14)
  {
    self->_int64_t lastSuccessfulIndex = -1;
LABEL_7:
    self->_actionCountWithoutIncrease = 0;
  }

  _Block_object_dispose(&v23, 8);
}

- (void)reset
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_UITextInputSessionMetaAccumulator;
  [(_UITextInputSessionAccumulator *)&v12 reset];
  self->_int64_t lastSuccessfulIndex = -1;
  self->_actionCountWithoutIncrease = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_accumulators;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "reset", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
}

@end