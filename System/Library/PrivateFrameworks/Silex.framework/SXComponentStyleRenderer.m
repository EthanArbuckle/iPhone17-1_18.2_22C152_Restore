@interface SXComponentStyleRenderer
- (BOOL)didRegisterForDynamicBounds;
- (SXComponentStyle)componentStyle;
- (SXComponentStyleRenderer)initWithComponentStyle:(id)a3 viewport:(id)a4 imageFillViewFactory:(id)a5 videoFillViewFactory:(id)a6 gradientViewFactory:(id)a7 repeatableImageFillViewFactory:(id)a8;
- (SXComponentView)componentView;
- (SXGradientFactory)gradientFactory;
- (SXGradientFillView)gradientFillView;
- (SXImageFillView)imageFillView;
- (SXImageFillViewFactory)imageFillViewFactory;
- (SXLayer)shadowLayer;
- (SXRepeatableImageFillView)repeatableImageFillView;
- (SXRepeatableImageFillViewFactory)repeatableImageFillViewFactory;
- (SXShapeLayer)borderLayer;
- (SXShapeLayer)bottomBorderLayer;
- (SXShapeLayer)leftBorderLayer;
- (SXShapeLayer)rightBorderLayer;
- (SXShapeLayer)topBorderLayer;
- (SXVideoFillView)videoFillView;
- (SXVideoFillViewFactory)videoFillViewFactory;
- (SXViewport)viewport;
- (id)gradientViewForFill:(id)a3;
- (id)imageViewForFill:(id)a3;
- (id)repeatableImageFillViewForFill:(id)a3;
- (id)videoPlayerViewForFill:(id)a3;
- (id)viewForFill:(id)a3;
- (void)applyBackgroundColor:(id)a3;
- (void)applyBorder:(id)a3;
- (void)applyComponentStyle;
- (void)applyCornerRadius:(double)a3 cornerMask:(unint64_t)a4 curve:(id)a5 onView:(id)a6;
- (void)applyFill:(id)a3;
- (void)applyMask:(id)a3;
- (void)applyOpacity:(double)a3;
- (void)applyShadow:(id)a3;
- (void)applyStrokeStyle:(id)a3 borderLayer:(id)a4 path:(id)a5 lineWidth:(double)a6;
- (void)componentVisiblityStateDidChange:(int64_t)a3;
- (void)dealloc;
- (void)prepareBorder:(id)a3;
- (void)prepareFill:(id)a3;
- (void)prepareForComponentView:(id)a3;
- (void)prepareShadow:(id)a3;
- (void)setBorderLayer:(id)a3;
- (void)setBottomBorderLayer:(id)a3;
- (void)setDidRegisterForDynamicBounds:(BOOL)a3;
- (void)setGradientFillView:(id)a3;
- (void)setImageFillView:(id)a3;
- (void)setLeftBorderLayer:(id)a3;
- (void)setRepeatableImageFillView:(id)a3;
- (void)setRightBorderLayer:(id)a3;
- (void)setShadowLayer:(id)a3;
- (void)setTopBorderLayer:(id)a3;
- (void)setVideoFillView:(id)a3;
- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4;
- (void)viewport:(id)a3 dynamicBoundsDidChangeFromBounds:(CGRect)a4;
@end

@implementation SXComponentStyleRenderer

- (SXComponentStyleRenderer)initWithComponentStyle:(id)a3 viewport:(id)a4 imageFillViewFactory:(id)a5 videoFillViewFactory:(id)a6 gradientViewFactory:(id)a7 repeatableImageFillViewFactory:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SXComponentStyleRenderer;
  v18 = [(SXComponentStyleRenderer *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_componentStyle, a3);
    objc_storeStrong((id *)&v19->_viewport, a4);
    objc_storeStrong((id *)&v19->_videoFillViewFactory, a6);
    objc_storeStrong((id *)&v19->_imageFillViewFactory, a5);
    objc_storeStrong((id *)&v19->_gradientFactory, a7);
    objc_storeStrong((id *)&v19->_repeatableImageFillViewFactory, a8);
  }

  return v19;
}

- (void)dealloc
{
  v3 = [(SXComponentStyleRenderer *)self gradientFillView];
  [v3 removeFromSuperview];

  v4 = [(SXComponentStyleRenderer *)self imageFillView];
  [v4 removeFromSuperview];

  v5 = [(SXComponentStyleRenderer *)self videoFillView];
  [v5 removeFromSuperview];

  v6 = [(SXComponentStyleRenderer *)self repeatableImageFillView];
  [v6 removeFromSuperview];

  v7 = [(SXComponentStyleRenderer *)self shadowLayer];
  [v7 removeFromSuperlayer];

  v8 = [(SXComponentStyleRenderer *)self borderLayer];
  [v8 removeFromSuperlayer];

  v9 = [(SXComponentStyleRenderer *)self topBorderLayer];
  [v9 removeFromSuperlayer];

  v10 = [(SXComponentStyleRenderer *)self rightBorderLayer];
  [v10 removeFromSuperlayer];

  v11 = [(SXComponentStyleRenderer *)self bottomBorderLayer];
  [v11 removeFromSuperlayer];

  v12 = [(SXComponentStyleRenderer *)self leftBorderLayer];
  [v12 removeFromSuperlayer];

  v13 = [(SXComponentStyleRenderer *)self componentView];
  [v13 setAlpha:1.0];

  v14 = [(SXComponentStyleRenderer *)self componentView];
  id v15 = [v14 backgroundView];
  id v16 = [MEMORY[0x263F1C550] clearColor];
  [v15 setBackgroundColor:v16];

  uint64_t v17 = *MEMORY[0x263F15A10];
  v18 = [(SXComponentStyleRenderer *)self componentView];
  v19 = [v18 backgroundView];
  [(SXComponentStyleRenderer *)self applyCornerRadius:11 cornerMask:v17 curve:v19 onView:0.0];

  v20.receiver = self;
  v20.super_class = (Class)SXComponentStyleRenderer;
  [(SXComponentStyleRenderer *)&v20 dealloc];
}

