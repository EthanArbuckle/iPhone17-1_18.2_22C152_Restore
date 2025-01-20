@interface SUUIMetricsRequestInfo
- (BOOL)hasResponseWasCachedValue;
- (BOOL)responseWasCached;
- (NSDictionary)dictionaryRepresentation;
- (SUUIMetricsRequestInfo)initWithReportRequestTimesMessagePayload:(id)a3;
- (double)requestStartTime;
- (double)responseEndTime;
- (double)responseStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setHasResponseWasCachedValue:(BOOL)a3;
- (void)setRequestStartTime:(double)a3;
- (void)setResponseEndTime:(double)a3;
- (void)setResponseStartTime:(double)a3;
- (void)setResponseWasCached:(BOOL)a3;
@end

@implementation SUUIMetricsRequestInfo

- (SUUIMetricsRequestInfo)initWithReportRequestTimesMessagePayload:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"requestStartTime"];
  v6 = [v4 objectForKeyedSubscript:@"responseStartTime"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"responseEndTime"];
  v8 = (void *)v7;
  v9 = 0;
  if (v5 && v6 && v7)
  {
    v10 = [(SUUIMetricsRequestInfo *)self init];
    if (v10)
    {
      +[SUUIMetricsUtilities timeIntervalFromJSTime:v5];
      -[SUUIMetricsRequestInfo setRequestStartTime:](v10, "setRequestStartTime:");
      +[SUUIMetricsUtilities timeIntervalFromJSTime:v6];
      -[SUUIMetricsRequestInfo setResponseStartTime:](v10, "setResponseStartTime:");
      +[SUUIMetricsUtilities timeIntervalFromJSTime:v8];
      -[SUUIMetricsRequestInfo setResponseEndTime:](v10, "setResponseEndTime:");
      v11 = [v4 objectForKeyedSubscript:@"responseWasCached"];

      if (v11)
      {
        v12 = [v4 objectForKeyedSubscript:@"responseWasCached"];
        -[SUUIMetricsRequestInfo setResponseWasCached:](v10, "setResponseWasCached:", [v12 BOOLValue]);
      }
    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(SUUIMetricsRequestInfo *)self requestStartTime];
  objc_msgSend(v4, "setRequestStartTime:");
  [(SUUIMetricsRequestInfo *)self responseStartTime];
  objc_msgSend(v4, "setResponseStartTime:");
  [(SUUIMetricsRequestInfo *)self responseEndTime];
  objc_msgSend(v4, "setResponseEndTime:");
  if ([(SUUIMetricsRequestInfo *)self hasResponseWasCachedValue])
  {
    objc_msgSend(v4, "setResponseWasCached:", -[SUUIMetricsRequestInfo responseWasCached](self, "responseWasCached"));
    [v4 setHasResponseWasCachedValue:1];
  }
  return v4;
}

- (void)setResponseWasCached:(BOOL)a3
{
  self->_responseWasCached = a3;
  [(SUUIMetricsRequestInfo *)self setHasResponseWasCachedValue:1];
}

- (NSDictionary)dictionaryRepresentation
{
  v12[4] = *MEMORY[0x263EF8340];
  if ([(SUUIMetricsRequestInfo *)self hasResponseWasCachedValue])
  {
    v11[0] = @"requestStartTime";
    [(SUUIMetricsRequestInfo *)self requestStartTime];
    v3 = +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v12[0] = v3;
    v11[1] = @"responseStartTime";
    [(SUUIMetricsRequestInfo *)self responseStartTime];
    id v4 = +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v12[1] = v4;
    v11[2] = @"responseEndTime";
    [(SUUIMetricsRequestInfo *)self responseEndTime];
    v5 = +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v12[2] = v5;
    v11[3] = @"responseWasCached";
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SUUIMetricsRequestInfo responseWasCached](self, "responseWasCached"));
    v12[3] = v6;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  }
  else
  {
    v9[0] = @"requestStartTime";
    [(SUUIMetricsRequestInfo *)self requestStartTime];
    v3 = +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v10[0] = v3;
    v9[1] = @"responseStartTime";
    [(SUUIMetricsRequestInfo *)self responseStartTime];
    id v4 = +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v10[1] = v4;
    v9[2] = @"responseEndTime";
    [(SUUIMetricsRequestInfo *)self responseEndTime];
    v5 = +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v10[2] = v5;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  }

  return (NSDictionary *)v7;
}

- (double)requestStartTime
{
  return self->_requestStartTime;
}

- (void)setRequestStartTime:(double)a3
{
  self->_requestStartTime = a3;
}

- (double)responseStartTime
{
  return self->_responseStartTime;
}

- (void)setResponseStartTime:(double)a3
{
  self->_responseStartTime = a3;
}

- (double)responseEndTime
{
  return self->_responseEndTime;
}

- (void)setResponseEndTime:(double)a3
{
  self->_responseEndTime = a3;
}

- (BOOL)responseWasCached
{
  return self->_responseWasCached;
}

- (BOOL)hasResponseWasCachedValue
{
  return self->_hasResponseWasCachedValue;
}

- (void)setHasResponseWasCachedValue:(BOOL)a3
{
  self->_hasResponseWasCachedValue = a3;
}

@end