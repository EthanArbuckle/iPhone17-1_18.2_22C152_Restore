@interface CACZWLensChromeView
- (BOOL)showingResizeHandles;
- (CACZWLensChromeView)initWithFrame:(CGRect)a3;
- (CALayer)backdropLayer;
- (CALayer)grabberOverlayLayer;
- (CAShapeLayer)backdropGrabberMaskLayer;
- (CAShapeLayer)backdropMaskShapeLayer;
- (CAShapeLayer)backdropResizingMaskLayer;
- (CAShapeLayer)chromeInnerBorderLayer;
- (CAShapeLayer)chromeOuterBorderLayer;
- (CAShapeLayer)lensResizingHandlesLayer;
- (CAShapeLayer)touchStealerShapeLayer;
- (CGRect)previousResizeBounds;
- (NSArray)resizeElements;
- (double)lensCornerRadius;
- (void)layoutSubviews;
- (void)setBackdropGrabberMaskLayer:(id)a3;
- (void)setBackdropLayer:(id)a3;
- (void)setBackdropMaskShapeLayer:(id)a3;
- (void)setBackdropResizingMaskLayer:(id)a3;
- (void)setChromeInnerBorderLayer:(id)a3;
- (void)setChromeOuterBorderLayer:(id)a3;
- (void)setGrabberOverlayLayer:(id)a3;
- (void)setLensCornerRadius:(double)a3;
- (void)setLensResizingHandlesLayer:(id)a3;
- (void)setPreviousResizeBounds:(CGRect)a3;
- (void)setResizeElements:(id)a3;
- (void)setShowingResizeHandles:(BOOL)a3;
- (void)setTouchStealerShapeLayer:(id)a3;
- (void)showLensResizingHandles:(BOOL)a3 animated:(BOOL)a4;
- (void)updateChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation CACZWLensChromeView