- (void)prepareForComponentView:(id)a3
{
  objc_storeWeak((id *)&self->_componentView, a3);
  v4 = [(SXComponentStyleRenderer *)self componentStyle];
  v5 = [v4 shadow];

  if (v5)
  {
    v6 = [(SXComponentStyleRenderer *)self componentStyle];
    v7 = [v6 shadow];
    [(SXComponentStyleRenderer *)self prepareShadow:v7];
  }
  v8 = [(SXComponentStyleRenderer *)self componentStyle];
  v9 = [v8 fill];

  if (v9)
  {
    v10 = [(SXComponentStyleRenderer *)self componentStyle];
    v11 = [v10 fill];
    [(SXComponentStyleRenderer *)self prepareFill:v11];
  }
  v12 = [(SXComponentStyleRenderer *)self componentStyle];
  v13 = [v12 border];
  v14 = [v13 defaultStrokeStyle];

  if (v14)
  {
    id v16 = [(SXComponentStyleRenderer *)self componentStyle];
    id v15 = [v16 border];
    [(SXComponentStyleRenderer *)self prepareBorder:v15];
  }
}

- (void)applyComponentStyle
{
  id v15 = [(SXComponentStyleRenderer *)self componentStyle];
  if (v15)
  {
    v3 = [v15 mask];

    if (v3)
    {
      v4 = [v15 mask];
      [(SXComponentStyleRenderer *)self applyMask:v4];
    }
    v5 = [v15 border];
    v6 = [v5 defaultStrokeStyle];

    if (v6)
    {
      v7 = [v15 border];
      [(SXComponentStyleRenderer *)self applyBorder:v7];
    }
    v8 = [v15 backgroundColor];

    if (v8)
    {
      v9 = [v15 backgroundColor];
      [(SXComponentStyleRenderer *)self applyBackgroundColor:v9];
    }
    [v15 opacity];
    if (v10 != 1.79769313e308)
    {
      [v15 opacity];
      -[SXComponentStyleRenderer applyOpacity:](self, "applyOpacity:");
    }
    v11 = [v15 fill];

    if (v11)
    {
      v12 = [v15 fill];
      [(SXComponentStyleRenderer *)self applyFill:v12];
    }
    v13 = [v15 shadow];

    if (v13)
    {
      v14 = [v15 shadow];
      [(SXComponentStyleRenderer *)self applyShadow:v14];
    }
  }
}

- (void)prepareFill:(id)a3
{
  id v4 = a3;
  v5 = [(SXComponentStyleRenderer *)self viewForFill:v4];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v74[0] = *MEMORY[0x263F000D0];
  v74[1] = v6;
  v74[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v5 setTransform:v74];
  v7 = [(SXComponentStyleRenderer *)self componentStyle];
  v8 = [v7 fill];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = v4;
    v11 = [(SXComponentStyleRenderer *)self componentView];
    v12 = [v11 unitConverter];

    uint64_t v13 = [v10 width];
    objc_msgSend(v12, "convertValueToPoints:", v13, v14);
    double v16 = v15;
    uint64_t v17 = [v10 height];
    uint64_t v19 = v18;

    objc_msgSend(v12, "convertValueToPoints:", v17, v19);
    double v21 = v20;
    id v22 = [(SXComponentStyleRenderer *)self repeatableImageFillView];
    objc_msgSend(v22, "setPatternSize:", v16, v21);
  }
  id v23 = [(SXComponentStyleRenderer *)self componentView];
  objc_super v24 = [v23 backgroundView];
  [v24 bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  v33 = [(SXComponentStyleRenderer *)self componentView];
  [v33 borderInsets];
  double v35 = v34;
  double v37 = v36;
  double v39 = v30 - (v36 + v38);
  double v41 = v32 - (v34 + v40);

  double v72 = v41;
  double v73 = v39;
  if ([v4 attachment] == 1)
  {
    v42 = [(SXComponentStyleRenderer *)self viewport];
    [v42 bounds];
    double v39 = v43;
    double v41 = v44;
  }
  double v45 = v26 + v37;
  double v46 = v28 + v35;
  objc_msgSend(v5, "fillFrameWithBoundingSize:", v39, v41);
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  if ([v4 attachment] != 1) {
    goto LABEL_12;
  }
  v55 = [(SXComponentStyleRenderer *)self viewport];
  v56 = [(SXComponentStyleRenderer *)self componentView];
  objc_msgSend(v55, "convertPointToViewportCoordinateSpace:fromView:", v56, v45, v46);
  double v58 = v57;
  double v71 = v59;

  double v48 = v48 - v58;
  uint64_t v60 = [v4 verticalAlignment];
  if (v60 == 2)
  {
    double v50 = v41 - v71 - v54;
LABEL_12:
    double v61 = v73;
    goto LABEL_13;
  }
  double v61 = v73;
  if (v60 == 1)
  {
    double v50 = (v41 - v54) * 0.5 - v71;
  }
  else if (!v60)
  {
    double v50 = -v71;
  }
LABEL_13:
  objc_msgSend(v5, "setFrame:", v45, v46, v61, v72);
  objc_msgSend(v5, "setContentFrame:", v48, v50, v52, v54);
  objc_msgSend(v5, "setOriginalFrame:", v48, v50, v52, v54);
  v62 = [(SXComponentStyleRenderer *)self componentView];
  [v62 setFillView:v5];

  v63 = [(SXComponentStyleRenderer *)self componentView];
  v64 = [v63 backgroundView];
  v65 = [(SXComponentStyleRenderer *)self componentView];
  v66 = [v65 contentView];
  [v64 insertSubview:v5 belowSubview:v66];

  v67 = [(SXComponentStyleRenderer *)self componentStyle];
  v68 = [v67 fill];
  if ([v68 attachment] == 1)
  {
    BOOL v69 = [(SXComponentStyleRenderer *)self didRegisterForDynamicBounds];

    if (!v69)
    {
      v70 = [(SXComponentStyleRenderer *)self viewport];
      [v70 addViewportChangeListener:self forOptions:2];

      [(SXComponentStyleRenderer *)self setDidRegisterForDynamicBounds:1];
    }
  }
  else
  {
  }
}

