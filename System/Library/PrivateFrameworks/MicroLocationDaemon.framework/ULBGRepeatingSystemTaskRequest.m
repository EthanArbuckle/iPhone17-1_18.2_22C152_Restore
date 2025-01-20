@interface ULBGRepeatingSystemTaskRequest
+ (id)analyticsULBGRepeatingSystemTaskRequest;
+ (id)exportBackupULBGRepeatingSystemTaskRequest;
+ (id)learningULBGRepeatingSystemTaskRequest;
+ (id)maintenanceULBGRepeatingSystemTaskRequest;
+ (id)routineStateAnalyzerULBGRepeatingSystemTaskRequest;
+ (id)wifiAnalyzerULBGRepeatingSystemTaskRequest;
- (ULBGRepeatingSystemTaskRequest)initWithIdentifier:(id)a3 interval:(double)a4 minDurationBetweenInstances:(double)a5;
- (double)interval;
- (double)minDurationBetweenInstances;
- (id)createRequestFromSelf;
- (void)setInterval:(double)a3;
- (void)setMinDurationBetweenInstances:(double)a3;
@end

@implementation ULBGRepeatingSystemTaskRequest

- (ULBGRepeatingSystemTaskRequest)initWithIdentifier:(id)a3 interval:(double)a4 minDurationBetweenInstances:(double)a5
{
  v10.receiver = self;
  v10.super_class = (Class)ULBGRepeatingSystemTaskRequest;
  v7 = [(ULBGSystemTaskRequest *)&v10 initWithIdentifier:a3];
  v8 = v7;
  if (v7)
  {
    [(ULBGRepeatingSystemTaskRequest *)v7 setInterval:a4];
    [(ULBGRepeatingSystemTaskRequest *)v8 setMinDurationBetweenInstances:a5];
  }
  return v8;
}

- (id)createRequestFromSelf
{
  id v3 = objc_alloc(MEMORY[0x263F298E8]);
  v4 = [(ULBGSystemTaskRequest *)self identifier];
  v5 = (void *)[v3 initWithIdentifier:v4];

  [(ULBGRepeatingSystemTaskRequest *)self interval];
  objc_msgSend(v5, "setInterval:");
  [(ULBGRepeatingSystemTaskRequest *)self minDurationBetweenInstances];
  objc_msgSend(v5, "setMinDurationBetweenInstances:");
  objc_msgSend(v5, "setPriority:", -[ULBGSystemTaskRequest priority](self, "priority"));
  objc_msgSend(v5, "setRequiresProtectionClass:", -[ULBGSystemTaskRequest requiresProtectionClass](self, "requiresProtectionClass"));
  objc_msgSend(v5, "setResourceIntensive:", -[ULBGSystemTaskRequest resourceIntensive](self, "resourceIntensive"));
  objc_msgSend(v5, "setResources:", -[ULBGSystemTaskRequest resources](self, "resources"));
  objc_msgSend(v5, "setRequiresBuddyComplete:", -[ULBGSystemTaskRequest requiresBuddyComplete](self, "requiresBuddyComplete"));
  objc_msgSend(v5, "setRequiresUserInactivity:", -[ULBGSystemTaskRequest requiresUserInactivity](self, "requiresUserInactivity"));
  objc_msgSend(v5, "setPostInstall:", -[ULBGSystemTaskRequest postInstall](self, "postInstall"));
  return v5;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)minDurationBetweenInstances
{
  return self->_minDurationBetweenInstances;
}

- (void)setMinDurationBetweenInstances:(double)a3
{
  self->_minDurationBetweenInstances = a3;
}

+ (id)learningULBGRepeatingSystemTaskRequest
{
  v2 = +[ULDefaultsSingleton shared];
  id v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULLearningInterval"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v6 = [v5 intValue];
  }
  else {
    int v6 = [&unk_2704F2448 intValue];
  }
  int v7 = v6;

  v8 = [[ULBGRepeatingSystemTaskRequest alloc] initWithIdentifier:@"com.apple.milod.learning" interval:(double)v7 minDurationBetweenInstances:(double)v7 * 0.8];
  [(ULBGSystemTaskRequest *)v8 setPriority:1];
  [(ULBGSystemTaskRequest *)v8 setRequiresProtectionClass:0];
  [(ULBGSystemTaskRequest *)v8 setResourceIntensive:1];
  [(ULBGSystemTaskRequest *)v8 setResources:7];
  [(ULBGSystemTaskRequest *)v8 setRequiresBuddyComplete:1];
  [(ULBGSystemTaskRequest *)v8 setRequiresUserInactivity:1];
  [(ULBGSystemTaskRequest *)v8 setPostInstall:0];
  return v8;
}

