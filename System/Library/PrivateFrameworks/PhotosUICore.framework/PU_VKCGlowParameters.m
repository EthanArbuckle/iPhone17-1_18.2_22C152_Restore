@interface PU_VKCGlowParameters
- (double)blurRadius;
- (double)maxOpacity;
- (double)maxThickness;
- (double)minOpacity;
- (double)minThickness;
- (double)strokeLengthFraction;
- (double)strokeTaperLength;
- (unint64_t)strokeCount;
- (void)setBlurRadius:(double)a3;
- (void)setMaxOpacity:(double)a3;
- (void)setMaxThickness:(double)a3;
- (void)setMinOpacity:(double)a3;
- (void)setMinThickness:(double)a3;
- (void)setStrokeCount:(unint64_t)a3;
- (void)setStrokeLengthFraction:(double)a3;
- (void)setStrokeTaperLength:(double)a3;
@end

@implementation PU_VKCGlowParameters

- (void)setStrokeCount:(unint64_t)a3
{
  self->_strokeCount = a3;
}

- (unint64_t)strokeCount
{
  return self->_strokeCount;
}

- (void)setMaxOpacity:(double)a3
{
  self->_maxOpacity = a3;
}

- (double)maxOpacity
{
  return self->_maxOpacity;
}

- (void)setMinOpacity:(double)a3
{
  self->_minOpacity = a3;
}

- (double)minOpacity
{
  return self->_minOpacity;
}

- (void)setStrokeTaperLength:(double)a3
{
  self->_strokeTaperLength = a3;
}

- (double)strokeTaperLength
{
  return self->_strokeTaperLength;
}

- (void)setStrokeLengthFraction:(double)a3
{
  self->_strokeLengthFraction = a3;
}

- (double)strokeLengthFraction
{
  return self->_strokeLengthFraction;
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void)setMaxThickness:(double)a3
{
  self->_maxThickness = a3;
}

- (double)maxThickness
{
  return self->_maxThickness;
}

- (void)setMinThickness:(double)a3
{
  self->_minThickness = a3;
}

- (double)minThickness
{
  return self->_minThickness;
}

@end