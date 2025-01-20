@interface SVXSessionIdleAssertion
- (SVXSession)session;
- (SVXSessionIdleAssertion)initWithTimestamp:(unint64_t)a3 session:(id)a4;
- (id)description;
- (unint64_t)timestamp;
@end

@implementation SVXSessionIdleAssertion

- (void).cxx_destruct
{
}

- (SVXSession)session
{
  return self->_session;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)SVXSessionIdleAssertion;
  v4 = [(SVXSessionIdleAssertion *)&v7 description];
  v5 = (void *)[v3 initWithFormat:@"%@ {timestamp = %llu, session = %@}", v4, self->_timestamp, self->_session];

  return v5;
}

- (SVXSessionIdleAssertion)initWithTimestamp:(unint64_t)a3 session:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SVXSessionIdleAssertion;
  v8 = [(SVXSessionIdleAssertion *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_timestamp = a3;
    objc_storeStrong((id *)&v8->_session, a4);
  }

  return v9;
}

@end