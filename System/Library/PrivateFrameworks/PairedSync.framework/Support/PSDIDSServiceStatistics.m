@interface PSDIDSServiceStatistics
+ (BOOL)supportsSecureCoding;
+ (id)statisticsWithServiceName:(id)a3 serviceStatisticsDictionary:(id)a4;
- (BOOL)statisticsAreBogus;
- (BOOL)statisticsAreZero;
- (NSString)serviceName;
- (PSDIDSServiceStatistics)initWithCoder:(id)a3;
- (id)description;
- (id)statisticsByDiffingStatistics:(id)a3;
- (id)statisticsBySummingStatistics:(id)a3;
- (int64_t)bytes;
- (int64_t)deliveredBytes;
- (int64_t)deliveredMessageCount;
- (int64_t)messageCount;
- (void)encodeWithCoder:(id)a3;
- (void)setBytes:(int64_t)a3;
- (void)setDeliveredBytes:(int64_t)a3;
- (void)setDeliveredMessageCount:(int64_t)a3;
- (void)setMessageCount:(int64_t)a3;
- (void)setServiceName:(id)a3;
@end

@implementation PSDIDSServiceStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)statisticsWithServiceName:(id)a3 serviceStatisticsDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setServiceName:v7];

  v9 = [v6 objectForKey:@"localDeliveryQueueStatBytes"];
  objc_msgSend(v8, "setBytes:", objc_msgSend(v9, "integerValue"));

  v10 = [v6 objectForKey:@"localDeliveryQueueStatMessageCount"];
  objc_msgSend(v8, "setMessageCount:", objc_msgSend(v10, "integerValue"));

  v11 = [v6 objectForKey:@"localDeliveryQueueStatDeliveredBytes"];
  objc_msgSend(v8, "setDeliveredBytes:", objc_msgSend(v11, "integerValue"));

  v12 = [v6 objectForKey:@"localDeliveryQueueStatDeliveredMessageCount"];

  objc_msgSend(v8, "setDeliveredMessageCount:", objc_msgSend(v12, "integerValue"));

  return v8;
}

- (id)statisticsByDiffingStatistics:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(PSDIDSServiceStatistics);
  id v6 = [(PSDIDSServiceStatistics *)self serviceName];
  [(PSDIDSServiceStatistics *)v5 setServiceName:v6];

  -[PSDIDSServiceStatistics setBytes:](v5, "setBytes:", (unsigned char *)-[PSDIDSServiceStatistics bytes](self, "bytes") - (unsigned char *)[v4 bytes]);
  -[PSDIDSServiceStatistics setMessageCount:](v5, "setMessageCount:", (unsigned char *)-[PSDIDSServiceStatistics messageCount](self, "messageCount") - (unsigned char *)[v4 messageCount]);
  -[PSDIDSServiceStatistics setDeliveredBytes:](v5, "setDeliveredBytes:", (unsigned char *)-[PSDIDSServiceStatistics deliveredBytes](self, "deliveredBytes")- (unsigned char *)[v4 deliveredBytes]);
  int64_t v7 = [(PSDIDSServiceStatistics *)self deliveredMessageCount];
  id v8 = [v4 deliveredMessageCount];

  [(PSDIDSServiceStatistics *)v5 setDeliveredMessageCount:v7 - (void)v8];

  return v5;
}

- (id)statisticsBySummingStatistics:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(PSDIDSServiceStatistics);
  id v6 = [(PSDIDSServiceStatistics *)self serviceName];
  [(PSDIDSServiceStatistics *)v5 setServiceName:v6];

  -[PSDIDSServiceStatistics setBytes:](v5, "setBytes:", (char *)-[PSDIDSServiceStatistics bytes](self, "bytes") + (void)[v4 bytes]);
  -[PSDIDSServiceStatistics setMessageCount:](v5, "setMessageCount:", (char *)-[PSDIDSServiceStatistics messageCount](self, "messageCount") + (void)[v4 messageCount]);
  -[PSDIDSServiceStatistics setDeliveredBytes:](v5, "setDeliveredBytes:", (char *)-[PSDIDSServiceStatistics deliveredBytes](self, "deliveredBytes")+ (void)[v4 deliveredBytes]);
  int64_t v7 = [(PSDIDSServiceStatistics *)self deliveredMessageCount];
  id v8 = (char *)[v4 deliveredMessageCount];

  [(PSDIDSServiceStatistics *)v5 setDeliveredMessageCount:&v8[v7]];

  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(PSDIDSServiceStatistics *)self serviceName];
  id v6 = +[NSNumber numberWithInteger:[(PSDIDSServiceStatistics *)self bytes]];
  int64_t v7 = +[NSNumber numberWithInteger:[(PSDIDSServiceStatistics *)self messageCount]];
  id v8 = +[NSNumber numberWithInteger:[(PSDIDSServiceStatistics *)self deliveredBytes]];
  v9 = +[NSNumber numberWithInteger:[(PSDIDSServiceStatistics *)self deliveredMessageCount]];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; serviceName=%@; bytes=%@; messageCount=%@; deliveredBytes=%@; deliveredMessageCount=%@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
  v10 = v9);

  return v10;
}

- (PSDIDSServiceStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSDIDSServiceStatistics;
  v5 = [(PSDIDSServiceStatistics *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceName"];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    v5->_messageCount = (int64_t)[v4 decodeIntegerForKey:@"messageCount"];
    v5->_bytes = (int64_t)[v4 decodeIntegerForKey:@"bytes"];
    v5->_deliveredMessageCount = (int64_t)[v4 decodeIntegerForKey:@"deliveredMessageCount"];
    v5->_deliveredBytes = (int64_t)[v4 decodeIntegerForKey:@"deliveredBytes"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  serviceName = self->_serviceName;
  id v5 = a3;
  [v5 encodeObject:serviceName forKey:@"serviceName"];
  [v5 encodeInteger:self->_messageCount forKey:@"messageCount"];
  [v5 encodeInteger:self->_bytes forKey:@"bytes"];
  [v5 encodeInteger:self->_deliveredMessageCount forKey:@"deliveredMessageCount"];
  [v5 encodeInteger:self->_deliveredBytes forKey:@"deliveredBytes"];
}

- (BOOL)statisticsAreBogus
{
  return self->_messageCount > 0x7A120uLL
      || self->_bytes > 0x2FAF080uLL
      || self->_deliveredMessageCount > 0x7A120uLL
      || self->_deliveredBytes > 0x2FAF080uLL;
}

- (BOOL)statisticsAreZero
{
  return !self->_messageCount && !self->_bytes && !self->_deliveredMessageCount && !self->_deliveredBytes;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (int64_t)messageCount
{
  return self->_messageCount;
}

- (void)setMessageCount:(int64_t)a3
{
  self->_messageCount = a3;
}

- (int64_t)bytes
{
  return self->_bytes;
}

- (void)setBytes:(int64_t)a3
{
  self->_bytes = a3;
}

- (int64_t)deliveredMessageCount
{
  return self->_deliveredMessageCount;
}

- (void)setDeliveredMessageCount:(int64_t)a3
{
  self->_deliveredMessageCount = a3;
}

- (int64_t)deliveredBytes
{
  return self->_deliveredBytes;
}

- (void)setDeliveredBytes:(int64_t)a3
{
  self->_deliveredBytes = a3;
}

- (void).cxx_destruct
{
}

@end