@interface _DASRequiresBuddyCompletePolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)buddyCompleteWithActivity:(id)a3 withState:(id)a4;
- (BOOL)fwIsAvailable;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSMutableDictionary)buddyCompleteForUserIdentifier;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (_DASRequiresBuddyCompletePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)_updateCache;
- (void)setBuddyCompleteForUserIdentifier:(id)a3;
- (void)setFwIsAvailable:(BOOL)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASRequiresBuddyCompletePolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_fwIsAvailable)
  {
    if ([v4 requiresBuddyComplete])
    {
      BOOL v6 = 1;
    }
    else
    {
      v7 = [v5 fastPass];
      BOOL v6 = v7 != 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (_DASRequiresBuddyCompletePolicy)init
{
  v11.receiver = self;
  v11.super_class = (Class)_DASRequiresBuddyCompletePolicy;
  v2 = [(_DASRequiresBuddyCompletePolicy *)&v11 init];
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Requires Buddy Complete Policy";

    uint64_t v5 = objc_opt_new();
    buddyCompleteForUserIdentifier = v3->_buddyCompleteForUserIdentifier;
    v3->_buddyCompleteForUserIdentifier = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.dasd.buddyComplete", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    v3->_fwIsAvailable = sub_100048F8C() != 0;
  }
  return v3;
}

- (void)_updateCache
{
  if (self->_fwIsAvailable)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    v3 = (uint64_t (*)(void))off_1001C3D20;
    v25 = off_1001C3D20;
    if (!off_1001C3D20)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000490D0;
      v21[3] = &unk_100175628;
      v21[4] = &v22;
      sub_1000490D0((uint64_t)v21);
      v3 = (uint64_t (*)(void))v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (!v3)
    {
      sub_1000F50F0();
      __break(1u);
    }
    int v4 = v3();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = [(NSMutableDictionary *)self->_buddyCompleteForUserIdentifier keyEnumerator];
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v10 = +[NSNumber numberWithBool:v4 ^ 1u];
          [(NSMutableDictionary *)self->_buddyCompleteForUserIdentifier setObject:v10 forKeyedSubscript:v9];
        }
        id v6 = [v5 countByEnumeratingWithState:&v17 objects:v26 count:16];
      }
      while (v6);
    }

    timer = self->_timer;
    if (v4)
    {
      if (!timer)
      {
        v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
        v13 = self->_timer;
        self->_timer = v12;

        dispatch_set_qos_class_fallback();
        dispatch_source_set_timer((dispatch_source_t)self->_timer, 0, 0x37E11D600uLL, 0x3B9ACA00uLL);
        v14 = self->_timer;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_100048B28;
        handler[3] = &unk_1001754F8;
        handler[4] = self;
        dispatch_source_set_event_handler(v14, handler);
        dispatch_activate((dispatch_object_t)self->_timer);
      }
    }
    else if (timer)
    {
      dispatch_source_cancel(timer);
      v15 = self->_timer;
      self->_timer = 0;
    }
  }
}

+ (id)policyInstance
{
  if (qword_1001C3D08 != -1) {
    dispatch_once(&qword_1001C3D08, &stru_100176130);
  }
  v2 = (void *)qword_1001C3D10;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (BOOL)buddyCompleteWithActivity:(id)a3 withState:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (self->_fwIsAvailable)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100048CC0;
    block[3] = &unk_100175948;
    id v11 = v5;
    v12 = self;
    v13 = &v14;
    dispatch_sync(queue, block);
    BOOL v8 = *((unsigned char *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  BOOL v7 = [(_DASRequiresBuddyCompletePolicy *)self buddyCompleteWithActivity:v6 withState:a4];
  BOOL v8 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  uint64_t v9 = +[NSNumber numberWithBool:v7];
  v10 = +[NSPredicate predicateWithFormat:@"buddyComplete = %@", v9];
  [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v10];

  if (v7)
  {
    uint64_t v11 = 0;
  }
  else if ([(_DASRequiresBuddyCompletePolicy *)self appliesToActivity:v6])
  {
    uint64_t v11 = 33;
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = +[_DASPolicyResponse policyResponseWithDecision:v11 validityDuration:v8 rationale:(double)0x384uLL];

  return v12;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)buddyCompleteForUserIdentifier
{
  return self->_buddyCompleteForUserIdentifier;
}

- (void)setBuddyCompleteForUserIdentifier:(id)a3
{
}

- (BOOL)fwIsAvailable
{
  return self->_fwIsAvailable;
}

- (void)setFwIsAvailable:(BOOL)a3
{
  self->_fwIsAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buddyCompleteForUserIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end