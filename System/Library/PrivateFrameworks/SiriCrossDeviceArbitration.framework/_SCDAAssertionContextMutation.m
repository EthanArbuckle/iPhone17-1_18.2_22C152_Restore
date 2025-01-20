@interface _SCDAAssertionContextMutation
- (BOOL)isDirty;
- (_SCDAAssertionContextMutation)initWithBase:(id)a3;
- (double)getExpirationDuration;
- (id)getEffectiveDate;
- (id)getReason;
- (id)getUserInfo;
- (unint64_t)getTimestamp;
- (void)setEffectiveDate:(id)a3;
- (void)setExpirationDuration:(double)a3;
- (void)setReason:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _SCDAAssertionContextMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_effectiveDate, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setUserInfo:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (id)getUserInfo
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_userInfo;
  }
  else
  {
    v2 = [(SCDAAssertionContext *)self->_base userInfo];
  }
  return v2;
}

- (void)setExpirationDuration:(double)a3
{
  self->_expirationDuration = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (double)getExpirationDuration
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
    return self->_expirationDuration;
  }
  [(SCDAAssertionContext *)self->_base expirationDuration];
  return result;
}

- (void)setEffectiveDate:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getEffectiveDate
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_effectiveDate;
  }
  else
  {
    v2 = [(SCDAAssertionContext *)self->_base effectiveDate];
  }
  return v2;
}

- (void)setReason:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getReason
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_reason;
  }
  else
  {
    v2 = [(SCDAAssertionContext *)self->_base reason];
  }
  return v2;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getTimestamp
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_timestamp;
  }
  else {
    return [(SCDAAssertionContext *)self->_base timestamp];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_SCDAAssertionContextMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SCDAAssertionContextMutation;
  v6 = [(_SCDAAssertionContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end