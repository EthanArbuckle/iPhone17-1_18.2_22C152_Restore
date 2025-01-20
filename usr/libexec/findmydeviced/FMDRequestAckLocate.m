@interface FMDRequestAckLocate
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (FMDAccount)account;
- (FMDRequestAckLocate)initWithAccount:(id)a3 locateCommand:(id)a4 ackURL:(id)a5 cmdStatusCode:(int64_t)a6 cmdStatusMessage:(id)a7;
- (NSDictionary)locateCommand;
- (NSString)cmdStatusMsg;
- (NSURL)ackURL;
- (id)requestBody;
- (id)requestUrl;
- (int64_t)cmdStatusCode;
- (void)setAccount:(id)a3;
- (void)setAckURL:(id)a3;
- (void)setCmdStatusCode:(int64_t)a3;
- (void)setCmdStatusMsg:(id)a3;
- (void)setLocateCommand:(id)a3;
@end

@implementation FMDRequestAckLocate

- (FMDRequestAckLocate)initWithAccount:(id)a3 locateCommand:(id)a4 ackURL:(id)a5 cmdStatusCode:(int64_t)a6 cmdStatusMessage:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)FMDRequestAckLocate;
  v16 = [(FMDRequest *)&v19 initWithAccount:v12];
  v17 = v16;
  if (v16)
  {
    [(FMDRequestAckLocate *)v16 setAccount:v12];
    [(FMDRequestAckLocate *)v17 setLocateCommand:v13];
    [(FMDRequestAckLocate *)v17 setAckURL:v14];
    [(FMDRequestAckLocate *)v17 setCmdStatusCode:a6];
    [(FMDRequestAckLocate *)v17 setCmdStatusMsg:v15];
  }

  return v17;
}

- (id)requestUrl
{
  return [(FMDRequestAckLocate *)self ackURL];
}

- (id)requestBody
{
  v19.receiver = self;
  v19.super_class = (Class)FMDRequestAckLocate;
  v3 = [(FMDRequest *)&v19 requestBody];
  v4 = +[NSNumber numberWithInteger:[(FMDRequestAckLocate *)self cmdStatusCode]];
  [v3 setObject:v4 forKeyedSubscript:@"statusCode"];

  v5 = [(FMDRequestAckLocate *)self cmdStatusMsg];

  if (v5)
  {
    v6 = [(FMDRequestAckLocate *)self cmdStatusMsg];
    [v3 setObject:v6 forKeyedSubscript:@"statusMessage"];
  }
  v7 = +[NSMutableDictionary dictionary];
  v8 = [(FMDRequestAckLocate *)self locateCommand];
  v9 = [v8 objectForKeyedSubscript:@"id"];
  [v7 fm_safelyMapKey:@"id" toObject:v9];

  v10 = [(FMDRequestAckLocate *)self locateCommand];
  v11 = [v10 objectForKeyedSubscript:@"enqueueTimestamp"];
  [v7 fm_safelyMapKey:@"enqueueTimestamp" toObject:v11];

  id v12 = [(FMDRequestAckLocate *)self locateCommand];
  id v13 = [v12 objectForKeyedSubscript:@"responseTimeStamp"];
  [v7 fm_safelyMapKey:@"responseTimeStamp" toObject:v13];

  id v14 = [(FMDRequestAckLocate *)self locateCommand];
  id v15 = [v14 objectForKeyedSubscript:@"cmd"];
  [v7 fm_safelyMapKey:@"cmd" toObject:v15];

  v16 = [(FMDRequestAckLocate *)self locateCommand];
  v17 = [v16 objectForKeyedSubscript:@"desiredAccuracy"];
  [v7 fm_safelyMapKey:@"desiredAccuracy" toObject:v17];

  [v3 setObject:v7 forKeyedSubscript:@"cmdContext"];

  return v3;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
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
      v6 = [(FMDRequestAckLocate *)self locateCommand];
      v7 = [v6 objectForKeyedSubscript:@"id"];
      v8 = [v5 locateCommand];
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

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSDictionary)locateCommand
{
  return self->_locateCommand;
}

- (void)setLocateCommand:(id)a3
{
}

- (NSURL)ackURL
{
  return self->_ackURL;
}

- (void)setAckURL:(id)a3
{
}

- (int64_t)cmdStatusCode
{
  return self->_cmdStatusCode;
}

- (void)setCmdStatusCode:(int64_t)a3
{
  self->_cmdStatusCode = a3;
}

- (NSString)cmdStatusMsg
{
  return self->_cmdStatusMsg;
}

- (void)setCmdStatusMsg:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmdStatusMsg, 0);
  objc_storeStrong((id *)&self->_ackURL, 0);
  objc_storeStrong((id *)&self->_locateCommand, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end