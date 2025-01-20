@interface SBInteractiveScreenshotGestureCropsView
- (SBInteractiveScreenshotGestureCropsView)initWithFrame:(CGRect)a3;
- (UIColor)cornerColor;
- (UIColor)lineColor;
- (UIColor)lineGrabberColor;
- (double)cornerAlpha;
- (double)cornerEdgeLength;
- (double)grabberLineWidth;
- (double)lineAlpha;
- (double)lineGrabberAlpha;
- (double)lineGrabberEdgeLength;
- (double)lineWidth;
- (id)cropsCompositingFilter;
- (void)_setPresentationValue:(id)a3 forKey:(id)a4;
- (void)_updateGeometryForBounds:(CGRect)a3 shouldUsePresentationValues:(BOOL)a4;
- (void)_updateGeometryOrDeferLayoutUsingModelBounds;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setCornerAlpha:(double)a3;
- (void)setCornerColor:(id)a3;
- (void)setCornerEdgeLength:(double)a3;
- (void)setCropsCompositingFilter:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGrabberLineWidth:(double)a3;
- (void)setLineAlpha:(double)a3;
- (void)setLineColor:(id)a3;
- (void)setLineGrabberAlpha:(double)a3;
- (void)setLineGrabberColor:(id)a3;
- (void)setLineGrabberEdgeLength:(double)a3;
- (void)setLineWidth:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SBInteractiveScreenshotGestureCropsView

