@interface PLAutoBindingBlackholeProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (PLAutoBindingBlackholeProxy)initWithTargetObject:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation PLAutoBindingBlackholeProxy

- (void).cxx_destruct
{
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[self->_targetObject methodSignatureForSelector:a3];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector((SEL)[v3 selector]);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Swallowing proxy invocation: %@ %@", (uint8_t *)&v6, 0x16u);
  }
}

- (PLAutoBindingBlackholeProxy)initWithTargetObject:(id)a3
{
  return self;
}

@end