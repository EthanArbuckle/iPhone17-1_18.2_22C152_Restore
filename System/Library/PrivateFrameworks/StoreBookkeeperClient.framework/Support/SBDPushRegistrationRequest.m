@interface SBDPushRegistrationRequest
+ (id)requestForDomain:(id)a3 optIn:(BOOL)a4 accountID:(id)a5 typeRegistrationURL:(id)a6;
- (BOOL)isEqualToRegistrationRequest:(id)a3;
- (BOOL)optIn;
- (NSNumber)storeAccountID;
- (NSString)domain;
- (SBDPushRegistrationRequest)initWithDomain:(id)a3 optIn:(BOOL)a4 accountID:(id)a5 typeRegistrationURL:(id)a6;
- (id)_requestPropertiesForDomain:(id)a3 optIn:(BOOL)a4 typeRegistrationURL:(id)a5;
@end

@implementation SBDPushRegistrationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_storeAccountID, 0);
}

- (BOOL)optIn
{
  return self->_optIn;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSNumber)storeAccountID
{
  return self->_storeAccountID;
}

- (BOOL)isEqualToRegistrationRequest:(id)a3
{
  v4 = (SBDPushRegistrationRequest *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      unsigned __int8 v12 = 1;
    }
    else
    {
      domain = self->_domain;
      v6 = [(SBDPushRegistrationRequest *)v4 domain];
      if ([(NSString *)domain isEqual:v6]
        && (BOOL optIn = self->_optIn, optIn == [(SBDPushRegistrationRequest *)v4 optIn]))
      {
        storeAccountID = self->_storeAccountID;
        v9 = [(SBDPushRegistrationRequest *)v4 storeAccountID];
        if ([(NSNumber *)storeAccountID isEqual:v9])
        {
          v10 = [(SBDPushRegistrationRequest *)self requestProperties];
          v11 = [(SBDPushRegistrationRequest *)v4 requestProperties];
          unsigned __int8 v12 = [v10 isEqual:v11];
        }
        else
        {
          unsigned __int8 v12 = 0;
        }
      }
      else
      {
        unsigned __int8 v12 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (id)_requestPropertiesForDomain:(id)a3 optIn:(BOOL)a4 typeRegistrationURL:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURL:v7];

  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  [v9 setITunesStoreRequest:1];
  if (qword_1000278D8 != -1) {
    dispatch_once(&qword_1000278D8, &stru_100021180);
  }
  v10 = +[NSString stringWithFormat:@"bookkeeperDomain:%@", v8];

  v11 = +[NSString stringWithFormat:@"%d", v5];
  v17[0] = @"guid";
  v17[1] = @"notification-type";
  v18[0] = qword_1000278D0;
  v18[1] = @"mzbookkeeper";
  v17[2] = @"put-parameters";
  v15 = v10;
  v16 = v11;
  unsigned __int8 v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v18[2] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  [v9 setRequestParameters:v13];
  return v9;
}

- (SBDPushRegistrationRequest)initWithDomain:(id)a3 optIn:(BOOL)a4 accountID:(id)a5 typeRegistrationURL:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  v13 = [(SBDPushRegistrationRequest *)self _requestPropertiesForDomain:v11 optIn:v8 typeRegistrationURL:a6];
  v17.receiver = self;
  v17.super_class = (Class)SBDPushRegistrationRequest;
  v14 = [(SBDPushRegistrationRequest *)&v17 initWithRequestProperties:v13];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_domain, a3);
    v15->_BOOL optIn = v8;
    objc_storeStrong((id *)&v15->_storeAccountID, a5);
  }

  return v15;
}

+ (id)requestForDomain:(id)a3 optIn:(BOOL)a4 accountID:(id)a5 typeRegistrationURL:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithDomain:v12 optIn:v7 accountID:v11 typeRegistrationURL:v10];

  return v13;
}

@end