- (SBInteractiveScreenshotGestureCropsView)initWithFrame:(CGRect)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  v89.receiver = self;
  v89.super_class = (Class)SBInteractiveScreenshotGestureCropsView;
  v3 = -[SBInteractiveScreenshotGestureCropsView initWithFrame:](&v89, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SpringBoard.SBInteractiveScreenshotGestureCropsView.accessQueue", 0);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.82];
    cornerColor = v3->_cornerColor;
    v3->_cornerColor = (UIColor *)v6;

    uint64_t v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    id cropsCompositingFilter = v3->_cropsCompositingFilter;
    v3->_id cropsCompositingFilter = (id)v8;

    v3->_cornerEdgeLength = 20.0;
    v3->_cornerAlpha = 1.0;
    v3->_grabberLineWidth = 4.0;
    v3->_lineGrabberEdgeLength = v3->_cornerEdgeLength;
    v3->_lineGrabberAlpha = 1.0;
    v3->_lineWidth = 1.0;
    uint64_t v10 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.82];
    lineGrabberColor = v3->_lineGrabberColor;
    v3->_lineGrabberColor = (UIColor *)v10;

    uint64_t v12 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.82];
    lineColor = v3->_lineColor;
    v3->_lineColor = (UIColor *)v12;

    v3->_lineAlpha = 1.0;
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
    id v15 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v16 = *MEMORY[0x1E4F1DB28];
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v20 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], v17, v18, v19);
    bottomLeftCornerHorizontalView = v3->_bottomLeftCornerHorizontalView;
    v3->_bottomLeftCornerHorizontalView = (UIView *)v20;

    [v14 addObject:v3->_bottomLeftCornerHorizontalView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_bottomLeftCornerHorizontalView];
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    bottomLeftCornerVerticalView = v3->_bottomLeftCornerVerticalView;
    v3->_bottomLeftCornerVerticalView = (UIView *)v22;

    [v14 addObject:v3->_bottomLeftCornerVerticalView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_bottomLeftCornerVerticalView];
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    bottomRightCornerHorizontalView = v3->_bottomRightCornerHorizontalView;
    v3->_bottomRightCornerHorizontalView = (UIView *)v24;

    [v14 addObject:v3->_bottomRightCornerHorizontalView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_bottomRightCornerHorizontalView];
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    bottomRightCornerVerticalView = v3->_bottomRightCornerVerticalView;
    v3->_bottomRightCornerVerticalView = (UIView *)v26;

    [v14 addObject:v3->_bottomRightCornerVerticalView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_bottomRightCornerVerticalView];
    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    topLeftCornerHorizontalView = v3->_topLeftCornerHorizontalView;
    v3->_topLeftCornerHorizontalView = (UIView *)v28;

    [v14 addObject:v3->_topLeftCornerHorizontalView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_topLeftCornerHorizontalView];
    uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    topLeftCornerVerticalView = v3->_topLeftCornerVerticalView;
    v3->_topLeftCornerVerticalView = (UIView *)v30;

    [v14 addObject:v3->_topLeftCornerVerticalView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_topLeftCornerVerticalView];
    uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    topRightCornerHorizontalView = v3->_topRightCornerHorizontalView;
    v3->_topRightCornerHorizontalView = (UIView *)v32;

    [v14 addObject:v3->_topRightCornerHorizontalView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_topRightCornerHorizontalView];
    uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    topRightCornerVerticalView = v3->_topRightCornerVerticalView;
    v3->_topRightCornerVerticalView = (UIView *)v34;

    [v14 addObject:v3->_topRightCornerVerticalView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_topRightCornerVerticalView];
    v76 = v14;
    objc_storeStrong((id *)&v3->_cornerViews, v14);
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v36 = v3->_cornerViews;
    uint64_t v37 = [(NSArray *)v36 countByEnumeratingWithState:&v85 objects:v92 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v86 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          [v41 setBackgroundColor:v3->_cornerColor];
          v42 = [v41 layer];
          [v42 setCompositingFilter:v3->_cropsCompositingFilter];
        }
        uint64_t v38 = [(NSArray *)v36 countByEnumeratingWithState:&v85 objects:v92 count:16];
      }
      while (v38);
    }

    v43 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    uint64_t v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    bottomLineView = v3->_bottomLineView;
    v3->_bottomLineView = (UIView *)v44;

    [v43 addObject:v3->_bottomLineView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_bottomLineView];
    uint64_t v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    leftLineView = v3->_leftLineView;
    v3->_leftLineView = (UIView *)v46;

    [v43 addObject:v3->_leftLineView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_leftLineView];
    uint64_t v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    rightLineView = v3->_rightLineView;
    v3->_rightLineView = (UIView *)v48;

    [v43 addObject:v3->_rightLineView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_rightLineView];
    uint64_t v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    topLineView = v3->_topLineView;
    v3->_topLineView = (UIView *)v50;

    [v43 addObject:v3->_topLineView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_topLineView];
    objc_storeStrong((id *)&v3->_lineViews, v43);
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v52 = v3->_lineViews;
    uint64_t v53 = [(NSArray *)v52 countByEnumeratingWithState:&v81 objects:v91 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v82;
      do
      {
        for (uint64_t j = 0; j != v54; ++j)
        {
          if (*(void *)v82 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = *(void **)(*((void *)&v81 + 1) + 8 * j);
          [v57 setBackgroundColor:v3->_lineColor];
          v58 = [v57 layer];
          [v58 setCompositingFilter:v3->_cropsCompositingFilter];
        }
        uint64_t v54 = [(NSArray *)v52 countByEnumeratingWithState:&v81 objects:v91 count:16];
      }
      while (v54);
    }

    v59 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    uint64_t v60 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    bottomLineGrabberView = v3->_bottomLineGrabberView;
    v3->_bottomLineGrabberView = (UIView *)v60;

    [v59 addObject:v3->_bottomLineGrabberView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_bottomLineGrabberView];
    uint64_t v62 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    leftLineGrabberView = v3->_leftLineGrabberView;
    v3->_leftLineGrabberView = (UIView *)v62;

    [v59 addObject:v3->_leftLineGrabberView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_leftLineGrabberView];
    uint64_t v64 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    rightLineGrabberView = v3->_rightLineGrabberView;
    v3->_rightLineGrabberView = (UIView *)v64;

    [v59 addObject:v3->_rightLineGrabberView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_rightLineGrabberView];
    uint64_t v66 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    topLineGrabberView = v3->_topLineGrabberView;
    v3->_topLineGrabberView = (UIView *)v66;

    [v59 addObject:v3->_topLineGrabberView];
    [(SBInteractiveScreenshotGestureCropsView *)v3 addSubview:v3->_topLineGrabberView];
    objc_storeStrong((id *)&v3->_lineGrabberViews, v59);
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v68 = v3->_lineGrabberViews;
    uint64_t v69 = [(NSArray *)v68 countByEnumeratingWithState:&v77 objects:v90 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v78;
      do
      {
        for (uint64_t k = 0; k != v70; ++k)
        {
          if (*(void *)v78 != v71) {
            objc_enumerationMutation(v68);
          }
          v73 = *(void **)(*((void *)&v77 + 1) + 8 * k);
          [v73 setBackgroundColor:v3->_lineGrabberColor];
          v74 = [v73 layer];
          [v74 setCompositingFilter:v3->_cropsCompositingFilter];
        }
        uint64_t v70 = [(NSArray *)v68 countByEnumeratingWithState:&v77 objects:v90 count:16];
      }
      while (v70);
    }
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBInteractiveScreenshotGestureCropsView;
  [(SBInteractiveScreenshotGestureCropsView *)&v3 layoutSubviews];
  [(SBInteractiveScreenshotGestureCropsView *)self bounds];
  -[SBInteractiveScreenshotGestureCropsView _updateGeometryForBounds:shouldUsePresentationValues:](self, "_updateGeometryForBounds:shouldUsePresentationValues:", 0);
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBInteractiveScreenshotGestureCropsView;
  -[SBInteractiveScreenshotGestureCropsView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SBInteractiveScreenshotGestureCropsView *)self _updateGeometryOrDeferLayoutUsingModelBounds];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBInteractiveScreenshotGestureCropsView;
  -[SBInteractiveScreenshotGestureCropsView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SBInteractiveScreenshotGestureCropsView *)self _updateGeometryOrDeferLayoutUsingModelBounds];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBInteractiveScreenshotGestureCropsView;
  [(SBInteractiveScreenshotGestureCropsView *)&v9 traitCollectionDidChange:a3];
  objc_super v4 = [(SBInteractiveScreenshotGestureCropsView *)self traitCollection];
  [v4 displayScale];
  uint64_t v6 = v5;

  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__SBInteractiveScreenshotGestureCropsView_traitCollectionDidChange___block_invoke;
  v8[3] = &unk_1E6AF4A70;
  v8[4] = self;
  v8[5] = v6;
  dispatch_sync(accessQueue, v8);
}

