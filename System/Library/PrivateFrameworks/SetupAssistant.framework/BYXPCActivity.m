@interface BYXPCActivity
+ (id)activityWithXPCActivity:(id)a3;
- (BOOL)setCompletionStatus:(int64_t)a3;
- (BOOL)setState:(int64_t)a3;
- (BOOL)shouldDefer;
- (OS_xpc_object)criteria;
- (OS_xpc_object)underlyingActivity;
- (OS_xpc_object)xpcActivity;
- (int64_t)state;
- (void)setCriteria:(id)a3;
- (void)setUnderlyingActivity:(id)a3;
- (void)setXpcActivity:(id)a3;
@end

@implementation BYXPCActivity

+ (id)activityWithXPCActivity:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(BYXPCActivity);
  [(BYXPCActivity *)v4 setUnderlyingActivity:v3];

  return v4;
}

- (BOOL)setState:(int64_t)a3
{
  v4 = [(BYXPCActivity *)self underlyingActivity];
  LOBYTE(a3) = xpc_activity_set_state(v4, a3);

  return a3;
}

- (int64_t)state
{
  v2 = [(BYXPCActivity *)self underlyingActivity];
  xpc_activity_state_t state = xpc_activity_get_state(v2);

  return state;
}

- (BOOL)shouldDefer
{
  v2 = [(BYXPCActivity *)self underlyingActivity];
  BOOL should_defer = xpc_activity_should_defer(v2);

  return should_defer;
}

- (BOOL)setCompletionStatus:(int64_t)a3
{
  id v3 = [(BYXPCActivity *)self underlyingActivity];
  char v4 = xpc_activity_set_completion_status();

  return v4;
}

- (void)setCriteria:(id)a3
{
  id v4 = a3;
  v5 = [(BYXPCActivity *)self underlyingActivity];
  xpc_activity_set_criteria(v5, v4);
}

- (OS_xpc_object)criteria
{
  v2 = [(BYXPCActivity *)self underlyingActivity];
  xpc_object_t v3 = xpc_activity_copy_criteria(v2);

  return (OS_xpc_object *)v3;
}

- (OS_xpc_object)underlyingActivity
{
  return self->_underlyingActivity;
}

- (void)setUnderlyingActivity:(id)a3
{
}

- (OS_xpc_object)xpcActivity
{
  return self->_xpcActivity;
}

- (void)setXpcActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivity, 0);
  objc_storeStrong((id *)&self->_underlyingActivity, 0);
}

@end