@interface TPSOSTransaction
+ (id)transactionWithName:(id)a3;
- (OS_os_transaction)transaction;
- (TPSOSTransaction)initWithTransactionName:(id)a3;
- (double)creationTime;
- (void)dealloc;
- (void)endTransaction;
@end

@implementation TPSOSTransaction

- (void)dealloc
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [a2 creationTime];
  OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_19C8DC000, v4, v5, "Ending transaction %s (%p) - held for %.3fs", v6, v7, v8, v9, v10);
}

- (void).cxx_destruct
{
}

+ (id)transactionWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithTransactionName:v4];

  return v5;
}

- (void)endTransaction
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [a2 creationTime];
  OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_19C8DC000, v4, v5, "Ending transaction: %s (%p) - held for %.3fs", v6, v7, v8, v9, v10);
}

- (TPSOSTransaction)initWithTransactionName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSOSTransaction;
  uint64_t v5 = [(TPSOSTransaction *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 UTF8String];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v5->_creationTime = v7;
    uint64_t v8 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v8;

    uint8_t v10 = +[TPSLogger default];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(TPSOSTransaction *)v6 initWithTransactionName:v10];
    }
  }
  return v5;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (void)initWithTransactionName:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_19C8DC000, log, OS_LOG_TYPE_DEBUG, "Created transaction: %s (%p)", (uint8_t *)&v3, 0x16u);
}

@end