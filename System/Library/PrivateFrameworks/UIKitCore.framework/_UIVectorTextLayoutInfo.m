@interface _UIVectorTextLayoutInfo
- (CGAffineTransform)coordinateAdjustment;
- (_UIVectorTextLayoutParameters)parameters;
- (__CTFrame)frame;
- (double)scale;
- (void)dealloc;
- (void)setCoordinateAdjustment:(CGAffineTransform *)a3;
- (void)setFrame:(__CTFrame *)a3;
- (void)setParameters:(id)a3;
@end

@implementation _UIVectorTextLayoutInfo

- (void)setFrame:(__CTFrame *)a3
{
  frame = self->_frame;
  if (frame) {
    CFRelease(frame);
  }
  self->_frame = a3;
  if (a3)
  {
    CFRetain(a3);
  }
}

- (double)scale
{
  v2 = [(_UIVectorTextLayoutInfo *)self parameters];
  v3 = [v2 traitCollection];
  [v3 displayScale];
  double v5 = v4;

  double result = 1.0;
  if (v5 >= 1.0) {
    return v5;
  }
  return result;
}

- (void)dealloc
{
  frame = self->_frame;
  if (frame)
  {
    CFRelease(frame);
    self->_frame = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIVectorTextLayoutInfo;
  [(_UIVectorTextLayoutInfo *)&v4 dealloc];
}

- (_UIVectorTextLayoutParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (CGAffineTransform)coordinateAdjustment
{
  long long v3 = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].b;
  return self;
}

- (void)setCoordinateAdjustment:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_coordinateAdjustment.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_coordinateAdjustment.c = v4;
  *(_OWORD *)&self->_coordinateAdjustment.a = v3;
}

- (__CTFrame)frame
{
  return self->_frame;
}

- (void).cxx_destruct
{
}

@end