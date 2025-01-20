@interface PUParallaxDebugInfoView
- (CALayer)maskLayer;
- (NSDictionary)additionalDebugInfo;
- (NSMutableDictionary)rectViewsByIdentifier;
- (NSString)debugHUDString;
- (PUParallaxDebugInfoView)initWithViewModel:(id)a3;
- (PUParallaxLayerStackViewModel)viewModel;
- (UILabel)debugHUDLabel;
- (id)_rectViewForIdentifier:(id)a3;
- (id)currentLayoutInfo;
- (void)_layoutWithCurrentLayoutInfo;
- (void)_updateDebugHUDString;
- (void)displayAdditionalDebugInfo:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAdditionalDebugInfo:(id)a3;
- (void)setCurrentLayoutInfo:(id)a3;
- (void)setDebugHUDString:(id)a3;
@end

@implementation PUParallaxDebugInfoView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugHUDString, 0);
  objc_storeStrong((id *)&self->_additionalDebugInfo, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_rectViewsByIdentifier, 0);
  objc_destroyWeak((id *)&self->_viewModel);
  objc_storeStrong((id *)&self->_debugHUDLabel, 0);
  objc_storeStrong((id *)&self->_currentLayoutInfo, 0);
}

- (NSString)debugHUDString
{
  return self->_debugHUDString;
}

- (NSDictionary)additionalDebugInfo
{
  return self->_additionalDebugInfo;
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (NSMutableDictionary)rectViewsByIdentifier
{
  return self->_rectViewsByIdentifier;
}

- (PUParallaxLayerStackViewModel)viewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  return (PUParallaxLayerStackViewModel *)WeakRetained;
}

- (id)currentLayoutInfo
{
  return self->_currentLayoutInfo;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v5 = a4;
  id v7 = a3;
  if ((v5 & 0x200) != 0) {
    [(PUParallaxDebugInfoView *)self _layoutWithCurrentLayoutInfo];
  }
  if ((*(void *)&v5 & 0xC0000) != 0) {
    [(PUParallaxDebugInfoView *)self _invalidateDebugHUDString];
  }
}