double __68__SBInteractiveScreenshotGestureCropsView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 568) = result;
  return result;
}

- (void)_setPresentationValue:(id)a3 forKey:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"bounds"])
  {
    v34.receiver = self;
    v34.super_class = (Class)SBInteractiveScreenshotGestureCropsView;
    [(SBInteractiveScreenshotGestureCropsView *)&v34 _setPresentationValue:v6 forKey:v7];
    [v6 CGRectValue];
    -[SBInteractiveScreenshotGestureCropsView _updateGeometryForBounds:shouldUsePresentationValues:](self, "_updateGeometryForBounds:shouldUsePresentationValues:", 1);
  }
  else
  {
    if ([v7 isEqualToString:@"lineGrabberAlpha"])
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v8 = self->_lineGrabberViews;
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v30 objects:v37 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v31 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v30 + 1) + 8 * i) _setPresentationValue:v6 forKey:@"opacity"];
          }
          uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v30 objects:v37 count:16];
        }
        while (v10);
      }
    }
    else if ([v7 isEqualToString:@"lineAlpha"])
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v8 = self->_lineViews;
      uint64_t v13 = [(NSArray *)v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v27;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v26 + 1) + 8 * j) _setPresentationValue:v6 forKey:@"opacity"];
          }
          uint64_t v14 = [(NSArray *)v8 countByEnumeratingWithState:&v26 objects:v36 count:16];
        }
        while (v14);
      }
    }
    else
    {
      if (![v7 isEqualToString:@"cornerAlpha"])
      {
        v21.receiver = self;
        v21.super_class = (Class)SBInteractiveScreenshotGestureCropsView;
        [(SBInteractiveScreenshotGestureCropsView *)&v21 _setPresentationValue:v6 forKey:v7];
        goto LABEL_30;
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v8 = self->_cornerViews;
      uint64_t v17 = [(NSArray *)v8 countByEnumeratingWithState:&v22 objects:v35 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v23;
        do
        {
          for (uint64_t k = 0; k != v18; ++k)
          {
            if (*(void *)v23 != v19) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v22 + 1) + 8 * k) _setPresentationValue:v6 forKey:@"opacity"];
          }
          uint64_t v18 = [(NSArray *)v8 countByEnumeratingWithState:&v22 objects:v35 count:16];
        }
        while (v18);
      }
    }
  }
LABEL_30:
}

