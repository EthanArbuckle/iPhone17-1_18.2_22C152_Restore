@interface PDNotificationServiceTransactionAuthenticationTask
+ (BOOL)supportsSecureCoding;
+ (id)transactionAuthenticationTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4 transactionServiceIdentifier:(id)a5 authenticationResultsData:(id)a6 signature:(id)a7;
- (BOOL)backoffComplete;
- (BOOL)isValid;
- (BOOL)matchesTask:(id)a3;
- (BOOL)pertainsToNotificationService:(id)a3 andDPANIdentifier:(id)a4;
- (NSData)authenticationResultsData;
- (NSData)signature;
- (NSString)dpanIdentifier;
- (NSString)transactionServiceIdentifier;
- (PDNotificationServiceTransactionAuthenticationTask)initWithCoder:(id)a3;
- (PDNotificationServiceTransactionAuthenticationTask)initWithNotificationService:(id)a3 dpanIdentifier:(id)a4 transactionServiceIdentifier:(id)a5 authenticationResultsData:(id)a6 signature:(id)a7;
- (id)_resultFromResponseData:(id)a3;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)method;
- (int64_t)taskType;
- (void)_reportAuthenticationFailure;
- (void)_reportForbiddenErrorResponse:(id)a3;
- (void)_reportUnexpectedResponseCode:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
@end

@implementation PDNotificationServiceTransactionAuthenticationTask

+ (id)transactionAuthenticationTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4 transactionServiceIdentifier:(id)a5 authenticationResultsData:(id)a6 signature:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [objc_alloc((Class)a1) initWithNotificationService:v16 dpanIdentifier:v15 transactionServiceIdentifier:v14 authenticationResultsData:v13 signature:v12];

  return v17;
}

- (PDNotificationServiceTransactionAuthenticationTask)initWithNotificationService:(id)a3 dpanIdentifier:(id)a4 transactionServiceIdentifier:(id)a5 authenticationResultsData:(id)a6 signature:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PDNotificationServiceTransactionAuthenticationTask;
  id v17 = [(PDNotificationServiceConnectionTask *)&v20 initWithNotificationService:a3];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_dpanIdentifier, a4);
    objc_storeStrong((id *)&v18->_transactionServiceIdentifier, a5);
    objc_storeStrong((id *)&v18->_authenticationResultsData, a6);
    objc_storeStrong((id *)&v18->_signature, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationServiceTransactionAuthenticationTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PDNotificationServiceTransactionAuthenticationTask;
  v5 = [(PDNotificationServiceConnectionTask *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dpanIdentifier"];
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionServiceIdentifier"];
    transactionServiceIdentifier = v5->_transactionServiceIdentifier;
    v5->_transactionServiceIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationResultsData"];
    authenticationResultsData = v5->_authenticationResultsData;
    v5->_authenticationResultsData = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (NSData *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDNotificationServiceTransactionAuthenticationTask;
  id v4 = a3;
  [(PDNotificationServiceConnectionTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_dpanIdentifier, @"dpanIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_transactionServiceIdentifier forKey:@"transactionServiceIdentifier"];
  [v4 encodeObject:self->_authenticationResultsData forKey:@"authenticationResultsData"];
  [v4 encodeObject:self->_signature forKey:@"signature"];
}

- (BOOL)isValid
{
  v3 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v4 = [v3 deviceIdentifier];

  objc_super v5 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v6 = [v5 serviceType];

  if (v4 && self->_dpanIdentifier && self->_transactionServiceIdentifier && self->_authenticationResultsData)
  {
    if (self->_signature) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    BOOL v8 = v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (int64_t)taskType
{
  return 3;
}

- (id)endpointComponents
{
  v3 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v4 = [v3 deviceIdentifier];

  if (v4
    && self->_dpanIdentifier
    && self->_transactionServiceIdentifier
    && ([(PDNotificationServiceConnectionTask *)self notificationService],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 serviceType],
        v5,
        !v6))
  {
    v11[0] = @"devices";
    v11[1] = v4;
    dpanIdentifier = self->_dpanIdentifier;
    v11[2] = @"dpan";
    v11[3] = dpanIdentifier;
    transactionServiceIdentifier = self->_transactionServiceIdentifier;
    v11[4] = @"transactions";
    v11[5] = transactionServiceIdentifier;
    v11[6] = @"authenticationResults";
    BOOL v7 = +[NSArray arrayWithObjects:v11 count:7];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)method
{
  return @"POST";
}

- (id)bodyDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = +[NSJSONSerialization JSONObjectWithData:self->_authenticationResultsData options:0 error:0];
  [v3 setObject:v4 forKey:@"authenticationResults"];

  objc_super v5 = [(NSData *)self->_signature base64EncodedStringWithOptions:0];
  [v3 setObject:v5 forKey:@"authenticationResultsSignature"];

  id v6 = [v3 copy];
  return v6;
}

- (id)description
{
  id v3 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v4 = [v3 deviceIdentifier];
  dpanIdentifier = self->_dpanIdentifier;
  transactionServiceIdentifier = self->_transactionServiceIdentifier;
  BOOL v7 = [(PDNotificationServiceConnectionTask *)self notificationService];
  BOOL v8 = [v7 serviceURL];
  v9 = +[NSString stringWithFormat:@"Transaction Authentication Task (Device ID: %@, DPAN ID: %@, Transaction ID: %@, Service URL: %@)", v4, dpanIdentifier, transactionServiceIdentifier, v8];

  return v9;
}

- (BOOL)matchesTask:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PDNotificationServiceTransactionAuthenticationTask;
  if ([(PDNotificationServiceConnectionTask *)&v23 matchesTask:v4])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(PDNotificationServiceTransactionAuthenticationTask *)self dpanIdentifier];
      BOOL v7 = [v5 dpanIdentifier];
      id v8 = v6;
      id v9 = v7;
      uint64_t v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        uint64_t v12 = v9;
        id v13 = v8;
        if (!v8 || !v9) {
          goto LABEL_20;
        }
        unsigned int v14 = [v8 isEqualToString:v9];

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      objc_super v15 = [(PDNotificationServiceTransactionAuthenticationTask *)self transactionServiceIdentifier];
      id v16 = [v5 transactionServiceIdentifier];
      id v13 = v15;
      id v17 = v16;
      uint64_t v12 = v17;
      if (v13 == v17)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        v18 = v17;
        v19 = v13;
        if (!v13 || !v17) {
          goto LABEL_19;
        }
        unsigned int v11 = [v13 isEqualToString:v17];

        if (!v11) {
          goto LABEL_20;
        }
      }
      v19 = [(PDNotificationServiceTransactionAuthenticationTask *)self authenticationResultsData];
      v18 = [v5 authenticationResultsData];
      if (PKEqualObjects())
      {
        v22 = [(PDNotificationServiceTransactionAuthenticationTask *)self signature];
        objc_super v20 = [v5 signature];
        LOBYTE(v11) = PKEqualObjects();
      }
      else
      {
        LOBYTE(v11) = 0;
      }
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
  }
  LOBYTE(v11) = 0;
LABEL_22:

  return v11;
}

- (BOOL)backoffComplete
{
  return 1;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = [a3 statusCode];
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 2048;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ got response with code %ld", (uint8_t *)&v11, 0x16u);
  }

  if (v7 == (id)403)
  {
    uint64_t v10 = [[PDNotificationServiceConnectionForbiddenErrorResponse alloc] initWithData:v6];
    [(PDNotificationServiceTransactionAuthenticationTask *)self _reportForbiddenErrorResponse:v10];
    [(PDNetworkTask *)self fail];
  }
  else if (v7 == (id)401)
  {
    [(PDNotificationServiceTransactionAuthenticationTask *)self _reportAuthenticationFailure];
    [(PDNetworkTask *)self failForAuthentication];
  }
  else if (v7 == (id)200)
  {
    id v9 = [(PDNotificationServiceTransactionAuthenticationTask *)self _resultFromResponseData:v6];
    [(PDNetworkTask *)self deliverResult:v9];

    [(PDNetworkTask *)self succeed];
  }
  else
  {
    [(PDNotificationServiceTransactionAuthenticationTask *)self _reportUnexpectedResponseCode:v7];
    [(PDNetworkTask *)self fail];
  }
}

- (void)handleError:(id)a3
{
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connection Error for Task: %@ (%@)", (uint8_t *)&v6, 0x16u);
  }

  [(PDNetworkTask *)self fail];
}