+ (id)maintenanceULBGRepeatingSystemTaskRequest
{
  v2 = +[ULDefaultsSingleton shared];
  id v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULMaintenanceInterval"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v6 = [v5 intValue];
  }
  else {
    int v6 = [&unk_2704F2448 intValue];
  }
  int v7 = v6;

  v8 = [[ULBGRepeatingSystemTaskRequest alloc] initWithIdentifier:@"com.apple.milod.maintenance" interval:(double)v7 minDurationBetweenInstances:(double)v7 * 0.8];
  [(ULBGSystemTaskRequest *)v8 setPriority:1];
  [(ULBGSystemTaskRequest *)v8 setRequiresProtectionClass:0];
  [(ULBGSystemTaskRequest *)v8 setResourceIntensive:1];
  [(ULBGSystemTaskRequest *)v8 setResources:7];
  [(ULBGSystemTaskRequest *)v8 setRequiresBuddyComplete:1];
  [(ULBGSystemTaskRequest *)v8 setRequiresUserInactivity:1];
  [(ULBGSystemTaskRequest *)v8 setPostInstall:0];
  return v8;
}

+ (id)routineStateAnalyzerULBGRepeatingSystemTaskRequest
{
  v2 = +[ULDefaultsSingleton shared];
  id v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULRoutineStateRefreshInterval"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v6 = [v5 intValue];
  }
  else {
    int v6 = [&unk_2704F2448 intValue];
  }
  int v7 = v6;

  v8 = [[ULBGRepeatingSystemTaskRequest alloc] initWithIdentifier:@"com.apple.milod.routineStateAnalyzerExecute" interval:(double)v7 minDurationBetweenInstances:(double)v7 * 0.8];
  [(ULBGSystemTaskRequest *)v8 setPriority:1];
  [(ULBGSystemTaskRequest *)v8 setRequiresProtectionClass:0];
  [(ULBGSystemTaskRequest *)v8 setResourceIntensive:1];
  [(ULBGSystemTaskRequest *)v8 setResources:7];
  [(ULBGSystemTaskRequest *)v8 setRequiresBuddyComplete:1];
  [(ULBGSystemTaskRequest *)v8 setRequiresUserInactivity:1];
  [(ULBGSystemTaskRequest *)v8 setPostInstall:0];
  return v8;
}

+ (id)analyticsULBGRepeatingSystemTaskRequest
{
  double v2 = (double)ULSettings::get<ULSettings::AnalyticsInterval>();
  id v3 = [[ULBGRepeatingSystemTaskRequest alloc] initWithIdentifier:@"com.apple.milod.analytics" interval:v2 minDurationBetweenInstances:v2 * 0.8];
  [(ULBGSystemTaskRequest *)v3 setPriority:1];
  [(ULBGSystemTaskRequest *)v3 setRequiresProtectionClass:0];
  [(ULBGSystemTaskRequest *)v3 setResourceIntensive:1];
  [(ULBGSystemTaskRequest *)v3 setResources:7];
  [(ULBGSystemTaskRequest *)v3 setRequiresBuddyComplete:1];
  [(ULBGSystemTaskRequest *)v3 setRequiresUserInactivity:1];
  [(ULBGSystemTaskRequest *)v3 setPostInstall:0];
  return v3;
}

+ (id)wifiAnalyzerULBGRepeatingSystemTaskRequest
{
  double v2 = (double)ULSettings::get<ULSettings::AnalyticsInterval>();
  id v3 = [[ULBGRepeatingSystemTaskRequest alloc] initWithIdentifier:@"com.apple.milod.wifiAnalyzer" interval:v2 minDurationBetweenInstances:v2 * 0.8];
  [(ULBGSystemTaskRequest *)v3 setPriority:1];
  [(ULBGSystemTaskRequest *)v3 setRequiresProtectionClass:0];
  [(ULBGSystemTaskRequest *)v3 setResourceIntensive:1];
  [(ULBGSystemTaskRequest *)v3 setResources:7];
  [(ULBGSystemTaskRequest *)v3 setRequiresBuddyComplete:1];
  [(ULBGSystemTaskRequest *)v3 setRequiresUserInactivity:1];
  [(ULBGSystemTaskRequest *)v3 setPostInstall:0];
  return v3;
}

+ (id)exportBackupULBGRepeatingSystemTaskRequest
{
  double v2 = [[ULBGRepeatingSystemTaskRequest alloc] initWithIdentifier:@"com.apple.milod.exportiCloudBackup" interval:86400.0 minDurationBetweenInstances:69120.0];
  [(ULBGSystemTaskRequest *)v2 setPriority:1];
  [(ULBGSystemTaskRequest *)v2 setRequiresProtectionClass:1];
  [(ULBGSystemTaskRequest *)v2 setResourceIntensive:0];
  [(ULBGSystemTaskRequest *)v2 setResources:0];
  [(ULBGSystemTaskRequest *)v2 setRequiresBuddyComplete:1];
  [(ULBGSystemTaskRequest *)v2 setRequiresUserInactivity:0];
  [(ULBGSystemTaskRequest *)v2 setPostInstall:0];
  return v2;
}

@end