@interface MXSourceXPCPayload
+ (BOOL)supportsSecureCoding;
- (MXSourceXPCPayload)initWithCoder:(id)a3;
- (MXSourceXPCPayload)initWithSourceID:(int64_t)a3 withDateStamp:(id)a4 andMetrics:(id)a5;
- (NSDate)datestamp;
- (NSDictionary)metrics;
- (int64_t)sourceID;
- (void)encodeWithCoder:(id)a3;
- (void)setDatestamp:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setSourceID:(int64_t)a3;
@end

@implementation MXSourceXPCPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MXSourceXPCPayload)initWithSourceID:(int64_t)a3 withDateStamp:(id)a4 andMetrics:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MXSourceXPCPayload;
  v11 = [(MXSourceXPCPayload *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_sourceID = a3;
    objc_storeStrong((id *)&v11->_datestamp, a4);
    objc_storeStrong((id *)&v12->_metrics, a5);
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t sourceID = self->_sourceID;
  id v5 = a3;
  [v5 encodeInteger:sourceID forKey:@"sourceID"];
  [v5 encodeObject:self->_datestamp forKey:@"dateStamp"];
  [v5 encodeObject:self->_metrics forKey:@"metrics"];
}

- (MXSourceXPCPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MXSourceXPCPayload;
  id v5 = [(MXSourceXPCPayload *)&v19 init];
  if (v5)
  {
    v5->_int64_t sourceID = [v4 decodeIntegerForKey:@"sourceID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateStamp"];
    datestamp = v5->_datestamp;
    v5->_datestamp = (NSDate *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"metrics"];
    metrics = v5->_metrics;
    v5->_metrics = (NSDictionary *)v16;
  }
  return v5;
}

- (int64_t)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(int64_t)a3
{
  self->_int64_t sourceID = a3;
}

- (NSDate)datestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDatestamp:(id)a3
{
}

- (NSDictionary)metrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);

  objc_storeStrong((id *)&self->_datestamp, 0);
}

@end