@interface _UIDismissCurlUpTapGestureRecognizer
- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (float)_curlUpDY;
- (void)_setCurlUpDY:(float)a3;
@end

@implementation _UIDismissCurlUpTapGestureRecognizer

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!_IsKindOfUIView((uint64_t)v10)) {
    goto LABEL_11;
  }
  id v11 = v10;
  [v8 locationInView:v11];
  double v13 = v12;
  double v15 = v14;
  [v11 bounds];
  CGFloat x = v29.origin.x;
  CGFloat y = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  double v20 = CGRectGetHeight(v29);
  [(_UIDismissCurlUpTapGestureRecognizer *)self _curlUpDY];
  if (v13 < 0.0
    || (float v22 = v21,
        v30.origin.CGFloat x = x,
        v30.origin.CGFloat y = y,
        v30.size.CGFloat width = width,
        v30.size.CGFloat height = height,
        v13 > CGRectGetWidth(v30))
    || v15 < 0.0)
  {

LABEL_11:
    BOOL v26 = 0;
    goto LABEL_12;
  }
  float v23 = v20 - v22;
  double v24 = v23 + v13 * -0.176326975;
  if (v24 >= 40.0) {
    double v25 = v24;
  }
  else {
    double v25 = 40.0;
  }

  if (v15 > v25) {
    goto LABEL_11;
  }
  v28.receiver = self;
  v28.super_class = (Class)_UIDismissCurlUpTapGestureRecognizer;
  BOOL v26 = [(UIGestureRecognizer *)&v28 _shouldReceiveTouch:v8 forEvent:v9 recognizerView:v11];
LABEL_12:

  return v26;
}

- (float)_curlUpDY
{
  return self->_curlUpDY;
}

- (void)_setCurlUpDY:(float)a3
{
  self->_curlUpDY = a3;
}

@end