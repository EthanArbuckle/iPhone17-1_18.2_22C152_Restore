@interface MFMonitoredInvocation
+ (MFMonitoredInvocation)invocationWithMethodSignature:(id)a3;
+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 object1:(id)a5 object2:(id)a6 taskName:(id)a7 priority:(int)a8 canBeCancelled:(BOOL)a9;
+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 object:(id)a5 taskName:(id)a6 priority:(int)a7 canBeCancelled:(BOOL)a8;
+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 taskName:(id)a5 priority:(int)a6 canBeCancelled:(BOOL)a7;
- (BOOL)isLowPriority;
- (BOOL)mf_shouldLogInvocation;
- (MFActivityMonitor)monitor;
- (NSString)powerAssertionId;
- (id)description;
- (void)dealloc;
- (void)invoke;
- (void)setIsLowPriority:(BOOL)a3;
- (void)setPowerAssertionId:(id)a3;
- (void)setShouldLogInvocation:(BOOL)a3;
@end

@implementation MFMonitoredInvocation

+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 object:(id)a5 taskName:(id)a6 priority:(int)a7 canBeCancelled:(BOOL)a8
{
  id v10 = a5;
  v8 = (MFMonitoredInvocation *)[a1 invocationWithSelector:a3 target:a4 taskName:a6 priority:*(void *)&a7 canBeCancelled:a8];
  if ((unint64_t)objc_msgSend((id)-[MFMonitoredInvocation methodSignature](v8, "methodSignature"), "numberOfArguments") >= 3)-[MFMonitoredInvocation setArgument:atIndex:](v8, "setArgument:atIndex:", &v10, 2); {
  return v8;
  }
}

+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 taskName:(id)a5 priority:(int)a6 canBeCancelled:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  id v10 = (MFMonitoredInvocation *)objc_msgSend(a1, "mf_invocationWithSelector:target:", a3, a4);
  v11 = [(MFMonitoredInvocation *)v10 monitor];
  [(MFActivityMonitor *)v11 setTaskName:a5];
  [(MFActivityMonitor *)v11 setCanBeCancelled:v7];
  [(EFPriorityDesignator *)v11 setPriority:v8];
  return v10;
}

- (MFActivityMonitor)monitor
{
  return self->_monitor;
}

+ (MFMonitoredInvocation)invocationWithMethodSignature:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MFMonitoredInvocation;
  v3 = (MFMonitoredInvocation *)objc_msgSendSuper2(&v5, sel_invocationWithMethodSignature_, a3);
  v3->_monitor = objc_alloc_init(MFActivityMonitor);
  return v3;
}

- (BOOL)mf_shouldLogInvocation
{
  return self->_shouldLogInvocation;
}

- (void)invoke
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1CFCFE000, log, OS_LOG_TYPE_FAULT, "Exception raised during monitored invocation of %{public}@, exception: %{public}@", buf, 0x16u);
}

+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 object1:(id)a5 object2:(id)a6 taskName:(id)a7 priority:(int)a8 canBeCancelled:(BOOL)a9
{
  id v11 = a6;
  v9 = (MFMonitoredInvocation *)[a1 invocationWithSelector:a3 target:a4 object:a5 taskName:a7 priority:*(void *)&a8 canBeCancelled:a9];
  if ((unint64_t)objc_msgSend((id)-[MFMonitoredInvocation methodSignature](v9, "methodSignature"), "numberOfArguments") >= 4)-[MFMonitoredInvocation setArgument:atIndex:](v9, "setArgument:atIndex:", &v11, 3); {
  return v9;
  }
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
      uint64_t v8 = self;
      _os_log_impl(&dword_1CFCFE000, v3, OS_LOG_TYPE_DEFAULT, "deallocating %p %@", buf, 0x16u);
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)MFMonitoredInvocation;
  [(MFMonitoredInvocation *)&v4 dealloc];
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
  objc_super v5 = NSStringFromClass(v4);
  unint64_t v6 = [(EFPriorityDesignator *)self->_monitor priority];
  uint64_t v7 = [(MFMonitoredInvocation *)self target];
  Name = sel_getName((SEL)[(MFMonitoredInvocation *)self selector]);
  if (self->_isLowPriority) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p priority: %lu target: %@ selector: %s lowPriority: %@>", v5, self, v6, v7, Name, v9];
}

- (BOOL)isLowPriority
{
  return self->_isLowPriority;
}

- (void)setIsLowPriority:(BOOL)a3
{
  self->_isLowPriority = a3;
}

- (NSString)powerAssertionId
{
  return self->_powerAssertionId;
}

- (void)setPowerAssertionId:(id)a3
{
}

@end