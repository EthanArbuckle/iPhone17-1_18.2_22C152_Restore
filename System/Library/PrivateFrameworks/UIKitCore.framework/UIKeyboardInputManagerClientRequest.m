@interface UIKeyboardInputManagerClientRequest
+ (id)untargetedInvocationWithInvocation:(id)a3 withCompletion:(BOOL)a4;
- (NSInvocation)invocation;
- (UIKeyboardInputManagerClientRequest)initWithInvocation:(id)a3;
- (unint64_t)errorCount;
- (void)setErrorCount:(unint64_t)a3;
@end

@implementation UIKeyboardInputManagerClientRequest

- (UIKeyboardInputManagerClientRequest)initWithInvocation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardInputManagerClientRequest;
  v5 = [(UIKeyboardInputManagerClientRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() untargetedInvocationWithInvocation:v4 withCompletion:1];
    invocation = v5->_invocation;
    v5->_invocation = (NSInvocation *)v6;

    [(NSInvocation *)v5->_invocation retainArguments];
  }

  return v5;
}

- (NSInvocation)invocation
{
  v3 = objc_opt_class();
  invocation = self->_invocation;
  return (NSInvocation *)[v3 untargetedInvocationWithInvocation:invocation withCompletion:1];
}

+ (id)untargetedInvocationWithInvocation:(id)a3 withCompletion:(BOOL)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 methodSignature];
  v7 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v6];
  objc_msgSend(v7, "setSelector:", objc_msgSend(v5, "selector"));
  v8 = (char *)v13 - (([v6 frameLength] + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = [v6 numberOfArguments];
  if (v9 >= 3)
  {
    unint64_t v10 = v9;
    for (uint64_t i = 2; i != v10; ++i)
    {
      if (!a4
        && !strncmp((const char *)[v6 getArgumentTypeAtIndex:i], "@?", 2uLL))
      {
        break;
      }
      [v5 getArgument:v8 atIndex:i];
      [v7 setArgument:v8 atIndex:i];
    }
  }

  return v7;
}

- (unint64_t)errorCount
{
  return self->_errorCount;
}

- (void)setErrorCount:(unint64_t)a3
{
  self->_errorCount = a3;
}

- (void).cxx_destruct
{
}

@end