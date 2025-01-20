@interface SBAppStatusBarTransitionInfo
- (BOOL)zoomOther;
- (UIStatusBarStyleRequest)endStyleRequest;
- (UIStatusBarStyleRequest)startStyleRequest;
- (id)description;
- (int)transition;
- (int64_t)endOrientation;
- (int64_t)startOrientation;
- (void)setEndOrientation:(int64_t)a3;
- (void)setEndStyleRequest:(id)a3;
- (void)setStartOrientation:(int64_t)a3;
- (void)setStartStyleRequest:(id)a3;
- (void)setTransition:(int)a3;
- (void)setZoomOther:(BOOL)a3;
@end

@implementation SBAppStatusBarTransitionInfo

- (id)description
{
  if (self->_zoomOther) {
    v3 = @"(zoomOther) :";
  }
  else {
    v3 = @":";
  }
  v4 = v3;
  int64_t endOrientation = self->_endOrientation;
  if (self->_startOrientation == endOrientation) {
    objc_msgSend(NSString, "stringWithFormat:", @"%i", self->_startOrientation, v17);
  }
  else {
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%i -> %i", self->_startOrientation, endOrientation);
  }
  if ([(UIStatusBarStyleRequest *)self->_startStyleRequest isEqual:self->_endStyleRequest])
  {
    v7 = __stringForStyleRequest(self->_startStyleRequest);
  }
  else
  {
    v8 = NSString;
    v9 = __stringForStyleRequest(self->_startStyleRequest);
    v10 = __stringForStyleRequest(self->_endStyleRequest);
    v7 = [v8 stringWithFormat:@"%@ -> %@", v9, v10];
  }
  v11 = NSString;
  uint64_t v12 = objc_opt_class();
  uint64_t transition = self->_transition;
  if (transition > 4) {
    v14 = 0;
  }
  else {
    v14 = off_1E6B081A0[transition];
  }
  v15 = [v11 stringWithFormat:@"<%@:%p transition=%@ %@ orientation=%@ : styleRequest=%@>", v12, self, v14, v4, v6, v7];

  return v15;
}

- (UIStatusBarStyleRequest)startStyleRequest
{
  return self->_startStyleRequest;
}

- (void)setStartStyleRequest:(id)a3
{
}

- (int64_t)startOrientation
{
  return self->_startOrientation;
}

- (void)setStartOrientation:(int64_t)a3
{
  self->_startOrientation = a3;
}

- (UIStatusBarStyleRequest)endStyleRequest
{
  return self->_endStyleRequest;
}

- (void)setEndStyleRequest:(id)a3
{
}

- (int64_t)endOrientation
{
  return self->_endOrientation;
}

- (void)setEndOrientation:(int64_t)a3
{
  self->_int64_t endOrientation = a3;
}

- (int)transition
{
  return self->_transition;
}

- (void)setTransition:(int)a3
{
  self->_uint64_t transition = a3;
}

- (BOOL)zoomOther
{
  return self->_zoomOther;
}

- (void)setZoomOther:(BOOL)a3
{
  self->_zoomOther = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endStyleRequest, 0);
  objc_storeStrong((id *)&self->_startStyleRequest, 0);
}

@end