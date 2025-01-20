@interface RDXPCActivity
+ (void)initialize;
- (BOOL)deferIfNeeded;
- (RDXPCActivity)initWithName:(id)a3 criteria:(id)a4;
- (id)description;
- (void)dealloc;
- (void)markCompleted;
@end

@implementation RDXPCActivity

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EBD0 = (uint64_t)os_log_create("com.apple.SensorKit", "RDXPCActivity");
  }
}

- (RDXPCActivity)initWithName:(id)a3 criteria:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RDXPCActivity;
  v6 = [(RDXPCActivity *)&v8 init];
  if (v6)
  {
    v6->_name = (NSString *)a3;
    v6->_criteria = (OS_xpc_object *)a4;
  }
  return v6;
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 8);
    objc_setProperty_nonatomic(self, v3, 0, 16);
    objc_setProperty_nonatomic(self, v4, 0, 24);
  }
  v5.receiver = self;
  v5.super_class = (Class)RDXPCActivity;
  [(RDXPCActivity *)&v5 dealloc];
}

- (BOOL)deferIfNeeded
{
  BOOL should_defer = xpc_activity_should_defer(self->_xpcActivity);
  if (should_defer)
  {
    SEL v4 = qword_10006EBD0;
    if (os_log_type_enabled((os_log_t)qword_10006EBD0, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      int v9 = 138543362;
      v10 = name;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Marking XPC Activity %{public}@ as DEFERRED", (uint8_t *)&v9, 0xCu);
    }
    if (!xpc_activity_set_state(self->_xpcActivity, 3))
    {
      v6 = qword_10006EBD0;
      if (os_log_type_enabled((os_log_t)qword_10006EBD0, OS_LOG_TYPE_ERROR))
      {
        objc_super v8 = self->_name;
        int v9 = 138543618;
        v10 = v8;
        __int16 v11 = 2050;
        uint64_t v12 = 3;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to mark the activity %{public}@ as %{public}ld", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  return should_defer;
}

- (void)markCompleted
{
  SEL v3 = qword_10006EBD0;
  if (os_log_type_enabled((os_log_t)qword_10006EBD0, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      name = self->_name;
    }
    else {
      name = 0;
    }
    int v7 = 138543362;
    objc_super v8 = name;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Marking XPC Activity %{public}@ as DONE", (uint8_t *)&v7, 0xCu);
  }
  if (self && !xpc_activity_set_state(self->_xpcActivity, 5))
  {
    objc_super v5 = qword_10006EBD0;
    if (os_log_type_enabled((os_log_t)qword_10006EBD0, OS_LOG_TYPE_ERROR))
    {
      v6 = self->_name;
      int v7 = 138543618;
      objc_super v8 = v6;
      __int16 v9 = 2050;
      uint64_t v10 = 5;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to mark the activity %{public}@ as %{public}ld", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (id)description
{
  SEL v3 = xpc_copy_description(self->_criteria);
  SEL v4 = +[NSString stringWithFormat:@"%@: %@, criteria: %s", objc_opt_class(), self->_name, v3];
  free(v3);
  return v4;
}

@end