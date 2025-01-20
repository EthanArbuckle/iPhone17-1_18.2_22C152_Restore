@interface SKUIMetricsTemplateLoad
- (BOOL)responseWasCached;
- (NSDictionary)dictionaryRepresentation;
- (double)requestStartTime;
- (double)responseEndTime;
- (double)responseStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dictionaryRepresentation;
- (void)setRequestStartTime:(double)a3;
- (void)setResponseEndTime:(double)a3;
- (void)setResponseStartTime:(double)a3;
- (void)setResponseWasCached:(BOOL)a3;
@end

@implementation SKUIMetricsTemplateLoad

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMetricsTemplateLoad copyWithZone:]();
  }
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(SKUIMetricsTemplateLoad *)self requestStartTime];
  objc_msgSend(v4, "setRequestStartTime:");
  [(SKUIMetricsTemplateLoad *)self responseStartTime];
  objc_msgSend(v4, "setResponseStartTime:");
  [(SKUIMetricsTemplateLoad *)self responseEndTime];
  objc_msgSend(v4, "setResponseEndTime:");
  objc_msgSend(v4, "setResponseWasCached:", -[SKUIMetricsTemplateLoad responseWasCached](self, "responseWasCached"));
  return v4;
}

- (NSDictionary)dictionaryRepresentation
{
  v10[4] = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMetricsTemplateLoad dictionaryRepresentation]();
  }
  v9[0] = @"requestStartTime";
  [(SKUIMetricsTemplateLoad *)self requestStartTime];
  v3 = +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v10[0] = v3;
  v9[1] = @"responseStartTime";
  [(SKUIMetricsTemplateLoad *)self responseStartTime];
  id v4 = +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v10[1] = v4;
  v9[2] = @"responseEndTime";
  [(SKUIMetricsTemplateLoad *)self responseEndTime];
  v5 = +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v10[2] = v5;
  v9[3] = @"responseWasCached";
  v6 = +[SKUIMetricsUtilities jsTimeFromTimeInterval:(double)[(SKUIMetricsTemplateLoad *)self responseWasCached]];
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

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

- (void)copyWithZone:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMetricsTemplateLoad copyWithZone:]";
}

- (void)dictionaryRepresentation
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMetricsTemplateLoad dictionaryRepresentation]";
}

@end