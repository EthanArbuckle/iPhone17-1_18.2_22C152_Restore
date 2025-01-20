@interface WAMessage
+ (BOOL)supportsSecureCoding;
- (NSMutableDictionary)metricInfo;
- (NSString)metricName;
- (WAMessage)initWithCoder:(id)a3;
- (WAMessage)initWithMetricName:(id)a3 options:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)options;
- (void)addFieldForKey:(id)a3 value:(id)a4 options:(int64_t)a5;
- (void)addFieldsForChannelFlagLikeKey:(id)a3 value:(id)a4 options:(int64_t)a5;
- (void)addFieldsFromDictionary:(id)a3 options:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setMetricInfo:(id)a3;
- (void)setMetricName:(id)a3;
- (void)setOptions:(int64_t)a3;
@end

@implementation WAMessage

- (WAMessage)initWithMetricName:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WAMessage;
  v7 = [(WAMessage *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [NSString stringWithString:v6];
    metricName = v7->_metricName;
    v7->_metricName = (NSString *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    metricInfo = v7->_metricInfo;
    v7->_metricInfo = (NSMutableDictionary *)v10;

    v7->_options = a4;
  }

  return v7;
}

- (void)addFieldForKey:(id)a3 value:(id)a4 options:(int64_t)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = +[WAUtil isInternalInstall];
  if ((a5 & 1) != 0 && v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 && ([MEMORY[0x263F08900] isValidJSONObject:v9] & 1) == 0)
      {
        v11 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v20 = v8;
          __int16 v21 = 2112;
          id v22 = (id)objc_opt_class();
          __int16 v23 = 2112;
          id v24 = v9;
          id v16 = v22;
          _os_log_fault_impl(&dword_21D96D000, v11, OS_LOG_TYPE_FAULT, "CODE FIX NEEDED! Field cannot be sent to CoreAnalytics, removing CA option from field %@ (%@): %@", buf, 0x20u);
        }
        a5 = 0;
      }
    }
  }
  if (([v8 containsString:@"channelFlags"] & 1) != 0
    || [v8 containsString:@"ChannelFlags"])
  {
    [(WAMessage *)self addFieldsForChannelFlagLikeKey:v8 value:v9 options:a5];
  }
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", a5, @"value", @"options", v9);
  v18[1] = v12;
  objc_super v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:2];

  v14 = [(WAMessage *)self metricInfo];

  if (v14)
  {
    v15 = [(WAMessage *)self metricInfo];
    [v15 setObject:v13 forKey:v8];
  }
}

- (void)addFieldsForChannelFlagLikeKey:(id)a3 value:(id)a4 options:(int64_t)a5
{
  v27[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(WAMessage *)self metricInfo];

  if (v10)
  {
    v11 = [v8 stringByReplacingOccurrencesOfString:@"Flags" withString:&stru_26CE4D7E8];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    __int16 v12 = [v9 unsignedIntValue];
    __int16 v13 = v12;
    if ((v12 & 8) != 0)
    {
      v14 = @"2";
    }
    else if ((v12 & 0x10) != 0)
    {
      v14 = @"5";
    }
    else
    {
      if ((v12 & 0x2000) == 0)
      {
LABEL_10:
        if ((v13 & 0x800) != 0)
        {
          v19 = @"160";
          goto LABEL_18;
        }
        if ((v13 & 0x400) != 0)
        {
          v19 = @"80";
          goto LABEL_18;
        }
        if ((v13 & 4) != 0)
        {
          v19 = @"40";
          goto LABEL_18;
        }
        if ((v13 & 2) != 0)
        {
          v19 = @"20";
LABEL_18:
          id v20 = [(WAMessage *)self metricInfo];
          v24[0] = @"value";
          v24[1] = @"options";
          v25[0] = v19;
          __int16 v21 = [NSNumber numberWithInteger:a5];
          v25[1] = v21;
          id v22 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
          __int16 v23 = [NSString stringWithFormat:@"%@%@", v11, @"BW"];
          [v20 setObject:v22 forKey:v23];
        }
LABEL_19:

        goto LABEL_20;
      }
      v14 = @"6";
    }
    v15 = [(WAMessage *)self metricInfo];
    v26[0] = @"value";
    v26[1] = @"options";
    v27[0] = v14;
    id v16 = [NSNumber numberWithInteger:a5];
    v27[1] = v16;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    v18 = [NSString stringWithFormat:@"%@%@", v11, @"Band"];
    [v15 setObject:v17 forKey:v18];

    goto LABEL_10;
  }
LABEL_20:
}

- (void)addFieldsFromDictionary:(id)a3 options:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = objc_msgSend(v6, "allKeys", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        __int16 v13 = [v6 objectForKeyedSubscript:v12];
        [(WAMessage *)self addFieldForKey:v12 value:v13 options:a4];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[WAMessage allocWithZone:a3] init];
  [(WAMessage *)v4 setMetricName:self->_metricName];
  [(WAMessage *)v4 setMetricInfo:self->_metricInfo];
  [(WAMessage *)v4 setOptions:self->_options];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  metricName = self->_metricName;
  id v5 = a3;
  [v5 encodeObject:metricName forKey:@"_metricName"];
  [v5 encodeObject:self->_metricInfo forKey:@"_metricInfo"];
  [v5 encodeInteger:self->_options forKey:@"_options"];
}

- (WAMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WAMessage;
  id v5 = [(WAMessage *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_metricName"];
    metricName = v5->_metricName;
    v5->_metricName = (NSString *)v6;

    id v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    long long v16 = objc_msgSend(v22, "setWithObjects:", v21, v20, v8, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"_metricInfo"];
    metricInfo = v5->_metricInfo;
    v5->_metricInfo = (NSMutableDictionary *)v17;

    v5->_options = [v4 decodeIntegerForKey:@"_options"];
  }

  return v5;
}

- (NSString)metricName
{
  return self->_metricName;
}

- (void)setMetricName:(id)a3
{
}

- (NSMutableDictionary)metricInfo
{
  return self->_metricInfo;
}

- (void)setMetricInfo:(id)a3
{
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricInfo, 0);
  objc_storeStrong((id *)&self->_metricName, 0);
}

@end