@interface SUUIMetricsDOMChange
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromDeferredMessage;
- (NSDictionary)dictionaryRepresentation;
- (SUUIMetricsDOMChange)initWithReportDomBuildTimesMessagePayload:(id)a3;
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

@implementation SUUIMetricsDOMChange

- (SUUIMetricsDOMChange)initWithReportDomBuildTimesMessagePayload:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"buildStartTime"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"buildEndTime"];
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = [(SUUIMetricsDOMChange *)self init];
    if (v9)
    {
      +[SUUIMetricsUtilities timeIntervalFromJSTime:v5];
      -[SUUIMetricsDOMChange setBuildStartTime:](v9, "setBuildStartTime:");
      +[SUUIMetricsUtilities timeIntervalFromJSTime:v7];
      -[SUUIMetricsDOMChange setBuildEndTime:](v9, "setBuildEndTime:");
      v10 = [v4 objectForKeyedSubscript:@"messageWasDeferred"];
      -[SUUIMetricsDOMChange setFromDeferredMessage:](v9, "setFromDeferredMessage:", [v10 BOOLValue]);
    }
    self = v9;
    v8 = self;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(SUUIMetricsDOMChange *)self buildStartTime];
  objc_msgSend(v4, "setBuildStartTime:");
  [(SUUIMetricsDOMChange *)self buildEndTime];
  objc_msgSend(v4, "setBuildEndTime:");
  [(SUUIMetricsDOMChange *)self renderStartTime];
  objc_msgSend(v4, "setRenderStartTime:");
  [(SUUIMetricsDOMChange *)self renderEndTime];
  objc_msgSend(v4, "setRenderEndTime:");
  objc_msgSend(v4, "setFromDeferredMessage:", -[SUUIMetricsDOMChange isFromDeferredMessage](self, "isFromDeferredMessage"));
  return v4;
}

- (NSDictionary)dictionaryRepresentation
{
  v10[4] = *MEMORY[0x263EF8340];
  v9[0] = @"buildStartTime";
  [(SUUIMetricsDOMChange *)self buildStartTime];
  v3 = +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v10[0] = v3;
  v9[1] = @"buildEndTime";
  [(SUUIMetricsDOMChange *)self buildEndTime];
  id v4 = +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v10[1] = v4;
  v9[2] = @"renderStartTime";
  [(SUUIMetricsDOMChange *)self renderStartTime];
  v5 = +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v10[2] = v5;
  v9[3] = @"renderEndTime";
  [(SUUIMetricsDOMChange *)self renderEndTime];
  uint64_t v6 = +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v10[3] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return (NSDictionary *)v7;
}

- (unint64_t)hash
{
  [(SUUIMetricsDOMChange *)self buildStartTime];
  unint64_t v4 = (unint64_t)v3;
  [(SUUIMetricsDOMChange *)self buildEndTime];
  unint64_t v6 = v4 + 10 * (unint64_t)v5;
  [(SUUIMetricsDOMChange *)self renderStartTime];
  unint64_t v8 = v6 + 100 * (unint64_t)v7;
  [(SUUIMetricsDOMChange *)self renderEndTime];
  unint64_t v10 = v8 + 1000 * (unint64_t)v9;
  BOOL v11 = [(SUUIMetricsDOMChange *)self isFromDeferredMessage];
  uint64_t v12 = 10000;
  if (!v11) {
    uint64_t v12 = 0;
  }
  return v10 + v12;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SUUIMetricsDOMChange *)a3;
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
      [(SUUIMetricsDOMChange *)self buildStartTime];
      double v7 = v6;
      [(SUUIMetricsDOMChange *)v5 buildStartTime];
      if (v7 != v8) {
        goto LABEL_10;
      }
      [(SUUIMetricsDOMChange *)self buildEndTime];
      double v10 = v9;
      [(SUUIMetricsDOMChange *)v5 buildEndTime];
      if (v10 != v11) {
        goto LABEL_10;
      }
      [(SUUIMetricsDOMChange *)self renderStartTime];
      double v13 = v12;
      [(SUUIMetricsDOMChange *)v5 renderStartTime];
      if (v13 == v14
        && ([(SUUIMetricsDOMChange *)self renderEndTime],
            double v16 = v15,
            [(SUUIMetricsDOMChange *)v5 renderEndTime],
            v16 == v17))
      {
        BOOL v18 = [(SUUIMetricsDOMChange *)self isFromDeferredMessage];
        BOOL v19 = v18 ^ [(SUUIMetricsDOMChange *)v5 isFromDeferredMessage] ^ 1;
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
  [(SUUIMetricsDOMChange *)self buildStartTime];
  uint64_t v7 = v6;
  [(SUUIMetricsDOMChange *)self buildEndTime];
  uint64_t v9 = v8;
  [(SUUIMetricsDOMChange *)self renderStartTime];
  uint64_t v11 = v10;
  [(SUUIMetricsDOMChange *)self renderEndTime];
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

@end