@interface IPAPhotoAdjustmentStack
- (IPAPhotoAdjustmentPipeline)pipeline;
- (PFIntSize_st)inputSize;
- (id)_debugDescriptionSuffix;
- (id)copyWithZone:(_NSZone *)a3;
- (id)maskUUIDs;
- (id)minimumVersionForFormat:(id)a3;
- (int64_t)orientation;
- (void)setInputSize:(PFIntSize_st)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setPipeline:(id)a3;
@end

@implementation IPAPhotoAdjustmentStack

- (void).cxx_destruct
{
}

- (void)setPipeline:(id)a3
{
}

- (IPAPhotoAdjustmentPipeline)pipeline
{
  return self->_pipeline;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setInputSize:(PFIntSize_st)a3
{
  self->_inputSize = a3;
}

- (PFIntSize_st)inputSize
{
  p_inputSize = &self->_inputSize;
  unint64_t width = self->_inputSize.width;
  unint64_t height = p_inputSize->height;
  result.unint64_t height = height;
  result.unint64_t width = width;
  return result;
}

- (id)_debugDescriptionSuffix
{
  return (id)[NSString stringWithFormat:@"inputSize(w:%lu,h:%lu) orientation=%lu pipeline=%@ >", self->_inputSize.width, self->_inputSize.height, self->_orientation, self->_pipeline];
}

- (id)maskUUIDs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(IPAAdjustmentStack *)self adjustments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) maskUUID];
        if (v8)
        {
          if (!v5)
          {
            v5 = [MEMORY[0x1E4F1CA70] orderedSet];
          }
          [v5 addObject:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  v9 = [MEMORY[0x1E4F1CAA0] orderedSetWithOrderedSet:v5];

  return v9;
}

- (id)minimumVersionForFormat:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.photo"])
  {
    v5 = @"1.4";
    uint64_t v6 = @"1.4";
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)IPAPhotoAdjustmentStack;
    v5 = [(IPAAdjustmentStack *)&v8 minimumVersionForFormat:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IPAPhotoAdjustmentStack;
  id v4 = [(IPAAdjustmentStack *)&v6 copyWithZone:a3];
  *(PFIntSize_st *)(v4 + 40) = self->_inputSize;
  *((void *)v4 + 3) = self->_orientation;
  objc_storeStrong((id *)v4 + 4, self->_pipeline);
  return v4;
}

@end