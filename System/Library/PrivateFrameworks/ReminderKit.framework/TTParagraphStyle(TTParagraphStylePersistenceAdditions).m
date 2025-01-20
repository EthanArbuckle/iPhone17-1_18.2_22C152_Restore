@interface TTParagraphStyle(TTParagraphStylePersistenceAdditions)
@end

@implementation TTParagraphStyle(TTParagraphStylePersistenceAdditions)

- (void)initWithData:()TTParagraphStylePersistenceAdditions .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "TTParagraphStyle protobuf corrupt.", v1, 2u);
}

- (void)saveToArchive:()TTParagraphStylePersistenceAdditions .cold.1()
{
}

- (void)saveToArchive:()TTParagraphStylePersistenceAdditions .cold.2()
{
}

@end