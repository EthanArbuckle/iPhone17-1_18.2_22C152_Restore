@interface MTIDInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isSynchronized;
- (BOOL)isValueExpired;
- (BOOL)shouldGenerateMetricsFields;
- (MTIDInfo)initWithScheme:(id)a3 secret:(id)a4 idString:(id)a5 dsId:(id)a6 effectiveDate:(id)a7 expirationDate:(id)a8;
- (MTIDInfo)initWithScheme:(id)a3 secret:(id)a4 idString:(id)a5 dsId:(id)a6 effectiveDate:(id)a7 expirationDate:(id)a8 shouldGenerateMetricsFields:(BOOL)a9;
- (MTIDScheme)scheme;
- (MTIDSecret)secret;
- (NSDate)computedDate;
- (NSDate)effectiveDate;
- (NSDate)expirationDate;
- (NSDictionary)metricsFields;
- (NSNumber)dsId;
- (NSString)description;
- (NSString)idNamespace;
- (NSString)idString;
- (double)lifespan;
- (id)debugInfo;
- (int64_t)idType;
- (void)setComputedDate:(id)a3;
- (void)setDsId:(id)a3;
- (void)setEffectiveDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIdString:(id)a3;
- (void)setIsSynchronized:(BOOL)a3;
- (void)setScheme:(id)a3;
- (void)setSecret:(id)a3;
- (void)setShouldGenerateMetricsFields:(BOOL)a3;
@end

@implementation MTIDInfo

