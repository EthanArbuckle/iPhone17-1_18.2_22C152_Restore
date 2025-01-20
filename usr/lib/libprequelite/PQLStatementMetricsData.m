@interface PQLStatementMetricsData
- (PQLStatementMetricsData)initWithStmt:(sqlite3_stmt *)a3 returnedRows:(unint64_t)a4 executionTime:(double)a5 preparationTime:(double)a6;
- (double)executionTime;
- (double)preparationTime;
- (sqlite3_stmt)stmt;
- (unint64_t)returnedRows;
@end

@implementation PQLStatementMetricsData

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (double)preparationTime
{
  return self->_preparationTime;
}

- (double)executionTime
{
  return self->_executionTime;
}

- (PQLStatementMetricsData)initWithStmt:(sqlite3_stmt *)a3 returnedRows:(unint64_t)a4 executionTime:(double)a5 preparationTime:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)PQLStatementMetricsData;
  result = [(PQLStatementMetricsData *)&v11 init];
  if (result)
  {
    result->_stmt = a3;
    result->_returnedRows = a4;
    result->_executionTime = a5;
    result->_preparationTime = a6;
  }
  return result;
}

- (unint64_t)returnedRows
{
  return self->_returnedRows;
}

@end