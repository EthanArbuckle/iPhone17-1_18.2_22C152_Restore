@interface VSJSRequest
- (NSArray)attributeNames;
- (NSString)appleVerificationToken;
- (NSString)currentAuthentication;
- (NSString)requestBody;
- (NSString)requestType;
- (NSString)requestorVerificationToken;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAppleVerificationToken:(id)a3;
- (void)setAttributeNames:(id)a3;
- (void)setCurrentAuthentication:(id)a3;
- (void)setRequestBody:(id)a3;
- (void)setRequestType:(id)a3;
- (void)setRequestorVerificationToken:(id)a3;
@end

@implementation VSJSRequest

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[VSJSRequest allocWithZone:a3];
  v5 = [(IKJSObject *)self appContext];
  v6 = [(IKJSObject *)v4 initWithAppContext:v5];

  uint64_t v7 = [(NSString *)self->_requestType copy];
  requestType = v6->_requestType;
  v6->_requestType = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_requestBody copy];
  requestBody = v6->_requestBody;
  v6->_requestBody = (NSString *)v9;

  uint64_t v11 = [(NSString *)self->_currentAuthentication copy];
  currentAuthentication = v6->_currentAuthentication;
  v6->_currentAuthentication = (NSString *)v11;

  uint64_t v13 = [(NSString *)self->_appleVerificationToken copy];
  appleVerificationToken = v6->_appleVerificationToken;
  v6->_appleVerificationToken = (NSString *)v13;

  uint64_t v15 = [(NSString *)self->_requestorVerificationToken copy];
  requestorVerificationToken = v6->_requestorVerificationToken;
  v6->_requestorVerificationToken = (NSString *)v15;

  return v6;
}

- (NSString)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(id)a3
{
}

- (NSString)requestBody
{
  return self->_requestBody;
}

- (void)setRequestBody:(id)a3
{
}

- (NSString)currentAuthentication
{
  return self->_currentAuthentication;
}

- (void)setCurrentAuthentication:(id)a3
{
}

- (NSString)appleVerificationToken
{
  return self->_appleVerificationToken;
}

- (void)setAppleVerificationToken:(id)a3
{
}

- (NSString)requestorVerificationToken
{
  return self->_requestorVerificationToken;
}

- (void)setRequestorVerificationToken:(id)a3
{
}

- (NSArray)attributeNames
{
  return self->_attributeNames;
}

- (void)setAttributeNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeNames, 0);
  objc_storeStrong((id *)&self->_requestorVerificationToken, 0);
  objc_storeStrong((id *)&self->_appleVerificationToken, 0);
  objc_storeStrong((id *)&self->_currentAuthentication, 0);
  objc_storeStrong((id *)&self->_requestBody, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
}

@end