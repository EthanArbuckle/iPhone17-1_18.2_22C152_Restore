@interface SiriCoreSQLiteQueryResult
- (NSArray)columnNameTuple;
- (NSArray)columnValueTuples;
- (NSArray)records;
- (NSArray)rowValueMaps;
- (NSArray)rowValueTuples;
- (NSDictionary)columnValuesMap;
- (NSError)error;
- (SiriCoreSQLiteQuery)query;
- (SiriCoreSQLiteQueryResult)initWithQuery:(id)a3 beginMachTime:(unint64_t)a4 endMachTime:(unint64_t)a5 statement:(id)a6 columnNameTuple:(id)a7 columnValueTuples:(id)a8 columnValuesMap:(id)a9 rowValueTuples:(id)a10 rowValueMaps:(id)a11 records:(id)a12 error:(id)a13;
- (SiriCoreSQLiteStatement)statement;
- (id)description;
- (unint64_t)beginMachTime;
- (unint64_t)endMachTime;
@end

@implementation SiriCoreSQLiteQueryResult

- (SiriCoreSQLiteQueryResult)initWithQuery:(id)a3 beginMachTime:(unint64_t)a4 endMachTime:(unint64_t)a5 statement:(id)a6 columnNameTuple:(id)a7 columnValueTuples:(id)a8 columnValuesMap:(id)a9 rowValueTuples:(id)a10 rowValueMaps:(id)a11 records:(id)a12 error:(id)a13
{
  id v46 = a3;
  id v45 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v21 = v18;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  v47.receiver = self;
  v47.super_class = (Class)SiriCoreSQLiteQueryResult;
  v26 = [(SiriCoreSQLiteQueryResult *)&v47 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_query, a3);
    v27->_beginMachTime = a4;
    v27->_endMachTime = a5;
    objc_storeStrong((id *)&v27->_statement, a6);
    uint64_t v28 = [v21 copy];
    columnNameTuple = v27->_columnNameTuple;
    v27->_columnNameTuple = (NSArray *)v28;

    uint64_t v30 = [v19 copy];
    columnValueTuples = v27->_columnValueTuples;
    v27->_columnValueTuples = (NSArray *)v30;

    uint64_t v32 = [v20 copy];
    columnValuesMap = v27->_columnValuesMap;
    v27->_columnValuesMap = (NSDictionary *)v32;

    uint64_t v34 = [v22 copy];
    rowValueTuples = v27->_rowValueTuples;
    v27->_rowValueTuples = (NSArray *)v34;

    uint64_t v36 = [v23 copy];
    rowValueMaps = v27->_rowValueMaps;
    v27->_rowValueMaps = (NSArray *)v36;

    uint64_t v38 = [v24 copy];
    records = v27->_records;
    v27->_records = (NSArray *)v38;

    uint64_t v40 = [v25 copy];
    error = v27->_error;
    v27->_error = (NSError *)v40;
  }
  return v27;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_rowValueMaps, 0);
  objc_storeStrong((id *)&self->_rowValueTuples, 0);
  objc_storeStrong((id *)&self->_columnValuesMap, 0);
  objc_storeStrong((id *)&self->_columnValueTuples, 0);
  objc_storeStrong((id *)&self->_columnNameTuple, 0);
  objc_storeStrong((id *)&self->_statement, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

- (NSArray)records
{
  return self->_records;
}

- (NSArray)rowValueMaps
{
  return self->_rowValueMaps;
}

- (NSArray)rowValueTuples
{
  return self->_rowValueTuples;
}

- (NSDictionary)columnValuesMap
{
  return self->_columnValuesMap;
}

- (NSArray)columnValueTuples
{
  return self->_columnValueTuples;
}

- (NSArray)columnNameTuple
{
  return self->_columnNameTuple;
}

- (SiriCoreSQLiteStatement)statement
{
  return self->_statement;
}

- (unint64_t)endMachTime
{
  return self->_endMachTime;
}

- (unint64_t)beginMachTime
{
  return self->_beginMachTime;
}

- (SiriCoreSQLiteQuery)query
{
  return self->_query;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v7.receiver = self;
  v7.super_class = (Class)SiriCoreSQLiteQueryResult;
  v4 = [(SiriCoreSQLiteQueryResult *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ {query = %@, beginMachTime = %llu, endMachTime = %llu", v4, self->_query, self->_beginMachTime, self->_endMachTime];

  if (self->_columnNameTuple) {
    [v5 appendFormat:@", columnNameTuple = %@", self->_columnNameTuple];
  }
  if (self->_columnValueTuples) {
    [v5 appendFormat:@", columnValueTuples = %@", self->_columnValueTuples];
  }
  if (self->_columnValuesMap) {
    [v5 appendFormat:@", columnValuesMap = %@", self->_columnValuesMap];
  }
  if (self->_rowValueTuples) {
    [v5 appendFormat:@", rowValueTuples = %@", self->_rowValueTuples];
  }
  if (self->_rowValueMaps) {
    [v5 appendFormat:@", rowValueMaps = %@", self->_rowValueMaps];
  }
  if (self->_records) {
    [v5 appendFormat:@", records = %@", self->_records];
  }
  if (self->_error) {
    [v5 appendFormat:@", error = %@", self->_error];
  }
  [v5 appendString:@"}"];

  return v5;
}

@end