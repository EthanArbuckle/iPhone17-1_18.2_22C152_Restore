@interface SSMetricsPageEvent
- (BOOL)connectionReused;
- (BOOL)isCachedResponse;
- (BOOL)isUbered;
- (BOOL)xpSamplingForced;
- (NSString)clientCorrelationKey;
- (NSString)navigationType;
- (NSString)pageHistoryDescription;
- (NSString)referringAppName;
- (NSString)referringURL;
- (NSString)searchTerm;
- (NSString)serverApplicationInstance;
- (NSString)serverTiming;
- (SSMetricsPageEvent)init;
- (double)connectionEndTime;
- (double)connectionStartTime;
- (double)domainLookupEndTime;
- (double)domainLookupStartTime;
- (double)fetchStartTime;
- (double)pageRenderTime;
- (double)redirectEndTime;
- (double)redirectStartTime;
- (double)requestEndTime;
- (double)requestStartTime;
- (double)responseEndTime;
- (double)responseStartTime;
- (double)secureConnectionStartTime;
- (double)xpSamplingPercentageCachedResponses;
- (double)xpSamplingPercentageUsers;
- (double)xpSessionDuration;
- (id)description;
- (unint64_t)connectionStartNStatRXBytes;
- (unint64_t)connectionStartNStatTXBytes;
- (unint64_t)connectionStopNStatRXBytes;
- (unint64_t)connectionStopNStatTXBytes;
- (unint64_t)redirectCount;
- (void)setCachedResponse:(BOOL)a3;
- (void)setClientCorrelationKey:(id)a3;
- (void)setConnectionEndTime:(double)a3;
- (void)setConnectionReused:(BOOL)a3;
- (void)setConnectionStartNStatRXBytes:(unint64_t)a3;
- (void)setConnectionStartNStatTXBytes:(unint64_t)a3;
- (void)setConnectionStartTime:(double)a3;
- (void)setConnectionStopNStatRXBytes:(unint64_t)a3;
- (void)setConnectionStopNStatTXBytes:(unint64_t)a3;
- (void)setDomainLookupEndTime:(double)a3;
- (void)setDomainLookupStartTime:(double)a3;
- (void)setFetchStartTime:(double)a3;
- (void)setNavigationType:(id)a3;
- (void)setPageHistoryDescription:(id)a3;
- (void)setPageHistoryDescriptionWithIdentifiers:(id)a3;
- (void)setPageRenderTime:(double)a3;
- (void)setRedirectCount:(unint64_t)a3;
- (void)setRedirectEndTime:(double)a3;
- (void)setRedirectStartTime:(double)a3;
- (void)setReferringAppName:(id)a3;
- (void)setReferringURL:(id)a3;
- (void)setRequestEndTime:(double)a3;
- (void)setRequestStartTime:(double)a3;
- (void)setResponseEndTime:(double)a3;
- (void)setResponseStartTime:(double)a3;
- (void)setSearchTerm:(id)a3;
- (void)setSecureConnectionStartTime:(double)a3;
- (void)setServerApplicationInstance:(id)a3;
- (void)setServerTiming:(id)a3;
- (void)setUbered:(BOOL)a3;
- (void)setXPSamplingForced:(BOOL)a3;
- (void)setXPSamplingPercentageCachedResponses:(double)a3;
- (void)setXPSamplingPercentageUsers:(double)a3;
- (void)setXPSessionDuration:(double)a3;
@end

@implementation SSMetricsPageEvent

- (SSMetricsPageEvent)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSMetricsPageEvent;
  v2 = [(SSMetricsBaseEvent *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SSMetricsMutableEvent *)v2 setEventType:@"page"];
  }
  return v3;
}

- (BOOL)isCachedResponse
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"isCachedResponse"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isUbered
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"isUber"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)clientCorrelationKey
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"clientCorrelationKey"];
}

- (double)connectionEndTime
{
  char v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"connectionEndTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (BOOL)connectionReused
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"connectionReused"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (double)connectionStartTime
{
  char v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"connectionStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (unint64_t)connectionStartNStatRXBytes
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"connectionStartNStatRXBytes"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unint64_t)connectionStartNStatTXBytes
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"connectionStartNStatTXBytes"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unint64_t)connectionStopNStatRXBytes
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"connectionStopNStatRXBytes"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unint64_t)connectionStopNStatTXBytes
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"connectionStopNStatTXBytes"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (double)domainLookupEndTime
{
  unint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"domainLookupEndTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (double)domainLookupStartTime
{
  unint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"domainLookupStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (double)fetchStartTime
{
  unint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"fetchStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (NSString)navigationType
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"navigation"];
}

- (NSString)pageHistoryDescription
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"pageHistory"];
}