- (void)setCornerAlpha:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cornerAlpha = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = self->_cornerViews;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setAlpha:", self->_cornerAlpha, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)setCornerColor:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (UIColor *)a3;
  p_cornerColor = &self->_cornerColor;
  cornerColor = self->_cornerColor;
  if (cornerColor != v5 && ([(UIColor *)cornerColor isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cornerColor, a3);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = self->_cornerViews;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "setBackgroundColor:", *p_cornerColor, (void)v13);
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)setCropsCompositingFilter:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_id cropsCompositingFilter = &self->_cropsCompositingFilter;
  id cropsCompositingFilter = self->_cropsCompositingFilter;
  if (cropsCompositingFilter != v5 && ([cropsCompositingFilter isEqual:v5] & 1) == 0)
  {
    objc_storeStrong(&self->_cropsCompositingFilter, a3);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = self->_cornerViews;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "layer", (void)v14);
          [v13 setCompositingFilter:*p_cropsCompositingFilter];
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)setCornerEdgeLength:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cornerEdgeLength = a3;
    [(SBInteractiveScreenshotGestureCropsView *)self _updateGeometryOrDeferLayoutUsingModelBounds];
  }
}

- (void)setGrabberLineWidth:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cornerEdgeLength = a3;
    [(SBInteractiveScreenshotGestureCropsView *)self _updateGeometryOrDeferLayoutUsingModelBounds];
  }
}

- (void)setLineAlpha:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_lineAlpha = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = self->_lineViews;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setAlpha:", self->_lineAlpha, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)setLineColor:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (UIColor *)a3;
  p_lineColor = &self->_lineColor;
  lineColor = self->_lineColor;
  if (lineColor != v5 && ([(UIColor *)lineColor isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lineColor, a3);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = self->_lineViews;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "setBackgroundColor:", *p_lineColor, (void)v13);
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)setLineWidth:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_lineWidth = a3;
    [(SBInteractiveScreenshotGestureCropsView *)self _updateGeometryOrDeferLayoutUsingModelBounds];
  }
}

- (void)setLineGrabberAlpha:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_lineGrabberAlpha = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = self->_lineGrabberViews;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setAlpha:", self->_lineGrabberAlpha, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)setLineGrabberColor:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (UIColor *)a3;
  p_lineGrabberColor = &self->_lineGrabberColor;
  lineGrabberColor = self->_lineGrabberColor;
  if (lineGrabberColor != v5 && ([(UIColor *)lineGrabberColor isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lineGrabberColor, a3);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = self->_lineGrabberViews;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "setBackgroundColor:", *p_lineGrabberColor, (void)v13);
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)setLineGrabberEdgeLength:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_lineGrabberEdgeLength = a3;
    [(SBInteractiveScreenshotGestureCropsView *)self _updateGeometryOrDeferLayoutUsingModelBounds];
  }
}

