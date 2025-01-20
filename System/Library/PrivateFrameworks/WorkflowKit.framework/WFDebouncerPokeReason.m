@interface WFDebouncerPokeReason
- (NSString)reason;
- (id)userInfo;
- (void)setReason:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation WFDebouncerPokeReason

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (void)setUserInfo:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setReason:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

@end