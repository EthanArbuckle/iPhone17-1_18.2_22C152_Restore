@interface NTKRichComplicationDialView
- (CALayer)largeTickLayer;
- (CALayer)smallTickLayer;
- (NTKRichComplicationDialView)initWithLargeTickCount:(int64_t)a3 smallTickCountPerLargeTick:(int64_t)a4 largeTickSize:(CGSize)a5 smallTickSize:(CGSize)a6 dialRange:(double)a7 startAngle:(double)a8;
- (NTKRichComplicationDialView)initWithTickCount:(int64_t)a3 tickSize:(CGSize)a4 dialRange:(double)a5 startAngle:(double)a6;
- (UIColor)tickColor;
- (float)progress;
- (float)progressDirection;
- (void)_updateTicksRotationTransform;
- (void)layoutSubviews;
- (void)setLargeTicksTransformAngle:(double)a3;
- (void)setProgress:(float)a3;
- (void)setProgressDirection:(float)a3;
- (void)setTickColor:(id)a3;
@end

@implementation NTKRichComplicationDialView

- (NTKRichComplicationDialView)initWithLargeTickCount:(int64_t)a3 smallTickCountPerLargeTick:(int64_t)a4 largeTickSize:(CGSize)a5 smallTickSize:(CGSize)a6 dialRange:(double)a7 startAngle:(double)a8
{
  double height = a6.height;
  double width = a6.width;
  double v13 = a5.height;
  double v14 = a5.width;
  v41.receiver = self;
  v41.super_class = (Class)NTKRichComplicationDialView;
  v16 = -[NTKRichComplicationDialView initWithFrame:](&v41, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v16)
  {
    v17 = [MEMORY[0x1E4FB1618] clearColor];
    [(NTKRichComplicationDialView *)v16 setBackgroundColor:v17];

    v16->_progress = 1.0;
    v16->_progressDirection = 1.0;
    v18 = [(NTKRichComplicationDialView *)v16 layer];
    v16->_largeTickCount = a3;
    v16->_smallTickCountPerLargeTick = a4;
    uint64_t v19 = objc_opt_new();
    largeTicksReplicatorLayer = v16->_largeTicksReplicatorLayer;
    v16->_largeTicksReplicatorLayer = (CAReplicatorLayer *)v19;

    uint64_t v21 = *MEMORY[0x1E4F39FA0];
    [(CAReplicatorLayer *)v16->_largeTicksReplicatorLayer setFillMode:*MEMORY[0x1E4F39FA0]];
    [(CAReplicatorLayer *)v16->_largeTicksReplicatorLayer setInstanceCount:a3];
    v22 = v16->_largeTicksReplicatorLayer;
    CATransform3DMakeRotation(&v40, a8, 0.0, 0.0, 1.0);
    [(CAReplicatorLayer *)v22 setTransform:&v40];
    v23 = v16->_largeTicksReplicatorLayer;
    id v24 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAReplicatorLayer setBackgroundColor:](v23, "setBackgroundColor:", [v24 CGColor]);

    [v18 addSublayer:v16->_largeTicksReplicatorLayer];
    uint64_t v25 = objc_opt_new();
    largeTickLayer = v16->_largeTickLayer;
    v16->_largeTickLayer = (CALayer *)v25;

    v27 = v16->_largeTickLayer;
    id v28 = [MEMORY[0x1E4FB1618] whiteColor];
    -[CALayer setBackgroundColor:](v27, "setBackgroundColor:", [v28 CGColor]);

    -[CALayer setBounds:](v16->_largeTickLayer, "setBounds:", 0.0, 0.0, v14, v13);
    [(CALayer *)v16->_largeTickLayer setCornerRadius:v14 * 0.5];
    [(CAReplicatorLayer *)v16->_largeTicksReplicatorLayer addSublayer:v16->_largeTickLayer];
    v16->_largeTickPositionY = v13 * 0.5;
    if (width != *MEMORY[0x1E4F1DB30] || height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      uint64_t v29 = objc_opt_new();
      smallTicksReplicatorLayer = v16->_smallTicksReplicatorLayer;
      v16->_smallTicksReplicatorLayer = (CAReplicatorLayer *)v29;

      [(CAReplicatorLayer *)v16->_smallTicksReplicatorLayer setFillMode:v21];
      [(CAReplicatorLayer *)v16->_smallTicksReplicatorLayer setInstanceCount:v16->_smallTickCountPerLargeTick * a3];
      v31 = v16->_smallTicksReplicatorLayer;
      CATransform3DMakeRotation(&v39, a8, 0.0, 0.0, 1.0);
      [(CAReplicatorLayer *)v31 setTransform:&v39];
      v32 = v16->_smallTicksReplicatorLayer;
      id v33 = [MEMORY[0x1E4FB1618] clearColor];
      -[CAReplicatorLayer setBackgroundColor:](v32, "setBackgroundColor:", [v33 CGColor]);

      [(CAReplicatorLayer *)v16->_smallTicksReplicatorLayer setCompositingFilter:@"maximum"];
      [v18 insertSublayer:v16->_smallTicksReplicatorLayer below:v16->_largeTicksReplicatorLayer];
      uint64_t v34 = objc_opt_new();
      smallTickLayer = v16->_smallTickLayer;
      v16->_smallTickLayer = (CALayer *)v34;

      v36 = v16->_smallTickLayer;
      id v37 = [MEMORY[0x1E4FB1618] whiteColor];
      -[CALayer setBackgroundColor:](v36, "setBackgroundColor:", [v37 CGColor]);

      -[CALayer setBounds:](v16->_smallTickLayer, "setBounds:", 0.0, 0.0, width, height);
      [(CALayer *)v16->_smallTickLayer setCornerRadius:width * 0.5];
      [(CAReplicatorLayer *)v16->_smallTicksReplicatorLayer addSublayer:v16->_smallTickLayer];
      v16->_smallTickPositionY = height * 0.5;
    }
    [(NTKRichComplicationDialView *)v16 setLargeTicksTransformAngle:a7 / (double)a3];
  }
  return v16;
}

