@interface _UIViewServiceReplyControlTrampoline
- (void)_forwardInvocation:(id)a3 withIncomingReplyDispatchBlock:(id)a4;
- (void)forwardInvocation:(id)a3;
@end

@implementation _UIViewServiceReplyControlTrampoline

- (void)_forwardInvocation:(id)a3 withIncomingReplyDispatchBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 methodSignature];
  if (![v8 numberOfArguments])
  {
    id v28 = 0;
LABEL_14:
    v27.receiver = self;
    v24 = &v27;
    goto LABEL_15;
  }
  v25 = v7;
  unint64_t v9 = 0;
  uint64_t v10 = *MEMORY[0x1E4F1C3C8];
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v12 = v11;
    id v13 = v8;
    if (!strncmp((const char *)[v13 getArgumentTypeAtIndex:v9], "@?", 2uLL))
    {
      uint64_t v11 = v9;
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_7;
      }
      v14 = (void *)MEMORY[0x1E4F1CA00];
      v15 = [v6 debugDescription];
      [v14 raise:v10, @"reply awaiting can only be used with methods that only have one block (failing invocation: %@)", v15 format];
    }
    uint64_t v11 = v12;
LABEL_7:
    ++v9;
  }
  while ([v13 numberOfArguments] > v9);
  id v28 = 0;
  id v7 = v25;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_14;
  }
  [v6 getArgument:&v28 atIndex:v11];
  if (!v28) {
    goto LABEL_14;
  }
  id v16 = [v6 methodSignature];
  int v17 = strcmp((const char *)[v16 methodReturnType], "v");

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    v19 = [v6 debugDescription];
    [v18 raise:v10, @"reply awaiting can't handle invocations with a reply handler which also return a value (failing invocation: %@)", v19 format];
  }
  v20 = (void *)[v28 copy];
  id v21 = v28;
  id v28 = v20;

  [v6 setArgument:&v28 atIndex:v11];
  id v22 = v28;
  v23 = (void *)[v25 copy];
  objc_setAssociatedObject(v22, &_UIViewServiceIncomingReplyHandlerKey, v23, (void *)0x301);

  v26 = self;
  v24 = (objc_super *)&v26;
LABEL_15:
  v24->super_class = (Class)_UIViewServiceReplyControlTrampoline;
  [(objc_super *)v24 forwardInvocation:v6];
}

- (void)forwardInvocation:(id)a3
{
}

@end