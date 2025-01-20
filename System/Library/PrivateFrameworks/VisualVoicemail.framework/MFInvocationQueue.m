@interface MFInvocationQueue
- (void)_invokeBlock:(id)a3;
- (void)addBlockInvocation:(id)a3 withPriority:(int)a4 controlledBy:(id)a5;
@end

@implementation MFInvocationQueue

- (void)_invokeBlock:(id)a3
{
}

- (void)addBlockInvocation:(id)a3 withPriority:(int)a4 controlledBy:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = [a3 copy];
  id v10 = objc_retainBlock(v9);
  v11 = +[MFMonitoredInvocation invocationWithSelector:"_invokeBlock:" target:self object:v10 taskName:&stru_1000C35D8 priority:v5 canBeCancelled:0];

  [v11 retainArguments];
  v12 = vm_vmd_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v11 monitor];
    v14 = [v11 monitor];
    int v16 = 138413058;
    v17 = self;
    __int16 v18 = 2048;
    v19 = v13;
    __int16 v20 = 2112;
    v21 = v14;
    __int16 v22 = 2112;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[IVQ] queue:%@, monitor:%p.'%@', schedule block => %@", (uint8_t *)&v16, 0x2Au);
  }
  v15 = [v11 monitor];
  [v8 addScheduledActivity:v15];

  [(MFInvocationQueue *)self addInvocation:v11];
}

@end