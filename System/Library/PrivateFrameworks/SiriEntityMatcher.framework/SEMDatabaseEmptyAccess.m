@interface SEMDatabaseEmptyAccess
- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 batchSize:(unint64_t)a5 offset:(unint64_t)a6 enumerateAll:(BOOL)a7 error:(id *)a8 usingBlock:(id)a9;
- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateRowResultsOfSelect:(id)a3 batchSize:(unint64_t)a4 offset:(unint64_t)a5 enumerateAll:(BOOL)a6 error:(id *)a7 usingBlock:(id)a8;
- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)enumerateRowResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6;
@end

@implementation SEMDatabaseEmptyAccess

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v6 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[SEMDatabaseEmptyAccess enumerateRecordResultsOfSelect:recordClass:error:usingBlock:]";
    _os_log_impl(&dword_25C7CA000, v6, OS_LOG_TYPE_INFO, "%s Returning empty results.", (uint8_t *)&v8, 0xCu);
  }
  return 1;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v6 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[SEMDatabaseEmptyAccess enumerateRowResultsOfSelect:recordClass:error:usingBlock:]";
    _os_log_impl(&dword_25C7CA000, v6, OS_LOG_TYPE_INFO, "%s Returning empty results.", (uint8_t *)&v8, 0xCu);
  }
  return 1;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 batchSize:(unint64_t)a5 offset:(unint64_t)a6 enumerateAll:(BOOL)a7 error:(id *)a8 usingBlock:(id)a9
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v9 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    v12 = "-[SEMDatabaseEmptyAccess enumerateRecordResultsOfSelect:recordClass:batchSize:offset:enumerateAll:error:usingBlock:]";
    _os_log_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_INFO, "%s Returning empty results", (uint8_t *)&v11, 0xCu);
  }
  return 1;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 batchSize:(unint64_t)a4 offset:(unint64_t)a5 enumerateAll:(BOOL)a6 error:(id *)a7 usingBlock:(id)a8
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v8 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    int v11 = "-[SEMDatabaseEmptyAccess enumerateRowResultsOfSelect:batchSize:offset:enumerateAll:error:usingBlock:]";
    _os_log_impl(&dword_25C7CA000, v8, OS_LOG_TYPE_INFO, "%s Returning empty results", (uint8_t *)&v10, 0xCu);
  }
  return 1;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    int v8 = "-[SEMDatabaseEmptyAccess enumerateRowResultsOfSelect:error:usingBlock:]";
    _os_log_impl(&dword_25C7CA000, v5, OS_LOG_TYPE_INFO, "%s Returning empty results.", (uint8_t *)&v7, 0xCu);
  }
  return 1;
}

@end