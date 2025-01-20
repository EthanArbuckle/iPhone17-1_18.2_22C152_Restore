@interface NTKRichComplicationRingProgressView
- (BOOL)clockwise;
- (NTKRichComplicationRingProgressView)initWithFamily:(int64_t)a3 curveWidth:(double)a4 padding:(double)a5 forDevice:(id)a6;
- (void)setClockwise:(BOOL)a3;
@end

@implementation NTKRichComplicationRingProgressView

- (NTKRichComplicationRingProgressView)initWithFamily:(int64_t)a3 curveWidth:(double)a4 padding:(double)a5 forDevice:(id)a6
{
  id v10 = a6;
  if (NTKShowGossamerUI(v10)) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 0;
  }
  v12 = (void *)[objc_alloc((Class)off_1E62BD630) initWithCurveWidth:v10 padding:v11 forDevice:a4 withFilterStyle:a5];
  v13 = (void *)[objc_alloc((Class)off_1E62BD630) initWithCurveWidth:v10 padding:v11 forDevice:a4 withFilterStyle:a5];
  v16.receiver = self;
  v16.super_class = (Class)NTKRichComplicationRingProgressView;
  v14 = [(CDRichComplicationProgressView *)&v16 initForFamily:a3 device:v10 backgroundShapeView:v12 foregroundShapeView:v13];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_backgroundView, v12);
    objc_storeStrong((id *)&v14->_foregroundView, v13);
  }

  return v14;
}

- (void)setClockwise:(BOOL)a3
{
  BOOL v3 = a3;
  self->_clockwise = a3;
  -[CDRichComplicationRingView setClockwise:](self->_backgroundView, "setClockwise:");
  [(CDRichComplicationRingView *)self->_foregroundView setClockwise:v3];

  [(NTKRichComplicationRingProgressView *)self setNeedsLayout];
}

- (BOOL)clockwise
{
  return self->_clockwise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end