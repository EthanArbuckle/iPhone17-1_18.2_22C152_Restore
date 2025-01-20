@interface PAOngoingAccessIntervalState
- (PAAccess)access;
- (PAOngoingAccessIntervalState)initWithAccess:(id)a3;
- (int64_t)retryCount;
- (void)setAccess:(id)a3;
- (void)setRetryCount:(int64_t)a3;
@end

@implementation PAOngoingAccessIntervalState

- (PAOngoingAccessIntervalState)initWithAccess:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PAOngoingAccessIntervalState;
  v6 = [(PAOngoingAccessIntervalState *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_access, a3);
    v7->_retryCount = 0;
  }

  return v7;
}

- (PAAccess)access
{
  return self->_access;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (void)setAccess:(id)a3
{
}

- (void).cxx_destruct
{
}

@end