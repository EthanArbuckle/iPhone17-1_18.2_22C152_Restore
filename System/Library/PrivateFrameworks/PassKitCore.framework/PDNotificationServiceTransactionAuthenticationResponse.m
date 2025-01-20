@interface PDNotificationServiceTransactionAuthenticationResponse
- (NSData)signingCertificate;
- (PDNotificationServiceTransactionAuthenticationResponse)initWithData:(id)a3;
- (PKTransactionAuthenticationContext)updatedAuthenticationContext;
- (id)description;
- (int64_t)authenticationFailure;
- (int64_t)updatedTransactionStatus;
- (void)setAuthenticationFailure:(int64_t)a3;
- (void)setSigningCertificate:(id)a3;
- (void)setUpdatedAuthenticationContext:(id)a3;
- (void)setUpdatedTransactionStatus:(int64_t)a3;
@end

@implementation PDNotificationServiceTransactionAuthenticationResponse

- (PDNotificationServiceTransactionAuthenticationResponse)initWithData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v11 = 0;
    goto LABEL_13;
  }
  id v25 = 0;
  v5 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:&v25];
  id v6 = v25;
  if (v6)
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      v8 = "PDNotificationServiceTransactionAuthenticationResponse failed to parse response data with error: %@";
      v9 = v7;
      uint32_t v10 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "PDNotificationServiceTransactionAuthenticationResponse body is not a dictionary";
      v9 = v7;
      uint32_t v10 = 2;
      goto LABEL_10;
    }
LABEL_11:

    id v11 = 0;
    goto LABEL_12;
  }
  id v11 = v5;
LABEL_12:

LABEL_13:
  v12 = [v11 PKStringForKey:@"updatedTransactionStatus"];
  uint64_t v13 = PKPaymentTransactionStatusFromString();

  if (v13 == -1)
  {
    v15 = 0;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)PDNotificationServiceTransactionAuthenticationResponse;
    v14 = [(PDNotificationServiceTransactionAuthenticationResponse *)&v24 init];
    v15 = v14;
    if (v14)
    {
      v14->_updatedTransactionStatus = v13;
      v16 = [v11 PKStringForKey:@"authenticationError"];
      v15->_authenticationFailure = PKTransactionAuthenticationFailureFromString();

      id v17 = objc_alloc((Class)PKTransactionAuthenticationContext);
      v18 = [v11 PKDictionaryForKey:@"updatedAuthenticationDetails"];
      v19 = (PKTransactionAuthenticationContext *)[v17 initWithDictionary:v18];
      updatedAuthenticationContext = v15->_updatedAuthenticationContext;
      v15->_updatedAuthenticationContext = v19;

      self = [v11 PKStringForKey:@"signingCertificate"];
      if ([(PDNotificationServiceTransactionAuthenticationResponse *)self length])
      {
        v21 = (NSData *)[objc_alloc((Class)NSData) initWithBase64EncodedString:self options:0];
        signingCertificate = v15->_signingCertificate;
        v15->_signingCertificate = v21;
      }
    }
    else
    {
      self = 0;
    }
  }

  return v15;
}

- (id)description
{
  v3 = PKPaymentTransactionStatusToString();
  id v4 = PKTransactionAuthenticationFailureToString();
  v5 = +[NSString stringWithFormat:@"<TransactionAuthenticationResponse, updated transaction status: %@, authentication failure: %@, signing certificate: %tu bytes, updated authentication context: %@>", v3, v4, [(NSData *)self->_signingCertificate length], self->_updatedAuthenticationContext];

  return v5;
}

- (int64_t)updatedTransactionStatus
{
  return self->_updatedTransactionStatus;
}

- (void)setUpdatedTransactionStatus:(int64_t)a3
{
  self->_updatedTransactionStatus = a3;
}

- (PKTransactionAuthenticationContext)updatedAuthenticationContext
{
  return self->_updatedAuthenticationContext;
}

- (void)setUpdatedAuthenticationContext:(id)a3
{
}

- (int64_t)authenticationFailure
{
  return self->_authenticationFailure;
}

- (void)setAuthenticationFailure:(int64_t)a3
{
  self->_authenticationFailure = a3;
}

- (NSData)signingCertificate
{
  return self->_signingCertificate;
}

- (void)setSigningCertificate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingCertificate, 0);
  objc_storeStrong((id *)&self->_updatedAuthenticationContext, 0);
}

@end