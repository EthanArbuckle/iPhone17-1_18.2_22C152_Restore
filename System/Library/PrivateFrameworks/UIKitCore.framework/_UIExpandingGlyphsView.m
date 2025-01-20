@interface _UIExpandingGlyphsView
- (BOOL)expandsFromLeftToRight;
- (BOOL)fadesOut;
- (BOOL)prefersBaselineAlignment;
- (CGSize)intrinsicContentSize;
- (CGSize)intrinsicSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)imageViews;
- (NSAttributedString)attributedString;
- (_UIExpandingGlyphsView)initWithFrame:(CGRect)a3;
- (double)baselineOffset;
- (id)completionBlock;
- (int)remainingAnimationCount;
- (void)animateCompletionBlock:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setAttributedString:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setExpandsFromLeftToRight:(BOOL)a3;
- (void)setFadesOut:(BOOL)a3;
- (void)setImageViews:(id)a3;
- (void)setIntrinsicSize:(CGSize)a3;
- (void)setRemainingAnimationCount:(int)a3;
@end

@implementation _UIExpandingGlyphsView

- (BOOL)prefersBaselineAlignment
{
  return 1;
}

- (_UIExpandingGlyphsView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIExpandingGlyphsView;
  result = -[UIView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_fadesOut = 1;
  }
  return result;
}

- (void)setAttributedString:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_attributedString, a3);
  v6 = [(UIView *)self window];
  if (v6)
  {
    v7 = [(UIView *)self window];
    v8 = [v7 screen];
    [v8 scale];
    double v10 = v9;
  }
  else
  {
    v7 = +[UIScreen mainScreen];
    [v7 scale];
    double v10 = v11;
  }

  memset(v33, 0, sizeof(v33));
  memset(&v32, 0, sizeof(v32));

  v12 = objc_msgSend(v5, "_ui_glyphImageViewsScale:outImageRect:outLineRect:outBaselineOffset:", v33, &v32, &self->_baselineOffset, v10);
  [(_UIExpandingGlyphsView *)self setImageViews:v12];

  self->_intrinsicSize.width = CGRectGetWidth(v32);
  self->_intrinsicSize.height = CGRectGetHeight(v32);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v13 = [(UIView *)self subviews];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v15);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v18 = [(_UIExpandingGlyphsView *)self imageViews];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        [(UIView *)self addSubview:v23];
        [v23 setAlpha:0.0];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v20);
  }

  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)animateCompletionBlock:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  [(_UIExpandingGlyphsView *)self setCompletionBlock:a3];
  id v4 = objc_alloc(MEMORY[0x1E4F39C10]);
  LODWORD(v5) = 1046809695;
  LODWORD(v6) = 990250344;
  LODWORD(v7) = 1057860847;
  LODWORD(v8) = 1064564184;
  double v9 = (void *)[v4 initWithControlPoints:v5 :v6 :v7 :v8];
  double v10 = [(UIView *)self subviews];
  unint64_t v11 = [v10 count];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  BOOL expandsFromLeftToRight = self->_expandsFromLeftToRight;
  v47 = self;
  v13 = [(UIView *)self subviews];
  uint64_t v14 = v13;
  if (expandsFromLeftToRight) {
    [v13 objectEnumerator];
  }
  else {
  uint64_t v15 = [v13 reverseObjectEnumerator];
  }

  uint64_t v16 = v15;
  uint64_t v43 = [v15 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v51;
    uint64_t v46 = *MEMORY[0x1E4F39FA0];
    uint64_t v33 = *MEMORY[0x1E4F39FA8];
    double v17 = 0.0;
    unint64_t v18 = 0x1E4F39000uLL;
    long long v40 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v38 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v39 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v36 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v37 = *MEMORY[0x1E4F39B10];
    long long v34 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v35 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    obuint64_t j = v15;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v51 != v42) {
          objc_enumerationMutation(obj);
        }
        v44 = *(void **)(*((void *)&v50 + 1) + 8 * v19);
        uint64_t v45 = v19;
        uint64_t v20 = objc_msgSend(v44, "layer", obj);
        [v20 removeAllAnimations];

        uint64_t v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
        id v22 = objc_alloc_init(*(Class *)(v18 + 3216));
        [v22 setMass:2.0];
        [v22 setStiffness:300.0];
        [v22 setDamping:400.0];
        [v22 setTimingFunction:v9];
        [v22 setDuration:0.91];
        [v22 setKeyPath:@"transform"];
        v23 = (void *)MEMORY[0x1E4F29238];
        CATransform3DMakeScale(&v49, 0.5, 0.5, 1.0);
        long long v24 = [v23 valueWithCATransform3D:&v49];
        [v22 setFromValue:v24];

        v48[4] = v41;
        v48[5] = v40;
        v48[6] = v39;
        v48[7] = v38;
        v48[0] = v37;
        v48[1] = v36;
        v48[2] = v35;
        v48[3] = v34;
        long long v25 = [MEMORY[0x1E4F29238] valueWithCATransform3D:v48];
        [v22 setToValue:v25];

        [v22 setBeginTime:v17];
        [v22 setFillMode:v46];
        [v22 setRemovedOnCompletion:v47->_fadesOut];
        [v21 addObject:v22];
        id v26 = objc_alloc_init(*(Class *)(v18 + 3216));
        [v26 setMass:2.0];
        [v26 setStiffness:300.0];
        [v26 setDamping:400.0];
        [v26 setTimingFunction:v9];
        [v26 setDuration:0.91];
        [v26 setKeyPath:@"opacity"];
        [v26 setFromValue:&unk_1ED3F2918];
        [v26 setToValue:&unk_1ED3F2928];
        [v26 setBeginTime:v17];
        [v26 setFillMode:v46];
        [v26 setRemovedOnCompletion:v47->_fadesOut];
        [v21 addObject:v26];
        unint64_t v27 = v18;
        if (v47->_fadesOut)
        {
          id v28 = objc_alloc_init(*(Class *)(v18 + 3216));
          [v28 setMass:2.0];
          [v28 setStiffness:300.0];
          [v28 setDamping:400.0];
          [v28 setTimingFunction:v9];
          [v28 setDuration:0.91];
          [v28 setKeyPath:@"opacity"];
          [v28 setFromValue:&unk_1ED3F2928];
          [v28 setToValue:&unk_1ED3F2918];
          [v28 setBeginTime:1.49];
          [v28 setFillMode:v33];
          [v21 addObject:v28];
        }
        id v29 = objc_alloc_init(MEMORY[0x1E4F39B38]);
        [v29 setAnimations:v21];
        [v29 setDuration:2.4];
        LODWORD(v30) = 1066192077;
        [v29 setSpeed:v30];
        [v29 setRemovedOnCompletion:v47->_fadesOut];
        [v29 setFillMode:v46];
        long long v31 = +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:v47];
        [v29 setDelegate:v31];

        [v44 addAnimation:v29 forKey:@"animations"];
        [(_UIExpandingGlyphsView *)v47 setRemainingAnimationCount:[(_UIExpandingGlyphsView *)v47 remainingAnimationCount] + 1];
        double v17 = 0.14 / (double)v11 + v17;

        ++v19;
        unint64_t v18 = v27;
      }
      while (v43 != v45 + 1);
      uint64_t v16 = obj;
      uint64_t v43 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v43);
  }
}

