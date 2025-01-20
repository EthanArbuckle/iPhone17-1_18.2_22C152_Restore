@interface NSPOutageReasonStats
+ (BOOL)supportsSecureCoding;
- (NSPOutageReasonStats)initWithCoder:(id)a3;
- (NSString)fallbackEgressProxy;
- (NSString)fallbackIngressProxy;
- (NSString)odohProxy;
- (NSString)outageReasonSubType;
- (NSString)outageReasonType;
- (NSString)primaryEgressProxy;
- (NSString)primaryIngressProxy;
- (NSString)tierType;
- (NSString)tokenProxy;
- (id)analyticsDict;
- (id)copyWithZone:(_NSZone *)a3;
- (id)eventName;
- (void)encodeWithCoder:(id)a3;
- (void)setFallbackEgressProxy:(id)a3;
- (void)setFallbackIngressProxy:(id)a3;
- (void)setOdohProxy:(id)a3;
- (void)setOutageReasonSubType:(id)a3;
- (void)setOutageReasonType:(id)a3;
- (void)setPrimaryEgressProxy:(id)a3;
- (void)setPrimaryIngressProxy:(id)a3;
- (void)setTierType:(id)a3;
- (void)setTokenProxy:(id)a3;
@end

@implementation NSPOutageReasonStats

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPOutageReasonStats)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NSPOutageReasonStats;
  v5 = [(NSPOutageReasonStats *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TierType"];
    tierType = v5->_tierType;
    v5->_tierType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OutageReasonType"];
    outageReasonType = v5->_outageReasonType;
    v5->_outageReasonType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OutageReasonSubType"];
    outageReasonSubType = v5->_outageReasonSubType;
    v5->_outageReasonSubType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrimaryIngressProxy"];
    primaryIngressProxy = v5->_primaryIngressProxy;
    v5->_primaryIngressProxy = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrimaryEgressProxy"];
    primaryEgressProxy = v5->_primaryEgressProxy;
    v5->_primaryEgressProxy = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FallbackIngressProxy"];
    fallbackIngressProxy = v5->_fallbackIngressProxy;
    v5->_fallbackIngressProxy = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FallbackEgressProxy"];
    fallbackEgressProxy = v5->_fallbackEgressProxy;
    v5->_fallbackEgressProxy = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ODoHProxy"];
    odohProxy = v5->_odohProxy;
    v5->_odohProxy = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TokenProxy"];
    tokenProxy = v5->_tokenProxy;
    v5->_tokenProxy = (NSString *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NSPOutageReasonStats *)self tierType];
  [v4 encodeObject:v5 forKey:@"TierType"];

  uint64_t v6 = [(NSPOutageReasonStats *)self outageReasonType];
  [v4 encodeObject:v6 forKey:@"OutageReasonType"];

  v7 = [(NSPOutageReasonStats *)self outageReasonSubType];
  [v4 encodeObject:v7 forKey:@"OutageReasonSubType"];

  uint64_t v8 = [(NSPOutageReasonStats *)self primaryIngressProxy];
  [v4 encodeObject:v8 forKey:@"PrimaryIngressProxy"];

  v9 = [(NSPOutageReasonStats *)self primaryEgressProxy];
  [v4 encodeObject:v9 forKey:@"PrimaryEgressProxy"];

  uint64_t v10 = [(NSPOutageReasonStats *)self fallbackIngressProxy];
  [v4 encodeObject:v10 forKey:@"FallbackIngressProxy"];

  v11 = [(NSPOutageReasonStats *)self fallbackEgressProxy];
  [v4 encodeObject:v11 forKey:@"FallbackEgressProxy"];

  uint64_t v12 = [(NSPOutageReasonStats *)self odohProxy];
  [v4 encodeObject:v12 forKey:@"ODoHProxy"];

  id v13 = [(NSPOutageReasonStats *)self tokenProxy];
  [v4 encodeObject:v13 forKey:@"TokenProxy"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NSPOutageReasonStats allocWithZone:a3] init];
  v5 = [(NSPOutageReasonStats *)self tierType];
  [(NSPOutageReasonStats *)v4 setTierType:v5];

  uint64_t v6 = [(NSPOutageReasonStats *)self outageReasonType];
  [(NSPOutageReasonStats *)v4 setOutageReasonType:v6];

  v7 = [(NSPOutageReasonStats *)self outageReasonSubType];
  [(NSPOutageReasonStats *)v4 setOutageReasonSubType:v7];

  uint64_t v8 = [(NSPOutageReasonStats *)self primaryIngressProxy];
  [(NSPOutageReasonStats *)v4 setPrimaryIngressProxy:v8];

  v9 = [(NSPOutageReasonStats *)self primaryEgressProxy];
  [(NSPOutageReasonStats *)v4 setPrimaryEgressProxy:v9];

  uint64_t v10 = [(NSPOutageReasonStats *)self fallbackIngressProxy];
  [(NSPOutageReasonStats *)v4 setFallbackIngressProxy:v10];

  v11 = [(NSPOutageReasonStats *)self fallbackEgressProxy];
  [(NSPOutageReasonStats *)v4 setFallbackEgressProxy:v11];

  uint64_t v12 = [(NSPOutageReasonStats *)self odohProxy];
  [(NSPOutageReasonStats *)v4 setOdohProxy:v12];

  id v13 = [(NSPOutageReasonStats *)self tokenProxy];
  [(NSPOutageReasonStats *)v4 setTokenProxy:v13];

  return v4;
}

