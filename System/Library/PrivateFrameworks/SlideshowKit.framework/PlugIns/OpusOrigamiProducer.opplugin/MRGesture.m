@interface MRGesture
- (CGPoint)currentTranslation;
- (CGPoint)locationInSlideAtStart;
- (CGPoint)locationInViewAtStart;
- (CGPoint)slideCenterAtStart;
- (MRGesture)initWithHitBlob:(id)a3;
- (MRHitBlob)hitBlob;
- (double)currentRotation;
- (double)currentScale;
- (double)linearScaleAtStart;
- (double)slideRotationAtStart;
- (double)slideScaleAtStart;
- (void)dealloc;
- (void)setCurrentRotation:(double)a3;
- (void)setCurrentScale:(double)a3;
- (void)setCurrentTranslation:(CGPoint)a3;
- (void)setHitBlob:(id)a3;
- (void)setLinearScaleAtStart:(double)a3;
- (void)setLocationInSlideAtStart:(CGPoint)a3;
- (void)setLocationInViewAtStart:(CGPoint)a3;
- (void)setSlideCenterAtStart:(CGPoint)a3;
- (void)setSlideRotationAtStart:(double)a3;
- (void)setSlideScaleAtStart:(double)a3;
@end

@implementation MRGesture

- (MRGesture)initWithHitBlob:(id)a3
{
  v4 = [(MRGesture *)self init];
  if (v4) {
    v4->_hitBlob = (MRHitBlob *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_hitBlob = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRGesture;
  [(MRGesture *)&v3 dealloc];
}

- (MRHitBlob)hitBlob
{
  return (MRHitBlob *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHitBlob:(id)a3
{
}

- (CGPoint)locationInViewAtStart
{
  objc_copyStruct(v4, &self->_locationInViewAtStart, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLocationInViewAtStart:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_locationInViewAtStart, &v3, 16, 1, 0);
}

- (CGPoint)locationInSlideAtStart
{
  objc_copyStruct(v4, &self->_locationInSlideAtStart, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLocationInSlideAtStart:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_locationInSlideAtStart, &v3, 16, 1, 0);
}

- (double)linearScaleAtStart
{
  return self->_linearScaleAtStart;
}

- (void)setLinearScaleAtStart:(double)a3
{
  self->_linearScaleAtStart = a3;
}

- (CGPoint)slideCenterAtStart
{
  objc_copyStruct(v4, &self->_slideCenterAtStart, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setSlideCenterAtStart:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_slideCenterAtStart, &v3, 16, 1, 0);
}

- (double)slideRotationAtStart
{
  return self->_slideRotationAtStart;
}

- (void)setSlideRotationAtStart:(double)a3
{
  self->_slideRotationAtStart = a3;
}

- (double)slideScaleAtStart
{
  return self->_slideScaleAtStart;
}

- (void)setSlideScaleAtStart:(double)a3
{
  self->_slideScaleAtStart = a3;
}

- (CGPoint)currentTranslation
{
  objc_copyStruct(v4, &self->_currentTranslation, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCurrentTranslation:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_currentTranslation, &v3, 16, 1, 0);
}

- (double)currentRotation
{
  return self->_currentRotation;
}

- (void)setCurrentRotation:(double)a3
{
  self->_currentRotation = a3;
}

- (double)currentScale
{
  return self->_currentScale;
}

- (void)setCurrentScale:(double)a3
{
  self->_currentScale = a3;
}

@end