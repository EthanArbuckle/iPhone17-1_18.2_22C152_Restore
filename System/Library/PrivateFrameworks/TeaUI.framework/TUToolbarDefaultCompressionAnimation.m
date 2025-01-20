@interface TUToolbarDefaultCompressionAnimation
- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4;
- (BOOL)shouldCloseGapOnScroll;
- (BOOL)shouldCompressAtTop;
- (TUToolbarDefaultCompressionAnimation)initWithToolbar:(id)a3;
- (UIToolbar)toolbar;
- (double)maximumBarHeightForTraitCollection:(id)a3;
- (double)minimumBarHeightForTraitCollection:(id)a3;
- (double)topOffset;
- (void)reloadWithTraitCollection:(id)a3;
- (void)setToolbar:(id)a3;
- (void)updateWithPercentage:(double)a3;
@end

@implementation TUToolbarDefaultCompressionAnimation

- (TUToolbarDefaultCompressionAnimation)initWithToolbar:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUToolbarDefaultCompressionAnimation;
  v6 = [(TUToolbarDefaultCompressionAnimation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_toolbar, a3);
  }

  return v7;
}

- (void)updateWithPercentage:(double)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v4 = [(TUToolbarDefaultCompressionAnimation *)self toolbar];
  id v5 = [v4 window];
  [v5 frame];
  double Height = CGRectGetHeight(v33);
  objc_msgSend(v4, "ts_frameUsingCenterAndBounds");
  double v8 = Height - v7;
  memset(&v30, 0, sizeof(v30));
  long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v29.a = *MEMORY[0x1E4F1DAB8];
  long long v23 = *(_OWORD *)&v29.a;
  *(_OWORD *)&v29.c = v22;
  *(_OWORD *)&v29.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v21 = *(_OWORD *)&v29.tx;
  CGAffineTransformTranslate(&v30, &v29, 0.0, (Height - v7) * a3);
  *(_OWORD *)&v29.a = v23;
  *(_OWORD *)&v29.c = v22;
  *(_OWORD *)&v29.tx = v21;
  [v4 setTransform:&v29];
  objc_super v9 = [v4 items];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v13), "ts_barButtonItemView", v21, v22, v23);
        v15 = [v14 subviews];
        v16 = [v15 firstObject];

        if (v16)
        {
          *(_OWORD *)&v29.a = v23;
          *(_OWORD *)&v29.c = v22;
          *(_OWORD *)&v29.tx = v21;
          [v16 setTransform:&v29];
          v17 = [v16 superview];
          [v16 frame];
          objc_msgSend(v17, "convertPoint:toView:", v5);
          double v19 = v18;

          double v20 = Height - v19 - v8;
          if (v20 > 0.0)
          {
            *(_OWORD *)&v29.a = v23;
            *(_OWORD *)&v29.c = v22;
            *(_OWORD *)&v29.tx = v21;
            CGAffineTransformTranslate(&v24, &v29, 0.0, v20 * a3);
            [v16 setTransform:&v24];
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v11);
  }
  CGAffineTransform v29 = v30;
  objc_msgSend(v4, "setTransform:", &v29, v21, v22, v23);
}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  return 1;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  v3 = [(TUToolbarDefaultCompressionAnimation *)self toolbar];
  [v3 frame];
  double Height = CGRectGetHeight(v6);

  return Height;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

- (BOOL)shouldCompressAtTop
{
  return 0;
}

- (BOOL)shouldCloseGapOnScroll
{
  return 1;
}

- (void)reloadWithTraitCollection:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v3 = [(TUToolbarDefaultCompressionAnimation *)self toolbar];
  v4 = objc_msgSend(v3, "ts_barButtonViews");

  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v16 = *MEMORY[0x1E4F39B10];
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "layer", v13, v14, v15, v16, v17, v18, v19, v20);
        LODWORD(v11) = 1.0;
        [v10 setOpacity:v11];

        uint64_t v12 = [v9 layer];
        v21[4] = v20;
        v21[5] = v19;
        v21[6] = v18;
        v21[7] = v17;
        v21[0] = v16;
        v21[1] = v15;
        v21[2] = v14;
        v21[3] = v13;
        [v12 setTransform:v21];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
}

- (double)topOffset
{
  return self->_topOffset;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
}

- (void).cxx_destruct
{
}

@end