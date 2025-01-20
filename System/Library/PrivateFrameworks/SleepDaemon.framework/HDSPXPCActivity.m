@interface HDSPXPCActivity
- (BOOL)deferIfNecessary;
- (HDSPXPCActivity)initWithEventName:(id)a3 options:(unint64_t)a4 criteria:(id)a5;
- (HDSPXPCActivity)initWithEventName:(id)a3 options:(unint64_t)a4 criteria:(id)a5 activity:(id)a6;
- (NSString)name;
- (OS_xpc_object)activity;
- (OS_xpc_object)criteria;
- (unint64_t)options;
@end

@implementation HDSPXPCActivity

- (HDSPXPCActivity)initWithEventName:(id)a3 options:(unint64_t)a4 criteria:(id)a5
{
  return [(HDSPXPCActivity *)self initWithEventName:a3 options:a4 criteria:a5 activity:0];
}

- (HDSPXPCActivity)initWithEventName:(id)a3 options:(unint64_t)a4 criteria:(id)a5 activity:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDSPXPCActivity;
  v13 = [(HDSPXPCActivity *)&v18 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    name = v13->_name;
    v13->_name = (NSString *)v14;

    objc_storeStrong((id *)&v13->_criteria, a5);
    objc_storeStrong((id *)&v13->_activity, a6);
    v13->_options = a4;
    v16 = v13;
  }

  return v13;
}

- (BOOL)deferIfNecessary
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HDSPXPCActivity *)self activity];

  if (v3)
  {
    v4 = [(HDSPXPCActivity *)self activity];
    BOOL should_defer = xpc_activity_should_defer(v4);

    if (should_defer)
    {
      v6 = [(HDSPXPCActivity *)self activity];
      LOBYTE(v3) = xpc_activity_set_state(v6, 3);

      v7 = HKSPLogForCategory();
      v8 = v7;
      if (v3)
      {
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
LABEL_9:

          return v3;
        }
        v9 = [(HDSPXPCActivity *)self name];
        int v11 = 138543362;
        id v12 = v9;
        _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "XPC activity was deferred (%{public}@)", (uint8_t *)&v11, 0xCu);
      }
      else
      {
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_9;
        }
        v9 = [(HDSPXPCActivity *)self name];
        int v11 = 138543362;
        id v12 = v9;
        _os_log_error_impl(&dword_221A52000, v8, OS_LOG_TYPE_ERROR, "Failed to defer XPC activity (%{public}@)", (uint8_t *)&v11, 0xCu);
      }

      goto LABEL_9;
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)name
{
  return self->_name;
}

- (OS_xpc_object)criteria
{
  return self->_criteria;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_criteria, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end