- (void)_updateGeometryForBounds:(CGRect)a3 shouldUsePresentationValues:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v136 = 0;
  v137 = &v136;
  uint64_t v138 = 0x2020000000;
  uint64_t v139 = 0x3FF0000000000000;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__SBInteractiveScreenshotGestureCropsView__updateGeometryForBounds_shouldUsePresentationValues___block_invoke;
  block[3] = &unk_1E6AF4B88;
  block[4] = self;
  block[5] = &v136;
  dispatch_sync(accessQueue, block);
  v140.origin.CGFloat x = x;
  v140.origin.CGFloat y = y;
  v140.size.CGFloat width = width;
  v140.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v140);
  v141.origin.CGFloat x = x;
  v141.origin.CGFloat y = y;
  v141.size.CGFloat width = width;
  v141.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v141);
  double grabberLineWidth = self->_grabberLineWidth;
  double cornerEdgeLength = self->_cornerEdgeLength;
  v142.origin.CGFloat x = x;
  v142.origin.CGFloat y = y;
  v142.size.CGFloat width = width;
  v142.size.CGFloat height = height;
  double v134 = CGRectGetMinX(v142);
  v143.origin.CGFloat x = x;
  v143.origin.CGFloat y = y;
  v143.size.CGFloat width = width;
  v143.size.CGFloat height = height;
  double v118 = CGRectGetMinY(v143);
  double v133 = self->_grabberLineWidth;
  double v116 = self->_cornerEdgeLength;
  v144.origin.CGFloat x = x;
  v144.origin.CGFloat y = y;
  v144.size.CGFloat width = width;
  v144.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v144);
  double v12 = self->_cornerEdgeLength;
  v145.origin.CGFloat x = x;
  v145.origin.CGFloat y = y;
  v145.size.CGFloat width = width;
  v145.size.CGFloat height = height;
  double v123 = CGRectGetMinY(v145);
  double v121 = self->_cornerEdgeLength;
  double v122 = self->_grabberLineWidth;
  v146.origin.CGFloat x = x;
  v146.origin.CGFloat y = y;
  v146.size.CGFloat width = width;
  v146.size.CGFloat height = height;
  CGFloat v13 = CGRectGetMaxX(v146);
  double v113 = self->_grabberLineWidth;
  v147.origin.CGFloat x = x;
  v147.origin.CGFloat y = y;
  v147.size.CGFloat width = width;
  v147.size.CGFloat height = height;
  double v111 = CGRectGetMinY(v147);
  double v128 = self->_grabberLineWidth;
  double v109 = self->_cornerEdgeLength;
  v148.origin.CGFloat x = x;
  v148.origin.CGFloat y = y;
  v148.size.CGFloat width = width;
  v148.size.CGFloat height = height;
  double rect_24 = CGRectGetMinX(v148);
  v149.origin.CGFloat x = x;
  v149.origin.CGFloat y = y;
  v149.size.CGFloat width = width;
  v149.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v149);
  double v96 = v12;
  double v98 = MaxX;
  double rect_8 = self->_cornerEdgeLength;
  double rect_16 = self->_grabberLineWidth;
  v150.origin.CGFloat x = x;
  v150.origin.CGFloat y = y;
  v150.size.CGFloat width = width;
  v150.size.CGFloat height = height;
  double rect = CGRectGetMinX(v150);
  v151.origin.CGFloat x = x;
  v151.origin.CGFloat y = y;
  v151.size.CGFloat width = width;
  v151.size.CGFloat height = height;
  double v15 = CGRectGetMaxY(v151);
  double v103 = v13;
  double v16 = self->_cornerEdgeLength;
  double v120 = self->_grabberLineWidth;
  v152.origin.CGFloat x = x;
  v152.origin.CGFloat y = y;
  v152.size.CGFloat width = width;
  v152.size.CGFloat height = height;
  double v89 = CGRectGetMaxX(v152);
  double v87 = self->_cornerEdgeLength;
  v153.origin.CGFloat x = x;
  v153.origin.CGFloat y = y;
  v153.size.CGFloat width = width;
  v153.size.CGFloat height = height;
  double v85 = CGRectGetMaxY(v153);
  double v91 = MaxY;
  double v107 = self->_cornerEdgeLength;
  double v108 = self->_grabberLineWidth;
  v154.origin.CGFloat x = x;
  v154.origin.CGFloat y = y;
  v154.size.CGFloat width = width;
  v154.size.CGFloat height = height;
  double v101 = CGRectGetMaxX(v154);
  double v93 = self->_grabberLineWidth;
  v155.origin.CGFloat x = x;
  v155.origin.CGFloat y = y;
  v155.size.CGFloat width = width;
  v155.size.CGFloat height = height;
  double v17 = CGRectGetMaxY(v155);
  double v18 = self->_cornerEdgeLength;
  double v115 = self->_grabberLineWidth;
  v156.origin.CGFloat x = x;
  v156.origin.CGFloat y = y;
  v156.size.CGFloat width = width;
  v156.size.CGFloat height = height;
  double v83 = CGRectGetMinX(v156);
  v157.size.CGFloat width = v133;
  v157.origin.CGFloat y = v118 + v133;
  v157.size.CGFloat height = v116 - v133;
  double lineWidth = self->_lineWidth;
  double v81 = self->_grabberLineWidth;
  v157.origin.CGFloat x = v134;
  double v117 = v118 + v133;
  double v119 = v157.size.height;
  double v106 = CGRectGetMaxY(v157);
  CGFloat v19 = v15 - v16;
  v158.size.CGFloat width = v120;
  v158.size.CGFloat height = v16 - v120;
  double v105 = self->_lineWidth;
  v158.origin.CGFloat x = rect;
  v158.origin.CGFloat y = v19;
  double v71 = v16 - v120;
  double v77 = CGRectGetMinY(v158);
  v159.size.CGFloat width = v133;
  v159.origin.CGFloat x = v134;
  v159.origin.CGFloat y = v117;
  v159.size.CGFloat height = v119;
  double v75 = CGRectGetMaxY(v159);
  v160.origin.CGFloat x = x;
  v160.origin.CGFloat y = y;
  v160.size.CGFloat width = width;
  v160.size.CGFloat height = height;
  double v74 = CGRectGetMaxX(v160);
  v161.origin.CGFloat x = v103 - v113;
  v161.size.CGFloat width = v128;
  v161.size.CGFloat height = v109 - v128;
  double v73 = self->_grabberLineWidth;
  double v110 = v103 - v113;
  double v112 = v111 + v128;
  v161.origin.CGFloat y = v112;
  double v114 = v161.size.height;
  double v65 = CGRectGetMaxY(v161);
  v162.origin.CGFloat y = v17 - v18;
  v162.size.CGFloat width = v115;
  v162.size.CGFloat height = v18 - v115;
  double v64 = self->_lineWidth;
  double v66 = v101 - v93;
  double v67 = v17 - v18;
  v162.origin.CGFloat x = v101 - v93;
  double v69 = v18 - v115;
  double v72 = CGRectGetMinY(v162);
  v163.origin.CGFloat x = v110;
  v163.origin.CGFloat y = v112;
  v163.size.CGFloat width = v128;
  v163.size.CGFloat height = v114;
  double v70 = CGRectGetMaxY(v163);
  double v68 = v19;
  v164.origin.CGFloat y = MinY;
  v164.origin.CGFloat x = MinX;
  v164.size.CGFloat height = grabberLineWidth;
  v164.size.CGFloat width = cornerEdgeLength;
  double v102 = CGRectGetMaxX(v164);
  v165.origin.CGFloat x = x;
  v165.origin.CGFloat y = y;
  v165.size.CGFloat width = width;
  v165.size.CGFloat height = height;
  double v94 = CGRectGetMinY(v165);
  double v20 = self->_grabberLineWidth;
  double v97 = v98 - v96;
  v166.origin.CGFloat x = v97;
  double v99 = self->_lineWidth;
  v166.size.CGFloat height = v122;
  v166.origin.CGFloat y = v123;
  v166.size.CGFloat width = v121;
  double v21 = CGRectGetMinX(v166);
  v167.origin.CGFloat y = MinY;
  v167.origin.CGFloat x = MinX;
  v167.size.CGFloat height = grabberLineWidth;
  v167.size.CGFloat width = cornerEdgeLength;
  double v22 = CGRectGetMaxX(v167);
  v168.size.CGFloat width = rect_8;
  v168.size.CGFloat height = rect_16;
  v168.origin.CGFloat y = v91 - rect_16;
  double v23 = self->_lineWidth;
  v168.origin.CGFloat x = rect_24;
  double v104 = v91 - rect_16;
  double v61 = CGRectGetMaxX(v168);
  v169.origin.CGFloat x = x;
  v169.origin.CGFloat y = y;
  v169.size.CGFloat width = width;
  v169.size.CGFloat height = height;
  double v92 = CGRectGetMaxY(v169);
  v170.origin.CGFloat x = v89 - v87;
  v170.size.CGFloat height = v108;
  v170.origin.CGFloat y = v85 - v108;
  double v90 = self->_grabberLineWidth;
  double v62 = v170.origin.x;
  double v63 = v85 - v108;
  v170.size.CGFloat width = v107;
  double v88 = CGRectGetMinX(v170);
  v171.origin.CGFloat x = rect_24;
  v171.origin.CGFloat y = v104;
  v171.size.CGFloat width = rect_8;
  v171.size.CGFloat height = rect_16;
  double v86 = CGRectGetMaxX(v171);
  CGFloat v24 = v83 + v81 - lineWidth;
  v172.size.CGFloat height = v77 - v75;
  double v80 = self->_lineWidth;
  double v82 = v24;
  v172.origin.CGFloat x = v24;
  v172.size.CGFloat width = v105;
  v172.origin.CGFloat y = v106;
  double v84 = v77 - v75;
  CGRectGetMinX(v172);
  UIRectCenteredYInRectScale();
  double v59 = v25;
  double v60 = v26;
  double v76 = v27;
  double v78 = v28;
  v173.origin.CGFloat x = x;
  v173.origin.CGFloat y = y;
  v173.size.CGFloat width = width;
  v173.size.CGFloat height = height;
  CGRectGetMaxX(v173);
  UIRectCenteredYInRectScale();
  double v55 = v29;
  double v56 = v30;
  double v57 = v31;
  double v58 = v32;
  v174.origin.CGFloat y = v94 + v20 - v99;
  v174.size.CGFloat width = v21 - v22;
  v174.origin.CGFloat x = v102;
  double v33 = v174.origin.y;
  double v34 = v174.size.width;
  v174.size.CGFloat height = v23;
  CGRectGetMinY(v174);
  UIRectCenteredXInRectScale();
  double v100 = v35;
  double v54 = v36;
  double v95 = v37;
  double v39 = v38;
  v175.origin.CGFloat x = x;
  v175.origin.CGFloat y = y;
  v175.size.CGFloat width = width;
  v175.size.CGFloat height = height;
  CGRectGetMaxY(v175);
  uint64_t v49 = v137[3];
  UIRectCenteredXInRectScale();
  double v50 = v40;
  double v51 = v41;
  double v52 = v42;
  double v53 = v43;
  double v44 = v74 - v73;
  double v45 = v72 - v70;
  double v46 = v92 - v90;
  double v47 = v88 - v86;
  topLeftCornerHorizontalView = self->_topLeftCornerHorizontalView;
  if (v4)
  {
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](topLeftCornerHorizontalView, "sb_setPresentationBoundsAndPositionFromFrame:", MinX, MinY, cornerEdgeLength, grabberLineWidth, v49);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_topLeftCornerVerticalView, "sb_setPresentationBoundsAndPositionFromFrame:", v134, v117, v133, v119);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_topRightCornerHorizontalView, "sb_setPresentationBoundsAndPositionFromFrame:", v97, v123, v121, v122);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_topRightCornerVerticalView, "sb_setPresentationBoundsAndPositionFromFrame:", v110, v112, v128, v114);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_bottomLeftCornerHorizontalView, "sb_setPresentationBoundsAndPositionFromFrame:", rect_24, v104, rect_8, rect_16);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_bottomLeftCornerVerticalView, "sb_setPresentationBoundsAndPositionFromFrame:", rect, v68, v120, v71);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_bottomRightCornerHorizontalView, "sb_setPresentationBoundsAndPositionFromFrame:", v62, v63, v107, v108);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_bottomRightCornerVerticalView, "sb_setPresentationBoundsAndPositionFromFrame:", v66, v67, v115, v69);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_leftLineView, "sb_setPresentationBoundsAndPositionFromFrame:", v82, v106, v105, v84);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_bottomLineView, "sb_setPresentationBoundsAndPositionFromFrame:", v61, v46, v47, v80);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_topLineView, "sb_setPresentationBoundsAndPositionFromFrame:", v102, v33, v34, v23);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_rightLineView, "sb_setPresentationBoundsAndPositionFromFrame:", v44, v65, v64, v45);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_leftLineGrabberView, "sb_setPresentationBoundsAndPositionFromFrame:", v59, v60, v76, v78);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_bottomLineGrabberView, "sb_setPresentationBoundsAndPositionFromFrame:", v50, v51, v52, v53);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_topLineGrabberView, "sb_setPresentationBoundsAndPositionFromFrame:", v100, v39, v54, v95);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_rightLineGrabberView, "sb_setPresentationBoundsAndPositionFromFrame:", v55, v56, v57, v58);
  }
  else
  {
    -[UIView sb_setBoundsAndPositionFromFrame:](topLeftCornerHorizontalView, "sb_setBoundsAndPositionFromFrame:", MinX, MinY, cornerEdgeLength, grabberLineWidth, v49);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_topLeftCornerVerticalView, "sb_setBoundsAndPositionFromFrame:", v134, v117, v133, v119);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_topRightCornerHorizontalView, "sb_setBoundsAndPositionFromFrame:", v97, v123, v121, v122);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_topRightCornerVerticalView, "sb_setBoundsAndPositionFromFrame:", v110, v112, v128, v114);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_bottomLeftCornerHorizontalView, "sb_setBoundsAndPositionFromFrame:", rect_24, v104, rect_8, rect_16);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_bottomLeftCornerVerticalView, "sb_setBoundsAndPositionFromFrame:", rect, v68, v120, v71);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_bottomRightCornerHorizontalView, "sb_setBoundsAndPositionFromFrame:", v62, v63, v107, v108);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_bottomRightCornerVerticalView, "sb_setBoundsAndPositionFromFrame:", v66, v67, v115, v69);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_leftLineView, "sb_setBoundsAndPositionFromFrame:", v82, v106, v105, v84);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_bottomLineView, "sb_setBoundsAndPositionFromFrame:", v61, v46, v47, v80);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_topLineView, "sb_setBoundsAndPositionFromFrame:", v102, v33, v34, v23);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_rightLineView, "sb_setBoundsAndPositionFromFrame:", v44, v65, v64, v45);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_leftLineGrabberView, "sb_setBoundsAndPositionFromFrame:", v59, v60, v76, v78);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_bottomLineGrabberView, "sb_setBoundsAndPositionFromFrame:", v50, v51, v52, v53);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_topLineGrabberView, "sb_setBoundsAndPositionFromFrame:", v100, v39, v54, v95);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_rightLineGrabberView, "sb_setBoundsAndPositionFromFrame:", v55, v56, v57, v58);
  }
  _Block_object_dispose(&v136, 8);
}

