@interface NSUserActivity(SYDocumentWorkflows_Internal)
- (void)loadDocumentWithHandler:()SYDocumentWorkflows_Internal;
@end

@implementation NSUserActivity(SYDocumentWorkflows_Internal)

- (void)loadDocumentWithHandler:()SYDocumentWorkflows_Internal
{
  v8 = a3;
  uint64_t v4 = -[NSUserActivity _syDocument](a1);
  if (!v4)
  {
    v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[NSUserActivity(SYDocumentWorkflows_Internal) loadDocumentWithHandler:](v6);
    }

    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"user activity doesn't have a document." userInfo:0];
    objc_exception_throw(v7);
  }
  v5 = (void *)v4;
  v8[2](v8, v4);
}

- (void)loadDocumentWithHandler:()SYDocumentWorkflows_Internal .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C2C5F000, log, OS_LOG_TYPE_FAULT, "user activity doesn't have a document.", v1, 2u);
}

@end