@interface PCCRequest
- (NSDictionary)options;
- (NSString)event;
- (NSString)jid;
- (NSString)type;
- (PCCRequest)initWithMessage:(id)a3 options:(id)a4;
- (id)callback;
- (id)description;
- (void)setCallback:(id)a3;
@end

@implementation PCCRequest

- (PCCRequest)initWithMessage:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PCCRequest;
  v8 = [(PCCRequest *)&v21 init];
  if (v8)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"jobId"];
    jid = v8->_jid;
    v8->_jid = (NSString *)v9;

    uint64_t v11 = [v6 objectForKeyedSubscript:@"messageType"];
    type = v8->_type;
    v8->_type = (NSString *)v11;

    if ([(NSString *)v8->_type isEqualToString:@"initiateLogTransfer"])
    {
      v13 = [v6 objectForKeyedSubscript:@"logFile"];

      if (v13)
      {
        v14 = @"xfer-file";
      }
      else
      {
        v15 = [v6 objectForKeyedSubscript:@"allFiles"];
        int v16 = [v15 BOOLValue];

        v14 = @"xfer-group";
        if (v16) {
          v14 = @"xfer-all";
        }
      }
      v17 = v8->_type;
      v8->_type = &v14->isa;

      uint64_t v18 = [v6 objectForKeyedSubscript:@"jobEvent"];
      event = v8->_event;
      v8->_event = (NSString *)v18;
    }
    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ %@", self->_jid, self->_type];
}

- (NSString)jid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)callback
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setCallback:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_jid, 0);
}

@end