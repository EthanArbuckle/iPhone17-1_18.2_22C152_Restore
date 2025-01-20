@interface UIResponder(SUUIExtensions)
- (uint64_t)_SUUIView;
@end

@implementation UIResponder(SUUIExtensions)

- (uint64_t)_SUUIView
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_9;
  }
  NSStringFromSelector(a2);
  int v11 = 138412546;
  uint64_t v12 = a1;
  __int16 v13 = 2112;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 22;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v11, v10);
    free(v8);
    SSFileLog();
LABEL_9:
  }
  return 0;
}

@end