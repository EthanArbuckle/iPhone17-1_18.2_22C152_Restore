@interface TIActionWhenIdle
+ (id)actionWhenIdleWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5;
- (BOOL)isValid;
- (NSInvocation)invocation;
- (TIActionWhenIdle)initWithInvocation:(id)a3;
- (TIActionWhenIdle)initWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5;
- (void)addObserverToRunLoop;
- (void)invalidate;
- (void)invoke;
- (void)setInvocation:(id)a3;
@end

@implementation TIActionWhenIdle

- (void)invoke
{
  id v3 = [(TIActionWhenIdle *)self invocation];
  [(TIActionWhenIdle *)self setInvocation:0];
  [v3 invoke];
}

void __40__TIActionWhenIdle_addObserverToRunLoop__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invoke];
}

- (void)setInvocation:(id)a3
{
}

- (NSInvocation)invocation
{
  return self->_invocation;
}

+ (id)actionWhenIdleWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithTarget:v9 selector:a4 object:v8];

  return v10;
}

- (TIActionWhenIdle)initWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8 = a3;
  id v17 = a5;
  id v9 = [v8 methodSignatureForSelector:a4];
  v10 = v9;
  if (!v9)
  {
LABEL_8:

    v14 = 0;
    goto LABEL_9;
  }
  unint64_t v11 = [v9 numberOfArguments];
  unint64_t v12 = v11;
  if ((v11 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (v11 >= 4)
    {
      v15 = NSStringFromSelector(a4);
      NSLog(&cfstr_SMethodRequire.isa, "-[TIActionWhenIdle initWithTarget:selector:object:]", v15);
    }
    goto LABEL_8;
  }
  v13 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v10];
  [v13 setTarget:v8];
  [v13 setSelector:a4];
  if (v12 >= 3) {
    [v13 setArgument:&v17 atIndex:2];
  }
  v14 = [(TIActionWhenIdle *)self initWithInvocation:v13];

LABEL_9:
  return v14;
}

- (TIActionWhenIdle)initWithInvocation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIActionWhenIdle;
  v6 = [(TIActionWhenIdle *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_invocation, a3);
    [(NSInvocation *)v7->_invocation retainArguments];
    [(TIActionWhenIdle *)v7 addObserverToRunLoop];
  }

  return v7;
}

- (void)addObserverToRunLoop
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__TIActionWhenIdle_addObserverToRunLoop__block_invoke;
  v4[3] = &unk_1E55588B0;
  objc_copyWeak(&v5, &location);
  v2 = CFRunLoopObserverCreateWithHandler(0, 0x20uLL, 0, 0, v4);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddObserver(Current, v2, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  CFRelease(v2);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
}

- (void)invalidate
{
}

- (BOOL)isValid
{
  v2 = [(TIActionWhenIdle *)self invocation];
  BOOL v3 = v2 != 0;

  return v3;
}

@end