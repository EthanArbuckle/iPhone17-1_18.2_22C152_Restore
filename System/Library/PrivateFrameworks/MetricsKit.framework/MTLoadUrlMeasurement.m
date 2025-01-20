@interface MTLoadUrlMeasurement
- (void)mark:(id)a3;
- (void)mark:(id)a3 date:(id)a4;
- (void)mark:(id)a3 time:(int64_t)a4;
- (void)setConnectionReused:(BOOL)a3;
- (void)setDnsServersIPAddresses:(id)a3;
- (void)setEdgeNodeCacheStatus:(id)a3;
- (void)setRedirectCount:(unint64_t)a3;
- (void)setRequestUrl:(id)a3;
- (void)setResolvedIPAddress:(id)a3;
- (void)setStatusCode:(unint64_t)a3;
- (void)setXpSamplingForced:(BOOL)a3;
- (void)setXpSamplingPercentageUsers:(double)a3;
- (void)setXpSessionDuration:(unint64_t)a3;
@end

@implementation MTLoadUrlMeasurement

- (void)mark:(id)a3 time:(int64_t)a4
{
  v6 = NSNumber;
  id v7 = a3;
  id v9 = [v6 numberWithLongLong:a4];
  v8 = [(MTPerfBaseMeasurement *)self timestamps];
  [v8 setObject:v9 forKeyedSubscript:v7];
}

- (void)setRequestUrl:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v5 setObject:v4 forKeyedSubscript:@"requestUrl"];
}

- (void)setConnectionReused:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v4 setObject:v5 forKeyedSubscript:@"connectionReused"];
}

- (void)setDnsServersIPAddresses:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v5 setObject:v4 forKeyedSubscript:@"dnsServersIPAddresses"];
}

- (void)setEdgeNodeCacheStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v5 setObject:v4 forKeyedSubscript:@"edgeNodeCacheStatus"];
}

- (void)setRedirectCount:(unint64_t)a3
{
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v4 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v4 setObject:v5 forKeyedSubscript:@"redirectCount"];
}

- (void)setResolvedIPAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v5 setObject:v4 forKeyedSubscript:@"resolvedIPAddress"];
}

- (void)setStatusCode:(unint64_t)a3
{
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v4 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v4 setObject:v5 forKeyedSubscript:@"statusCode"];
}

- (void)setXpSessionDuration:(unint64_t)a3
{
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v4 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v4 setObject:v5 forKeyedSubscript:@"xpSessionDuration"];
}

- (void)setXpSamplingForced:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v4 setObject:v5 forKeyedSubscript:@"xpSamplingForced"];
}

- (void)setXpSamplingPercentageUsers:(double)a3
{
  id v5 = [NSNumber numberWithDouble:a3];
  id v4 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v4 setObject:v5 forKeyedSubscript:@"xpSamplingPercentageUsers"];
}

- (void)mark:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  -[MTLoadUrlMeasurement mark:time:](self, "mark:time:", v5, objc_msgSend(v4, "mt_longMillisecondsSince1970"));
}

- (void)mark:(id)a3 date:(id)a4
{
  id v6 = a3;
  -[MTLoadUrlMeasurement mark:time:](self, "mark:time:", v6, objc_msgSend(a4, "mt_longMillisecondsSince1970"));
}

@end