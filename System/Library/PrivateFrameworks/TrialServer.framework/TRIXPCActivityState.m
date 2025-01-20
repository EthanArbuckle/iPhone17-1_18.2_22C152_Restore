@interface TRIXPCActivityState
+ (id)xPCActivityStateWithFutureCompletionStatus:(unint64_t)a3 capabilities:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToXPCActivityState:(id)a3;
- (TRIXPCActivityState)initWithFutureCompletionStatus:(unint64_t)a3 capabilities:(unint64_t)a4;
- (id)copyWithReplacementCapabilities:(unint64_t)a3;
- (id)copyWithReplacementFutureCompletionStatus:(unint64_t)a3;
- (id)description;
- (unint64_t)capabilities;
- (unint64_t)futureCompletionStatus;
- (unint64_t)hash;
@end

@implementation TRIXPCActivityState

- (TRIXPCActivityState)initWithFutureCompletionStatus:(unint64_t)a3 capabilities:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TRIXPCActivityState;
  result = [(TRIXPCActivityState *)&v7 init];
  if (result)
  {
    result->_futureCompletionStatus = a3;
    result->_capabilities = a4;
  }
  return result;
}

+ (id)xPCActivityStateWithFutureCompletionStatus:(unint64_t)a3 capabilities:(unint64_t)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithFutureCompletionStatus:a3 capabilities:a4];
  return v4;
}

- (id)copyWithReplacementFutureCompletionStatus:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  unint64_t capabilities = self->_capabilities;
  return (id)[v5 initWithFutureCompletionStatus:a3 capabilities:capabilities];
}

- (id)copyWithReplacementCapabilities:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  unint64_t futureCompletionStatus = self->_futureCompletionStatus;
  return (id)[v5 initWithFutureCompletionStatus:futureCompletionStatus capabilities:a3];
}

- (BOOL)isEqualToXPCActivityState:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (unint64_t futureCompletionStatus = self->_futureCompletionStatus,
        futureCompletionStatus == [v4 futureCompletionStatus]))
  {
    unint64_t capabilities = self->_capabilities;
    BOOL v8 = capabilities == [v5 capabilities];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIXPCActivityState *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIXPCActivityState *)self isEqualToXPCActivityState:v5];

  return v6;
}

- (unint64_t)hash
{
  return self->_capabilities - self->_futureCompletionStatus + 32 * self->_futureCompletionStatus;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_futureCompletionStatus];
  id v5 = [NSNumber numberWithUnsignedLongLong:self->_capabilities];
  BOOL v6 = (void *)[v3 initWithFormat:@"<TRIXPCActivityState | futureCompletionStatus:%@ capabilities:%@>", v4, v5];

  return v6;
}

- (unint64_t)futureCompletionStatus
{
  return self->_futureCompletionStatus;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

@end