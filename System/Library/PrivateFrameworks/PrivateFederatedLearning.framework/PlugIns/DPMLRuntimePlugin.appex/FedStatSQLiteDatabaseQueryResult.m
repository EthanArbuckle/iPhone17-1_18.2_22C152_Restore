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
    v4 = +[NSMutableDictionary dictionaryWithCapacity:v3];
    if (v3 >= 1)
    {
      int v5 = 0;
      v6 = 0;
      do
      {
        v7 = v6;
        v6 = +[NSString stringWithUTF8String:sqlite3_column_name([(FedStatSQLiteDatabaseQueryResult *)self queryStatement], v5)];

        int v8 = sqlite3_column_type([(FedStatSQLiteDatabaseQueryResult *)self queryStatement], v5);
        if ((v8 - 3) < 2)
        {
          uint64_t v9 = +[NSString stringWithUTF8String:sqlite3_column_text([(FedStatSQLiteDatabaseQueryResult *)self queryStatement], v5)];
        }
        else if (v8 == 2)
        {
          uint64_t v9 = +[NSNumber numberWithDouble:sqlite3_column_double([(FedStatSQLiteDatabaseQueryResult *)self queryStatement], v5)];
        }
        else
        {
          if (v8 == 1) {
            +[NSNumber numberWithInt:sqlite3_column_int([(FedStatSQLiteDatabaseQueryResult *)self queryStatement], v5)];
          }
          else {
          uint64_t v9 = +[NSNull null];
          }
        }
        v10 = (void *)v9;
        [v4 setObject:v9 forKey:v6];

        ++v5;
      }
      while (v3 != v5);
    }
    id v11 = [v4 copy];
  }
  else
  {
    id v11 = 0;
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