- (BOOL)pertainsToNotificationService:(id)a3 andDPANIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = [(PDNotificationServiceConnectionTask *)self notificationService];
  unsigned int v9 = [v8 isEqual:v7];

  if (v9)
  {
    uint64_t v10 = [(PDNotificationServiceTransactionAuthenticationTask *)self dpanIdentifier];
    unsigned __int8 v11 = [v10 isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)_reportAuthenticationFailure
{
  PDTaskError(0, self, 0, @"Authentication failure", v2, v3, v4, v5, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(PDNetworkTask *)self reportError:v8];
}

- (void)_reportUnexpectedResponseCode:(int64_t)a3
{
  PDTaskError(1, self, 0, @"Unexpected response code %ld", v3, v4, v5, v6, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(PDNetworkTask *)self reportError:v8];
}

- (void)_reportForbiddenErrorResponse:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 errorCode];
      uint64_t v7 = [v4 serverDebugDescription];
      *(_DWORD *)buf = 138412802;
      id v16 = self;
      __int16 v17 = 2048;
      id v18 = v6;
      __int16 v19 = 2112;
      objc_super v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ got forbidden error code %ld, %@", buf, 0x20u);
    }
    id v8 = [v4 errorCode];
    unsigned int v9 = [v4 serverDebugDescription];
    id v14 = PDTaskError((uint64_t)v8, self, 0, @"%@", v10, v11, v12, v13, (uint64_t)v9);
    [(PDNetworkTask *)self reportError:v14];
  }
}

- (id)_resultFromResponseData:(id)a3
{
  id v3 = a3;
  id v4 = [[PDNotificationServiceTransactionAuthenticationResponse alloc] initWithData:v3];

  return v4;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (NSString)transactionServiceIdentifier
{
  return self->_transactionServiceIdentifier;
}

- (NSData)authenticationResultsData
{
  return self->_authenticationResultsData;
}

- (NSData)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authenticationResultsData, 0);
  objc_storeStrong((id *)&self->_transactionServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end