- (void)prepareBorder:(id)a3
{
  id v57 = a3;
  uint64_t v4 = [v57 defaultStrokeStyle];
  if (v4)
  {
    v5 = (void *)v4;
    long long v6 = [(SXComponentStyleRenderer *)self borderLayer];

    if (!v6)
    {
      v7 = +[SXShapeLayer layer];
      [(SXComponentStyleRenderer *)self setBorderLayer:v7];

      v8 = [(SXComponentStyleRenderer *)self borderLayer];
      id v9 = [MEMORY[0x263F1C550] clearColor];
      objc_msgSend(v8, "setFillColor:", objc_msgSend(v9, "CGColor"));

      id v10 = [(SXComponentStyleRenderer *)self borderLayer];
      [v10 setMasksToBounds:1];
    }
  }
  uint64_t v11 = [v57 top];
  if (v11)
  {
    v12 = (void *)v11;
    uint64_t v13 = [(SXComponentStyleRenderer *)self topBorderLayer];

    if (!v13)
    {
      uint64_t v14 = +[SXShapeLayer layer];
      [(SXComponentStyleRenderer *)self setTopBorderLayer:v14];

      double v15 = [(SXComponentStyleRenderer *)self topBorderLayer];
      id v16 = [MEMORY[0x263F1C550] clearColor];
      objc_msgSend(v15, "setFillColor:", objc_msgSend(v16, "CGColor"));

      uint64_t v17 = [(SXComponentStyleRenderer *)self topBorderLayer];
      [v17 setMasksToBounds:1];
    }
  }
  uint64_t v18 = [v57 right];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    double v20 = [(SXComponentStyleRenderer *)self rightBorderLayer];

    if (!v20)
    {
      double v21 = +[SXShapeLayer layer];
      [(SXComponentStyleRenderer *)self setRightBorderLayer:v21];

      id v22 = [(SXComponentStyleRenderer *)self rightBorderLayer];
      id v23 = [MEMORY[0x263F1C550] clearColor];
      objc_msgSend(v22, "setFillColor:", objc_msgSend(v23, "CGColor"));

      objc_super v24 = [(SXComponentStyleRenderer *)self rightBorderLayer];
      [v24 setMasksToBounds:1];
    }
  }
  uint64_t v25 = [v57 bottom];
  if (v25)
  {
    double v26 = (void *)v25;
    double v27 = [(SXComponentStyleRenderer *)self bottomBorderLayer];

    if (!v27)
    {
      double v28 = +[SXShapeLayer layer];
      [(SXComponentStyleRenderer *)self setBottomBorderLayer:v28];

      double v29 = [(SXComponentStyleRenderer *)self bottomBorderLayer];
      id v30 = [MEMORY[0x263F1C550] clearColor];
      objc_msgSend(v29, "setFillColor:", objc_msgSend(v30, "CGColor"));

      double v31 = [(SXComponentStyleRenderer *)self bottomBorderLayer];
      [v31 setMasksToBounds:1];
    }
  }
  uint64_t v32 = [v57 left];
  if (v32)
  {
    v33 = (void *)v32;
    double v34 = [(SXComponentStyleRenderer *)self leftBorderLayer];

    if (!v34)
    {
      double v35 = +[SXShapeLayer layer];
      [(SXComponentStyleRenderer *)self setLeftBorderLayer:v35];

      double v36 = [(SXComponentStyleRenderer *)self leftBorderLayer];
      id v37 = [MEMORY[0x263F1C550] clearColor];
      objc_msgSend(v36, "setFillColor:", objc_msgSend(v37, "CGColor"));

      double v38 = [(SXComponentStyleRenderer *)self leftBorderLayer];
      [v38 setMasksToBounds:1];
    }
  }
  double v39 = [(SXComponentStyleRenderer *)self borderLayer];
  double v40 = [(SXComponentStyleRenderer *)self componentView];
  double v41 = [v40 backgroundView];
  [v41 bounds];
  objc_msgSend(v39, "setFrame:");

  v42 = [(SXComponentStyleRenderer *)self componentView];
  double v43 = [v42 backgroundView];
  double v44 = [v43 layer];
  double v45 = [(SXComponentStyleRenderer *)self borderLayer];
  double v46 = [(SXComponentStyleRenderer *)self componentView];
  double v47 = [v46 contentView];
  double v48 = [v47 layer];
  [v44 insertSublayer:v45 above:v48];

  double v49 = [(SXComponentStyleRenderer *)self borderLayer];
  double v50 = [(SXComponentStyleRenderer *)self topBorderLayer];
  [v49 addSublayer:v50];

  double v51 = [(SXComponentStyleRenderer *)self borderLayer];
  double v52 = [(SXComponentStyleRenderer *)self rightBorderLayer];
  [v51 addSublayer:v52];

  double v53 = [(SXComponentStyleRenderer *)self borderLayer];
  double v54 = [(SXComponentStyleRenderer *)self bottomBorderLayer];
  [v53 addSublayer:v54];

  v55 = [(SXComponentStyleRenderer *)self borderLayer];
  v56 = [(SXComponentStyleRenderer *)self leftBorderLayer];
  [v55 addSublayer:v56];
}