- (CGSize)intrinsicContentSize
{
  double width = self->_intrinsicSize.width;
  double height = self->_intrinsicSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_intrinsicSize.width;
  double height = self->_intrinsicSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  [(_UIExpandingGlyphsView *)self setRemainingAnimationCount:[(_UIExpandingGlyphsView *)self remainingAnimationCount] - 1];
  if (![(_UIExpandingGlyphsView *)self remainingAnimationCount])
  {
    uint64_t v6 = [(_UIExpandingGlyphsView *)self completionBlock];
    [(_UIExpandingGlyphsView *)self setCompletionBlock:0];
    double v5 = (void *)v6;
    if (v6)
    {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
      double v5 = (void *)v6;
    }
  }
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (BOOL)expandsFromLeftToRight
{
  return self->_expandsFromLeftToRight;
}

- (void)setExpandsFromLeftToRight:(BOOL)a3
{
  self->_BOOL expandsFromLeftToRight = a3;
}

- (BOOL)fadesOut
{
  return self->_fadesOut;
}

- (void)setFadesOut:(BOOL)a3
{
  self->_fadesOut = a3;
}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (int)remainingAnimationCount
{
  return self->_remainingAnimationCount;
}

- (void)setRemainingAnimationCount:(int)a3
{
  self->_remainingAnimationCount = a3;
}

- (CGSize)intrinsicSize
{
  double width = self->_intrinsicSize.width;
  double height = self->_intrinsicSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIntrinsicSize:(CGSize)a3
{
  self->_intrinsicSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end