- (double)pageRenderTime
{
  unint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"pageRenderTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (unint64_t)redirectCount
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"redirectCount"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (double)redirectEndTime
{
  unint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"redirectEndTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (double)redirectStartTime
{
  unint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"redirectStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (NSString)referringAppName
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"refApp"];
}

- (NSString)referringURL
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"refUrl"];
}

- (double)requestEndTime
{
  unint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"requestEndTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (double)requestStartTime
{
  unint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"requestStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (double)responseEndTime
{
  unint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"responseEndTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (double)responseStartTime
{
  unint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"responseStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (NSString)searchTerm
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"searchTerm"];
}

- (double)secureConnectionStartTime
{
  unint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"secureConnectionStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (NSString)serverApplicationInstance
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"serverAppInstance"];
}

- (NSString)serverTiming
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"serverTiming"];
}

- (void)setCachedResponse:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"isCachedResponse"];
}

- (void)setClientCorrelationKey:(id)a3
{
}

- (void)setConnectionEndTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"connectionEndTime"];
}

- (void)setConnectionReused:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"connectionReused"];
}

- (void)setConnectionStartTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"connectionStartTime"];
}

- (void)setConnectionStartNStatRXBytes:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"connectionStartNStatRXBytes"];
}

- (void)setConnectionStartNStatTXBytes:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"connectionStartNStatTXBytes"];
}

- (void)setConnectionStopNStatRXBytes:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"connectionStopNStatRXBytes"];
}

- (void)setConnectionStopNStatTXBytes:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"connectionStopNStatTXBytes"];
}

- (void)setDomainLookupEndTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"domainLookupEndTime"];
}

- (void)setDomainLookupStartTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"domainLookupStartTime"];
}

- (void)setFetchStartTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"fetchStartTime"];
}

- (void)setNavigationType:(id)a3
{
}

- (void)setPageHistoryDescription:(id)a3
{
}

- (void)setPageHistoryDescriptionWithIdentifiers:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    uint64_t v4 = [v5 componentsJoinedByString:@","];
    [(SSMetricsPageEvent *)self setPageHistoryDescription:v4];
  }
}

- (void)setPageRenderTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"pageRenderTime"];
}

- (void)setRedirectCount:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"redirectCount"];
}

- (void)setRedirectEndTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"redirectEndTime"];
}

- (void)setRedirectStartTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"redirectStartTime"];
}

- (void)setReferringAppName:(id)a3
{
}

- (void)setReferringURL:(id)a3
{
}

- (void)setRequestEndTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"requestEndTime"];
}

- (void)setRequestStartTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"requestStartTime"];
}

- (void)setResponseEndTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"responseEndTime"];
}

- (void)setResponseStartTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"responseStartTime"];
}

- (void)setSearchTerm:(id)a3
{
}

- (void)setSecureConnectionStartTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"secureConnectionStartTime"];
}

- (void)setServerApplicationInstance:(id)a3
{
}

- (void)setServerTiming:(id)a3
{
}

- (void)setUbered:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"isUber"];
}

- (void)setXPSessionDuration:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"xpSessionDuration"];
}

- (void)setXPSamplingForced:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"xpSamplingForced"];
}

- (void)setXPSamplingPercentageUsers:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"xpSamplingPercentageUsers"];
}

- (void)setXPSamplingPercentageCachedResponses:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"xpSamplingPercentageCachedResponses"];
}

- (double)xpSessionDuration
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"xpSessionDuration"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (BOOL)xpSamplingForced
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"xpSamplingForced"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (double)xpSamplingPercentageUsers
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"xpSamplingPercentageUsers"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)xpSamplingPercentageCachedResponses
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"xpSamplingPercentageCachedResponses"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (id)description
{
  double v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SSMetricsPageEvent;
  double v4 = [(SSMetricsBaseEvent *)&v8 description];
  id v5 = [(SSMetricsPageEvent *)self serverApplicationInstance];
  v6 = [v3 stringWithFormat:@"%@: Instance: %@", v4, v5];

  return v6;
}

@end