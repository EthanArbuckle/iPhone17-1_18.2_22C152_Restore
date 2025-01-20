@interface Exchange
+ (id)formattedExchangeNameForName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)marketIsAfterHours;
- (BOOL)marketIsOpen;
- (Exchange)initWithDictionary:(id)a3;
- (Exchange)initWithName:(id)a3;
- (NSDate)lastCloseDate;
- (NSDate)nextOpenDate;
- (NSString)name;
- (double)lastUpdateTime;
- (double)streamInterval;
- (id)archiveDictionary;
- (id)description;
- (int64_t)status;
- (unint64_t)hash;
- (void)_updateWithDictionary:(id)a3 newUpdate:(BOOL)a4;
- (void)setLastCloseDate:(id)a3;
- (void)setName:(id)a3;
- (void)setNextOpenDate:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setStreamInterval:(double)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation Exchange

+ (id)formattedExchangeNameForName:(id)a3
{
  uint64_t v3 = formattedExchangeNameForName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&formattedExchangeNameForName__onceToken, &__block_literal_global_10);
  }
  v5 = [(id)formattedExchangeNameForName__prettyExchangeMap objectForKeyedSubscript:v4];
  v6 = v5;
  if (!v5) {
    v5 = v4;
  }
  id v7 = v5;

  return v7;
}

void __41__Exchange_formattedExchangeNameForName___block_invoke()
{
  v0 = (void *)formattedExchangeNameForName__prettyExchangeMap;
  formattedExchangeNameForName__prettyExchangeMap = (uint64_t)&unk_26D5E9110;
}

- (Exchange)initWithName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)Exchange;
    v5 = [(Exchange *)&v9 init];
    v6 = v5;
    if (v5) {
      [(Exchange *)v5 setName:v4];
    }
    self = v6;
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (Exchange)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"name"];
  v6 = [(Exchange *)self initWithName:v5];

  if (v6) {
    [(Exchange *)v6 _updateWithDictionary:v4 newUpdate:0];
  }

  return v6;
}

- (void)updateWithDictionary:(id)a3
{
}

- (void)_updateWithDictionary:(id)a3 newUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_opt_class();
  v8 = [v6 objectForKeyedSubscript:@"name"];
  objc_super v9 = [v7 formattedExchangeNameForName:v8];

  name = self->_name;
  if (name)
  {
    if (![(NSString *)name isEqualToString:v9])
    {
      v11 = StocksLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = self->_name;
        int v23 = 138412802;
        v24 = v12;
        __int16 v25 = 2112;
        v26 = v9;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_error_impl(&dword_222ED9000, v11, OS_LOG_TYPE_ERROR, "#Exchange Attempting to update exchange %@ with dictionary containing a different name (%@)! Dictionary: %@", (uint8_t *)&v23, 0x20u);
      }
      goto LABEL_24;
    }
  }
  else
  {
    [(Exchange *)self setName:v9];
  }
  v13 = [v6 objectForKeyedSubscript:@"nextOpenDate"];
  [(Exchange *)self setNextOpenDate:v13];

  v14 = [v6 objectForKeyedSubscript:@"status"];
  int64_t status = [v14 integerValue];
  if (!status) {
    int64_t status = self->_status;
  }

  int64_t v16 = self->_status;
  if (status != v16)
  {
    if (v4)
    {
      if (v16 <= 2 && status >= 3)
      {
        uint64_t v17 = [MEMORY[0x263EFF910] date];
LABEL_17:
        v19 = (void *)v17;
        [(Exchange *)self setLastCloseDate:v17];

        goto LABEL_18;
      }
      if (status == 2)
      {
        [(Exchange *)self setLastCloseDate:0];
      }
      else
      {
        v18 = [v6 objectForKeyedSubscript:@"lastCloseDate"];

        if (v18)
        {
          uint64_t v17 = [v6 objectForKeyedSubscript:@"lastCloseDate"];
          goto LABEL_17;
        }
      }
    }
LABEL_18:
    [(Exchange *)self setStatus:status];
  }
  v20 = [v6 objectForKeyedSubscript:@"streamInterval"];
  [v20 doubleValue];
  if (streamInterval == 0.0) {
    double streamInterval = self->_streamInterval;
  }
  [(Exchange *)self setStreamInterval:streamInterval];

  if (!v4)
  {
    v11 = [v6 objectForKeyedSubscript:@"lastUpdateTime"];
    [v11 doubleValue];
    self->_lastUpdateTime = v22;
LABEL_24:

    goto LABEL_25;
  }
  self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