- (void)prepareShadow:(id)a3
{
  uint64_t v4 = [(SXComponentStyleRenderer *)self shadowLayer];

  if (!v4)
  {
    v5 = +[SXLayer layer];
    [(SXComponentStyleRenderer *)self setShadowLayer:v5];
  }
  long long v6 = [(SXComponentStyleRenderer *)self shadowLayer];
  v7 = [(SXComponentStyleRenderer *)self componentView];
  v8 = [v7 backgroundView];
  [v8 frame];
  objc_msgSend(v6, "setFrame:");

  id v14 = [(SXComponentStyleRenderer *)self componentView];
  id v9 = [v14 layer];
  id v10 = [(SXComponentStyleRenderer *)self shadowLayer];
  uint64_t v11 = [(SXComponentStyleRenderer *)self componentView];
  v12 = [v11 backgroundView];
  uint64_t v13 = [v12 layer];
  [v9 insertSublayer:v10 below:v13];
}

- (void)applyBackgroundColor:(id)a3
{
  id v4 = a3;
  id v6 = [(SXComponentStyleRenderer *)self componentView];
  v5 = [v6 backgroundView];
  [v5 setBackgroundColor:v4];
}

- (void)applyFill:(id)a3
{
  id v4 = a3;
  id v9 = [(SXComponentStyleRenderer *)self viewForFill:v4];
  [v9 load];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(SXComponentStyleRenderer *)self componentView];
    uint64_t v7 = [v6 visibilityState];

    if (v7 == 1)
    {
      v8 = [(SXComponentStyleRenderer *)self videoFillView];
      [v8 play];
    }
  }
}

- (void)applyOpacity:(double)a3
{
  id v4 = [(SXComponentStyleRenderer *)self componentView];
  [v4 setAlpha:a3];
}

