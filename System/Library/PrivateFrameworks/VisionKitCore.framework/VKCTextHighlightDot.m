@interface VKCTextHighlightDot
- (BOOL)pulsing;
- (CALayer)circleLayer;
- (CALayer)pulsingLayer;
- (CALayer)textHighlightLayer;
- (CGRect)_rectForViewSpace:(CGRect)a3;
- (CGRect)rectForIndicatorDot;
- (UIColor)highlightColor;
- (VKCTextHighlightDot)initWithColor:(id)a3;
- (VKQuadSideLength)quadSideLength;
- (double)opacityForCurrentQuadSize;
- (void)_updateLayout;
- (void)configureForPulsing:(BOOL)a3;
- (void)layoutSubviews;
- (void)setCircleLayer:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setPulsing:(BOOL)a3;
- (void)setPulsingLayer:(id)a3;
- (void)setQuadSideLength:(VKQuadSideLength)a3;
- (void)setTextHighlightLayer:(id)a3;
- (void)updateIndicatorDotForState;
@end

@implementation VKCTextHighlightDot

- (VKCTextHighlightDot)initWithColor:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VKCTextHighlightDot;
  v6 = [(VKCTextHighlightDot *)&v16 init];
  if (v6)
  {
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    id v8 = (id)[(VKCTextHighlightDot *)v6 registerForTraitChanges:v7 withAction:sel__updateLayout];

    v9 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    pulsingLayer = v6->_pulsingLayer;
    v6->_pulsingLayer = v9;

    v11 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    circleLayer = v6->_circleLayer;
    v6->_circleLayer = v11;

    objc_storeStrong((id *)&v6->_highlightColor, a3);
    v13 = [(VKCTextHighlightDot *)v6 layer];
    [v13 addSublayer:v6->_pulsingLayer];

    v14 = [(VKCTextHighlightDot *)v6 layer];
    [v14 addSublayer:v6->_circleLayer];
  }
  return v6;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VKCTextHighlightDot;
  [(VKCTextHighlightDot *)&v3 layoutSubviews];
  [(VKCTextHighlightDot *)self _updateLayout];
}

- (void)_updateLayout
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(VKCTextHighlightDot *)self updateIndicatorDotForState];
  [(VKCTextHighlightDot *)self opacityForCurrentQuadSize];
  double v4 = v3;
  -[UIView setVk_alpha:](self, "setVk_alpha:");
  v6 = [(VKCTextHighlightDot *)self textHighlightLayer];
  float v5 = 1.0 - v4;
  *(float *)&double v7 = v5;
  [v6 setOpacity:v7];

  [(VKCTextHighlightDot *)self setHidden:v4 <= 0.0];
  [(VKCTextHighlightDot *)self setPulsing:0];
  [(VKCTextHighlightDot *)self setPulsing:1];
  id v8 = (void *)MEMORY[0x1E4F39CF8];
  [v8 commit];
}

- (double)opacityForCurrentQuadSize
{
  [(UIView *)self vk_windowLengthFromViewLength:1.0];
  double v4 = v3;
  [(VKCTextHighlightDot *)self quadSideLength];
  double v9 = VKMMultiplyQuadSideLengthScaler(v5, v6, v7, v8, v4);
  if (v11 >= v12) {
    double v13 = v12;
  }
  else {
    double v13 = v11;
  }
  if (v9 >= v10) {
    double v14 = v10;
  }
  else {
    double v14 = v9;
  }
  if (v13 >= v14) {
    double v15 = v13;
  }
  else {
    double v15 = v14;
  }
  double v16 = VKMMininumQuadSideLength(v9, v10, v11, v12);
  double v17 = 0.0;
  if (v15 <= 20.0)
  {
    BOOL v18 = v15 > 18.0 && v15 < 20.0;
    double v17 = 1.0;
    if (v18) {
      double v17 = (20.0 - v15) * 0.5;
    }
  }
  double v19 = (6.0 - v16) * 0.5;
  if (v19 < v17) {
    double v19 = v17;
  }
  if (v17 < 1.0 && v16 < 6.0) {
    return v19;
  }
  else {
    return v17;
  }
}

- (CGRect)rectForIndicatorDot
{
  -[VKCTextHighlightDot _rectForViewSpace:](self, "_rectForViewSpace:", 0.0, 0.0, 16.0, 16.0);
  double v4 = v3;
  [(VKCTextHighlightDot *)self bounds];
  double v9 = VKMCenterOfRect(v5, v6, v7, v8);
  double v11 = VKMRectWithCenterAndSize(v9, v10, v4);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)updateIndicatorDotForState
{
  id v8 = [(VKCTextHighlightDot *)self circleLayer];
  [(VKCTextHighlightDot *)self rectForIndicatorDot];
  double v4 = v3;
  objc_msgSend(v8, "setFrame:");
  [v8 setCornerRadius:v4 * 0.5];
  [v8 setBorderWidth:0.0];
  [v8 setContents:0];
  id v5 = [(VKCTextHighlightDot *)self highlightColor];
  objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

  id v6 = [MEMORY[0x1E4F428B8] blackColor];
  objc_msgSend(v8, "setShadowColor:", objc_msgSend(v6, "CGColor"));

  LODWORD(v7) = 1045220557;
  [v8 setShadowOpacity:v7];
  [v8 setShadowRadius:8.0];
  [v8 setMasksToBounds:0];
  [(VKCTextHighlightDot *)self setPulsing:1];
}