double __96__SBInteractiveScreenshotGestureCropsView__updateGeometryForBounds_shouldUsePresentationValues___block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 568);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_updateGeometryOrDeferLayoutUsingModelBounds
{
  if (([MEMORY[0x1E4F42FF0] _isInAnimationBlockWithAnimationsEnabled] & 1) != 0
    || [MEMORY[0x1E4F42FF0] _isInRetargetableAnimationBlock])
  {
    [(SBInteractiveScreenshotGestureCropsView *)self bounds];
    -[SBInteractiveScreenshotGestureCropsView _updateGeometryForBounds:shouldUsePresentationValues:](self, "_updateGeometryForBounds:shouldUsePresentationValues:", 0);
  }
  else
  {
    [(SBInteractiveScreenshotGestureCropsView *)self setNeedsLayout];
  }
}

- (double)cornerAlpha
{
  return self->_cornerAlpha;
}

- (double)cornerEdgeLength
{
  return self->_cornerEdgeLength;
}

- (UIColor)cornerColor
{
  return self->_cornerColor;
}

- (double)lineGrabberAlpha
{
  return self->_lineGrabberAlpha;
}

- (double)lineGrabberEdgeLength
{
  return self->_lineGrabberEdgeLength;
}

- (UIColor)lineGrabberColor
{
  return self->_lineGrabberColor;
}

