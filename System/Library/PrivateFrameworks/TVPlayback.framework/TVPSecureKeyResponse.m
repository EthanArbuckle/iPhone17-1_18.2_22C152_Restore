@interface TVPSecureKeyResponse
- (NSData)keyData;
- (NSDate)renewalDate;
- (TVPSecureKeyRequest)request;
- (void)setKeyData:(id)a3;
- (void)setRenewalDate:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation TVPSecureKeyResponse

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
}

- (NSDate)renewalDate
{
  return self->_renewalDate;
}

- (void)setRenewalDate:(id)a3
{
}

- (TVPSecureKeyRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_renewalDate, 0);
  objc_storeStrong((id *)&self->_keyData, 0);
}

@end