- (void)applyBorder:(id)a3
{
  id v136 = a3;
  id v4 = [(SXComponentStyleRenderer *)self componentView];
  v5 = [v4 backgroundView];
  [v5 bounds];
  double v132 = v7;
  double v133 = v6;
  double v134 = v8;
  double v135 = v9;

  id v10 = [(SXComponentStyleRenderer *)self componentView];
  uint64_t v11 = [v10 backgroundView];
  v12 = [v11 layer];
  [v12 cornerRadius];
  double v14 = v13;

  double v15 = [(SXComponentStyleRenderer *)self componentView];
  id v16 = [v15 backgroundView];
  uint64_t v17 = [v16 layer];
  char v18 = [v17 maskedCorners];
  uint64_t v131 = v18 & 0xF;

  uint64_t v19 = [(SXComponentStyleRenderer *)self componentView];
  double v20 = [v19 backgroundView];
  double v21 = [v20 layer];
  id v22 = [v21 cornerCurve];
  id v23 = (void *)*MEMORY[0x263F15A20];

  double v24 = 0.0;
  if (v18) {
    double v25 = v14;
  }
  else {
    double v25 = 0.0;
  }
  if ((v18 & 2) != 0) {
    double v26 = v14;
  }
  else {
    double v26 = 0.0;
  }
  if ((v18 & 8) != 0) {
    double v27 = v14;
  }
  else {
    double v27 = 0.0;
  }
  double v125 = v27;
  if ((v18 & 4) != 0) {
    double v24 = v14;
  }
  double v128 = v24;
  double v129 = v25;
  double v28 = [(SXComponentStyleRenderer *)self componentView];
  double v29 = [v28 unitConverter];

  id v30 = [v136 all];
  double v31 = [v136 top];
  uint64_t v32 = [v136 right];
  v33 = [v136 bottom];
  double v34 = [v136 left];
  if (v30)
  {
    uint64_t v35 = [v30 width];
    objc_msgSend(v29, "convertValueToPoints:", v35, v36);
    if (v37 > 0.0)
    {
      double v38 = v37;
      BOOL v39 = v22 == v23;
      double v40 = v37 * 0.5;
      double v118 = fmax(v14 - v37 * 0.5, 0.0);
      [v136 left];
      double v41 = v121 = v23;

      if (v41) {
        double v42 = -(v38 * 0.5);
      }
      else {
        double v42 = v40;
      }
      double v43 = [v136 top];

      if (v43) {
        double v44 = -(v38 * 0.5);
      }
      else {
        double v44 = v40;
      }
      double v45 = [v136 right];

      double v46 = v26;
      if (v45) {
        double v47 = -(v38 * 0.5);
      }
      else {
        double v47 = v40;
      }
      double v48 = [v136 bottom];

      if (v48) {
        double v49 = -(v38 * 0.5);
      }
      else {
        double v49 = v40;
      }
      double v50 = v42 + v47;
      double v26 = v46;
      double v51 = objc_msgSend(MEMORY[0x263F1C478], "sx_bezierPathWithRect:byRoundingCorners:cornerRadius:continuousCorners:", v131, v39, v133 + v42, v132 + v44, v134 - v50, v135 - (v44 + v49), v118);
      double v52 = [(SXComponentStyleRenderer *)self borderLayer];
      [(SXComponentStyleRenderer *)self applyStrokeStyle:v30 borderLayer:v52 path:v51 lineWidth:v38];

      id v23 = v121;
    }
  }
  if (v31)
  {
    uint64_t v53 = [v31 width];
    objc_msgSend(v29, "convertValueToPoints:", v53, v54);
    if (v55 > 0.0)
    {
      double v56 = v55;
      BOOL v57 = v22 == v23;
      v122 = v22;
      double v58 = v23;
      uint64_t v59 = v57;
      double v60 = v55 * 0.5;
      double v113 = -(v55 * 0.5);
      double v115 = fmax(v14 - v55 * 0.5, 0.0);
      double v61 = v129;
      if (v129 < v26) {
        double v61 = v26;
      }
      if (v56 >= v61) {
        double v62 = v56;
      }
      else {
        double v62 = v61;
      }
      v138.origin.x = v133;
      v138.origin.y = v132;
      v138.size.width = v134;
      v138.size.height = v135;
      double Width = CGRectGetWidth(v138);
      v64 = [(SXComponentStyleRenderer *)self topBorderLayer];
      objc_msgSend(v64, "setFrame:", 0.0, 0.0, Width, v62);

      v65 = objc_msgSend(MEMORY[0x263F1C478], "sx_bezierPathWithRect:byRoundingCorners:cornerRadius:continuousCorners:", v131, v59, v133 - v60, v132 + v60, v134 - (v113 - v60), v135 - (v60 - v60), v115);
      v66 = [(SXComponentStyleRenderer *)self topBorderLayer];
      [(SXComponentStyleRenderer *)self applyStrokeStyle:v31 borderLayer:v66 path:v65 lineWidth:v56];

      id v23 = v58;
      id v22 = v122;
    }
  }
  if (v32)
  {
    uint64_t v67 = [v32 width];
    objc_msgSend(v29, "convertValueToPoints:", v67, v68);
    if (v69 > 0.0)
    {
      double v70 = v69;
      BOOL v71 = v22 == v23;
      double v72 = v69 * 0.5;
      double v116 = -(v69 * 0.5);
      double v119 = fmax(v14 - v69 * 0.5, 0.0);
      double v73 = v125;
      if (v26 >= v125) {
        double v73 = v26;
      }
      if (v70 >= v73) {
        double v74 = v70;
      }
      else {
        double v74 = v73;
      }
      v139.origin.x = v133;
      v139.origin.y = v132;
      v139.size.width = v134;
      v139.size.height = v135;
      CGFloat v114 = CGRectGetWidth(v139) - v74;
      v140.origin.x = v133;
      v140.origin.y = v132;
      v140.size.width = v134;
      v140.size.height = v135;
      double Height = CGRectGetHeight(v140);
      [(SXComponentStyleRenderer *)self rightBorderLayer];
      v123 = v34;
      v76 = v33;
      v77 = v31;
      v78 = v30;
      v79 = v22;
      v81 = v80 = v23;
      objc_msgSend(v81, "setFrame:", v114, 0.0, v74, Height);

      v141.origin.x = v133;
      v141.origin.y = v132;
      v141.size.width = v134;
      v141.size.height = v135;
      v82 = objc_msgSend(MEMORY[0x263F1C478], "sx_bezierPathWithRect:byRoundingCorners:cornerRadius:continuousCorners:", v131, v71, v74 - CGRectGetWidth(v141) - v72, v132 - v72, v134 - (v72 - v72), v135 - (v116 - v72), v119);
      v83 = [(SXComponentStyleRenderer *)self rightBorderLayer];
      [(SXComponentStyleRenderer *)self applyStrokeStyle:v32 borderLayer:v83 path:v82 lineWidth:v70];

      id v23 = v80;
      id v22 = v79;
      id v30 = v78;
      double v31 = v77;
      v33 = v76;
      double v34 = v123;
    }
  }
  if (v33)
  {
    uint64_t v84 = [v33 width];
    objc_msgSend(v29, "convertValueToPoints:", v84, v85);
    if (v86 > 0.0)
    {
      double v87 = v86;
      BOOL v88 = v22 == v23;
      double v89 = v86 * 0.5;
      double v117 = -(v86 * 0.5);
      double v120 = fmax(v14 - v86 * 0.5, 0.0);
      double v90 = v128;
      if (v128 < v125) {
        double v90 = v125;
      }
      if (v87 >= v90) {
        double v91 = v87;
      }
      else {
        double v91 = v90;
      }
      v142.origin.x = v133;
      v142.origin.y = v132;
      v142.size.width = v134;
      v142.size.height = v135;
      CGFloat v126 = CGRectGetHeight(v142) - v91;
      v143.origin.x = v133;
      v143.origin.y = v132;
      v143.size.width = v134;
      v143.size.height = v135;
      double v92 = CGRectGetWidth(v143);
      [(SXComponentStyleRenderer *)self bottomBorderLayer];
      v124 = v34;
      v93 = v32;
      v94 = v31;
      v95 = v30;
      v96 = v22;
      v98 = v97 = v23;
      objc_msgSend(v98, "setFrame:", 0.0, v126, v92, v91);

      v144.origin.x = v133;
      v144.origin.y = v132;
      v144.size.width = v134;
      v144.size.height = v135;
      v99 = objc_msgSend(MEMORY[0x263F1C478], "sx_bezierPathWithRect:byRoundingCorners:cornerRadius:continuousCorners:", v131, v88, v133 - v89, v91 - CGRectGetHeight(v144) - v89, v134 - (v117 - v89), v135 - (v89 - v89), v120);
      v100 = [(SXComponentStyleRenderer *)self bottomBorderLayer];
      [(SXComponentStyleRenderer *)self applyStrokeStyle:v33 borderLayer:v100 path:v99 lineWidth:v87];

      id v23 = v97;
      id v22 = v96;
      id v30 = v95;
      double v31 = v94;
      uint64_t v32 = v93;
      double v34 = v124;
    }
  }
  if (v34)
  {
    uint64_t v101 = [v34 width];
    objc_msgSend(v29, "convertValueToPoints:", v101, v102);
    if (v103 > 0.0)
    {
      double v104 = v103;
      BOOL v105 = v22 == v23;
      double v106 = v103 * 0.5;
      double v130 = fmax(v14 - v103 * 0.5, 0.0);
      double v127 = -(v103 * 0.5);
      double v107 = v129;
      if (v129 < v128) {
        double v107 = v128;
      }
      if (v104 >= v107) {
        double v108 = v104;
      }
      else {
        double v108 = v107;
      }
      v145.origin.x = v133;
      v145.origin.y = v132;
      v145.size.width = v134;
      v145.size.height = v135;
      double v109 = CGRectGetHeight(v145);
      v110 = [(SXComponentStyleRenderer *)self leftBorderLayer];
      objc_msgSend(v110, "setFrame:", 0.0, 0.0, v108, v109);

      v111 = objc_msgSend(MEMORY[0x263F1C478], "sx_bezierPathWithRect:byRoundingCorners:cornerRadius:continuousCorners:", v131, v105, v133 + v106, v132 - v106, v134 - (v106 - v106), v135 - (v127 - v106), v130);
      v112 = [(SXComponentStyleRenderer *)self leftBorderLayer];
      [(SXComponentStyleRenderer *)self applyStrokeStyle:v34 borderLayer:v112 path:v111 lineWidth:v104];
    }
  }
}