- (NTKRichComplicationDialView)initWithTickCount:(int64_t)a3 tickSize:(CGSize)a4 dialRange:(double)a5 startAngle:(double)a6
{
  return -[NTKRichComplicationDialView initWithLargeTickCount:smallTickCountPerLargeTick:largeTickSize:smallTickSize:dialRange:startAngle:](self, "initWithLargeTickCount:smallTickCountPerLargeTick:largeTickSize:smallTickSize:dialRange:startAngle:", a3, 2, a4.width, a4.height, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), a5, a6);
}

- (void)setProgress:(float)a3
{
  if (self->_progress != a3)
  {
    self->_progress = a3;
    uint64_t v4 = (uint64_t)(float)((float)(a3 * (float)self->_largeTickCount) + 1.0);
    largeTickLayer = self->_largeTickLayer;
    if (v4)
    {
      [(CALayer *)largeTickLayer setHidden:0];
      [(CAReplicatorLayer *)self->_largeTicksReplicatorLayer setInstanceCount:v4];
    }
    else
    {
      [(CALayer *)largeTickLayer setHidden:1];
    }
    if (self->_smallTicksReplicatorLayer)
    {
      uint64_t v6 = (uint64_t)(float)((float)((float)(self->_progress * (float)self->_largeTickCount)
                                  * (float)self->_smallTickCountPerLargeTick)
                          + 1.0);
      smallTickLayer = self->_smallTickLayer;
      if (v6)
      {
        [(CALayer *)smallTickLayer setHidden:0];
        smallTicksReplicatorLayer = self->_smallTicksReplicatorLayer;
        [(CAReplicatorLayer *)smallTicksReplicatorLayer setInstanceCount:v6];
      }
      else
      {
        [(CALayer *)smallTickLayer setHidden:1];
      }
    }
  }
}

