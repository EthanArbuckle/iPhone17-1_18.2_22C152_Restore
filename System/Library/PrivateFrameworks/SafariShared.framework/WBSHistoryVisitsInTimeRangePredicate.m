@interface WBSHistoryVisitsInTimeRangePredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)evaluateServiceVisit:(id)a3;
- (BOOL)evaluateVisit:(id)a3;
- (NSString)description;
- (WBSHistoryVisitsInTimeRangePredicate)initWithCoder:(id)a3;
- (WBSHistoryVisitsInTimeRangePredicate)initWithStartDate:(id)a3 endDate:(id)a4 urlString:(id)a5 urlHash:(id)a6 urlSalt:(id)a7;
- (id)statementForDatabase:(id)a3 cache:(id)a4 fetchOptions:(unint64_t)a5 error:(id *)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSHistoryVisitsInTimeRangePredicate

- (WBSHistoryVisitsInTimeRangePredicate)initWithStartDate:(id)a3 endDate:(id)a4 urlString:(id)a5 urlHash:(id)a6 urlSalt:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)WBSHistoryVisitsInTimeRangePredicate;
  v17 = [(WBSHistoryVisitsInTimeRangePredicate *)&v28 init];
  if (v17)
  {
    [v12 timeIntervalSinceReferenceDate];
    v17->_startTime = v18;
    [v13 timeIntervalSinceReferenceDate];
    v17->_endTime = v19;
    uint64_t v20 = [v14 copy];
    urlString = v17->_urlString;
    v17->_urlString = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    urlHash = v17->_urlHash;
    v17->_urlHash = (NSData *)v22;

    uint64_t v24 = [v16 copy];
    urlSalt = v17->_urlSalt;
    v17->_urlSalt = (NSData *)v24;

    v26 = v17;
  }

  return v17;
}

- (WBSHistoryVisitsInTimeRangePredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSHistoryVisitsInTimeRangePredicate;
  v5 = [(WBSHistoryVisitsInTimeRangePredicate *)&v16 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"startTime"];
    v5->_startTime = v6;
    [v4 decodeDoubleForKey:@"endTime"];
    v5->_endTime = v7;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlHash"];
    urlHash = v5->_urlHash;
    v5->_urlHash = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlSalt"];
    urlSalt = v5->_urlSalt;
    v5->_urlSalt = (NSData *)v12;

    id v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"startTime" forKey:self->_startTime];
  [v4 encodeDouble:@"endTime" forKey:self->_endTime];
  [v4 encodeObject:self->_urlString forKey:@"url"];
  [v4 encodeObject:self->_urlHash forKey:@"urlHash"];
  [v4 encodeObject:self->_urlSalt forKey:@"urlSalt"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)statementForDatabase:(id)a3 cache:(id)a4 fetchOptions:(unint64_t)a5 error:(id *)a6
{
  id v8 = a4;
  v9 = v8;
  if (self->_urlString)
  {
    uint64_t v10 = @"SELECT history_visits.* FROM history_visits INNER JOIN history_items ON history_items.id = history_visits.history_item WHERE visit_time > ? AND visit_time < ? AND history_items.url = ?";
  }
  else if (self->_urlHash)
  {
    uint64_t v10 = @"SELECT history_visits.* FROM history_visits WHERE visit_time > ? AND visit_time < ? AND history_item IN (SELECT id from history_items WHERE safari_sha512(url, ?) = ?)";
  }
  else
  {
    uint64_t v10 = @"SELECT history_visits.* FROM history_visits where visit_time > ? AND visit_time < ?";
  }
  v11 = [v8 statementForQuery:v10 error:a6];
  uint64_t v12 = v11;
  if (v11)
  {
    if (self->_urlString)
    {
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,double &,double &,NSString * {__strong}&>(v11, &self->_startTime, &self->_endTime, &self->_urlString);
    }
    else
    {
      p_startTime = &self->_startTime;
      p_endTime = &self->_endTime;
      if (self->_urlHash) {
        SafariShared::_WBSSQLiteStatementBindAllParameters<1,double &,double &,NSData * {__strong}&,NSData * {__strong}&>(v11, p_startTime, p_endTime, &self->_urlSalt, &self->_urlHash);
      }
      else {
        SafariShared::_WBSSQLiteStatementBindAllParameters<1,double &,double &>(v11, p_startTime, p_endTime);
      }
    }
  }

  return v12;
}

- (BOOL)evaluateVisit:(id)a3
{
  id v4 = a3;
  [v4 visitTime];
  if (self->_startTime >= v5 || v5 >= self->_endTime)
  {
    char v8 = 0;
  }
  else
  {
    if (self->_urlString)
    {
      double v6 = [v4 item];
      double v7 = [v6 urlString];
      char v8 = [v7 isEqualToString:self->_urlString];
    }
    else
    {
      if (!self->_urlHash)
      {
        char v8 = 1;
        goto LABEL_9;
      }
      urlSalt = self->_urlSalt;
      double v6 = [v4 item];
      double v7 = [v6 urlString];
      uint64_t v10 = WBSHistorySHA512(urlSalt, v7);
      char v8 = [v10 isEqualToData:self->_urlHash];
    }
  }
LABEL_9:

  return v8;
}

- (BOOL)evaluateServiceVisit:(id)a3
{
  [a3 visitTime];
  return self->_startTime < v4 && v4 < self->_endTime;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_urlString)
  {
    double v5 = @"url";
  }
  else if (self->_urlHash)
  {
    double v5 = @"hash";
  }
  else
  {
    double v5 = @"range";
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; startTime = %f; endTime = %f; mode = %@>",
                       v4,
                       self,
                       *(void *)&self->_startTime,
                       *(void *)&self->_endTime,
                       v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSalt, 0);
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end