- (void)applyStrokeStyle:(id)a3 borderLayer:(id)a4 path:(id)a5 lineWidth:(double)a6
{
  v27[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 color];
  double v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x263F1C550] blackColor];
  }
  double v15 = v14;

  [v10 setLineWidth:a6];
  id v16 = v15;
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v16, "CGColor"));
  id v17 = v11;
  uint64_t v18 = [v17 CGPath];

  [v10 setPath:v18];
  uint64_t v19 = *MEMORY[0x263F15E78];
  [v10 setLineCap:*MEMORY[0x263F15E78]];
  if ([v9 style] == 2)
  {
    double v20 = a6 + a6;
    double v21 = [NSNumber numberWithDouble:v20];
    v27[0] = v21;
    id v22 = [NSNumber numberWithDouble:v20];
    v27[1] = v22;
    id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
    [v10 setLineDashPattern:v23];

LABEL_8:
    [v10 setLineCap:v19];
    goto LABEL_9;
  }
  if ([v9 style] == 3)
  {
    v26[0] = &unk_26D593BA8;
    double v24 = [NSNumber numberWithDouble:a6 + a6];
    v26[1] = v24;
    double v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
    [v10 setLineDashPattern:v25];

    uint64_t v19 = *MEMORY[0x263F15E70];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)applyMask:(id)a3
{
  id v25 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = COERCE_DOUBLE([v25 radius]);
    if (v4 > 0.0
      && ((objc_msgSend(v25, "topLeft", v4) & 1) != 0
       || ([v25 topRight] & 1) != 0
       || ([v25 bottomRight] & 1) != 0
       || [v25 bottomLeft]))
    {
      v5 = [(SXComponentStyleRenderer *)self componentView];
      double v6 = [v5 unitConverter];
      uint64_t v7 = [v25 radius];
      objc_msgSend(v6, "convertValueToPoints:", v7, v8);
      double v10 = v9;

      id v11 = [(SXComponentStyleRenderer *)self componentView];
      v12 = [v11 contentView];
      [v12 frame];
      double v14 = v13;

      double v15 = [(SXComponentStyleRenderer *)self componentView];
      id v16 = [v15 contentView];
      [v16 frame];
      double v18 = v17;

      if (v14 >= v18) {
        double v19 = v18;
      }
      else {
        double v19 = v14;
      }
      double v20 = v19 * 0.5;
      if (v10 >= v20) {
        double v10 = v20;
      }
      uint64_t v21 = [v25 cornerMask];
      id v22 = [v25 curve];
      id v23 = [(SXComponentStyleRenderer *)self componentView];
      double v24 = [v23 backgroundView];
      [(SXComponentStyleRenderer *)self applyCornerRadius:v21 cornerMask:v22 curve:v24 onView:v10];
    }
  }
}

- (void)applyShadow:(id)a3
{
  id v4 = a3;
  v5 = [(SXComponentStyleRenderer *)self componentView];
  id v56 = [v5 unitConverter];

  uint64_t v6 = [v4 radius];
  objc_msgSend(v56, "convertValueToPoints:", v6, v7);
  double v9 = v8;
  double v10 = [v4 offset];
  uint64_t v11 = [v10 x];
  objc_msgSend(v56, "convertValueToPoints:allowNegativeValues:", v11, v12, 1);
  double v14 = v13;

  double v15 = [v4 offset];
  uint64_t v16 = [v15 y];
  objc_msgSend(v56, "convertValueToPoints:allowNegativeValues:", v16, v17, 1);
  double v19 = v18;

  double v20 = [(SXComponentStyleRenderer *)self shadowLayer];
  [v20 setShadowRadius:v9];

  uint64_t v21 = [(SXComponentStyleRenderer *)self shadowLayer];
  id v22 = [v4 color];
  objc_msgSend(v21, "setShadowColor:", objc_msgSend(v22, "CGColor"));

  id v23 = [(SXComponentStyleRenderer *)self shadowLayer];
  [v4 opacity];
  double v25 = v24;

  *(float *)&double v26 = v25;
  [v23 setShadowOpacity:v26];

  double v27 = [(SXComponentStyleRenderer *)self shadowLayer];
  objc_msgSend(v27, "setShadowOffset:", v14, v19);

  double v28 = [(SXComponentStyleRenderer *)self componentView];
  double v29 = [v28 backgroundView];
  id v30 = [v29 layer];
  [v30 bounds];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  BOOL v39 = [(SXComponentStyleRenderer *)self componentView];
  double v40 = [v39 backgroundView];
  double v41 = [v40 layer];
  uint64_t v42 = [v41 maskedCorners] & 0xF;

  double v43 = [(SXComponentStyleRenderer *)self componentView];
  double v44 = [v43 backgroundView];
  double v45 = [v44 layer];
  [v45 cornerRadius];
  double v47 = v46;

  double v48 = [(SXComponentStyleRenderer *)self componentView];
  double v49 = [v48 backgroundView];
  double v50 = [v49 layer];
  double v51 = [v50 cornerCurve];
  BOOL v52 = v51 == (void *)*MEMORY[0x263F15A20];

  uint64_t v53 = objc_msgSend(MEMORY[0x263F1C478], "sx_bezierPathWithRect:byRoundingCorners:cornerRadius:continuousCorners:", v42, v52, v32, v34, v36, v38, v47);
  uint64_t v54 = [(SXComponentStyleRenderer *)self shadowLayer];
  id v55 = v53;
  objc_msgSend(v54, "setShadowPath:", objc_msgSend(v55, "CGPath"));
}

