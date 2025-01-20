@interface ICDelegationConsumerServiceSessionRequestInfo
- (BOOL)isEqual:(id)a3;
- (ICDelegationConsumerServiceSessionRequestInfo)initWithAccountID:(unint64_t)a3 fairPlaySessionID:(unint64_t)a4;
- (unint64_t)accountID;
- (unint64_t)fairPlaySessionID;
- (unint64_t)hash;
@end

@implementation ICDelegationConsumerServiceSessionRequestInfo

- (unint64_t)fairPlaySessionID
{
  return self->_fairPlaySessionID;
}

- (unint64_t)accountID
{
  return self->_accountID;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ICDelegationConsumerServiceSessionRequestInfo *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_accountID == v4->_accountID
      && self->_fairPlaySessionID == v4->_fairPlaySessionID;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_fairPlaySessionID ^ self->_accountID;
}

- (ICDelegationConsumerServiceSessionRequestInfo)initWithAccountID:(unint64_t)a3 fairPlaySessionID:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICDelegationConsumerServiceSessionRequestInfo;
  result = [(ICDelegationConsumerServiceSessionRequestInfo *)&v7 init];
  if (result)
  {
    result->_accountID = a3;
    result->_fairPlaySessionID = a4;
  }
  return result;
}

@end