- (void)setProgressDirection:(float)a3
{
  BOOL v3 = a3 < 0.0;
  float v4 = 1.0;
  if (v3) {
    float v4 = -1.0;
  }
  if (self->_progressDirection != v4)
  {
    self->_progressDirection = v4;
    [(NTKRichComplicationDialView *)self _updateTicksRotationTransform];
  }
}

- (void)setLargeTicksTransformAngle:(double)a3
{
  if (self->_largeTicksTransformAngle != a3)
  {
    self->_largeTicksTransformAngle = a3;
    [(NTKRichComplicationDialView *)self _updateTicksRotationTransform];
  }
}

- (void)_updateTicksRotationTransform
{
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  double v3 = self->_largeTicksTransformAngle * self->_progressDirection;
  largeTicksReplicatorLayer = self->_largeTicksReplicatorLayer;
  CATransform3DMakeRotation(&v7, v3, 0.0, 0.0, 1.0);
  [(CAReplicatorLayer *)largeTicksReplicatorLayer setInstanceTransform:&v7];
  smallTicksReplicatorLayer = self->_smallTicksReplicatorLayer;
  if (smallTicksReplicatorLayer)
  {
    CATransform3DMakeRotation(&v6, v3 / (double)self->_smallTickCountPerLargeTick, 0.0, 0.0, 1.0);
    [(CAReplicatorLayer *)smallTicksReplicatorLayer setInstanceTransform:&v6];
  }
  [MEMORY[0x1E4F39CF8] setDisableActions:0];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)NTKRichComplicationDialView;
  [(NTKRichComplicationDialView *)&v15 layoutSubviews];
  double v3 = [(NTKRichComplicationDialView *)self layer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = v8 * 0.5;
  double v13 = v10 * 0.5;
  -[CAReplicatorLayer setPosition:](self->_largeTicksReplicatorLayer, "setPosition:", v8 * 0.5, v10 * 0.5);
  -[CAReplicatorLayer setBounds:](self->_largeTicksReplicatorLayer, "setBounds:", v5, v7, v9, v11);
  -[CALayer setPosition:](self->_largeTickLayer, "setPosition:", v12, self->_largeTickPositionY);
  smallTicksReplicatorLayer = self->_smallTicksReplicatorLayer;
  if (smallTicksReplicatorLayer)
  {
    -[CAReplicatorLayer setPosition:](smallTicksReplicatorLayer, "setPosition:", v12, v13);
    -[CAReplicatorLayer setBounds:](self->_smallTicksReplicatorLayer, "setBounds:", v5, v7, v9, v11);
    -[CALayer setPosition:](self->_smallTickLayer, "setPosition:", v12, self->_smallTickPositionY);
  }
}

- (void)setTickColor:(id)a3
{
  smallTickLayer = self->_smallTickLayer;
  id v5 = a3;
  -[CALayer setBackgroundColor:](smallTickLayer, "setBackgroundColor:", [v5 CGColor]);
  largeTickLayer = self->_largeTickLayer;
  id v7 = v5;
  uint64_t v8 = [v7 CGColor];

  [(CALayer *)largeTickLayer setBackgroundColor:v8];
}

- (CALayer)largeTickLayer
{
  return self->_largeTickLayer;
}

- (CALayer)smallTickLayer
{
  return self->_smallTickLayer;
}

- (float)progress
{
  return self->_progress;
}

- (float)progressDirection
{
  return self->_progressDirection;
}

- (UIColor)tickColor
{
  return self->_tickColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smallTickLayer, 0);
  objc_storeStrong((id *)&self->_smallTicksReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_largeTickLayer, 0);

  objc_storeStrong((id *)&self->_largeTicksReplicatorLayer, 0);
}

@end