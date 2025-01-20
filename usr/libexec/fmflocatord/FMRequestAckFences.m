@interface FMRequestAckFences
- (BOOL)canReplace:(id)a3;
- (FMRequestAckFences)initWithProvider:(id)a3 fencesCommand:(id)a4 ackURL:(id)a5;
- (NSDictionary)fencesCommand;
- (NSURL)ackURL;
- (id)requestBody;
- (id)requestUrl;
- (void)deinitializeRequest;
- (void)setAckURL:(id)a3;
- (void)setFencesCommand:(id)a3;
@end

@implementation FMRequestAckFences

- (void)deinitializeRequest
{
  v3.receiver = self;
  v3.super_class = (Class)FMRequestAckFences;
  [(FMRequest *)&v3 deinitializeRequest];
  [(FMRequestAckFences *)self setFencesCommand:0];
  [(FMRequestAckFences *)self setAckURL:0];
}

- (FMRequestAckFences)initWithProvider:(id)a3 fencesCommand:(id)a4 ackURL:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FMRequestAckFences;
  v10 = [(FMRequest *)&v13 initWithProvider:a3];
  v11 = v10;
  if (v10)
  {
    [(FMRequestAckFences *)v10 setFencesCommand:v8];
    [(FMRequestAckFences *)v11 setAckURL:v9];
  }

  return v11;
}

- (id)requestUrl
{
  return [(FMRequestAckFences *)self ackURL];
}

- (id)requestBody
{
  v10.receiver = self;
  v10.super_class = (Class)FMRequestAckFences;
  objc_super v3 = [(FMRequest *)&v10 requestBody];
  v4 = [(FMRequest *)self provider];
  v5 = [v4 standardDeviceContext];
  [v3 setObject:v5 forKeyedSubscript:@"deviceContext"];

  v6 = [(FMRequest *)self provider];
  v7 = [v6 fullDeviceInfo];
  [v3 setObject:v7 forKeyedSubscript:@"deviceInfo"];

  [v3 setObject:@"OK" forKeyedSubscript:@"statusMessage"];
  [v3 setObject:&off_10005EF00 forKeyedSubscript:@"statusCode"];
  id v8 = [(FMRequestAckFences *)self fencesCommand];
  [v3 setObject:v8 forKeyedSubscript:@"cmdContext"];

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
      v6 = [(FMRequest *)self delegate];
      v7 = [v5 delegate];
      if (v6 == v7)
      {
        id v9 = [(FMRequestAckFences *)self fencesCommand];
        objc_super v10 = [v9 objectForKeyedSubscript:@"id"];
        v11 = [v5 fencesCommand];
        v12 = [v11 objectForKeyedSubscript:@"id"];
        unsigned __int8 v8 = [v10 isEqualToString:v12];
      }
      else
      {
        unsigned __int8 v8 = 0;
      }
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NSDictionary)fencesCommand
{
  return self->_fencesCommand;
}

- (void)setFencesCommand:(id)a3
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

  objc_storeStrong((id *)&self->_fencesCommand, 0);
}

@end