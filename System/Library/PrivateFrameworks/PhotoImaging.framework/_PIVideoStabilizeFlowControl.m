@interface _PIVideoStabilizeFlowControl
- (BOOL)ICShouldBeCanceled;
- (double)rangeMax;
- (double)rangeMin;
- (id)progressHandler;
- (id)shouldCancelHandler;
- (void)ICReportProgress:(float)a3;
- (void)setProgressHandler:(id)a3;
- (void)setRangeMax:(double)a3;
- (void)setRangeMin:(double)a3;
- (void)setShouldCancelHandler:(id)a3;
@end

@implementation _PIVideoStabilizeFlowControl

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldCancelHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

- (void)setShouldCancelHandler:(id)a3
{
}

- (id)shouldCancelHandler
{
  return self->_shouldCancelHandler;
}

- (void)setRangeMax:(double)a3
{
  self->_rangeMax = a3;
}

- (double)rangeMax
{
  return self->_rangeMax;
}

- (void)setRangeMin:(double)a3
{
  self->_rangeMin = a3;
}

- (double)rangeMin
{
  return self->_rangeMin;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (BOOL)ICShouldBeCanceled
{
  v3 = [(_PIVideoStabilizeFlowControl *)self shouldCancelHandler];

  if (!v3) {
    return 0;
  }
  v4 = [(_PIVideoStabilizeFlowControl *)self shouldCancelHandler];
  char v5 = v4[2]();

  return v5;
}

- (void)ICReportProgress:(float)a3
{
  progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](self->_rangeMin + a3 * (self->_rangeMax - self->_rangeMin));
  }
}

@end