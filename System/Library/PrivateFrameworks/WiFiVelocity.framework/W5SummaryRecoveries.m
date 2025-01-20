@interface W5SummaryRecoveries
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecoveries:(id)a3;
- (NSArray)lastHrRecoveries;
- (W5SummaryRecoveries)initWithCoder:(id)a3;
- (W5SummaryRecoveries)initWithSummaryRecoveries:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLastHrRecoveries:(id)a3;
@end

@implementation W5SummaryRecoveries

- (W5SummaryRecoveries)initWithSummaryRecoveries:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)W5SummaryRecoveries;
  v5 = [(W5SummaryRecoveries *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)v4;
    p_super = &v5->_lastHrRecoveries->super;
    v5->_lastHrRecoveries = v6;
  }
  else
  {
    p_super = W5GetOSLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      v11 = "-[W5SummaryRecoveries initWithSummaryRecoveries:]";
      __int16 v12 = 2080;
      v13 = "W5SummaryRecoveries.m";
      __int16 v14 = 1024;
      int v15 = 31;
      __int16 v16 = 2080;
      v17 = "-[W5SummaryRecoveries initWithSummaryRecoveries:]";
      _os_log_send_and_compose_impl();
    }
  }

  return v5;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] stringWithCapacity:0];
  objc_msgSend(v3, "appendFormat:", @"Recoveries in last Hour: %lu\n", -[NSArray count](self->_lastHrRecoveries, "count"));
  if ([(NSArray *)self->_lastHrRecoveries count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    obj = self->_lastHrRecoveries;
    uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_super v9 = [v8 objectForKeyedSubscript:@"recoveryType"];
          [v3 appendFormat:@"Recovery Type: %@\n", v9];

          int v10 = [v8 objectForKeyedSubscript:@"recoveryReason"];
          [v3 appendFormat:@"\tRecovery Reason: %@\n", v10];
        }
        uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }
  }
  return v3;
}

- (BOOL)isEqualToRecoveries:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  NSUInteger v5 = [(NSArray *)self->_lastHrRecoveries count];
  uint64_t v6 = [v4 lastHrRecoveries];
  uint64_t v7 = [v6 count];

  if (v5 == v7)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = [v4 lastHrRecoveries];
    uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      id v21 = v4;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v13 = self->_lastHrRecoveries;
          uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (!v14)
          {

LABEL_20:
            BOOL v19 = 0;
            id v4 = v21;
            goto LABEL_21;
          }
          uint64_t v15 = v14;
          int v16 = 0;
          uint64_t v17 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v24 != v17) {
                objc_enumerationMutation(v13);
              }
              v16 |= objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "isEqualToDictionary:", v12, v21);
            }
            uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v15);

          if ((v16 & 1) == 0) {
            goto LABEL_20;
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
        BOOL v19 = 1;
        id v4 = v21;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v19 = 1;
    }
LABEL_21:
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (W5SummaryRecoveries *)a3;
  NSUInteger v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(W5SummaryRecoveries *)self isEqualToRecoveries:v5];

  return v6;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_lastHrRecoveries hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[W5SummaryRecoveries allocWithZone:a3] init];
  [(W5SummaryRecoveries *)v4 setLastHrRecoveries:self->_lastHrRecoveries];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (W5SummaryRecoveries)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)W5SummaryRecoveries;
  NSUInteger v5 = [(W5SummaryRecoveries *)&v16 init];
  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"_lastHrRecoveries"];
    uint64_t v13 = [v12 copy];
    lastHrRecoveries = v5->_lastHrRecoveries;
    v5->_lastHrRecoveries = (NSArray *)v13;
  }
  return v5;
}

- (NSArray)lastHrRecoveries
{
  return self->_lastHrRecoveries;
}

- (void)setLastHrRecoveries:(id)a3
{
}

- (void).cxx_destruct
{
}

@end