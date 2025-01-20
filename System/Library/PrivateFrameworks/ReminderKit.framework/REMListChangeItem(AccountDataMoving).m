@interface REMListChangeItem(AccountDataMoving)
@end

@implementation REMListChangeItem(AccountDataMoving)

- (void)copyListDataFrom:()AccountDataMoving .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v3 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "ListChangeItem (AccountDataMover): Copying from a source list which is a group, the case is not supported for now {sourceID: %@}.", v4, 0xCu);
}

@end