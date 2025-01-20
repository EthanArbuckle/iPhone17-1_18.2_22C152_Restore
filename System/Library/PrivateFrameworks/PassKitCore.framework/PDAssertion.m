@interface PDAssertion
- (BOOL)invalidateWhenBackgrounded;
- (NSString)identifier;
- (NSString)reason;
- (PDAssertion)initWithType:(unint64_t)a3 identifier:(id)a4 reason:(id)a5;
- (double)createdAt;
- (id)description;
- (unint64_t)type;
- (void)setInvalidateWhenBackgrounded:(BOOL)a3;
@end

@implementation PDAssertion

- (PDAssertion)initWithType:(unint64_t)a3 identifier:(id)a4 reason:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PDAssertion;
  v10 = [(PDAssertion *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    reason = v11->_reason;
    v11->_reason = (NSString *)v14;

    v11->_invalidateWhenBackgrounded = 1;
    v11->_createdAt = CFAbsoluteTimeGetCurrent();
  }

  return v11;
}

- (id)description
{
  unint64_t type = self->_type;
  if (type > 8) {
    v3 = @"unknown";
  }
  else {
    v3 = off_1E56F4CB0[type];
  }
  if (self->_invalidateWhenBackgrounded) {
    v4 = @"Y";
  }
  else {
    v4 = @"N";
  }
  return (id)[NSString stringWithFormat:@"<PDAssertion: Type: %@, Identifier: %@, Reason: \"%@\", invalidateWhenBackgrounded: %@, ageInSeconds: %f>", v3, self->_identifier, self->_reason, v4, CFAbsoluteTimeGetCurrent() - self->_createdAt];
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)invalidateWhenBackgrounded
{
  return self->_invalidateWhenBackgrounded;
}

- (void)setInvalidateWhenBackgrounded:(BOOL)a3
{
  self->_invalidateWhenBackgrounded = a3;
}

- (double)createdAt
{
  return self->_createdAt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end