- (CGRect)_rectForViewSpace:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(VKCTextHighlightDot *)self window];
  double v9 = [v8 screen];
  double v10 = [v9 fixedCoordinateSpace];
  double v11 = [(VKCTextHighlightDot *)self coordinateSpace];
  objc_msgSend(v10, "convertRect:toCoordinateSpace:", v11, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (void)setPulsing:(BOOL)a3
{
  if (self->_pulsing != a3)
  {
    self->_pulsing = a3;
    -[VKCTextHighlightDot configureForPulsing:](self, "configureForPulsing:");
  }
}

- (void)configureForPulsing:(BOOL)a3
{
  v60[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    double v4 = [(VKCTextHighlightDot *)self pulsingLayer];
    double v5 = VKMRectWithSize();
    double v53 = v6;
    double v54 = v5;
    double v8 = v7;
    double v52 = v9;
    -[VKCTextHighlightDot _rectForViewSpace:](self, "_rectForViewSpace:");
    double v11 = v10;
    double v55 = v10 * 0.0625;
    double v12 = [(VKCTextHighlightDot *)self layer];
    [v12 bounds];
    double v17 = VKMCenterOfRect(v13, v14, v15, v16);
    double v19 = v18;

    double v20 = VKMRectWithCenterAndSize(v17, v19, v11);
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    [(VKCTextHighlightDot *)self _rectForViewSpace:VKMRectWithSize()];
    double v27 = v17;
    double v29 = v28;
    double v30 = VKMRectWithCenterAndSize(v27, v19, v28);
    double v58 = v31;
    double v59 = v30;
    double v56 = v33;
    double v57 = v32;
    objc_msgSend(v4, "setFrame:", v54, v8, v53, v52);
    objc_msgSend(v4, "setFrame:", v20, v22, v24, v26);
    id v34 = [MEMORY[0x1E4F428B8] colorWithRed:0.91796875 green:0.91796875 blue:0.91796875 alpha:0.5];
    objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(v34, "CGColor"));

    double v35 = v11 * 0.5;
    [v4 setCornerRadius:v35];
    [v4 setBorderWidth:v55];
    id v36 = [MEMORY[0x1E4F428B8] colorWithRed:0.78125 green:0.78125 blue:0.78125 alpha:0.5];
    objc_msgSend(v4, "setBorderColor:", objc_msgSend(v36, "CGColor"));

    v37 = [MEMORY[0x1E4F39B48] animation];
    [v37 setKeyPath:@"bounds"];
    [v37 setDuration:1.5];
    v38 = objc_msgSend(MEMORY[0x1E4F29238], "vk_valueWithRect:", v20, v22, v24, v26);
    [v37 setFromValue:v38];

    v39 = objc_msgSend(MEMORY[0x1E4F29238], "vk_valueWithRect:", v59, v58, v57, v56);
    [v37 setToValue:v39];

    uint64_t v40 = *MEMORY[0x1E4F3A490];
    v41 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    [v37 setTimingFunction:v41];

    uint64_t v42 = *MEMORY[0x1E4F39FA8];
    [v37 setFillMode:*MEMORY[0x1E4F39FA8]];
    [v37 setRemovedOnCompletion:0];
    v43 = [MEMORY[0x1E4F39B48] animation];
    [v43 setKeyPath:@"cornerRadius"];
    [v43 setDuration:1.5];
    v44 = [NSNumber numberWithDouble:v35];
    [v43 setFromValue:v44];

    v45 = [NSNumber numberWithDouble:v29 * 0.5];
    [v43 setToValue:v45];

    v46 = [MEMORY[0x1E4F39C10] functionWithName:v40];
    [v43 setTimingFunction:v46];

    [v43 setFillMode:v42];
    [v43 setRemovedOnCompletion:0];
    v47 = [MEMORY[0x1E4F39B48] animation];
    [v47 setDuration:1.5];
    [v47 setKeyPath:@"opacity"];
    [v47 setFromValue:&unk_1F357DE20];
    [v47 setToValue:&unk_1F357DE30];
    [v47 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v47 setRemovedOnCompletion:0];
    v48 = [MEMORY[0x1E4F39B38] animation];
    [v48 setDuration:1.8];
    LODWORD(v49) = 2139095040;
    [v48 setRepeatCount:v49];
    [v48 setAutoreverses:1];
    v60[0] = v37;
    v60[1] = v43;
    v60[2] = v47;
    v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];
    [v48 setAnimations:v50];

    [(CALayer *)self->_pulsingLayer addAnimation:v48 forKey:@"basic"];
  }
  else
  {
    [(CALayer *)self->_pulsingLayer setOpacity:0.0];
    pulsingLayer = self->_pulsingLayer;
    [(CALayer *)pulsingLayer removeAllAnimations];
  }
}

- (VKQuadSideLength)quadSideLength
{
  double left = self->_quadSideLength.left;
  double right = self->_quadSideLength.right;
  double top = self->_quadSideLength.top;
  double bottom = self->_quadSideLength.bottom;
  result.double bottom = bottom;
  result.double top = top;
  result.double right = right;
  result.double left = left;
  return result;
}

- (void)setQuadSideLength:(VKQuadSideLength)a3
{
  self->_quadSideLength = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (CALayer)textHighlightLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textHighlightLayer);
  return (CALayer *)WeakRetained;
}

- (void)setTextHighlightLayer:(id)a3
{
}

- (CALayer)pulsingLayer
{
  return self->_pulsingLayer;
}

- (void)setPulsingLayer:(id)a3
{
}

- (CALayer)circleLayer
{
  return self->_circleLayer;
}

- (void)setCircleLayer:(id)a3
{
}

- (BOOL)pulsing
{
  return self->_pulsing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_pulsingLayer, 0);
  objc_destroyWeak((id *)&self->_textHighlightLayer);
  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end