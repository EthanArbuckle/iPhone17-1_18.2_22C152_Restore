@interface PKPaymentNotificationActionRequest
- (NSString)action;
- (NSString)requestID;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setAction:(id)a3;
- (void)setRequestID:(id)a3;
@end

@implementation PKPaymentNotificationActionRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v21 = @"devices";
  id v22 = v8;
  v23 = @"notificationAction";
  v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 arrayWithObjects:&v21 count:3];
  v13 = -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v10, v21, v22, v23, v24);

  v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v15 = v14;
  action = self->_action;
  if (action) {
    [v14 setObject:action forKey:@"action"];
  }
  requestID = self->_requestID;
  if (requestID) {
    [v15 setObject:requestID forKey:@"requestId"];
  }
  v18 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v15];
  [v13 setHTTPBody:v18];

  [v13 setHTTPMethod:@"POST"];
  v19 = (void *)[v13 copy];

  return v19;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end