- (void)_layoutWithCurrentLayoutInfo
{
  v3 = [(PUParallaxDebugInfoView *)self currentLayoutInfo];
  if (v3
    && ([(PUParallaxDebugInfoView *)self viewModel],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 showsDebugHUD],
        v4,
        (v5 & 1) != 0))
  {
    [(PUParallaxDebugInfoView *)self setHidden:0];
    [v3 containerFrame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v14 = [(PUParallaxDebugInfoView *)self _rectViewForIdentifier:@"timeFrame"];
    v15 = [(PUParallaxDebugInfoView *)self viewModel];
    v16 = [v15 currentLayerStack];
    v17 = [v16 layout];
    [v17 timeFrame];
    v18 = [(PUParallaxDebugInfoView *)self viewModel];
    v19 = [v18 currentLayerStack];
    v20 = [v19 layout];
    [v20 imageSize];
    PXRectWithOriginAndSize();
    PXRectFlippedVertically();
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    objc_msgSend(v3, "viewFrameForLayerFrame:", v22, v24, v26, v28);
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    [v3 additionalContentTransform];
    v82.origin.double x = v30;
    v82.origin.double y = v32;
    v82.size.width = v34;
    v82.size.double height = v36;
    CGRect v83 = CGRectApplyAffineTransform(v82, &v81);
    objc_msgSend(v14, "setFrame:", v83.origin.x, v83.origin.y, v83.size.width, v83.size.height);
    [v3 additionalTransform];
    v80[0] = v80[3];
    v80[1] = v80[4];
    v80[2] = v80[5];
    [(PUParallaxDebugInfoView *)self setTransform:v80];
    v37 = [(PUParallaxDebugInfoView *)self debugHUDString];
    v38 = [(PUParallaxDebugInfoView *)self debugHUDLabel];
    [v38 setText:v37];

    v39 = [(PUParallaxDebugInfoView *)self debugHUDLabel];
    v40 = [v39 superview];

    v41 = [(PUParallaxDebugInfoView *)self debugHUDLabel];
    objc_msgSend(v41, "sizeThatFits:", v11, v13);
    double v43 = v42;

    uint64_t v44 = [v3 deviceOrientation];
    CGFloat v45 = v7;
    CGFloat v46 = v9;
    double v47 = v11;
    double v48 = v13;
    if ((unint64_t)(v44 - 3) > 1) {
      double MaxY = CGRectGetMaxY(*(CGRect *)&v45);
    }
    else {
      double MaxY = CGRectGetMaxX(*(CGRect *)&v45);
    }
    double v50 = MaxY;
    [v40 safeAreaInsets];
    CGFloat v52 = v51;
    v84.origin.double x = v7;
    v84.origin.double y = v9;
    v84.size.width = v11;
    v84.size.double height = v13;
    CGFloat Width = CGRectGetWidth(v84);
    [v3 additionalContentTransform];
    v85.origin.double x = v52;
    v85.origin.double y = v50 + -130.0 - v43;
    v85.size.width = Width;
    v85.size.double height = v43;
    CGRect v86 = CGRectApplyAffineTransform(v85, &v79);
    double x = v86.origin.x;
    double y = v86.origin.y;
    double v56 = v86.size.width;
    double height = v86.size.height;
    v58 = [(PUParallaxDebugInfoView *)self debugHUDLabel];
    objc_msgSend(v58, "setFrame:", x, y, v56, height);

    [v3 visibleFrame];
    objc_msgSend(v3, "viewFrameForLayerFrame:");
    CGFloat v60 = v59;
    CGFloat v62 = v61;
    CGFloat v64 = v63;
    CGFloat v66 = v65;
    [v3 additionalContentTransform];
    v87.origin.double x = v60;
    v87.origin.double y = v62;
    v87.size.width = v64;
    v87.size.double height = v66;
    CGRect v88 = CGRectApplyAffineTransform(v87, &v78);
    CGRectGetHeight(v88);
    PXRectWithOriginAndSize();
    [v3 visibilityAmount];
    uint64_t v77 = v67;
    PXRectByLinearlyInterpolatingRects();
    objc_msgSend(v3, "visibilityEdge", v77);
    PXRectWithSizeAlignedToRectEdges();
    double v69 = v68;
    double v71 = v70;
    double v73 = v72;
    double v75 = v74;
    v76 = [(PUParallaxDebugInfoView *)self maskLayer];
    objc_msgSend(v76, "setFrame:", v69, v71, v73, v75);

    PXRectWithSize();
    -[PUParallaxDebugInfoView setBounds:](self, "setBounds:");
    PXRectGetCenter();
    -[PUParallaxDebugInfoView setCenter:](self, "setCenter:");
  }
  else
  {
    [(PUParallaxDebugInfoView *)self setHidden:1];
  }
}

- (void)setDebugHUDString:(id)a3
{
  double v8 = (NSString *)a3;
  v4 = self->_debugHUDString;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      double v6 = (NSString *)[(NSString *)v8 copy];
      debugHUDString = self->_debugHUDString;
      self->_debugHUDString = v6;

      [(PUParallaxDebugInfoView *)self _layoutWithCurrentLayoutInfo];
    }
  }
}

- (void)_updateDebugHUDString
{
  v2 = self;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [(PUParallaxDebugInfoView *)self viewModel];
  int v4 = [v3 showsDebugHUD];

  if (v4)
  {
    char v5 = [(PUParallaxDebugInfoView *)v2 viewModel];
    double v6 = [v5 debugHUDRepresentation];

    id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    double v8 = [MEMORY[0x1E4F28F80] processInfo];
    objc_msgSend(v7, "appendFormat:", @"pid: %d\n", objc_msgSend(v8, "processIdentifier"));

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v15 = [v9 objectForKeyedSubscript:v14];
          [v7 appendFormat:@"\n%@ : %@", v14, v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v11);
    }

    v16 = [(PUParallaxDebugInfoView *)v2 additionalDebugInfo];
    if ([v16 count])
    {
      double v24 = v2;
      [v7 appendString:@"\n"];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * j);
            double v23 = [v17 objectForKeyedSubscript:v22];
            [v7 appendFormat:@"\n%@ : %@", v22, v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v19);
      }

      v2 = v24;
    }
    [(PUParallaxDebugInfoView *)v2 setDebugHUDString:v7];
  }
}

