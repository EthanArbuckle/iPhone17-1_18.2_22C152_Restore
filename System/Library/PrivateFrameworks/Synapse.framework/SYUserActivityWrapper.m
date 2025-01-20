@interface SYUserActivityWrapper
+ (BOOL)supportsSecureCoding;
- (NSUserActivity)userActivity;
- (SYUserActivityWrapper)initWithCoder:(id)a3;
- (SYUserActivityWrapper)initWithUserActivity:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SYUserActivityWrapper

- (SYUserActivityWrapper)initWithUserActivity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYUserActivityWrapper;
  v6 = [(SYUserActivityWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userActivity, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYUserActivityWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivityData"];

  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityData:v5];
    if (v6)
    {
      self = [(SYUserActivityWrapper *)self initWithUserActivity:v6];
      v7 = self;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  userActivity = self->_userActivity;
  id v9 = 0;
  v6 = [(NSUserActivity *)userActivity _createUserActivityDataWithSaving:0 options:0 error:&v9];
  id v7 = v9;
  if (!v6)
  {
    v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SYUserActivityWrapper encodeWithCoder:]((uint64_t)v7, v8);
    }
  }
  [v4 encodeObject:v6 forKey:@"userActivityData"];
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize user activity, error: %@", (uint8_t *)&v2, 0xCu);
}

@end