@interface PIVideoReframeTimedMetadata
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (CGVector)estimatedCenterMotion;
- (CGVector)estimatedMotionBlur;
- (__n128)setTrajectoryHomography:(__n128)a3;
- (double)trajectoryHomography;
- (void)setEstimatedCenterMotion:(CGVector)a3;
- (void)setEstimatedMotionBlur:(CGVector)a3;
- (void)setTime:(id *)a3;
@end

@implementation PIVideoReframeTimedMetadata

- (double)trajectoryHomography
{
  objc_copyStruct(&v2, (const void *)(a1 + 64), 48, 1, 0);
  return *(double *)&v2;
}

- (CGVector)estimatedMotionBlur
{
  objc_copyStruct(v4, &self->_estimatedMotionBlur, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (CGVector)estimatedCenterMotion
{
  objc_copyStruct(v4, &self->_estimatedCenterMotion, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (__n128)setTrajectoryHomography:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  return result;
}

- (void)setEstimatedMotionBlur:(CGVector)a3
{
  self->_estimatedMotionBlur = a3;
}

- (void)setEstimatedCenterMotion:(CGVector)a3
{
  self->_estimatedCenterMotion = a3;
}

- (void)setTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

@end