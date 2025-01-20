@interface RESessionRelevanceProvider
+ (id)_simulationDateFormatter;
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHistoric;
- (NSDate)endDate;
- (NSDate)startDate;
- (RESessionRelevanceProvider)init;
- (RESessionRelevanceProvider)initWithDictionary:(id)a3;
- (RESessionRelevanceProvider)initWithStartDate:(id)a3 endDate:(id)a4;
- (RESessionRelevanceProvider)initWithStartDate:(id)a3 endDate:(id)a4 historic:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
@end

@implementation RESessionRelevanceProvider

- (RESessionRelevanceProvider)init
{
  return [(RESessionRelevanceProvider *)self initWithStartDate:0 endDate:0];
}

- (RESessionRelevanceProvider)initWithStartDate:(id)a3 endDate:(id)a4
{
  return [(RESessionRelevanceProvider *)self initWithStartDate:a3 endDate:a4 historic:0];
}

- (RESessionRelevanceProvider)initWithStartDate:(id)a3 endDate:(id)a4 historic:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)RESessionRelevanceProvider;
  v10 = [(RERelevanceProvider *)&v17 init];
  if (v10)
  {
    uint64_t v11 = REDateByRemovingSubseconds(v8);
    startDate = v10->_startDate;
    v10->_startDate = (NSDate *)v11;

    uint64_t v13 = REDateByRemovingSubseconds(v9);
    endDate = v10->_endDate;
    v10->_endDate = (NSDate *)v13;

    v10->_historic = a5;
    v15 = v10->_startDate;
    if (v15)
    {
      if (v10->_endDate && -[NSDate compare:](v15, "compare:") == NSOrderedDescending) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Start Date (%@) must occur before the End Date (%@)", v10->_startDate, v10->_endDate format];
      }
    }
  }

  return v10;
}

+ (id)relevanceSimulatorID
{
  return @"session";
}

+ (id)_simulationDateFormatter
{
  if (_simulationDateFormatter_onceToken_0 != -1) {
    dispatch_once(&_simulationDateFormatter_onceToken_0, &__block_literal_global_45);
  }
  v2 = (void *)_simulationDateFormatter_dateFormatter_0;
  return v2;
}

uint64_t __54__RESessionRelevanceProvider__simulationDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_simulationDateFormatter_dateFormatter_0;
  _simulationDateFormatter_dateFormatter_0 = (uint64_t)v0;

  v2 = (void *)_simulationDateFormatter_dateFormatter_0;
  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (RESessionRelevanceProvider)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"start_date"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"end_date"];
  v7 = (void *)v6;
  if (v5)
  {
    id v8 = [(id)objc_opt_class() _simulationDateFormatter];
    id v9 = [v8 dateFromString:v5];

    if (v7)
    {
LABEL_3:
      v10 = [(id)objc_opt_class() _simulationDateFormatter];
      uint64_t v11 = [v10 dateFromString:v7];

      goto LABEL_6;
    }
  }
  else
  {
    id v9 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
LABEL_6:
  uint64_t v12 = [v4 objectForKeyedSubscript:@"historic"];
  uint64_t v13 = (void *)v12;
  v14 = (void *)MEMORY[0x263EFFA80];
  if (v12) {
    v14 = (void *)v12;
  }
  id v15 = v14;

  uint64_t v16 = [v15 BOOLValue];
  objc_super v17 = [(RESessionRelevanceProvider *)self initWithStartDate:v9 endDate:v11 historic:v16];

  return v17;
}

- (id)dictionaryEncoding
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithBool:self->_historic];
  [v3 setObject:v4 forKeyedSubscript:@"historic"];

  if (self->_startDate)
  {
    v5 = [(id)objc_opt_class() _simulationDateFormatter];
    uint64_t v6 = [v5 stringFromDate:self->_startDate];
    [v3 setObject:v6 forKeyedSubscript:@"start_date"];
  }
  if (self->_endDate)
  {
    v7 = [(id)objc_opt_class() _simulationDateFormatter];
    id v8 = [v7 stringFromDate:self->_endDate];
    [v3 setObject:v8 forKeyedSubscript:@"end_date"];
  }
  id v9 = (void *)[v3 copy];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RESessionRelevanceProvider;
  id v4 = [(RERelevanceProvider *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 5, self->_startDate);
  objc_storeStrong(v4 + 6, self->_endDate);
  *((unsigned char *)v4 + 32) = self->_historic;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RESessionRelevanceProvider *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)RESessionRelevanceProvider;
    if ([(RERelevanceProvider *)&v18 isEqual:v4])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = v4;
        startDate = self->_startDate;
        v7 = v5->_startDate;
        if (startDate == v7)
        {
        }
        else
        {
          id v8 = v7;
          id v9 = startDate;
          int v10 = [(NSDate *)v9 isEqual:v8];

          if (!v10) {
            goto LABEL_12;
          }
        }
        endDate = self->_endDate;
        uint64_t v13 = v5->_endDate;
        if (endDate == v13)
        {
        }
        else
        {
          v14 = v13;
          id v15 = endDate;
          int v16 = [(NSDate *)v15 isEqual:v14];

          if (!v16)
          {
LABEL_12:
            BOOL v11 = 0;
LABEL_15:

            goto LABEL_16;
          }
        }
        BOOL v11 = self->_historic == v5->_historic;
        goto LABEL_15;
      }
    }
    BOOL v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)_hash
{
  uint64_t v3 = [(NSDate *)self->_startDate hash];
  uint64_t v4 = [(NSDate *)self->_endDate hash] ^ v3;
  v5 = [NSNumber numberWithBool:self->_historic];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)RESessionRelevanceProvider;
  uint64_t v3 = [(RESessionRelevanceProvider *)&v8 description];
  uint64_t v4 = v3;
  if (self->_historic) {
    v5 = @", historic";
  }
  else {
    v5 = &stru_26CFA57D0;
  }
  unint64_t v6 = [v3 stringByAppendingFormat:@" start=%@, end=%@%@", self->_startDate, self->_endDate, v5];

  return v6;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)isHistoric
{
  return self->_historic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end