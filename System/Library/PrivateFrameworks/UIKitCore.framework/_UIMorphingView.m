@interface _UIMorphingView
- (BOOL)useOpacityPairFilter;
- (CGRect)initialBounds;
- (NSMutableOrderedSet)contentViews;
- (UIView)opacityPairSourceView;
- (double)progress;
- (id)_currentDestinationView;
- (void)_updateMorphProgress;
- (void)addContentView:(id)a3;
- (void)setContentViews:(id)a3;
- (void)setInitialBounds:(CGRect)a3;
- (void)setOpacityPairSourceView:(id)a3;
- (void)setProgress:(double)a3;
- (void)setUseOpacityPairFilter:(BOOL)a3;
@end

@implementation _UIMorphingView

- (void)addContentView:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_UIMorphingView *)self contentViews];

  if (!v5)
  {
    v6 = objc_opt_new();
    [(_UIMorphingView *)self setContentViews:v6];
  }
  v7 = [(_UIMorphingView *)self contentViews];
  uint64_t v8 = [v7 indexOfObject:v4];

  v9 = [(_UIMorphingView *)self contentViews];
  v10 = v9;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [v9 count];

    if (v11)
    {
      [v4 setAlpha:0.0];
    }
    else
    {
      [v4 bounds];
      -[UIView setBounds:](self, "setBounds:");
    }
    v14 = [(_UIMorphingView *)self contentViews];
    [v14 addObject:v4];

    [(UIView *)self addSubview:v4];
  }
  else
  {
    v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v8];
    v13 = [(_UIMorphingView *)self contentViews];
    objc_msgSend(v10, "moveObjectsAtIndexes:toIndex:", v12, objc_msgSend(v13, "count") - 1);
  }
  [(UIView *)self bounds];
  -[_UIMorphingView setInitialBounds:](self, "setInitialBounds:");
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v15 = [(_UIMorphingView *)self contentViews];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v20 alpha];
        objc_msgSend(v20, "_uimorphingView_setInitialAlpha:");
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v17);
  }

  if ([(_UIMorphingView *)self useOpacityPairFilter])
  {
    v21 = [(_UIMorphingView *)self contentViews];
    unint64_t v22 = [v21 count];

    if (v22 >= 2)
    {
      v23 = [(_UIMorphingView *)self opacityPairSourceView];
      v24 = [v23 layer];
      [v24 setFilters:0];

      v25 = [(_UIMorphingView *)self opacityPairSourceView];
      v26 = [v25 layer];
      [v26 removeAllAnimations];

      v27 = [(_UIMorphingView *)self contentViews];
      v28 = [(_UIMorphingView *)self contentViews];
      v29 = objc_msgSend(v27, "objectAtIndexedSubscript:", objc_msgSend(v28, "count") - 2);
      [(_UIMorphingView *)self setOpacityPairSourceView:v29];

      v30 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2C0]];
      v39 = v30;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
      v32 = [(_UIMorphingView *)self opacityPairSourceView];
      v33 = [v32 layer];
      [v33 setFilters:v31];
    }
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __34___UIMorphingView_addContentView___block_invoke;
  v34[3] = &unk_1E52D9F70;
  v34[4] = self;
  +[UIView performWithoutAnimation:v34];
}

- (void)setProgress:(double)a3
{
  if (self->_progress != a3)
  {
    self->_progress = a3;
    [(_UIMorphingView *)self _updateMorphProgress];
  }
}

- (id)_currentDestinationView
{
  v2 = [(_UIMorphingView *)self contentViews];
  v3 = [v2 lastObject];

  return v3;
}