- (void)componentVisiblityStateDidChange:(int64_t)a3
{
  v5 = [(SXComponentStyleRenderer *)self videoFillView];
  if (v5
    || ([(SXComponentStyleRenderer *)self imageFillView],
        (v5 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(SXComponentStyleRenderer *)self gradientFillView],
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    uint64_t v21 = [(SXComponentStyleRenderer *)self repeatableImageFillView];

    if (!v21) {
      return;
    }
  }
  uint64_t v6 = [(SXComponentStyleRenderer *)self componentView];
  uint64_t v7 = [v6 visibilityState];

  if (a3 == 1 || v7 != 1)
  {
    double v10 = [(SXComponentStyleRenderer *)self componentView];
    if ([v10 visibilityState] == 2)
    {
    }
    else
    {
      uint64_t v11 = [(SXComponentStyleRenderer *)self componentView];
      uint64_t v12 = [v11 visibilityState];

      if (v12) {
        return;
      }
    }
    double v13 = [(SXComponentStyleRenderer *)self videoFillView];

    if (v13)
    {
      double v14 = [(SXComponentStyleRenderer *)self componentStyle];
      id v23 = [v14 fill];

      if (([v23 loop] & 1) == 0)
      {
        double v15 = [(SXComponentStyleRenderer *)self videoFillView];
        [v15 reset];
      }
      uint64_t v16 = [(SXComponentStyleRenderer *)self videoFillView];
      [v16 pause];
    }
    else
    {
      double v18 = [(SXComponentStyleRenderer *)self imageFillView];

      if (v18)
      {
        double v19 = [(SXComponentStyleRenderer *)self imageFillView];
      }
      else
      {
        id v22 = [(SXComponentStyleRenderer *)self repeatableImageFillView];

        if (!v22) {
          return;
        }
        double v19 = [(SXComponentStyleRenderer *)self repeatableImageFillView];
      }
      id v23 = v19;
      [v19 pause];
    }
  }
  else
  {
    double v8 = [(SXComponentStyleRenderer *)self videoFillView];

    if (v8)
    {
      double v9 = [(SXComponentStyleRenderer *)self videoFillView];
    }
    else
    {
      uint64_t v17 = [(SXComponentStyleRenderer *)self imageFillView];

      if (v17)
      {
        double v9 = [(SXComponentStyleRenderer *)self imageFillView];
      }
      else
      {
        double v20 = [(SXComponentStyleRenderer *)self repeatableImageFillView];

        if (!v20) {
          return;
        }
        double v9 = [(SXComponentStyleRenderer *)self repeatableImageFillView];
      }
    }
    id v23 = v9;
    [v9 play];
  }
}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  id v10 = a3;
  uint64_t v6 = [v10 appearState];
  if (a4 == 2 && v6 != 2)
  {
    uint64_t v7 = [(SXComponentStyleRenderer *)self videoFillView];
    [v7 pause];
LABEL_7:

    goto LABEL_8;
  }
  if ([v10 appearState] == 2)
  {
    double v8 = [(SXComponentStyleRenderer *)self componentView];
    uint64_t v9 = [v8 visibilityState];

    if (v9 == 1)
    {
      uint64_t v7 = [(SXComponentStyleRenderer *)self videoFillView];
      [v7 play];
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)viewport:(id)a3 dynamicBoundsDidChangeFromBounds:(CGRect)a4
{
  id v31 = a3;
  v5 = [(SXComponentStyleRenderer *)self componentView];
  uint64_t v6 = [v5 fillView];
  [v6 contentFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = [(SXComponentStyleRenderer *)self componentView];
  uint64_t v16 = [v15 fillView];
  [v16 frame];
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [(SXComponentStyleRenderer *)self componentView];
  objc_msgSend(v31, "convertPointToViewportCoordinateSpace:fromView:", v21, v18, v20);
  double v23 = v22;

  double v24 = [(SXComponentStyleRenderer *)self componentStyle];
  double v25 = [v24 fill];
  uint64_t v26 = [v25 verticalAlignment];

  switch(v26)
  {
    case 2:
      [v31 bounds];
      double v10 = v27 - v23 - v14;
      break;
    case 1:
      [v31 bounds];
      double v10 = (v28 - v14) * 0.5 - v23;
      break;
    case 0:
      double v10 = -v23;
      break;
  }
  double v29 = [(SXComponentStyleRenderer *)self componentView];
  id v30 = [v29 fillView];
  objc_msgSend(v30, "setContentFrame:", v8, v10, v12, v14);
}

- (void)applyCornerRadius:(double)a3 cornerMask:(unint64_t)a4 curve:(id)a5 onView:(id)a6
{
  BOOL v9 = a3 > 0.0;
  id v10 = a6;
  id v11 = a5;
  [v10 setClipsToBounds:v9];
  double v12 = [v10 layer];
  [v12 setMaskedCorners:a4];

  double v13 = [v10 layer];
  [v13 setCornerRadius:a3];

  id v14 = [v10 layer];

  [v14 setCornerCurve:v11];
}

- (id)viewForFill:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SXComponentStyleRenderer *)self videoPlayerViewForFill:v4];
LABEL_9:
    uint64_t v6 = (void *)v5;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SXComponentStyleRenderer *)self imageViewForFill:v4];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SXComponentStyleRenderer *)self gradientViewForFill:v4];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SXComponentStyleRenderer *)self repeatableImageFillViewForFill:v4];
    goto LABEL_9;
  }
  uint64_t v6 = 0;
