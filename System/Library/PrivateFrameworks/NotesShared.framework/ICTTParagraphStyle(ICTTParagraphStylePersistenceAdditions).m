@interface ICTTParagraphStyle(ICTTParagraphStylePersistenceAdditions)
@end

@implementation ICTTParagraphStyle(ICTTParagraphStylePersistenceAdditions)

- (void)initWithData:()ICTTParagraphStylePersistenceAdditions .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "ICTTParagraphStyle protobuf corrupt.", v1, 2u);
}

- (void)saveToArchive:()ICTTParagraphStylePersistenceAdditions .cold.2()
{
}

- (void)saveToArchive:()ICTTParagraphStylePersistenceAdditions .cold.3()
{
}

@end