- (void)_updateMorphProgress
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v3 = [(_UIMorphingView *)self _currentDestinationView];
  id v4 = [(_UIMorphingView *)self contentViews];
  unint64_t v5 = [v4 count];

  if (v5 < 2)
  {
    [v3 setAlpha:1.0];
  }
  else
  {
    [(_UIMorphingView *)self progress];
    double v69 = v6;
    [(_UIMorphingView *)self initialBounds];
    CGFloat v8 = v7;
    CGFloat v57 = v9;
    CGFloat v58 = v7;
    CGFloat v11 = v10;
    CGFloat recta = v10;
    CGFloat v12 = v9;
    CGFloat v14 = v13;
    CGFloat v55 = v13;
    [v3 bounds];
    CGFloat v16 = v15;
    double v70 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v56 = v21;
    v79.origin.x = v8;
    v79.origin.y = v11;
    v79.size.width = v12;
    v79.size.height = v14;
    double MinX = CGRectGetMinX(v79);
    v80.origin.x = v16;
    v80.origin.y = v18;
    CGFloat v54 = v20;
    v80.size.width = v20;
    v80.size.height = v22;
    double v65 = (1.0 - v69) * MinX + v69 * CGRectGetMinX(v80);
    v81.origin.x = v58;
    v81.origin.y = recta;
    v81.size.width = v57;
    v81.size.height = v55;
    double MinY = CGRectGetMinY(v81);
    v82.origin.x = v70;
    v82.origin.y = v18;
    v82.size.width = v20;
    v82.size.height = v56;
    double v63 = (1.0 - v69) * MinY + v69 * CGRectGetMinY(v82);
    v83.origin.x = v58;
    v83.origin.y = recta;
    v83.size.width = v57;
    v83.size.height = v55;
    double Width = CGRectGetWidth(v83);
    v84.origin.x = v70;
    v84.origin.y = v18;
    v84.size.width = v20;
    v84.size.height = v56;
    double v60 = (1.0 - v69) * Width + v69 * CGRectGetWidth(v84);
    v85.origin.x = v58;
    v85.origin.y = recta;
    v85.size.width = v57;
    v85.size.height = v55;
    double Height = CGRectGetHeight(v85);
    v86.origin.x = v70;
    v86.origin.y = v18;
    v86.size.width = v20;
    v86.size.height = v56;
    double v59 = 1.0 - v69;
    -[UIView setBounds:](self, "setBounds:", v65, v63, v60, (1.0 - v69) * Height + v69 * CGRectGetHeight(v86));
    [(UIView *)self bounds];
    double v66 = v27;
    double rect = v26;
    double v61 = v29;
    double v64 = v28;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v30 = [(_UIMorphingView *)self contentViews];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v73 objects:v77 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v74 != v33) {
            objc_enumerationMutation(v30);
          }
          long long v35 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          objc_msgSend(v35, "bounds", *(void *)&v54);
          CGFloat v37 = v36;
          CGFloat v39 = v38;
          CGFloat v41 = v40;
          CGFloat v43 = v42;
          v87.origin.x = rect;
          v87.origin.y = v66;
          v87.size.width = v64;
          v87.size.height = v61;
          double v70 = CGRectGetWidth(v87);
          v88.origin.x = v37;
          v88.origin.y = v39;
          v88.size.width = v41;
          v88.size.height = v43;
          double v70 = v70 / CGRectGetWidth(v88);
          v89.origin.x = rect;
          v89.origin.y = v66;
          v89.size.width = v64;
          v89.size.height = v61;
          double v44 = CGRectGetHeight(v89);
          v90.origin.x = v37;
          v90.origin.y = v39;
          v90.size.width = v41;
          v90.size.height = v43;
          CGFloat v45 = CGRectGetHeight(v90);
          CGAffineTransformMakeScale(&v72, v70, v44 / v45);
          CGAffineTransform v71 = v72;
          [v35 setTransform:&v71];
          objc_msgSend(v35, "setCenter:", rect + v64 * 0.5, v66 + v61 * 0.5);
          v46 = [(_UIMorphingView *)self opacityPairSourceView];

          if (v35 == v46)
          {
            objc_msgSend(v3, "_uimorphingView_getInitialAlpha");
            double v50 = v69 + v59 * v49;
            v51 = [(_UIMorphingView *)self opacityPairSourceView];
            v52 = [v51 layer];
            v53 = [NSNumber numberWithDouble:v50];
            [v52 setValue:v53 forKey:@"filters.opacityPair.inputAmount"];
          }
          else
          {
            if (v35 == v3) {
              double v47 = 1.0;
            }
            else {
              double v47 = 0.0;
            }
            objc_msgSend(v35, "_uimorphingView_getInitialAlpha");
            [v35 setAlpha:v69 * v47 + v59 * v48];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v73 objects:v77 count:16];
      }
      while (v32);
    }
  }
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)useOpacityPairFilter
{
  return self->_useOpacityPairFilter;
}

- (void)setUseOpacityPairFilter:(BOOL)a3
{
  self->_useOpacityPairFilter = a3;
}

- (NSMutableOrderedSet)contentViews
{
  return self->_contentViews;
}

- (void)setContentViews:(id)a3
{
}

- (CGRect)initialBounds
{
  double x = self->_initialBounds.origin.x;
  double y = self->_initialBounds.origin.y;
  double width = self->_initialBounds.size.width;
  double height = self->_initialBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInitialBounds:(CGRect)a3
{
  self->_initialBounds = a3;
}

- (UIView)opacityPairSourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_opacityPairSourceView);
  return (UIView *)WeakRetained;
}

- (void)setOpacityPairSourceView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_opacityPairSourceView);
  objc_storeStrong((id *)&self->_contentViews, 0);
}

@end