LABEL_10:

  return v6;
}

- (id)gradientViewForFill:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SXComponentStyleRenderer *)self gradientFillView];
  if (!v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_5;
    }
    id v6 = v4;
    double v7 = [SXGradientFillView alloc];
    double v8 = [(SXComponentStyleRenderer *)self gradientFactory];
    uint64_t v5 = [(SXGradientFillView *)v7 initWithGradientFill:v6 gradientFactory:v8];

    [(SXComponentStyleRenderer *)self setGradientFillView:v5];
  }

LABEL_5:
  BOOL v9 = [(SXComponentStyleRenderer *)self gradientFillView];

  return v9;
}

- (id)imageViewForFill:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SXComponentStyleRenderer *)self imageFillView];

  if (!v5)
  {
    id v6 = [(SXComponentStyleRenderer *)self imageFillViewFactory];
    double v7 = [v6 createImageFillViewForImageFill:v4];
    [(SXComponentStyleRenderer *)self setImageFillView:v7];
  }
  double v8 = [(SXComponentStyleRenderer *)self imageFillView];

  return v8;
}

- (id)videoPlayerViewForFill:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SXComponentStyleRenderer *)self videoFillView];

  if (!v5)
  {
    id v6 = [(SXComponentStyleRenderer *)self videoFillViewFactory];
    double v7 = [v6 createVideoFillViewForVideoFill:v4];
    [(SXComponentStyleRenderer *)self setVideoFillView:v7];

    double v8 = [(SXComponentStyleRenderer *)self viewport];
    [v8 addViewportChangeListener:self forOptions:8];
  }
  BOOL v9 = [(SXComponentStyleRenderer *)self videoFillView];

  return v9;
}

- (id)repeatableImageFillViewForFill:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SXComponentStyleRenderer *)self repeatableImageFillView];

  if (!v5)
  {
    id v6 = [(SXComponentStyleRenderer *)self repeatableImageFillViewFactory];
    double v7 = [v6 createRepeatableImageFillViewForRepeatableImageFill:v4];
    [(SXComponentStyleRenderer *)self setRepeatableImageFillView:v7];
  }
  double v8 = [(SXComponentStyleRenderer *)self repeatableImageFillView];

  return v8;
}

- (SXComponentStyle)componentStyle
{
  return self->_componentStyle;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXVideoFillViewFactory)videoFillViewFactory
{
  return self->_videoFillViewFactory;
}

- (SXImageFillViewFactory)imageFillViewFactory
{
  return self->_imageFillViewFactory;
}

- (SXGradientFactory)gradientFactory
{
  return self->_gradientFactory;
}

- (SXRepeatableImageFillViewFactory)repeatableImageFillViewFactory
{
  return self->_repeatableImageFillViewFactory;
}

- (SXComponentView)componentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_componentView);
  return (SXComponentView *)WeakRetained;
}

- (SXGradientFillView)gradientFillView
{
  return self->_gradientFillView;
}

- (void)setGradientFillView:(id)a3
{
}

- (SXImageFillView)imageFillView
{
  return self->_imageFillView;
}

- (void)setImageFillView:(id)a3
{
}

- (SXVideoFillView)videoFillView
{
  return self->_videoFillView;
}

- (void)setVideoFillView:(id)a3
{
}

- (SXRepeatableImageFillView)repeatableImageFillView
{
  return self->_repeatableImageFillView;
}

- (void)setRepeatableImageFillView:(id)a3
{
}

- (BOOL)didRegisterForDynamicBounds
{
  return self->_didRegisterForDynamicBounds;
}

- (void)setDidRegisterForDynamicBounds:(BOOL)a3
{
  self->_didRegisterForDynamicBounds = a3;
}

- (SXLayer)shadowLayer
{
  return self->_shadowLayer;
}

- (void)setShadowLayer:(id)a3
{
}

- (SXShapeLayer)borderLayer
{
  return self->_borderLayer;
}

- (void)setBorderLayer:(id)a3
{
}

- (SXShapeLayer)topBorderLayer
{
  return self->_topBorderLayer;
}

- (void)setTopBorderLayer:(id)a3
{
}

- (SXShapeLayer)rightBorderLayer
{
  return self->_rightBorderLayer;
}

- (void)setRightBorderLayer:(id)a3
{
}

- (SXShapeLayer)bottomBorderLayer
{
  return self->_bottomBorderLayer;
}

- (void)setBottomBorderLayer:(id)a3
{
}

- (SXShapeLayer)leftBorderLayer
{
  return self->_leftBorderLayer;
}

- (void)setLeftBorderLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftBorderLayer, 0);
  objc_storeStrong((id *)&self->_bottomBorderLayer, 0);
  objc_storeStrong((id *)&self->_rightBorderLayer, 0);
  objc_storeStrong((id *)&self->_topBorderLayer, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_repeatableImageFillView, 0);
  objc_storeStrong((id *)&self->_videoFillView, 0);
  objc_storeStrong((id *)&self->_imageFillView, 0);
  objc_storeStrong((id *)&self->_gradientFillView, 0);
  objc_destroyWeak((id *)&self->_componentView);
  objc_storeStrong((id *)&self->_repeatableImageFillViewFactory, 0);
  objc_storeStrong((id *)&self->_gradientFactory, 0);
  objc_storeStrong((id *)&self->_imageFillViewFactory, 0);
  objc_storeStrong((id *)&self->_videoFillViewFactory, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_componentStyle, 0);
}

@end