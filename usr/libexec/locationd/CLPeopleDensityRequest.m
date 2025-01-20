@interface CLPeopleDensityRequest
- (CLPeopleDensityRequest)initWithRequestTimestamp:(double)a3 hints:(id)a4 replyBlock:(id)a5;
- (NSDictionary)hints;
- (double)requestTimestamp;
- (id)reply;
- (void)dealloc;
- (void)setHints:(id)a3;
- (void)setReply:(id)a3;
- (void)setRequestTimestamp:(double)a3;
@end

@implementation CLPeopleDensityRequest

- (CLPeopleDensityRequest)initWithRequestTimestamp:(double)a3 hints:(id)a4 replyBlock:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CLPeopleDensityRequest;
  v8 = [(CLPeopleDensityRequest *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_requestTimestamp = a3;
    if (a4) {
      v10 = (NSDictionary *)a4;
    }
    else {
      v10 = 0;
    }
    v9->_hints = v10;
    v9->_reply = [a5 copy];
  }
  return v9;
}

- (void)dealloc
{
  hints = self->_hints;
  if (hints)
  {

    self->_hints = 0;
  }

  self->_reply = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLPeopleDensityRequest;
  [(CLPeopleDensityRequest *)&v4 dealloc];
}

- (double)requestTimestamp
{
  return self->_requestTimestamp;
}

- (void)setRequestTimestamp:(double)a3
{
  self->_requestTimestamp = a3;
}

- (NSDictionary)hints
{
  return self->_hints;
}

- (void)setHints:(id)a3
{
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

@end