@interface ISURLRequestPerformance
- (NSURLResponse)URLResponse;
- (double)finishInterval;
- (double)receivedResponseInterval;
- (double)renderBeginInterval;
- (double)renderEndInterval;
- (double)startTime;
- (void)dealloc;
- (void)setFinishTime:(double)a3;
- (void)setReceivedResponseTime:(double)a3;
- (void)setRenderBeginTime:(double)a3;
- (void)setRenderFinishTime:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setURLResponse:(id)a3;
@end

@implementation ISURLRequestPerformance

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISURLRequestPerformance;
  [(ISURLRequestPerformance *)&v3 dealloc];
}

- (double)finishInterval
{
  return self->_finishTime - self->_startTime;
}

- (double)receivedResponseInterval
{
  return self->_receivedResponseTime - self->_startTime;
}

- (double)renderBeginInterval
{
  return self->_renderBeginTime - self->_startTime;
}

- (double)renderEndInterval
{
  return self->_renderEndTime - self->_startTime;
}

- (void)setFinishTime:(double)a3
{
  self->_finishTime = a3;
}

- (void)setReceivedResponseTime:(double)a3
{
  self->_receivedResponseTime = a3;
}

- (void)setRenderBeginTime:(double)a3
{
  self->_renderBeginTime = a3;
}

- (void)setRenderFinishTime:(double)a3
{
  self->_renderEndTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (NSURLResponse)URLResponse
{
  return self->_urlResponse;
}

- (void)setURLResponse:(id)a3
{
}

@end