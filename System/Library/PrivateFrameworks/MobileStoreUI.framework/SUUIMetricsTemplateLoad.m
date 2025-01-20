@interface SUUIMetricsTemplateLoad
- (BOOL)responseWasCached;
- (NSDictionary)dictionaryRepresentation;
- (double)requestStartTime;
- (double)responseEndTime;
- (double)responseStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setRequestStartTime:(double)a3;
- (void)setResponseEndTime:(double)a3;
- (void)setResponseStartTime:(double)a3;
- (void)setResponseWasCached:(BOOL)a3;
@end

@implementation SUUIMetricsTemplateLoad

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(SUUIMetricsTemplateLoad *)self requestStartTime];
  objc_msgSend(v4, "setRequestStartTime:");
  [(SUUIMetricsTemplateLoad *)self responseStartTime];
  objc_msgSend(v4, "setResponseStartTime:");
  [(SUUIMetricsTemplateLoad *)self responseEndTime];
  objc_msgSend(v4, "setResponseEndTime:");
  objc_msgSend(v4, "setResponseWasCached:", -[SUUIMetricsTemplateLoad responseWasCached](self, "responseWasCached"));
  return v4;
}

- (NSDictionary)dictionaryRepresentation
{
  v10[4] = *MEMORY[0x263EF8340];
  v9[0] = @"requestStartTime";
  [(SUUIMetricsTemplateLoad *)self requestStartTime];
  v3 = +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v10[0] = v3;
  v9[1] = @"responseStartTime";
  [(SUUIMetricsTemplateLoad *)self responseStartTime];
  id v4 = +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v10[1] = v4;
  v9[2] = @"responseEndTime";
  [(SUUIMetricsTemplateLoad *)self responseEndTime];
  v5 = +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v10[2] = v5;
  v9[3] = @"responseWasCached";
  v6 = +[SUUIMetricsUtilities jsTimeFromTimeInterval:(double)[(SUUIMetricsTemplateLoad *)self responseWasCached]];
  v10[3] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

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

- (void)setResponseWasCached:(BOOL)a3
{
  self->_responseWasCached = a3;
}

@end