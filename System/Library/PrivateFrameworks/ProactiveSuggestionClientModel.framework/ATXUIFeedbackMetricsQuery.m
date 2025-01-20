@interface ATXUIFeedbackMetricsQuery
- (ATXUIFeedbackMetricsQuery)init;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXUIFeedbackMetricsQuery:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (int64_t)clientModelType;
- (unint64_t)hash;
- (unsigned)consumerSubType;
- (void)setClientModelType:(int64_t)a3;
- (void)setConsumerSubType:(unsigned __int8)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation ATXUIFeedbackMetricsQuery

- (ATXUIFeedbackMetricsQuery)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXUIFeedbackMetricsQuery;
  v2 = [(ATXUIFeedbackMetricsQuery *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
    startDate = v2->_startDate;
    v2->_startDate = (NSDate *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
    endDate = v2->_endDate;
    v2->_endDate = (NSDate *)v5;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXUIFeedbackMetricsQuery *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXUIFeedbackMetricsQuery *)self isEqualToATXUIFeedbackMetricsQuery:v5];

  return v6;
}

- (BOOL)isEqualToATXUIFeedbackMetricsQuery:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  uint64_t v5 = v4;
  if (self->_clientModelType != *((void *)v4 + 4) || self->_consumerSubType != v4[8]) {
    goto LABEL_5;
  }
  startDate = self->_startDate;
  v7 = (NSDate *)*((id *)v4 + 2);
  if (startDate == v7)
  {
  }
  else
  {
    objc_super v8 = v7;
    v9 = startDate;
    char v10 = [(NSDate *)v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
LABEL_5:
      char v11 = 0;
      goto LABEL_6;
    }
  }
  v13 = self->_endDate;
  v14 = v13;
  if (v13 == (NSDate *)v5[3]) {
    char v11 = 1;
  }
  else {
    char v11 = -[NSDate isEqual:](v13, "isEqual:");
  }

LABEL_6:
  return v11;
}

- (unint64_t)hash
{
  int64_t v3 = self->_consumerSubType - self->_clientModelType + 32 * self->_clientModelType;
  uint64_t v4 = [(NSDate *)self->_startDate hash] - v3 + 32 * v3;
  return [(NSDate *)self->_endDate hash] - v4 + 32 * v4;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (int64_t)clientModelType
{
  return self->_clientModelType;
}

- (void)setClientModelType:(int64_t)a3
{
  self->_clientModelType = a3;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(unsigned __int8)a3
{
  self->_consumerSubType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end