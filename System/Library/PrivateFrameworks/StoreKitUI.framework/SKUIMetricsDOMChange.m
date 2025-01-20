@interface SKUIMetricsDOMChange
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromDeferredMessage;
- (NSDictionary)dictionaryRepresentation;
- (SKUIMetricsDOMChange)initWithReportDomBuildTimesMessagePayload:(id)a3;
- (double)buildEndTime;
- (double)buildStartTime;
- (double)renderEndTime;
- (double)renderStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setBuildEndTime:(double)a3;
- (void)setBuildStartTime:(double)a3;
- (void)setFromDeferredMessage:(BOOL)a3;
- (void)setRenderEndTime:(double)a3;
- (void)setRenderStartTime:(double)a3;
@end

@implementation SKUIMetricsDOMChange

- (SKUIMetricsDOMChange)initWithReportDomBuildTimesMessagePayload:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIMetricsDOMChange initWithReportDomBuildTimesMessagePayload:]();
  }
  v5 = [v4 objectForKeyedSubscript:@"buildStartTime"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"buildEndTime"];
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = [(SKUIMetricsDOMChange *)self init];
    if (v9)
    {
      +[SKUIMetricsUtilities timeIntervalFromJSTime:v5];
      -[SKUIMetricsDOMChange setBuildStartTime:](v9, "setBuildStartTime:");
      +[SKUIMetricsUtilities timeIntervalFromJSTime:v7];
      -[SKUIMetricsDOMChange setBuildEndTime:](v9, "setBuildEndTime:");
      v10 = [v4 objectForKeyedSubscript:@"messageWasDeferred"];
      -[SKUIMetricsDOMChange setFromDeferredMessage:](v9, "setFromDeferredMessage:", [v10 BOOLValue]);
    }
    self = v9;
    v8 = self;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(SKUIMetricsDOMChange *)self buildStartTime];
  objc_msgSend(v4, "setBuildStartTime:");
  [(SKUIMetricsDOMChange *)self buildEndTime];
  objc_msgSend(v4, "setBuildEndTime:");
  [(SKUIMetricsDOMChange *)self renderStartTime];
  objc_msgSend(v4, "setRenderStartTime:");
  [(SKUIMetricsDOMChange *)self renderEndTime];
  objc_msgSend(v4, "setRenderEndTime:");
  objc_msgSend(v4, "setFromDeferredMessage:", -[SKUIMetricsDOMChange isFromDeferredMessage](self, "isFromDeferredMessage"));
  return v4;
}

- (NSDictionary)dictionaryRepresentation
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"buildStartTime";
  [(SKUIMetricsDOMChange *)self buildStartTime];
  v3 = +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v10[0] = v3;
  v9[1] = @"buildEndTime";
  [(SKUIMetricsDOMChange *)self buildEndTime];
  id v4 = +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v10[1] = v4;
  v9[2] = @"renderStartTime";
  [(SKUIMetricsDOMChange *)self renderStartTime];
  v5 = +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v10[2] = v5;
  v9[3] = @"renderEndTime";
  [(SKUIMetricsDOMChange *)self renderEndTime];
  uint64_t v6 = +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return (NSDictionary *)v7;
}

- (unint64_t)hash
{
  [(SKUIMetricsDOMChange *)self buildStartTime];
  unint64_t v4 = (unint64_t)v3;
  [(SKUIMetricsDOMChange *)self buildEndTime];
  unint64_t v6 = v4 + 10 * (unint64_t)v5;
  [(SKUIMetricsDOMChange *)self renderStartTime];
  unint64_t v8 = v6 + 100 * (unint64_t)v7;
  [(SKUIMetricsDOMChange *)self renderEndTime];
  unint64_t v10 = v8 + 1000 * (unint64_t)v9;
  BOOL v11 = [(SKUIMetricsDOMChange *)self isFromDeferredMessage];
  uint64_t v12 = 10000;
  if (!v11) {
    uint64_t v12 = 0;
  }
  return v10 + v12;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SKUIMetricsDOMChange *)a3;
  if (self == v4)
  {
    LOBYTE(v19) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      [(SKUIMetricsDOMChange *)self buildStartTime];
      double v7 = v6;
      [(SKUIMetricsDOMChange *)v5 buildStartTime];
      if (v7 != v8) {
        goto LABEL_10;
      }
      [(SKUIMetricsDOMChange *)self buildEndTime];
      double v10 = v9;
      [(SKUIMetricsDOMChange *)v5 buildEndTime];
      if (v10 != v11) {
        goto LABEL_10;
      }
      [(SKUIMetricsDOMChange *)self renderStartTime];
      double v13 = v12;
      [(SKUIMetricsDOMChange *)v5 renderStartTime];
      if (v13 == v14
        && ([(SKUIMetricsDOMChange *)self renderEndTime],
            double v16 = v15,
            [(SKUIMetricsDOMChange *)v5 renderEndTime],
            v16 == v17))
      {
        BOOL v18 = [(SKUIMetricsDOMChange *)self isFromDeferredMessage];
        BOOL v19 = v18 ^ [(SKUIMetricsDOMChange *)v5 isFromDeferredMessage] ^ 1;
      }
      else
      {
LABEL_10:
        LOBYTE(v19) = 0;
      }
    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }

  return v19;
}

- (id)description
{
  double v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [(SKUIMetricsDOMChange *)self buildStartTime];
  uint64_t v7 = v6;
  [(SKUIMetricsDOMChange *)self buildEndTime];
  uint64_t v9 = v8;
  [(SKUIMetricsDOMChange *)self renderStartTime];
  uint64_t v11 = v10;
  [(SKUIMetricsDOMChange *)self renderEndTime];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; buildStartTime = %f; buildEndTime = %f; renderStartTime = %f; renderEndTime = %f>",
    v5,
    self,
    v7,
    v9,
    v11,
  double v13 = v12);

  return v13;
}

- (double)buildStartTime
{
  return self->_buildStartTime;
}

- (void)setBuildStartTime:(double)a3
{
  self->_buildStartTime = a3;
}

- (double)buildEndTime
{
  return self->_buildEndTime;
}

- (void)setBuildEndTime:(double)a3
{
  self->_buildEndTime = a3;
}

- (double)renderStartTime
{
  return self->_renderStartTime;
}

- (void)setRenderStartTime:(double)a3
{
  self->_renderStartTime = a3;
}

- (double)renderEndTime
{
  return self->_renderEndTime;
}

- (void)setRenderEndTime:(double)a3
{
  self->_renderEndTime = a3;
}

- (BOOL)isFromDeferredMessage
{
  return self->_fromDeferredMessage;
}

- (void)setFromDeferredMessage:(BOOL)a3
{
  self->_fromDeferredMessage = a3;
}

- (void)initWithReportDomBuildTimesMessagePayload:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMetricsDOMChange initWithReportDomBuildTimesMessagePayload:]";
}

@end