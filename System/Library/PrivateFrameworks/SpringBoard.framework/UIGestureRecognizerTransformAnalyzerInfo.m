@interface UIGestureRecognizerTransformAnalyzerInfo
- (CGPoint)absoluteTranslation;
- (CGPoint)translation;
- (double)rotation;
- (double)scale;
- (double)translationMagnitude;
- (id)description;
- (void)_reset;
- (void)_setAbsoluteTranslation:(CGPoint)a3;
- (void)_setRotation:(double)a3;
- (void)_setScale:(double)a3;
- (void)_setTranslation:(CGPoint)a3;
- (void)_setTranslationMagnitude:(double)a3;
@end

@implementation UIGestureRecognizerTransformAnalyzerInfo

- (void)_reset
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  -[UIGestureRecognizerTransformAnalyzerInfo _setTranslation:](self, "_setTranslation:", *MEMORY[0x1E4F1DAD8], v4);
  [(UIGestureRecognizerTransformAnalyzerInfo *)self _setTranslationMagnitude:0.0];
  -[UIGestureRecognizerTransformAnalyzerInfo _setAbsoluteTranslation:](self, "_setAbsoluteTranslation:", v3, v4);
  [(UIGestureRecognizerTransformAnalyzerInfo *)self _setScale:0.0];
  [(UIGestureRecognizerTransformAnalyzerInfo *)self _setRotation:0.0];
}

- (id)description
{
  double v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendPoint:withName:", @"translation", self->_translation.x, self->_translation.y);
  id v5 = (id)[v3 appendFloat:@"translationMagnitude" withName:self->_translationMagnitude];
  id v6 = (id)objc_msgSend(v3, "appendPoint:withName:", @"absoluteTranslation", self->_absoluteTranslation.x, self->_absoluteTranslation.y);
  id v7 = (id)[v3 appendFloat:@"scale" withName:self->_scale];
  id v8 = (id)[v3 appendFloat:@"rotation" withName:self->_rotation];
  v9 = [v3 build];

  return v9;
}

- (CGPoint)translation
{
  double x = self->_translation.x;
  double y = self->_translation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setTranslation:(CGPoint)a3
{
  self->_translation = a3;
}

- (double)translationMagnitude
{
  return self->_translationMagnitude;
}

- (void)_setTranslationMagnitude:(double)a3
{
  self->_translationMagnitude = a3;
}

- (CGPoint)absoluteTranslation
{
  double x = self->_absoluteTranslation.x;
  double y = self->_absoluteTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setAbsoluteTranslation:(CGPoint)a3
{
  self->_absoluteTranslation = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)_setScale:(double)a3
{
  self->_scale = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)_setRotation:(double)a3
{
  self->_rotation = a3;
}

@end