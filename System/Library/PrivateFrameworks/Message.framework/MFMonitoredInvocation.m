@interface MFMonitoredInvocation
+ (MFMonitoredInvocation)invocationWithMethodSignature:(id)a3;
+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 object1:(id)a5 object2:(id)a6 taskName:(id)a7 priority:(unint64_t)a8 canBeCancelled:(BOOL)a9;
+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 object:(id)a5 taskName:(id)a6 priority:(unint64_t)a7 canBeCancelled:(BOOL)a8;
+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 taskName:(id)a5 priority:(unint64_t)a6 canBeCancelled:(BOOL)a7;
- (BOOL)mf_shouldLogInvocation;
- (MFActivityMonitor)monitor;
- (NSString)powerAssertionId;
- (id)description;
- (void)dealloc;
- (void)invoke;
- (void)setPowerAssertionId:(id)a3;
- (void)setShouldLogInvocation:(BOOL)a3;
@end

@implementation MFMonitoredInvocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertionId, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 taskName:(id)a5 priority:(unint64_t)a6 canBeCancelled:(BOOL)a7
{
  BOOL v7 = a7;
  v9 = objc_msgSend(a1, "mf_invocationWithSelector:target:", a3, a4, a5);
  v10 = [v9 monitor];
  [v10 setCanBeCancelled:v7];
  [v10 setPriority:a6];

  return (MFMonitoredInvocation *)v9;
}

- (MFActivityMonitor)monitor
{
  return self->_monitor;
}

+ (MFMonitoredInvocation)invocationWithMethodSignature:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MFMonitoredInvocation;
  v3 = objc_msgSendSuper2(&v7, sel_invocationWithMethodSignature_, a3);
  v4 = objc_alloc_init(MFActivityMonitor);
  v5 = (void *)v3[8];
  v3[8] = v4;

  return (MFMonitoredInvocation *)v3;
}

- (BOOL)mf_shouldLogInvocation
{
  return self->_shouldLogInvocation;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_shouldLogInvocation)
  {
    v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v6 = self;
      __int16 v7 = 2112;
      v8 = self;
      _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "deallocating %p %@", buf, 0x16u);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)MFMonitoredInvocation;
  [(MFMonitoredInvocation *)&v4 dealloc];
}

- (void)invoke
{
  v9[26] = *MEMORY[0x1E4F143B8];
  if (self->_powerAssertionId)
  {
    v3 = +[MFPowerController sharedInstance];
    [v3 retainAssertionWithIdentifier:self->_powerAssertionId];

    objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __31__MFMonitoredInvocation_invoke__block_invoke;
    v9[3] = &unk_1E5D40BF8;
    v9[4] = self;
    v5 = [v4 addObserverForName:@"MFPowerAssertionDidExpire" object:0 queue:0 usingBlock:v9];
  }
  else
  {
    v5 = 0;
  }
  [(MFActivityMonitor *)self->_monitor startActivity];
  if (![(MFActivityMonitor *)self->_monitor shouldCancel])
  {
    v8.receiver = self;
    v8.super_class = (Class)MFMonitoredInvocation;
    [(MFMonitoredInvocation *)&v8 invoke];
    _MFFlushCurrentInvocation();
  }
  [(MFActivityMonitor *)self->_monitor finishedActivity:self];
  if (self->_powerAssertionId)
  {
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:v5];

    __int16 v7 = +[MFPowerController sharedInstance];
    [v7 releaseAssertionWithIdentifier:self->_powerAssertionId];
  }
}

+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 object:(id)a5 taskName:(id)a6 priority:(unint64_t)a7 canBeCancelled:(BOOL)a8
{
  BOOL v8 = a8;
  id v18 = a5;
  v14 = [a1 invocationWithSelector:a3 target:a4 taskName:a6 priority:a7 canBeCancelled:v8];
  v15 = [v14 methodSignature];
  unint64_t v16 = [v15 numberOfArguments];

  if (v16 >= 3) {
    [v14 setArgument:&v18 atIndex:2];
  }

  return (MFMonitoredInvocation *)v14;
}

+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 object1:(id)a5 object2:(id)a6 taskName:(id)a7 priority:(unint64_t)a8 canBeCancelled:(BOOL)a9
{
  id v19 = a6;
  v15 = [a1 invocationWithSelector:a3 target:a4 object:a5 taskName:a7 priority:a8 canBeCancelled:a9];
  unint64_t v16 = [v15 methodSignature];
  unint64_t v17 = [v16 numberOfArguments];

  if (v17 >= 4) {
    [v15 setArgument:&v19 atIndex:3];
  }

  return (MFMonitoredInvocation *)v15;
}

- (void)setShouldLogInvocation:(BOOL)a3
{
  self->_shouldLogInvocation = a3;
}

uint64_t __31__MFMonitoredInvocation_invoke__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) cancel];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(EFPriorityDesignator *)self->_monitor priority];
  __int16 v7 = [(MFMonitoredInvocation *)self target];
  BOOL v8 = [v3 stringWithFormat:@"<%@: %p priority: %lu target: %@ selector: %s>", v5, self, v6, v7, sel_getName((SEL)-[MFMonitoredInvocation selector](self, "selector"))];

  return v8;
}

- (NSString)powerAssertionId
{
  return self->_powerAssertionId;
}

- (void)setPowerAssertionId:(id)a3
{
}

@end