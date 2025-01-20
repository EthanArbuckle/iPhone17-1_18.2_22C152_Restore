@interface TUIGradient
+ (unint64_t)defaultRole;
+ (unint64_t)directionFromString:(id)a3;
- (BOOL)continuousCorners;
- (Class)layoutClass;
- (NSString)CAfilterBlendMode;
- (NSString)blendMode;
- (UIColor)gradientEndColor;
- (UIColor)gradientStartColor;
- (double)gradientBlurOffset;
- (double)gradientBlurRadius;
- (double)gradientEndPosition;
- (double)gradientStartPosition;
- (double)opacity;
- (unint64_t)gradientDirection;
- (void)setBlendMode:(id)a3;
- (void)setContinuousCorners:(BOOL)a3;
- (void)setGradientBlurOffset:(double)a3;
- (void)setGradientBlurRadius:(double)a3;
- (void)setGradientDirection:(unint64_t)a3;
- (void)setGradientEndColor:(id)a3;
- (void)setGradientEndPosition:(double)a3;
- (void)setGradientStartColor:(id)a3;
- (void)setGradientStartPosition:(double)a3;
- (void)setOpacity:(double)a3;
@end

@implementation TUIGradient

+ (unint64_t)defaultRole
{
  return 1;
}

+ (unint64_t)directionFromString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (qword_2DF500 != -1)
  {
    dispatch_once(&qword_2DF500, &stru_254238);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(id)qword_2DF4F8 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (NSString)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(id)a3
{
}

- (UIColor)gradientStartColor
{
  return self->_gradientStartColor;
}

- (void)setGradientStartColor:(id)a3
{
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (void)setGradientEndColor:(id)a3
{
}

- (double)gradientStartPosition
{
  return self->_gradientStartPosition;
}

- (void)setGradientStartPosition:(double)a3
{
  self->_gradientStartPosition = a3;
}

- (double)gradientEndPosition
{
  return self->_gradientEndPosition;
}

- (void)setGradientEndPosition:(double)a3
{
  self->_gradientEndPosition = a3;
}

- (unint64_t)gradientDirection
{
  return self->_gradientDirection;
}

- (void)setGradientDirection:(unint64_t)a3
{
  self->_gradientDirection = a3;
}

- (NSString)CAfilterBlendMode
{
  return self->_CAfilterBlendMode;
}

- (BOOL)continuousCorners
{
  return self->_continuousCorners;
}

- (void)setContinuousCorners:(BOOL)a3
{
  self->_continuousCorners = a3;
}

- (double)gradientBlurRadius
{
  return self->_gradientBlurRadius;
}

- (void)setGradientBlurRadius:(double)a3
{
  self->_gradientBlurRadius = a3;
}

- (double)gradientBlurOffset
{
  return self->_gradientBlurOffset;
}

- (void)setGradientBlurOffset:(double)a3
{
  self->_gradientBlurOffset = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CAfilterBlendMode, 0);
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);

  objc_storeStrong((id *)&self->_blendMode, 0);
}

@end