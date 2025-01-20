@interface TVPPlaybackImageLoadInfo
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)requestedCMTime;
- (CGSize)maxSize;
- (NSDate)requestedDate;
- (double)requestedTime;
- (id)dateBasedHandler;
- (id)description;
- (id)identifier;
- (id)timeBasedHandler;
- (void)callCompletionHandlerWithImage:(id)a3 actualCMTime:(id *)a4 actualDate:(id)a5;
- (void)setDateBasedHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMaxSize:(CGSize)a3;
- (void)setRequestedCMTime:(id *)a3;
- (void)setRequestedDate:(id)a3;
- (void)setRequestedTime:(double)a3;
- (void)setTimeBasedHandler:(id)a3;
@end

@implementation TVPPlaybackImageLoadInfo

- (id)description
{
  v3 = NSString;
  [(TVPPlaybackImageLoadInfo *)self requestedTime];
  uint64_t v5 = v4;
  [(TVPPlaybackImageLoadInfo *)self maxSize];
  v6 = NSStringFromCGSize(v11);
  v7 = [(TVPPlaybackImageLoadInfo *)self identifier];
  v8 = [v3 stringWithFormat:@"requestedTime: %f, maxSize: %@, identifier: %@", v5, v6, v7];

  return v8;
}

- (void)callCompletionHandlerWithImage:(id)a3 actualCMTime:(id *)a4 actualDate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a4;
    CMTimeGetSeconds((CMTime *)&v13);
  }
  v10 = [(TVPPlaybackImageLoadInfo *)self dateBasedHandler];
  if (v10)
  {
    CGSize v11 = [(TVPPlaybackImageLoadInfo *)self identifier];
    v12 = [(TVPPlaybackImageLoadInfo *)self requestedDate];
    ((void (**)(void, void (**)(void, void, void), id, void *, id))v10)[2](v10, v11, v8, v12, v9);
LABEL_7:

    goto LABEL_8;
  }
  CGSize v11 = [(TVPPlaybackImageLoadInfo *)self timeBasedHandler];
  if (v11)
  {
    v12 = [(TVPPlaybackImageLoadInfo *)self identifier];
    [(TVPPlaybackImageLoadInfo *)self requestedTime];
    ((void (**)(void, void *, id))v11)[2](v11, v12, v8);
    goto LABEL_7;
  }
LABEL_8:
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)requestedTime
{
  return self->_requestedTime;
}

- (void)setRequestedTime:(double)a3
{
  self->_requestedTime = a3;
}

- (NSDate)requestedDate
{
  return self->_requestedDate;
}

- (void)setRequestedDate:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)requestedCMTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setRequestedCMTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_requestedCMTime.epoch = a3->var3;
  *(_OWORD *)&self->_requestedCMTime.value = v3;
}

- (CGSize)maxSize
{
  double width = self->_maxSize.width;
  double height = self->_maxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  self->_maxSize = a3;
}

- (id)timeBasedHandler
{
  return self->_timeBasedHandler;
}

- (void)setTimeBasedHandler:(id)a3
{
}

- (id)dateBasedHandler
{
  return self->_dateBasedHandler;
}

- (void)setDateBasedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateBasedHandler, 0);
  objc_storeStrong(&self->_timeBasedHandler, 0);
  objc_storeStrong((id *)&self->_requestedDate, 0);
  objc_storeStrong(&self->_identifier, 0);
}

@end