@interface TCMPSHorizontalFlipAugmenter
- (TCMPSHorizontalFlipAugmenter)init;
- (double)skipProbability;
- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4;
- (void)setSkipProbability:(double)a3;
@end

@implementation TCMPSHorizontalFlipAugmenter

- (TCMPSHorizontalFlipAugmenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)TCMPSHorizontalFlipAugmenter;
  result = [(TCMPSHorizontalFlipAugmenter *)&v3 init];
  if (result) {
    result->_skipProbability = 0.5;
  }
  return result;
}

- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = (*((double (**)(id, double, double))a4 + 2))(a4, 0.0, 1.0);
  [(TCMPSHorizontalFlipAugmenter *)self skipProbability];
  if (v7 >= v8)
  {
    memset(&v28, 0, sizeof(v28));
    CGAffineTransformMakeScale(&v28, -1.0, 1.0);
    id v9 = (id)objc_opt_new();
    v10 = [v6 image];
    CGAffineTransform v27 = v28;
    v11 = [v10 imageByApplyingTransform:&v27];
    [v9 setImage:v11];

    [v6 bounds];
    CGAffineTransform v27 = v28;
    CGRect v33 = CGRectApplyAffineTransform(v32, &v27);
    objc_msgSend(v9, "setBounds:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
    v12 = (void *)MEMORY[0x263EFF980];
    v13 = [v6 annotations];
    v14 = objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v15 = objc_msgSend(v6, "annotations", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v21 = (void *)[v20 copy];
          [v20 boundingBox];
          CGAffineTransform v27 = v28;
          CGRect v35 = CGRectApplyAffineTransform(v34, &v27);
          objc_msgSend(v21, "setBoundingBox:", v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
          [v14 addObject:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v17);
    }

    [v9 setAnnotations:v14];
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

- (double)skipProbability
{
  return self->_skipProbability;
}

- (void)setSkipProbability:(double)a3
{
  self->_skipProbability = a3;
}

@end