- (id)eventName
{
  return @"com.apple.nsp.outageReasonStats";
}

- (id)analyticsDict
{
  v3 = [(NSPOutageReasonStats *)self outageReasonType];

  if (!v3)
  {
    uint64_t v16 = nplog_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v18 = 136315138;
    v19 = "-[NSPOutageReasonStats analyticsDict]";
    v17 = "%s called with null self.outageReasonType";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, v17, (uint8_t *)&v18, 0xCu);
    goto LABEL_10;
  }
  id v4 = [(NSPOutageReasonStats *)self outageReasonSubType];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v6 = [(NSPOutageReasonStats *)self tierType];
    [v5 setObject:v6 forKeyedSubscript:@"TierType"];

    v7 = [(NSPOutageReasonStats *)self outageReasonType];
    [v5 setObject:v7 forKeyedSubscript:@"OutageReasonType"];

    uint64_t v8 = [(NSPOutageReasonStats *)self outageReasonSubType];
    [v5 setObject:v8 forKeyedSubscript:@"OutageReasonSubType"];

    v9 = [(NSPOutageReasonStats *)self primaryIngressProxy];
    [v5 setObject:v9 forKeyedSubscript:@"PrimaryIngressProxy"];

    uint64_t v10 = [(NSPOutageReasonStats *)self primaryEgressProxy];
    [v5 setObject:v10 forKeyedSubscript:@"PrimaryEgressProxy"];

    v11 = [(NSPOutageReasonStats *)self fallbackIngressProxy];
    [v5 setObject:v11 forKeyedSubscript:@"FallbackIngressProxy"];

    uint64_t v12 = [(NSPOutageReasonStats *)self fallbackEgressProxy];
    [v5 setObject:v12 forKeyedSubscript:@"FallbackEgressProxy"];

    id v13 = [(NSPOutageReasonStats *)self odohProxy];
    [v5 setObject:v13 forKeyedSubscript:@"ODoHProxy"];

    uint64_t v14 = [(NSPOutageReasonStats *)self tokenProxy];
    [v5 setObject:v14 forKeyedSubscript:@"TokenProxy"];

    goto LABEL_4;
  }
  uint64_t v16 = nplog_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    int v18 = 136315138;
    v19 = "-[NSPOutageReasonStats analyticsDict]";
    v17 = "%s called with null self.outageReasonSubType";
    goto LABEL_12;
  }
LABEL_10:

  id v5 = 0;
LABEL_4:

  return v5;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (NSString)outageReasonType
{
  return self->_outageReasonType;
}

- (void)setOutageReasonType:(id)a3
{
}

- (NSString)outageReasonSubType
{
  return self->_outageReasonSubType;
}

- (void)setOutageReasonSubType:(id)a3
{
}

- (NSString)primaryIngressProxy
{
  return self->_primaryIngressProxy;
}

- (void)setPrimaryIngressProxy:(id)a3
{
}

- (NSString)primaryEgressProxy
{
  return self->_primaryEgressProxy;
}

- (void)setPrimaryEgressProxy:(id)a3
{
}

- (NSString)fallbackIngressProxy
{
  return self->_fallbackIngressProxy;
}

- (void)setFallbackIngressProxy:(id)a3
{
}

- (NSString)fallbackEgressProxy
{
  return self->_fallbackEgressProxy;
}

- (void)setFallbackEgressProxy:(id)a3
{
}

- (NSString)odohProxy
{
  return self->_odohProxy;
}

- (void)setOdohProxy:(id)a3
{
}

- (NSString)tokenProxy
{
  return self->_tokenProxy;
}

- (void)setTokenProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenProxy, 0);
  objc_storeStrong((id *)&self->_odohProxy, 0);
  objc_storeStrong((id *)&self->_fallbackEgressProxy, 0);
  objc_storeStrong((id *)&self->_fallbackIngressProxy, 0);
  objc_storeStrong((id *)&self->_primaryEgressProxy, 0);
  objc_storeStrong((id *)&self->_primaryIngressProxy, 0);
  objc_storeStrong((id *)&self->_outageReasonSubType, 0);
  objc_storeStrong((id *)&self->_outageReasonType, 0);

  objc_storeStrong((id *)&self->_tierType, 0);
}

@end