- (CACZWLensChromeView)initWithFrame:(CGRect)a3
{
  v55.receiver = self;
  v55.super_class = (Class)CACZWLensChromeView;
  v3 = -[CACZWLensChromeView initWithFrame:](&v55, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CACZWLensChromeView *)v3 layer];
    id v6 = objc_alloc_init(MEMORY[0x263F15758]);
    [v6 setEnabled:1];
    [v6 setAllowsHitTesting:0];
    [v6 setMarginWidth:12.0];
    [v6 setMasksToBounds:0];
    [(CACZWLensChromeView *)v4 setBackdropLayer:v6];
    v7 = [(CACZWLensChromeView *)v4 layer];
    [v7 addSublayer:v6];

    id v8 = v6;
    v9 = [MEMORY[0x263F157E8] layer];
    v10 = [(CACZWLensChromeView *)v4 backdropLayer];
    [v10 setMask:v9];

    v11 = [MEMORY[0x263F15880] layer];
    [(CACZWLensChromeView *)v4 setBackdropMaskShapeLayer:v11];

    v12 = [MEMORY[0x263F15880] layer];
    [(CACZWLensChromeView *)v4 setBackdropResizingMaskLayer:v12];

    id v13 = [MEMORY[0x263F825C8] whiteColor];
    uint64_t v14 = [v13 CGColor];
    v15 = [(CACZWLensChromeView *)v4 backdropResizingMaskLayer];
    [v15 setBackgroundColor:v14];

    v16 = [(CACZWLensChromeView *)v4 backdropResizingMaskLayer];
    [v16 setOpacity:0.0];

    v17 = [MEMORY[0x263F15880] layer];
    [(CACZWLensChromeView *)v4 setBackdropGrabberMaskLayer:v17];

    id v18 = [MEMORY[0x263F825C8] whiteColor];
    uint64_t v19 = [v18 CGColor];
    v20 = [(CACZWLensChromeView *)v4 backdropGrabberMaskLayer];
    [v20 setBackgroundColor:v19];

    v21 = [(CACZWLensChromeView *)v4 backdropGrabberMaskLayer];
    [v21 setCornerRadius:5.0];

    v22 = [(CACZWLensChromeView *)v4 backdropLayer];
    v23 = [v22 mask];
    v24 = [(CACZWLensChromeView *)v4 backdropMaskShapeLayer];
    [v23 addSublayer:v24];

    v25 = [(CACZWLensChromeView *)v4 backdropLayer];
    v26 = [v25 mask];
    v27 = [(CACZWLensChromeView *)v4 backdropGrabberMaskLayer];
    [v26 addSublayer:v27];

    v28 = [(CACZWLensChromeView *)v4 backdropLayer];
    v29 = [v28 mask];
    v30 = [(CACZWLensChromeView *)v4 backdropResizingMaskLayer];
    [v29 addSublayer:v30];

    v31 = [MEMORY[0x263F15880] layer];
    [(CACZWLensChromeView *)v4 setChromeInnerBorderLayer:v31];
    [v8 addSublayer:v31];
    id v32 = [MEMORY[0x263F825C8] clearColor];
    objc_msgSend(v31, "setFillColor:", objc_msgSend(v32, "CGColor"));

    CACZWLensInnerColor();
    id v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setStrokeColor:", objc_msgSend(v33, "CGColor"));

    [v31 setLineWidth:CACZWLensInnerBorderWidth()];
    uint64_t v34 = *MEMORY[0x263F15D58];
    v35 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
    [v31 setCompositingFilter:v35];

    id v36 = objc_alloc_init(MEMORY[0x263F157E8]);
    CACZWLensInnerColor();
    id v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setBackgroundColor:", objc_msgSend(v37, "CGColor"));

    [v36 setMasksToBounds:1];
    v38 = [MEMORY[0x263F157C8] filterWithType:v34];
    [v36 setCompositingFilter:v38];

    [(CACZWLensChromeView *)v4 setGrabberOverlayLayer:v36];
    v39 = [(CACZWLensChromeView *)v4 grabberOverlayLayer];
    [v39 setCornerRadius:5.0];

    [v8 addSublayer:v36];
    v40 = [MEMORY[0x263F15880] layer];
    [(CACZWLensChromeView *)v4 setChromeOuterBorderLayer:v40];
    [v8 addSublayer:v40];

    id v41 = [MEMORY[0x263F825C8] clearColor];
    objc_msgSend(v40, "setFillColor:", objc_msgSend(v41, "CGColor"));

    CACZWLensOuterColor();
    id v42 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setStrokeColor:", objc_msgSend(v42, "CGColor"));

    [v40 setLineWidth:CACZWLensOuterBorderWidth()];
    v43 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D50]];
    [v40 setCompositingFilter:v43];

    [(CACZWLensChromeView *)v4 setLensCornerRadius:13.0];
    v44 = [MEMORY[0x263F15880] layer];
    [(CACZWLensChromeView *)v4 setLensResizingHandlesLayer:v44];
    [v44 setOpacity:0.0];
    CACZWLensInnerColor();
    id v45 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFillColor:", objc_msgSend(v45, "CGColor"));

    v46 = [MEMORY[0x263F157C8] filterWithType:v34];
    [v44 setCompositingFilter:v46];

    v47 = [(CACZWLensChromeView *)v4 layer];
    [v47 addSublayer:v44];

    v48 = [MEMORY[0x263F15880] layer];

    [(CACZWLensChromeView *)v4 setTouchStealerShapeLayer:v48];
    LODWORD(v49) = 1.0;
    [v48 setOpacity:v49];
    v50 = [MEMORY[0x263F825C8] blackColor];
    id v51 = [v50 colorWithAlphaComponent:0.00392156863];
    objc_msgSend(v48, "setStrokeColor:", objc_msgSend(v51, "CGColor"));

    id v52 = [MEMORY[0x263F825C8] clearColor];
    objc_msgSend(v48, "setFillColor:", objc_msgSend(v52, "CGColor"));

    [v48 setLineWidth:CACZWZoomLensBorderThicknessForTouches()];
    v53 = [(CACZWLensChromeView *)v4 layer];
    [v53 addSublayer:v48];
  }
  return v4;
}

