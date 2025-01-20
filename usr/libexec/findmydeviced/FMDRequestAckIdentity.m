@interface FMDRequestAckIdentity
- (BOOL)canReplace:(id)a3;
- (FMDRequestAckIdentity)initWithProvider:(id)a3 identityCommand:(id)a4 commandFailureReason:(unint64_t)a5 ackURL:(id)a6;
- (FMDServiceProvider)provider;
- (NSDictionary)identityCommand;
- (NSString)failureDescription;
- (NSURL)ackURL;
- (id)requestBody;
- (id)requestUrl;
- (unint64_t)failureReason;
- (void)setAckURL:(id)a3;
- (void)setFailureDescription:(id)a3;
- (void)setFailureReason:(unint64_t)a3;
- (void)setIdentityCommand:(id)a3;
- (void)setProvider:(id)a3;
@end

@implementation FMDRequestAckIdentity

- (FMDRequestAckIdentity)initWithProvider:(id)a3 identityCommand:(id)a4 commandFailureReason:(unint64_t)a5 ackURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v10 account];
  v16.receiver = self;
  v16.super_class = (Class)FMDRequestAckIdentity;
  v14 = [(FMDRequest *)&v16 initWithAccount:v13];

  if (v14)
  {
    [(FMDRequestAckIdentity *)v14 setProvider:v10];
    [(FMDRequestAckIdentity *)v14 setIdentityCommand:v11];
    [(FMDRequestAckIdentity *)v14 setAckURL:v12];
    [(FMDRequestAckIdentity *)v14 setFailureReason:a5];
  }

  return v14;
}

- (id)requestUrl
{
  return [(FMDRequestAckIdentity *)self ackURL];
}

- (id)requestBody
{
  v15.receiver = self;
  v15.super_class = (Class)FMDRequestAckIdentity;
  v3 = [(FMDRequest *)&v15 requestBody];
  v4 = [(FMDRequestAckIdentity *)self provider];
  if (v4)
  {
    v5 = objc_alloc_init(FMDActingRequestDecorator);
    v6 = [(FMDActingRequestDecorator *)v5 standardDeviceContext];

    [v3 fm_safelyMapKey:@"deviceContext" toObject:v6];
    v7 = +[ServerDeviceInfo sharedInstance];
    v8 = [v4 account];
    v9 = [v7 deviceInfoForAccount:v8];
    [v3 fm_safelyMapKey:@"deviceInfo" toObject:v9];
  }
  [v3 setObject:&off_1002F1F90 forKeyedSubscript:@"statusCode"];
  id v10 = [(FMDRequestAckIdentity *)self identityCommand];
  [v3 setObject:v10 forKeyedSubscript:@"cmdContext"];

  if ([(FMDRequestAckIdentity *)self failureReason])
  {
    [v3 setObject:&off_1002F1FA8 forKeyedSubscript:@"statusCode"];
    id v11 = +[NSNumber numberWithUnsignedInteger:[(FMDRequestAckIdentity *)self failureReason]];
    [v3 setObject:v11 forKeyedSubscript:@"identityFailureReason"];

    id v12 = [(FMDRequestAckIdentity *)self failureDescription];

    if (v12)
    {
      v13 = [(FMDRequestAckIdentity *)self failureDescription];
      [v3 setObject:v13 forKeyedSubscript:@"failureDescription"];
    }
  }

  return v3;
}

- (BOOL)canReplace:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(FMDRequestAckIdentity *)self identityCommand];
      v7 = [v6 objectForKeyedSubscript:@"id"];
      v8 = [v5 identityCommand];
      v9 = [v8 objectForKeyedSubscript:@"id"];
      unsigned __int8 v10 = [v7 isEqualToString:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (NSString)failureDescription
{
  return self->_failureDescription;
}

- (void)setFailureDescription:(id)a3
{
}

- (FMDServiceProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (FMDServiceProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (NSDictionary)identityCommand
{
  return self->_identityCommand;
}

- (void)setIdentityCommand:(id)a3
{
}

- (NSURL)ackURL
{
  return self->_ackURL;
}

- (void)setAckURL:(id)a3
{
}

- (unint64_t)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(unint64_t)a3
{
  self->_failureReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackURL, 0);
  objc_storeStrong((id *)&self->_identityCommand, 0);
  objc_destroyWeak((id *)&self->_provider);

  objc_storeStrong((id *)&self->_failureDescription, 0);
}

@end