@interface JSATimerContext
- (BOOL)isRepeating;
- (JSAManagedArray)managedArgs;
- (JSATimerContext)initWithCallback:(id)a3 callbackArgs:(id)a4 ownerObject:(id)a5 repeating:(BOOL)a6 interval:(double)a7 timer:(id)a8;
- (JSManagedValue)managedCallback;
- (NSTimer)timer;
- (double)interval;
- (id)description;
- (id)ownerObject;
- (void)dealloc;
- (void)removeManagedReferences;
- (void)setTimer:(id)a3;
@end

@implementation JSATimerContext

- (JSATimerContext)initWithCallback:(id)a3 callbackArgs:(id)a4 ownerObject:(id)a5 repeating:(BOOL)a6 interval:(double)a7 timer:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)JSATimerContext;
  v18 = [(JSATimerContext *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong(&v18->_ownerObject, a5);
    uint64_t v20 = +[JSManagedValue managedValueWithValue:v14 andOwner:v16];
    managedCallback = v19->_managedCallback;
    v19->_managedCallback = (JSManagedValue *)v20;

    if ([v15 count])
    {
      v22 = [[JSAManagedArray alloc] initWithArray:v15 ownerObject:v16];
      managedArgs = v19->_managedArgs;
      v19->_managedArgs = v22;
    }
    else
    {
      managedArgs = v19->_managedArgs;
      v19->_managedArgs = 0;
    }

    v19->_interval = a7;
    v19->_isRepeating = a6;
    objc_storeStrong((id *)&v19->_timer, a8);
  }

  return v19;
}

- (id)description
{
  v3 = [(JSATimerContext *)self timer];
  unsigned int v4 = [(JSATimerContext *)self isRepeating];
  [(JSATimerContext *)self interval];
  v6 = +[NSString stringWithFormat:@"<JSATimerContext %p, timer=%p, repeating=%d, interval=%0.3gs>", self, v3, v4, v5];

  return v6;
}

- (void)removeManagedReferences
{
  v3 = [(JSManagedValue *)self->_managedCallback value];
  unsigned int v4 = [v3 context];
  uint64_t v5 = [v4 virtualMachine];
  [v5 removeManagedReference:self->_managedCallback withOwner:self->_ownerObject];

  managedCallback = self->_managedCallback;
  self->_managedCallback = 0;

  managedArgs = self->_managedArgs;
  self->_managedArgs = 0;

  timer = self->_timer;
  self->_timer = 0;
}

- (void)dealloc
{
  if (self->_managedCallback)
  {
    v3 = JSALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_84A94(v3);
    }

    [(JSATimerContext *)self removeManagedReferences];
  }
  v4.receiver = self;
  v4.super_class = (Class)JSATimerContext;
  [(JSATimerContext *)&v4 dealloc];
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (id)ownerObject
{
  return self->_ownerObject;
}

- (JSManagedValue)managedCallback
{
  return self->_managedCallback;
}

- (JSAManagedArray)managedArgs
{
  return self->_managedArgs;
}

- (BOOL)isRepeating
{
  return self->_isRepeating;
}

- (double)interval
{
  return self->_interval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedArgs, 0);
  objc_storeStrong((id *)&self->_managedCallback, 0);
  objc_storeStrong(&self->_ownerObject, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end