- (void)layoutSubviews
{
  v132.receiver = self;
  v132.super_class = (Class)CACZWLensChromeView;
  [(CACZWLensChromeView *)&v132 layoutSubviews];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(CACZWLensChromeView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CACZWLensChromeView *)self chromeInnerBorderLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(CACZWLensChromeView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(CACZWLensChromeView *)self chromeOuterBorderLayer];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  [(CACZWLensChromeView *)self bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [(CACZWLensChromeView *)self lensResizingHandlesLayer];
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  [(CACZWLensChromeView *)self bounds];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  v38 = [(CACZWLensChromeView *)self backdropLayer];
  v39 = [v38 mask];
  objc_msgSend(v39, "setFrame:", v31, v33, v35, v37);

  [(CACZWLensChromeView *)self bounds];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  v48 = [(CACZWLensChromeView *)self backdropResizingMaskLayer];
  objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

  [(CACZWLensChromeView *)self bounds];
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  v57 = [(CACZWLensChromeView *)self backdropMaskShapeLayer];
  objc_msgSend(v57, "setFrame:", v50, v52, v54, v56);

  [(CACZWLensChromeView *)self bounds];
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;
  double v65 = v64;
  v66 = [(CACZWLensChromeView *)self touchStealerShapeLayer];
  objc_msgSend(v66, "setFrame:", v59, v61, v63, v65);

  v67 = (void *)MEMORY[0x263F824C0];
  [(CACZWLensChromeView *)self bounds];
  objc_msgSend(v67, "bezierPathWithRect:");
  id v68 = objc_claimAutoreleasedReturnValue();
  uint64_t v69 = [v68 CGPath];
  v70 = [(CACZWLensChromeView *)self touchStealerShapeLayer];
  [v70 setPath:v69];

  [(CACZWLensChromeView *)self bounds];
  v75 = CACZWOuterLensBorderForBounds([(CACZWLensChromeView *)self showingResizeHandles], v71, v72, v73, v74);
  [(CACZWLensChromeView *)self bounds];
  v80 = CACZWInnerLensBorderForBounds([(CACZWLensChromeView *)self showingResizeHandles], v76, v77, v78, v79);
  id v81 = v75;
  uint64_t v82 = [v81 CGPath];
  v83 = [(CACZWLensChromeView *)self chromeOuterBorderLayer];
  [v83 setPath:v82];

  id v84 = v80;
  uint64_t v85 = [v84 CGPath];
  v86 = [(CACZWLensChromeView *)self chromeInnerBorderLayer];
  [v86 setPath:v85];

  [(CACZWLensChromeView *)self bounds];
  double v88 = v87;
  double v90 = v89;
  double v92 = v91;
  double v94 = v93;
  v95 = [(CACZWLensChromeView *)self backdropLayer];
  objc_msgSend(v95, "setFrame:", v88, v90, v92, v94);

  [(CACZWLensChromeView *)self bounds];
  CACZWResizeGrabberPath(v96, v97, v98, v99);
  id v100 = objc_claimAutoreleasedReturnValue();
  uint64_t v101 = [v100 CGPath];
  v102 = [(CACZWLensChromeView *)self lensResizingHandlesLayer];
  [v102 setPath:v101];

  [(CACZWLensChromeView *)self bounds];
  CACZWResizeGrabberPath(v103, v104, v105, v106);
  id v107 = objc_claimAutoreleasedReturnValue();
  uint64_t v108 = [v107 CGPath];
  v109 = [(CACZWLensChromeView *)self backdropResizingMaskLayer];
  [v109 setPath:v108];

  id v110 = [MEMORY[0x263F825C8] whiteColor];
  uint64_t v111 = [v110 CGColor];
  v112 = [(CACZWLensChromeView *)self backdropResizingMaskLayer];
  [v112 setFillColor:v111];

  id v113 = [MEMORY[0x263F825C8] clearColor];
  uint64_t v114 = [v113 CGColor];
  v115 = [(CACZWLensChromeView *)self backdropResizingMaskLayer];
  [v115 setBackgroundColor:v114];

  v116 = (void *)[v84 copy];
  [v116 appendPath:v81];
  id v117 = v116;
  uint64_t v118 = [v117 CGPath];
  v119 = [(CACZWLensChromeView *)self backdropMaskShapeLayer];
  [v119 setPath:v118];

  id v120 = [MEMORY[0x263F825C8] clearColor];
  uint64_t v121 = [v120 CGColor];
  v122 = [(CACZWLensChromeView *)self backdropMaskShapeLayer];
  [v122 setFillColor:v121];

  id v123 = [MEMORY[0x263F825C8] whiteColor];
  uint64_t v124 = [v123 CGColor];
  v125 = [(CACZWLensChromeView *)self backdropMaskShapeLayer];
  [v125 setStrokeColor:v124];

  double v126 = CACZWLensInnerBorderWidth();
  double v127 = CACZWLensOuterBorderWidth();
  if (v126 < v127) {
    double v126 = v127;
  }
  v128 = [(CACZWLensChromeView *)self backdropMaskShapeLayer];
  [v128 setLineWidth:v126];

  id v129 = [MEMORY[0x263F825C8] clearColor];
  uint64_t v130 = [v129 CGColor];
  v131 = [(CACZWLensChromeView *)self backdropMaskShapeLayer];
  [v131 setBackgroundColor:v130];

  [MEMORY[0x263F158F8] commit];
}

- (void)updateChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  double v9 = (void *)MEMORY[0x263F82E00];
  double v10 = 0.0;
  if (v5) {
    double v10 = CACZWDefaultFadeAnimationDuration();
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__CACZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke;
  v14[3] = &unk_264D120C0;
  v14[4] = self;
  BOOL v15 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__CACZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke_2;
  v12[3] = &unk_264D125E8;
  id v13 = v8;
  id v11 = v8;
  [v9 animateWithDuration:v14 animations:v12 completion:v10];
}

uint64_t __66__CACZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

uint64_t __66__CACZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)showLensResizingHandles:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:!v4];
  double v7 = [(CACZWLensChromeView *)self lensResizingHandlesLayer];
  id v8 = v7;
  if (v5) {
    float v9 = 1.0;
  }
  else {
    float v9 = 0.0;
  }
  if (v5) {
    float v10 = 0.0;
  }
  else {
    float v10 = 1.0;
  }
  [v7 setOpacity:COERCE_DOUBLE((unint64_t)LODWORD(v9))];

  id v11 = [(CACZWLensChromeView *)self grabberOverlayLayer];
  *(float *)&double v12 = v10;
  [v11 setOpacity:v12];

  id v13 = [(CACZWLensChromeView *)self backdropResizingMaskLayer];
  *(float *)&double v14 = v9;
  [v13 setOpacity:v14];

  BOOL v15 = [(CACZWLensChromeView *)self backdropGrabberMaskLayer];
  *(float *)&double v16 = v10;
  [v15 setOpacity:v16];

  [(CACZWLensChromeView *)self setShowingResizeHandles:v5];
  [(CACZWLensChromeView *)self layoutSubviews];
  double v17 = (void *)MEMORY[0x263F158F8];
  [v17 commit];
}