- (void)setIsSynchronized:(BOOL)a3
{
  self->_isSynchronized = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(MTIDInfo *)self scheme];
    v7 = [v6 idNamespace];
    v8 = [v5 scheme];
    v9 = [v8 idNamespace];
    if ([v7 isEqual:v9])
    {
      v10 = [(MTIDInfo *)self idString];
      v11 = [v5 idString];
      if ([v10 isEqual:v11])
      {
        v12 = [(MTIDInfo *)self expirationDate];
        v13 = [v5 expirationDate];
        if (v12 == v13)
        {
          char v15 = 1;
        }
        else
        {
          v18 = v13;
          v17 = [(MTIDInfo *)self expirationDate];
          [v5 expirationDate];
          v14 = v19 = v12;
          char v15 = [v17 isEqual:v14];

          v12 = v19;
          v13 = v18;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (NSDictionary)metricsFields
{
  uint64_t v3 = [(MTIDInfo *)self idString];
  if (v3
    && (id v4 = (void *)v3,
        BOOL v5 = [(MTIDInfo *)self shouldGenerateMetricsFields],
        v4,
        v5))
  {
    v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
    int64_t v7 = [(MTIDInfo *)self idType];
    if (v7 == 1)
    {
      char v15 = [(MTIDInfo *)self idString];
      [v6 setObject:v15 forKeyedSubscript:@"clientId"];

      [v6 setObject:@"device" forKeyedSubscript:@"xpClientIdSource"];
    }
    else if (v7 == 2)
    {
      v8 = [(MTIDInfo *)self idString];
      [v6 setObject:v8 forKeyedSubscript:@"userId"];

      v9 = [(MTIDInfo *)self isSynchronized] ? @"synchronized" : @"unsynchronized";
      [v6 setObject:v9 forKeyedSubscript:@"xpUserIdSyncState"];
      [(MTIDInfo *)self lifespan];
      if (v10 > 0.0)
      {
        v11 = NSNumber;
        [(MTIDInfo *)self lifespan];
        v13 = [v11 numberWithDouble:v12 * 1000.0];
        [v6 setObject:v13 forKeyedSubscript:@"xpUserIdLifespan"];
      }
    }
    v14 = (void *)[v6 copy];
  }
  else
  {
    v14 = (void *)MEMORY[0x263EFFA78];
  }

  return (NSDictionary *)v14;
}

- (NSString)idString
{
  return self->_idString;
}

- (BOOL)shouldGenerateMetricsFields
{
  return self->_shouldGenerateMetricsFields;
}

- (double)lifespan
{
  v2 = [(MTIDInfo *)self scheme];
  double v3 = (double)[v2 lifespan];

  return v3;
}

- (int64_t)idType
{
  v2 = [(MTIDInfo *)self scheme];
  int64_t v3 = [v2 idType];

  return v3;
}

- (MTIDScheme)scheme
{
  return self->_scheme;
}

- (NSNumber)dsId
{
  return self->_dsId;
}

- (BOOL)isSynchronized
{
  return self->_isSynchronized;
}

- (MTIDInfo)initWithScheme:(id)a3 secret:(id)a4 idString:(id)a5 dsId:(id)a6 effectiveDate:(id)a7 expirationDate:(id)a8 shouldGenerateMetricsFields:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v26.receiver = self;
  v26.super_class = (Class)MTIDInfo;
  v21 = [(MTIDInfo *)&v26 init];
  v22 = v21;
  if (v21)
  {
    [(MTIDInfo *)v21 setScheme:v15];
    [(MTIDInfo *)v22 setSecret:v16];
    [(MTIDInfo *)v22 setIdString:v17];
    [(MTIDInfo *)v22 setDsId:v18];
    [(MTIDInfo *)v22 setExpirationDate:v20];
    [(MTIDInfo *)v22 setEffectiveDate:v19];
    [(MTIDInfo *)v22 setShouldGenerateMetricsFields:a9];
    v23 = +[MTFrameworkEnvironment sharedEnvironment];
    v24 = [v23 date];
    [(MTIDInfo *)v22 setComputedDate:v24];
  }
  return v22;
}

- (void)setShouldGenerateMetricsFields:(BOOL)a3
{
  self->_shouldGenerateMetricsFields = a3;
}

- (void)setSecret:(id)a3
{
}

- (void)setScheme:(id)a3
{
}

- (void)setIdString:(id)a3
{
}

- (void)setExpirationDate:(id)a3
{
}

- (void)setEffectiveDate:(id)a3
{
}

- (void)setDsId:(id)a3
{
}

- (void)setComputedDate:(id)a3
{
}

- (MTIDInfo)initWithScheme:(id)a3 secret:(id)a4 idString:(id)a5 dsId:(id)a6 effectiveDate:(id)a7 expirationDate:(id)a8
{
  LOBYTE(v9) = 1;
  return [(MTIDInfo *)self initWithScheme:a3 secret:a4 idString:a5 dsId:a6 effectiveDate:a7 expirationDate:a8 shouldGenerateMetricsFields:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computedDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_effectiveDate, 0);
  objc_storeStrong((id *)&self->_dsId, 0);
  objc_storeStrong((id *)&self->_idString, 0);
  objc_storeStrong((id *)&self->_secret, 0);

  objc_storeStrong((id *)&self->_scheme, 0);
}

- (NSString)idNamespace
{
  v2 = [(MTIDInfo *)self scheme];
  int64_t v3 = [v2 idNamespace];

  return (NSString *)v3;
}

- (BOOL)isValueExpired
{
  v2 = [(MTIDInfo *)self expirationDate];
  if (v2)
  {
    int64_t v3 = +[MTFrameworkEnvironment sharedEnvironment];
    id v4 = [v3 date];

    BOOL v5 = [v4 compare:v2] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  int64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  v6 = [(MTIDInfo *)self idString];
  int64_t v7 = [(MTIDInfo *)self scheme];
  v8 = [v7 idNamespace];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p, idString: %@, namespace: %@ >", v5, self, v6, v8];

  return (NSString *)v9;
}

- (id)debugInfo
{
  int64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(MTIDInfo *)self idString];
  [v3 setObject:v4 forKeyedSubscript:@"ID"];

  BOOL v5 = [(MTIDInfo *)self scheme];
  v6 = [v5 idNamespace];
  [v3 setObject:v6 forKeyedSubscript:@"namespace"];

  int64_t v7 = [(MTIDInfo *)self secret];
  v8 = [v7 debugInfo];
  [v3 setObject:v8 forKeyedSubscript:@"secret"];

  uint64_t v9 = [(MTIDInfo *)self effectiveDate];
  double v10 = [v9 description];
  [v3 setObject:v10 forKeyedSubscript:@"effectiveDate"];

  v11 = [(MTIDInfo *)self expirationDate];
  double v12 = [v11 description];
  [v3 setObject:v12 forKeyedSubscript:@"expirationDate"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[MTIDInfo isSynchronized](self, "isSynchronized"));
  [v3 setObject:v13 forKeyedSubscript:@"isSynchronized"];

  v14 = [(MTIDInfo *)self dsId];
  [v3 setObject:v14 forKeyedSubscript:@"dsId"];

  id v15 = (void *)[v3 copy];

  return v15;
}

- (MTIDSecret)secret
{
  return self->_secret;
}

- (NSDate)computedDate
{
  return self->_computedDate;
}

@end