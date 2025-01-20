@interface ICTTTodo(ICTTTodoPersistenceAdditions)
@end

@implementation ICTTTodo(ICTTTodoPersistenceAdditions)

- (void)initWithData:()ICTTTodoPersistenceAdditions .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "ICTTTodo protobuf corrupt.", v1, 2u);
}

@end