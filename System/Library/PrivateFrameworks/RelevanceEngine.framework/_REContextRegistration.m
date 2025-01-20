@interface _REContextRegistration
- (NSUUID)uuid;
- (REDuetContextQuery)query;
- (_CDUserContext)context;
- (_REContextRegistration)initWithQuery:(id)a3;
- (id)callback;
- (void)_evaluateQueryWithRegistration:(BOOL)a3;
- (void)dealloc;
- (void)deregisterWithContext;
- (void)evaluateQuery;
- (void)registerWithContext;
- (void)setCallback:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation _REContextRegistration

- (_REContextRegistration)initWithQuery:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_REContextRegistration;
  v6 = [(_REContextRegistration *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_query, a3);
    registrations = v7->_registrations;
    v7->_registrations = (NSArray *)MEMORY[0x263EFFA68];

    v7->_registered = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(_REContextRegistration *)self deregisterWithContext];
  v3.receiver = self;
  v3.super_class = (Class)_REContextRegistration;
  [(_REContextRegistration *)&v3 dealloc];
}

- (NSUUID)uuid
{
  return [(REDuetContextQuery *)self->_query uuid];
}

- (void)registerWithContext
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_context)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&REContextRegistrationLock);
    if (!self->_registered)
    {
      self->_registered = 1;
      objc_initWeak(&location, self);
      query = self->_query;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __45___REContextRegistration_registerWithContext__block_invoke;
      v14[3] = &unk_2644BC638;
      objc_copyWeak(&v15, &location);
      v4 = [(REDuetContextQuery *)query createRegistrationsWithCallback:v14];
      registrations = self->_registrations;
      self->_registrations = v4;

      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      v6 = self->_registrations;
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v6);
            }
            -[_CDUserContext registerCallback:](self->_context, "registerCallback:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
          }
          while (v7 != v9);
          uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v17 count:16];
        }
        while (v7);
      }

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&REContextRegistrationLock);
  }
}

- (void)deregisterWithContext
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_context)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&REContextRegistrationLock);
    if (self->_registered)
    {
      self->_registered = 0;
      long long v9 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      objc_super v3 = self->_registrations;
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v10;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v10 != v6) {
              objc_enumerationMutation(v3);
            }
            -[_CDUserContext deregisterCallback:](self->_context, "deregisterCallback:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), (void)v9);
          }
          while (v5 != v7);
          uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v5);
      }

      registrations = self->_registrations;
      self->_registrations = (NSArray *)MEMORY[0x263EFFA68];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&REContextRegistrationLock);
  }
}

- (void)evaluateQuery
{
}

- (void)_evaluateQueryWithRegistration:(BOOL)a3
{
  if (self->_callback)
  {
    BOOL v3 = a3;
    if (self->_context)
    {
      -[REDuetContextQuery valueFromUserContext:](self->_query, "valueFromUserContext:");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void))self->_callback + 2))();
      if (v3)
      {
        [(_REContextRegistration *)self deregisterWithContext];
        [(_REContextRegistration *)self registerWithContext];
      }
    }
  }
}

- (REDuetContextQuery)query
{
  return self->_query;
}

- (_CDUserContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
}

@end