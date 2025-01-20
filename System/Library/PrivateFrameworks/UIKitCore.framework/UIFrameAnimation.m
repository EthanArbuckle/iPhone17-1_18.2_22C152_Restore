@interface UIFrameAnimation
- (CGRect)endFrame;
- (UIFrameAnimation)initWithTarget:(id)a3;
- (void)setEndFrame:(CGRect)a3;
- (void)setProgress:(float)a3;
- (void)setSignificantRectFields:(int)a3;
- (void)setStartFrame:(CGRect)a3;
@end

@implementation UIFrameAnimation

- (UIFrameAnimation)initWithTarget:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIFrameAnimation;
  result = [(UIAnimation *)&v4 initWithTarget:a3];
  if (result) {
    result->_fieldsToChange = 255;
  }
  return result;
}

- (void)setStartFrame:(CGRect)a3
{
  self->_startFrame = a3;
}

- (void)setEndFrame:(CGRect)a3
{
  self->_endFrame = a3;
}

- (CGRect)endFrame
{
  double x = self->_endFrame.origin.x;
  double y = self->_endFrame.origin.y;
  double width = self->_endFrame.size.width;
  double height = self->_endFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSignificantRectFields:(int)a3
{
  self->_fieldsToChange = a3;
}

- (void)setProgress:(float)a3
{
  [self->super._target frame];
  double x = v32.origin.x;
  double y = v32.origin.y;
  double width = v32.size.width;
  double height = v32.size.height;
  CGRect v33 = CGRectIntegral(v32);
  CGFloat rect2 = v33.origin.x;
  CGFloat v9 = v33.origin.y;
  CGFloat v10 = v33.size.width;
  CGFloat v11 = v33.size.height;
  int fieldsToChange = self->_fieldsToChange;
  if ((fieldsToChange & 1) == 0)
  {
    if ((fieldsToChange & 2) == 0) {
      goto LABEL_3;
    }
LABEL_10:
    double v16 = self->_startFrame.origin.y;
    float v17 = self->_endFrame.origin.y - v16;
    double v18 = v16 + (float)(v17 * a3);
    if (v17 >= 0.0)
    {
      double y = ceil(v18);
      if ((fieldsToChange & 4) != 0) {
        goto LABEL_14;
      }
    }
    else
    {
      double y = floor(v18);
      if ((fieldsToChange & 4) != 0) {
        goto LABEL_14;
      }
    }
LABEL_4:
    if ((fieldsToChange & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  double v13 = self->_startFrame.origin.x;
  float v14 = self->_endFrame.origin.x - v13;
  double v15 = v13 + (float)(v14 * a3);
  if (v14 >= 0.0)
  {
    double x = ceil(v15);
    if ((fieldsToChange & 2) != 0) {
      goto LABEL_10;
    }
  }
  else
  {
    double x = floor(v15);
    if ((fieldsToChange & 2) != 0) {
      goto LABEL_10;
    }
  }
LABEL_3:
  if ((fieldsToChange & 4) == 0) {
    goto LABEL_4;
  }
LABEL_14:
  double v19 = self->_startFrame.size.width;
  float v20 = self->_endFrame.size.width - v19;
  double v21 = v19 + (float)(v20 * a3);
  if (v20 >= 0.0)
  {
    double width = ceil(v21);
    if ((fieldsToChange & 8) == 0) {
      goto LABEL_21;
    }
  }
  else
  {
    double width = floor(v21);
    if ((fieldsToChange & 8) == 0) {
      goto LABEL_21;
    }
  }
LABEL_18:
  double v22 = self->_startFrame.size.height;
  float v23 = self->_endFrame.size.height - v22;
  double v24 = v22 + (float)(v23 * a3);
  if (v23 >= 0.0) {
    double height = ceil(v24);
  }
  else {
    double height = floor(v24);
  }
LABEL_21:
  v34.origin.double x = x;
  v34.origin.double y = y;
  v34.size.double width = width;
  v34.size.double height = height;
  CGRect v35 = CGRectIntegral(v34);
  double v25 = v35.origin.x;
  double v26 = v35.origin.y;
  double v27 = v35.size.width;
  double v28 = v35.size.height;
  v36.origin.double x = rect2;
  v36.origin.double y = v9;
  v36.size.double width = v10;
  v36.size.double height = v11;
  if (!CGRectEqualToRect(v35, v36))
  {
    id target = self->super._target;
    objc_msgSend(target, "setFrame:", v25, v26, v27, v28);
  }
}

@end