- (double)grabberLineWidth
{
  return self->_grabberLineWidth;
}

- (double)lineAlpha
{
  return self->_lineAlpha;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (id)cropsCompositingFilter
{
  return self->_cropsCompositingFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cropsCompositingFilter, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_lineGrabberColor, 0);
  objc_storeStrong((id *)&self->_cornerColor, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_lineGrabberViews, 0);
  objc_storeStrong((id *)&self->_lineViews, 0);
  objc_storeStrong((id *)&self->_cornerViews, 0);
  objc_storeStrong((id *)&self->_topLineGrabberView, 0);
  objc_storeStrong((id *)&self->_topLineView, 0);
  objc_storeStrong((id *)&self->_rightLineGrabberView, 0);
  objc_storeStrong((id *)&self->_rightLineView, 0);
  objc_storeStrong((id *)&self->_leftLineGrabberView, 0);
  objc_storeStrong((id *)&self->_leftLineView, 0);
  objc_storeStrong((id *)&self->_bottomLineGrabberView, 0);
  objc_storeStrong((id *)&self->_bottomLineView, 0);
  objc_storeStrong((id *)&self->_topRightCornerVerticalView, 0);
  objc_storeStrong((id *)&self->_topRightCornerHorizontalView, 0);
  objc_storeStrong((id *)&self->_topLeftCornerVerticalView, 0);
  objc_storeStrong((id *)&self->_topLeftCornerHorizontalView, 0);
  objc_storeStrong((id *)&self->_bottomRightCornerVerticalView, 0);
  objc_storeStrong((id *)&self->_bottomRightCornerHorizontalView, 0);
  objc_storeStrong((id *)&self->_bottomLeftCornerVerticalView, 0);
  objc_storeStrong((id *)&self->_bottomLeftCornerHorizontalView, 0);
}

@end