LABEL_25:
}

- (id)archiveDictionary
{
  v15[4] = *MEMORY[0x263EF8340];
  name = (__CFString *)self->_name;
  if (!name) {
    name = &stru_26D5DA820;
  }
  v15[0] = name;
  v14[0] = @"name";
  v14[1] = @"status";
  BOOL v4 = [NSNumber numberWithInteger:self->_status];
  v15[1] = v4;
  v14[2] = @"streamInterval";
  v5 = [NSNumber numberWithDouble:self->_streamInterval];
  v15[2] = v5;
  v14[3] = @"lastUpdateTime";
  id v6 = [NSNumber numberWithDouble:self->_lastUpdateTime];
  v15[3] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  v8 = (void *)[v7 mutableCopy];

  objc_super v9 = [(Exchange *)self lastCloseDate];

  if (v9)
  {
    v10 = [(Exchange *)self lastCloseDate];
    [v8 setObject:v10 forKeyedSubscript:@"lastCloseDate"];
  }
  v11 = [(Exchange *)self nextOpenDate];

  if (v11)
  {
    v12 = [(Exchange *)self nextOpenDate];
    [v8 setObject:v12 forKeyedSubscript:@"nextOpenDate"];
  }

  return v8;
}

- (void)setName:(id)a3
{
  if (self->_name != a3)
  {
    id v4 = a3;
    v5 = [(id)objc_opt_class() formattedExchangeNameForName:v4];

    name = self->_name;
    self->_name = v5;
  }
}

- (BOOL)marketIsAfterHours
{
  return (self->_status & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (BOOL)marketIsOpen
{
  return self->_status == 2;
}

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    name = self->_name;
    id v6 = [v4 name];
    BOOL v7 = [(NSString *)name isEqualToString:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  if (self->_lastUpdateTime <= 0.0)
  {
    uint64_t v3 = @"never";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ds ago", (int)(CFAbsoluteTimeGetCurrent() - self->_lastUpdateTime));
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v4 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)Exchange;
  v5 = [(Exchange *)&v14 description];
  name = self->_name;
  unint64_t v7 = self->_status - 1;
  if (v7 > 5) {
    v8 = @"unknown";
  }
  else {
    v8 = off_26467DCD0[v7];
  }
  uint64_t streamInterval = (int)self->_streamInterval;
  v10 = [(NSDate *)self->_lastCloseDate description];
  v11 = [(NSDate *)self->_nextOpenDate description];
  v12 = [v4 stringWithFormat:@"%@ %@ (status: %@, stream interval: %ds, last updated: %@, last close: %@ next open: %@)", v5, name, v8, streamInterval, v3, v10, v11];

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)lastCloseDate
{
  return self->_lastCloseDate;
}

- (void)setLastCloseDate:(id)a3
{
}

- (NSDate)nextOpenDate
{
  return self->_nextOpenDate;
}

- (void)setNextOpenDate:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_int64_t status = a3;
}

- (double)streamInterval
{
  return self->_streamInterval;
}

- (void)setStreamInterval:(double)a3
{
  self->_uint64_t streamInterval = a3;
}

- (double)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextOpenDate, 0);
  objc_storeStrong((id *)&self->_lastCloseDate, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end