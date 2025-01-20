@interface BMManagerConfiguration
+ (ECBackgroundTaskProviding)backgroundTaskDelegate;
+ (void)setBackgroundTaskDelegate:(id)a3;
- (BMInternalManagerConfiguration)managerConfiguration;
- (BMManagerConfiguration)initWithDirectory:(id)a3 shouldRunUpdatesOnSchedule:(BOOL)a4 shouldPurgeOutdatedData:(BOOL)a5;
- (void)setManagerConfiguration:(id)a3;
@end

@implementation BMManagerConfiguration

- (BMManagerConfiguration)initWithDirectory:(id)a3 shouldRunUpdatesOnSchedule:(BOOL)a4 shouldPurgeOutdatedData:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMManagerConfiguration;
  v9 = [(BMManagerConfiguration *)&v12 init];
  if (v9)
  {
    v10 = [[BMInternalManagerConfiguration alloc] initWithDirectory:v8 shouldRunUpdatesOnSchedule:v6 shouldPurgeOutdatedData:v5];
    [(BMManagerConfiguration *)v9 setManagerConfiguration:v10];
  }
  return v9;
}

+ (void)setBackgroundTaskDelegate:(id)a3
{
}

+ (ECBackgroundTaskProviding)backgroundTaskDelegate
{
  id WeakRetained = objc_loadWeakRetained(qword_472F0);

  return (ECBackgroundTaskProviding *)WeakRetained;
}

- (BMInternalManagerConfiguration)managerConfiguration
{
  return self->_managerConfiguration;
}

- (void)setManagerConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end