- (double)lensCornerRadius
{
  return self->_lensCornerRadius;
}

- (void)setLensCornerRadius:(double)a3
{
  self->_lensCornerRadius = a3;
}

- (CAShapeLayer)chromeOuterBorderLayer
{
  return self->_chromeOuterBorderLayer;
}

- (void)setChromeOuterBorderLayer:(id)a3
{
}

- (CAShapeLayer)chromeInnerBorderLayer
{
  return self->_chromeInnerBorderLayer;
}

- (void)setChromeInnerBorderLayer:(id)a3
{
}

- (CAShapeLayer)lensResizingHandlesLayer
{
  return self->_lensResizingHandlesLayer;
}

- (void)setLensResizingHandlesLayer:(id)a3
{
}

- (CAShapeLayer)touchStealerShapeLayer
{
  return self->_touchStealerShapeLayer;
}

- (void)setTouchStealerShapeLayer:(id)a3
{
}

- (CALayer)grabberOverlayLayer
{
  return self->_grabberOverlayLayer;
}

- (void)setGrabberOverlayLayer:(id)a3
{
}

- (CALayer)backdropLayer
{
  return self->_backdropLayer;
}

- (void)setBackdropLayer:(id)a3
{
}

- (CAShapeLayer)backdropMaskShapeLayer
{
  return self->_backdropMaskShapeLayer;
}

- (void)setBackdropMaskShapeLayer:(id)a3
{
}

- (CAShapeLayer)backdropGrabberMaskLayer
{
  return self->_backdropGrabberMaskLayer;
}

- (void)setBackdropGrabberMaskLayer:(id)a3
{
}

- (CAShapeLayer)backdropResizingMaskLayer
{
  return self->_backdropResizingMaskLayer;
}

- (void)setBackdropResizingMaskLayer:(id)a3
{
}

- (NSArray)resizeElements
{
  return self->_resizeElements;
}

- (void)setResizeElements:(id)a3
{
}

- (CGRect)previousResizeBounds
{
  double x = self->_previousResizeBounds.origin.x;
  double y = self->_previousResizeBounds.origin.y;
  double width = self->_previousResizeBounds.size.width;
  double height = self->_previousResizeBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousResizeBounds:(CGRect)a3
{
  self->_previousResizeBounds = a3;
}

- (BOOL)showingResizeHandles
{
  return self->_showingResizeHandles;
}

- (void)setShowingResizeHandles:(BOOL)a3
{
  self->_showingResizeHandles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resizeElements, 0);
  objc_storeStrong((id *)&self->_backdropResizingMaskLayer, 0);
  objc_storeStrong((id *)&self->_backdropGrabberMaskLayer, 0);
  objc_storeStrong((id *)&self->_backdropMaskShapeLayer, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_grabberOverlayLayer, 0);
  objc_storeStrong((id *)&self->_touchStealerShapeLayer, 0);
  objc_storeStrong((id *)&self->_lensResizingHandlesLayer, 0);
  objc_storeStrong((id *)&self->_chromeInnerBorderLayer, 0);
  objc_storeStrong((id *)&self->_chromeOuterBorderLayer, 0);
}

@end