@interface FedStatSQLiteDatabaseQueryResult
- (FedStatSQLiteDatabaseQueryResult)initWithQueryStatement:(sqlite3_stmt *)a3;
- (id)next;
- (sqlite3_stmt)queryStatement;
- (void)dealloc;
- (void)setQueryStatement:(sqlite3_stmt *)a3;
@end

@implementation FedStatSQLiteDatabaseQueryResult

- (FedStatSQLiteDatabaseQueryResult)initWithQueryStatement:(sqlite3_stmt *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FedStatSQLiteDatabaseQueryResult;
  result = [(FedStatSQLiteDatabaseQueryResult *)&v5 init];
  if (result) {
    result->_queryStatement = a3;
  }
  return result;
}

- (void)dealloc
{
  sqlite3_finalize([(FedStatSQLiteDatabaseQueryResult *)self queryStatement]);
  v3.receiver = self;
  v3.super_class = (Class)FedStatSQLiteDatabaseQueryResult;
  [(FedStatSQLiteDatabaseQueryResult *)&v3 dealloc];
}

- (id)next
{
  if (sqlite3_step([(FedStatSQLiteDatabaseQueryResult *)self queryStatement]) == 100)
  {
    int v3 = sqlite3_column_count([(FedStatSQLiteDatabaseQueryResult *)self queryStatement]);
    v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v3];
    if (v3 >= 1)
    {
      int v5 = 0;
      v6 = 0;
      do
      {
        v7 = v6;
        v6 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_name(-[FedStatSQLiteDatabaseQueryResult queryStatement](self, "queryStatement"), v5));

        int v8 = sqlite3_column_type([(FedStatSQLiteDatabaseQueryResult *)self queryStatement], v5);
        if ((v8 - 3) < 2)
        {
          uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(-[FedStatSQLiteDatabaseQueryResult queryStatement](self, "queryStatement"), v5));
        }
        else if (v8 == 2)
        {
          uint64_t v9 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(-[FedStatSQLiteDatabaseQueryResult queryStatement](self, "queryStatement"), v5));
        }
        else
        {
          if (v8 == 1) {
            objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(-[FedStatSQLiteDatabaseQueryResult queryStatement](self, "queryStatement"), v5));
          }
          else {
          uint64_t v9 = [MEMORY[0x263EFF9D0] null];
          }
        }
        v10 = (void *)v9;
        [v4 setObject:v9 forKey:v6];

        ++v5;
      }
      while (v3 != v5);
    }
    v11 = (void *)[v4 copy];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (sqlite3_stmt)queryStatement
{
  return self->_queryStatement;
}

- (void)setQueryStatement:(sqlite3_stmt *)a3
{
  self->_queryStatement = a3;
}

@end