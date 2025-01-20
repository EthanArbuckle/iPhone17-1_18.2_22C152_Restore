@interface QuickTypePFLBackgroundTask
+ (BOOL)supportsSecureCoding;
+ (Class)taskRunnerClass;
- (NSURL)url;
- (QuickTypePFLBackgroundTask)initWithCoder:(id)a3;
- (QuickTypePFLBackgroundTask)initWithURL:(id)a3;
- (id)activityForScheduling;
- (void)activityForScheduling;
- (void)encodeWithCoder:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation QuickTypePFLBackgroundTask

- (QuickTypePFLBackgroundTask)initWithURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)QuickTypePFLBackgroundTask;
  v5 = [(MLBackgroundTask *)&v8 init];
  v6 = v5;
  if (v5) {
    [(QuickTypePFLBackgroundTask *)v5 setUrl:v4];
  }

  return v6;
}

+ (Class)taskRunnerClass
{
  return (Class)objc_opt_class();
}

- (id)activityForScheduling
{
  v16[1] = *MEMORY[0x263EF8340];
  id v14 = 0;
  v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v14];
  id v4 = v14;
  if (v3)
  {
    v5 = (void *)MEMORY[0x263F3AFC8];
    uint64_t v6 = *MEMORY[0x263F3B050];
    uint64_t v7 = *MEMORY[0x263F3B020];
    uint64_t v8 = *MEMORY[0x263F3AFE8];
    v9 = [MEMORY[0x263EFF910] date];
    v10 = [MEMORY[0x263EFF910] distantFuture];
    v11 = [v5 extensionLaunchActivityWithName:@"com.apple.NLPLearner.QuickTypePFLExtension" priority:v6 forExtensionIdentifier:@"com.apple.NLPLearner.QuickTypePFLExtension" withReason:v7 duration:v8 startingAfter:v9 startingBefore:v10];

    v15 = @"QuickTypePFLBackgroundTask";
    v16[0] = v3;
    v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    [v11 setUserInfo:v12];

    [v11 setRequiresDeviceInactivity:1];
    [v11 setCpuIntensive:1];
    [v11 setRequiresPlugin:1];
    [v11 setMemoryIntensive:1];
    [v11 setRequiresNetwork:1];
    [v11 setRequiresInexpensiveNetworking:1];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(QuickTypePFLBackgroundTask *)self activityForScheduling];
    }
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QuickTypePFLBackgroundTask;
  id v4 = a3;
  [(MLBackgroundTask *)&v6 encodeWithCoder:v4];
  v5 = [(QuickTypePFLBackgroundTask *)self url];
  [v4 encodeObject:v5 forKey:@"url"];
}

- (QuickTypePFLBackgroundTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)QuickTypePFLBackgroundTask;
  v5 = [(MLBackgroundTask *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    [(QuickTypePFLBackgroundTask *)v5 setUrl:v6];
  }
  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)activityForScheduling
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [a1 taskIdentifier];
  int v4 = 138412546;
  v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_234530000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to archive task %@: %@", (uint8_t *)&v4, 0x16u);
}

@end