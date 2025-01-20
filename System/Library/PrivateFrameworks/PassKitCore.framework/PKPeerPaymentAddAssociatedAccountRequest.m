@interface PKPeerPaymentAddAssociatedAccountRequest
- (NSString)altDSID;
- (NSString)firstName;
- (NSString)lastName;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (unint64_t)role;
- (void)setAltDSID:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setRole:(unint64_t)a3;
@end

@implementation PKPeerPaymentAddAssociatedAccountRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v18 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    int v24 = 138543618;
    v25 = v20;
    __int16 v26 = 2082;
    v27 = "url";
LABEL_17:
    _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v24, 0x16u);

    goto LABEL_18;
  }
  if (!v7)
  {
    v18 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    v21 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v21);
    int v24 = 138543618;
    v25 = v20;
    __int16 v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_17;
  }
  if (!self->_altDSID)
  {
    v18 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v22);
      int v24 = 138543618;
      v25 = v20;
      __int16 v26 = 2082;
      v27 = "_altDSID";
      goto LABEL_17;
    }
LABEL_18:

    v17 = 0;
    goto LABEL_19;
  }
  v9 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:&unk_1EE22B660 queryParameters:0 appleAccountInformation:v7];
  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  v11 = v10;
  altDSID = self->_altDSID;
  if (altDSID) {
    [v10 setObject:altDSID forKey:@"altDSID"];
  }
  firstName = self->_firstName;
  if (firstName) {
    [v11 setObject:firstName forKey:@"firstName"];
  }
  lastName = self->_lastName;
  if (lastName) {
    [v11 setObject:lastName forKey:@"lastName"];
  }
  v15 = PKPeerPaymentAccountRoleToString(self->_role);
  [v11 setObject:v15 forKey:@"role"];

  v16 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v11];
  [v9 setHTTPBody:v16];

  v17 = (void *)[v9 copy];
LABEL_19:

  return v17;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end