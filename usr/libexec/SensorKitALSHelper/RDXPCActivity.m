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
    qword_10002AA20 = (uint64_t)os_log_create("com.apple.SensorKit", "RDXPCActivity");
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
    SEL v4 = qword_10002AA20;
    if (os_log_type_enabled((os_log_t)qword_10002AA20, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      int v7 = 138543362;
      objc_super v8 = name;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Marking XPC Activity %{public}@ as DEFERRED", (uint8_t *)&v7, 0xCu);
    }
    sub_10000A0E8((uint64_t)self, 3);
  }
  return should_defer;
}

- (void)markCompleted
{
  SEL v3 = qword_10002AA20;
  if (os_log_type_enabled((os_log_t)qword_10002AA20, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      name = self->_name;
    }
    else {
      name = 0;
    }
    int v5 = 138543362;
    v6 = name;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Marking XPC Activity %{public}@ as DONE", (uint8_t *)&v5, 0xCu);
  }
  sub_10000A0E8((uint64_t)self, 5);
}

- (id)description
{
  SEL v3 = xpc_copy_description(self->_criteria);
  SEL v4 = +[NSString stringWithFormat:@"%@: %@, criteria: %s", objc_opt_class(), self->_name, v3];
  free(v3);
  return v4;
}

@end