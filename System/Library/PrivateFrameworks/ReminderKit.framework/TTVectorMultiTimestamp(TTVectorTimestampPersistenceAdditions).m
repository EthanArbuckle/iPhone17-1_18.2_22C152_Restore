@interface TTVectorMultiTimestamp(TTVectorTimestampPersistenceAdditions)
@end

@implementation TTVectorMultiTimestamp(TTVectorTimestampPersistenceAdditions)

- (void)initWithData:()TTVectorTimestampPersistenceAdditions andCapacity:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "TTVectorMultiTimestamp protobuf corrupt.", v1, 2u);
}

- (void)initWithArchive:()TTVectorTimestampPersistenceAdditions andCapacity:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "TTVectorMultiTimestamp clock requires uuids.", v1, 2u);
}

- (void)initWithArchive:()TTVectorTimestampPersistenceAdditions andCapacity:.cold.2(int a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "TTVectorMultiTimestamp requires the same number of clocks as capacity %d != %ld.", (uint8_t *)v3, 0x12u);
}

@end