- (void)setAdditionalDebugInfo:(id)a3
{
  double v8 = (NSDictionary *)a3;
  int v4 = self->_additionalDebugInfo;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      double v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      additionalDebugInfo = self->_additionalDebugInfo;
      self->_additionalDebugInfo = v6;

      [(PUParallaxDebugInfoView *)self _invalidateDebugHUDString];
    }
  }
}

- (void)displayAdditionalDebugInfo:(id)a3
{
  id v4 = a3;
  char v5 = [(PUParallaxDebugInfoView *)self additionalDebugInfo];
  id v6 = (id)[v5 mutableCopy];

  [v6 addEntriesFromDictionary:v4];
  [(PUParallaxDebugInfoView *)self setAdditionalDebugInfo:v6];
}

- (UILabel)debugHUDLabel
{
  debugHUDLabel = self->_debugHUDLabel;
  if (!debugHUDLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUParallaxDebugInfoView *)self bounds];
    char v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:");
    id v6 = [MEMORY[0x1E4FB08E0] monospacedSystemFontOfSize:15.0 weight:*MEMORY[0x1E4FB09E0]];
    [(UILabel *)v5 setFont:v6];

    id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
    [(UILabel *)v5 setBackgroundColor:v7];

    double v8 = [MEMORY[0x1E4FB1618] systemDarkOrangeColor];
    [(UILabel *)v5 setTextColor:v8];

    [(UILabel *)v5 setUserInteractionEnabled:0];
    id v9 = [(UILabel *)v5 layer];
    [v9 setZPosition:1.79769313e308];

    [(UILabel *)v5 setNumberOfLines:0];
    [(PUParallaxDebugInfoView *)self addSubview:v5];
    uint64_t v10 = self->_debugHUDLabel;
    self->_debugHUDLabel = v5;

    debugHUDLabel = self->_debugHUDLabel;
  }
  return debugHUDLabel;
}

- (id)_rectViewForIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [(PUParallaxDebugInfoView *)self rectViewsByIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v7 = [PUParallaxDebugInfoRectView alloc];
    id v6 = -[PUParallaxDebugInfoRectView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(PUParallaxDebugInfoRectView *)v6 setIdentifier:v4];
    [(PUParallaxDebugInfoView *)self addSubview:v6];
    double v8 = [(PUParallaxDebugInfoView *)self rectViewsByIdentifier];
    [v8 setObject:v6 forKeyedSubscript:v4];
  }
  return v6;
}

- (void)setCurrentLayoutInfo:(id)a3
{
  double v8 = (PUParallaxLayerLayoutInfo *)a3;
  char v5 = self->_currentLayoutInfo;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    BOOL v7 = [(PUParallaxLayerLayoutInfo *)v5 isEqual:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_currentLayoutInfo, a3);
      [(PUParallaxDebugInfoView *)self _layoutWithCurrentLayoutInfo];
    }
  }
}

- (PUParallaxDebugInfoView)initWithViewModel:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PUParallaxDebugInfoView;
  char v5 = [(PUParallaxDebugInfoView *)&v19 init];
  if (v5)
  {
    if ([v4 environment] == 2)
    {
      id v6 = [MEMORY[0x1E4F39BE8] layer];
      id v7 = [MEMORY[0x1E4FB1618] blackColor];
      -[CALayer setBackgroundColor:](v6, "setBackgroundColor:", [v7 CGColor]);

      v20[0] = @"bounds";
      double v8 = [MEMORY[0x1E4F1CA98] null];
      v21[0] = v8;
      v20[1] = @"position";
      id v9 = [MEMORY[0x1E4F1CA98] null];
      v21[1] = v9;
      v20[2] = @"frame";
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
      v21[2] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
      [(CALayer *)v6 setActions:v11];

      uint64_t v12 = [(PUParallaxDebugInfoView *)v5 layer];
      [v12 setMask:v6];

      maskLayer = v5->_maskLayer;
      v5->_maskLayer = v6;
    }
    uint64_t v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    additionalDebugInfo = v5->_additionalDebugInfo;
    v5->_additionalDebugInfo = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    rectViewsByIdentifier = v5->_rectViewsByIdentifier;
    v5->_rectViewsByIdentifier = v16;

    objc_storeWeak((id *)&v5->_viewModel, v4);
    [v4 registerChangeObserver:v5 context:"ViewModelObservationContext"];
    [(PUParallaxDebugInfoView *)v5 _invalidateDebugHUDString];
  }

  return v5;
}

@end