@interface PKShapeLayerPathState
- (PKShapeLayerPathState)init;
- (PKShapeLayerPathState)initWithShapeLayer:(id)a3;
- (PKShapeLayerPathState)initWithShapeLayer:(id)a3 reverse:(BOOL)a4;
- (PKShapeLayerPathState)initWithStrokeStart:(double)a3 strokeEnd:(double)a4;
- (PKShapeLayerPathState)initWithStrokeStartT0:(double)a3 strokeStartT1:(double)a4 strokeEndT0:(double)a5 strokeEndT1:(double)a6;
- (double)progressForShapeLayer:(id)a3;
- (double)strokeEndAtProgress:(double)a3;
- (double)strokeStartAtProgress:(double)a3;
- (id)description;
- (void)dealloc;
- (void)setProgress:(double)a3 onShapeLayer:(id)a4;
- (void)setProgress:(double)a3 onShapeLayer:(id)a4 withAnimationHandler:(id)a5;
@end

@implementation PKShapeLayerPathState

- (PKShapeLayerPathState)init
{
  return [(PKShapeLayerPathState *)self initWithStrokeStartT0:0.0 strokeStartT1:0.0 strokeEndT0:0.0 strokeEndT1:1.0];
}

- (PKShapeLayerPathState)initWithShapeLayer:(id)a3
{
  return [(PKShapeLayerPathState *)self initWithShapeLayer:a3 reverse:0];
}

- (PKShapeLayerPathState)initWithShapeLayer:(id)a3 reverse:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 strokeStart];
  double v8 = v7;
  [v6 strokeEnd];
  double v10 = v9;

  if (v4) {
    double v11 = v10;
  }
  else {
    double v11 = v8;
  }
  return [(PKShapeLayerPathState *)self initWithStrokeStartT0:v11 strokeStartT1:v8 strokeEndT0:v11 strokeEndT1:v10];
}

- (PKShapeLayerPathState)initWithStrokeStart:(double)a3 strokeEnd:(double)a4
{
  return [(PKShapeLayerPathState *)self initWithStrokeStartT0:a3 strokeStartT1:a3 strokeEndT0:a3 strokeEndT1:a4];
}

- (PKShapeLayerPathState)initWithStrokeStartT0:(double)a3 strokeStartT1:(double)a4 strokeEndT0:(double)a5 strokeEndT1:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)PKShapeLayerPathState;
  result = [(PKShapeLayerPathState *)&v11 init];
  if (result)
  {
    result->_strokeStartT0 = a3;
    result->_strokeStartT1 = a4;
    result->_strokeEndT0 = a5;
    result->_strokeEndT1 = a6;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKShapeLayerPathState;
  [(PKShapeLayerPathState *)&v2 dealloc];
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PKShapeLayerPathState;
  BOOL v4 = [(PKShapeLayerPathState *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: (%f -> %f) (%f -> %f)", v4, *(void *)&self->_strokeStartT0, *(void *)&self->_strokeStartT1, *(void *)&self->_strokeEndT0, *(void *)&self->_strokeEndT1];

  return v5;
}

- (double)strokeStartAtProgress:(double)a3
{
  double v3 = 0.0;
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  if (a3 <= 1.0) {
    double v4 = v3;
  }
  else {
    double v4 = 1.0;
  }
  return v4 * self->_strokeStartT1 + (1.0 - v4) * self->_strokeStartT0;
}

- (double)strokeEndAtProgress:(double)a3
{
  double v3 = 0.0;
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  if (a3 <= 1.0) {
    double v4 = v3;
  }
  else {
    double v4 = 1.0;
  }
  return v4 * self->_strokeEndT1 + (1.0 - v4) * self->_strokeEndT0;
}

- (void)setProgress:(double)a3 onShapeLayer:(id)a4
{
}

- (void)setProgress:(double)a3 onShapeLayer:(id)a4 withAnimationHandler:(id)a5
{
  id v19 = a4;
  double v8 = (void (**)(id, id, __CFString *, double, double))a5;
  double v9 = 0.0;
  if (a3 >= 0.0) {
    double v9 = a3;
  }
  if (a3 <= 1.0) {
    double v10 = v9;
  }
  else {
    double v10 = 1.0;
  }
  objc_msgSend(v19, "strokeStart", 1.0, v9);
  double v12 = v11;
  [(PKShapeLayerPathState *)self strokeStartAtProgress:v10];
  double v14 = v13;
  [v19 strokeEnd];
  double v16 = v15;
  [(PKShapeLayerPathState *)self strokeEndAtProgress:v10];
  double v18 = v17;
  [v19 setStrokeStart:v14];
  [v19 setStrokeEnd:v18];
  if (v8)
  {
    if (v12 != v14) {
      v8[2](v8, v19, @"strokeStart", v12, v14);
    }
    if (v16 != v18) {
      v8[2](v8, v19, @"strokeEnd", v16, v18);
    }
  }
}

- (double)progressForShapeLayer:(id)a3
{
  id v4 = a3;
  v5 = v4;
  double v6 = 1.0;
  double v7 = 1.0;
  if (self->_strokeStartT0 != self->_strokeStartT1)
  {
    [v4 strokeStart];
    double v7 = fmax(fmin((v8 - self->_strokeStartT0) / (self->_strokeStartT1 - self->_strokeStartT0), 1.0), 0.0);
  }
  if (self->_strokeEndT0 != self->_strokeEndT1)
  {
    [v5 strokeEnd];
    double v6 = fmax(fmin((v9 - self->_strokeEndT0) / (self->_strokeEndT1 - self->_strokeEndT0), 1.0), 0.0);
  }

  return fmin(v7, v6);
}

@end