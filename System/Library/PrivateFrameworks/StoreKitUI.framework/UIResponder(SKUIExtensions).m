@interface UIResponder(SKUIExtensions)
- (uint64_t)_SKUIView;
- (void)_SKUIView;
@end

@implementation UIResponder(SKUIExtensions)

- (uint64_t)_SKUIView
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        [(UIResponder(SKUIExtensions) *)v4 _SKUIView];
      }
    }
  }
  v12 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  v15 = [v12 OSLogObject];
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
    v14 &= 2u;
  }
  if (!v14) {
    goto LABEL_13;
  }
  NSStringFromSelector(a2);
  int v19 = 138412546;
  uint64_t v20 = a1;
  __int16 v21 = 2112;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 22;
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v19, v18);
    free(v16);
    SSFileLog();
LABEL_13:
  }
  return 0;
}

- (void)_SKUIView
{
}

@end