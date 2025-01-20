@interface FMDRequestAckTrack
- (BOOL)canReplace:(id)a3;
- (FMDAccount)account;
- (FMDRequestAckTrack)initWithAccount:(id)a3 trackCommand:(id)a4 ackURL:(id)a5;
- (NSDictionary)trackCommand;
- (NSURL)ackURL;
- (id)requestBody;
- (id)requestUrl;
- (void)setAccount:(id)a3;
- (void)setAckURL:(id)a3;
- (void)setTrackCommand:(id)a3;
@end

@implementation FMDRequestAckTrack

- (FMDRequestAckTrack)initWithAccount:(id)a3 trackCommand:(id)a4 ackURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestAckTrack;
  v11 = [(FMDRequest *)&v14 initWithAccount:v8];
  v12 = v11;
  if (v11)
  {
    [(FMDRequestAckTrack *)v11 setAccount:v8];
    [(FMDRequestAckTrack *)v12 setTrackCommand:v9];
    [(FMDRequestAckTrack *)v12 setAckURL:v10];
  }

  return v12;
}

- (id)requestUrl
{
  return [(FMDRequestAckTrack *)self ackURL];
}

- (id)requestBody
{
  v11.receiver = self;
  v11.super_class = (Class)FMDRequestAckTrack;
  v3 = [(FMDRequest *)&v11 requestBody];
  v4 = objc_alloc_init(FMDActingRequestDecorator);
  v5 = [(FMDActingRequestDecorator *)v4 standardDeviceContext];

  [v3 fm_safelyMapKey:@"deviceContext" toObject:v5];
  v6 = +[ServerDeviceInfo sharedInstance];
  v7 = [(FMDRequestAckTrack *)self account];
  id v8 = [v6 deviceInfoForAccount:v7];
  [v3 fm_safelyMapKey:@"deviceInfo" toObject:v8];

  [v3 setObject:&off_1002F1E40 forKeyedSubscript:@"statusCode"];
  id v9 = [(FMDRequestAckTrack *)self trackCommand];
  [v3 setObject:v9 forKeyedSubscript:@"cmdContext"];

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
      v6 = [(FMDRequestAckTrack *)self trackCommand];
      v7 = [v6 objectForKeyedSubscript:@"id"];
      id v8 = [v5 trackCommand];
      id v9 = [v8 objectForKeyedSubscript:@"id"];
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

- (NSDictionary)trackCommand
{
  return self->_trackCommand;
}

- (void)setTrackCommand:(id)a3
{
}

- (NSURL)ackURL
{
  return self->_ackURL;
}

- (void)setAckURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackURL, 0);
  objc_storeStrong((id *)&self->_trackCommand, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end