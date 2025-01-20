@interface TCMPSResizeAugmenter
- (CGSize)size;
- (TCMPSResizeAugmenter)initWithSize:(CGSize)a3;
- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4;
@end

@implementation TCMPSResizeAugmenter

- (TCMPSResizeAugmenter)initWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)TCMPSResizeAugmenter;
  result = [(TCMPSResizeAugmenter *)&v6 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
  }
  return result;
}

- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_super v6 = objc_opt_new();
  [v5 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(TCMPSResizeAugmenter *)self size];
  CGFloat v16 = v15 / v12;
  [(TCMPSResizeAugmenter *)self size];
  memset(&v42, 0, sizeof(v42));
  CGFloat v17 = -v8;
  CGFloat v19 = v18 / v14;
  CGAffineTransformMakeTranslation(&t1, v17, -v10);
  CGAffineTransformMakeScale(&t2, v16, v19);
  CGAffineTransformConcat(&v42, &t1, &t2);
  v20 = [v5 image];
  CGAffineTransform v39 = v42;
  v21 = [v20 imageByApplyingTransform:&v39];
  [v6 setImage:v21];

  v22 = [v6 image];
  v23 = [v22 imageBySamplingLinear];
  [v6 setImage:v23];

  [v5 bounds];
  CGAffineTransform v39 = v42;
  CGRect v47 = CGRectApplyAffineTransform(v46, &v39);
  objc_msgSend(v6, "setBounds:", v47.origin.x, v47.origin.y, v47.size.width, v47.size.height);
  v24 = (void *)MEMORY[0x263EFF980];
  v25 = [v5 annotations];
  v26 = objc_msgSend(v24, "arrayWithCapacity:", objc_msgSend(v25, "count"));

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v27 = objc_msgSend(v5, "annotations", 0);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v33 = (void *)[v32 copy];
        [v32 boundingBox];
        CGAffineTransform v39 = v42;
        CGRect v49 = CGRectApplyAffineTransform(v48, &v39);
        objc_msgSend(v33, "setBoundingBox:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
        [v26 addObject:v33];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v29);
  }

  [v6 setAnnotations:v26];
  return v6;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end