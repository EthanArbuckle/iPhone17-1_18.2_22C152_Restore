@interface WBSHistorySession
+ (id)currentSession;
- (BOOL)isCurrentSession;
- (BOOL)isEqual:(id)a3;
- (NSDate)startDate;
- (WBSHistorySession)init;
- (WBSHistorySession)initWithSessionStartDate:(id)a3;
- (unint64_t)hash;
@end

@implementation WBSHistorySession

+ (id)currentSession
{
  id v2 = objc_alloc((Class)a1);
  v3 = currentSessionStartDate();
  v4 = (void *)[v2 initWithSessionStartDate:v3];

  return v4;
}

- (WBSHistorySession)init
{
  return 0;
}

- (WBSHistorySession)initWithSessionStartDate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistorySession;
  v6 = [(WBSHistorySession *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_startDate, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isCurrentSession
{
  startDate = self->_startDate;
  v3 = currentSessionStartDate();
  LOBYTE(startDate) = [(NSDate *)startDate isEqualToDate:v3];

  return (char)startDate;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSHistorySession *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      startDate = self->_startDate;
      v6 = [(WBSHistorySession *)v4 startDate];
      char v7 = [(NSDate *)startDate isEqualToDate:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSDate *)self->_startDate hash];
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void).cxx_destruct
{
}

@end