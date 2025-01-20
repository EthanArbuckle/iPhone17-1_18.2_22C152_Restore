@interface TRILaunchDaemonActivityDescriptor
+ (id)cellularDescriptor;
+ (id)clientHotfixCellularAllowBatteryDescriptor;
+ (id)clientHotfixWifiDescriptor;
+ (id)clientTriggeredCellularDescriptor;
+ (id)clientTriggeredWifiDescriptor;
+ (id)inexpensiveNetworkingDescriptor;
+ (id)launchDaemonActivityDescriptorWithName:(id)a3 supportedTaskCapabilities:(unint64_t)a4;
+ (id)maintenanceWorkDescriptor;
+ (id)postUpgradeDescriptor;
+ (id)postUpgradeDescriptorRequireInexpensiveNetworking;
+ (id)retryFailuresDescriptor;
+ (id)setupAssistantFetchDescriptor;
+ (id)taskQueueDescriptor;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLaunchDaemonActivityDescriptor:(id)a3;
- (NSString)name;
- (TRILaunchDaemonActivityDescriptor)initWithName:(id)a3 supportedTaskCapabilities:(unint64_t)a4;
- (id)copyWithReplacementName:(id)a3;
- (id)copyWithReplacementSupportedTaskCapabilities:(unint64_t)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)supportedTaskCapabilities;
@end

@implementation TRILaunchDaemonActivityDescriptor

- (TRILaunchDaemonActivityDescriptor)initWithName:(id)a3 supportedTaskCapabilities:(unint64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1043, @"Invalid parameter not satisfying: %@", @"name != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)TRILaunchDaemonActivityDescriptor;
  v9 = [(TRILaunchDaemonActivityDescriptor *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v10->_supportedTaskCapabilities = a4;
  }

  return v10;
}

+ (id)launchDaemonActivityDescriptorWithName:(id)a3 supportedTaskCapabilities:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithName:v6 supportedTaskCapabilities:a4];

  return v7;
}

- (id)copyWithReplacementName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v4 supportedTaskCapabilities:self->_supportedTaskCapabilities];

  return v5;
}

- (id)copyWithReplacementSupportedTaskCapabilities:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  name = self->_name;
  return (id)[v5 initWithName:name supportedTaskCapabilities:a3];
}

- (BOOL)isEqualToLaunchDaemonActivityDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  int v6 = self->_name != 0;
  v7 = [v4 name];
  int v8 = v7 == 0;

  if (v6 == v8
    || (name = self->_name) != 0
    && ([v5 name],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [(NSString *)name isEqual:v10],
        v10,
        !v11))
  {
LABEL_6:
    BOOL v13 = 0;
  }
  else
  {
    unint64_t supportedTaskCapabilities = self->_supportedTaskCapabilities;
    BOOL v13 = supportedTaskCapabilities == [v5 supportedTaskCapabilities];
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRILaunchDaemonActivityDescriptor *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRILaunchDaemonActivityDescriptor *)self isEqualToLaunchDaemonActivityDescriptor:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return self->_supportedTaskCapabilities - v3 + 32 * v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  name = self->_name;
  id v5 = [NSNumber numberWithUnsignedLongLong:self->_supportedTaskCapabilities];
  BOOL v6 = (void *)[v3 initWithFormat:@"<TRILaunchDaemonActivityDescriptor | name:%@ supportedTaskCapabilities:%@>", name, v5];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)supportedTaskCapabilities
{
  return self->_supportedTaskCapabilities;
}

- (void).cxx_destruct
{
}

+ (id)retryFailuresDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:@"com.apple.triald.retries-networking" supportedTaskCapabilities:31];
}

+ (id)taskQueueDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:@"com.apple.triald.task-queue" supportedTaskCapabilities:24];
}

+ (id)cellularDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:@"com.apple.triald.cellular" supportedTaskCapabilities:26];
}

+ (id)inexpensiveNetworkingDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:@"com.apple.triald.fetch-experiments" supportedTaskCapabilities:27];
}

+ (id)postUpgradeDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:@"com.apple.triald.post-upgrade" supportedTaskCapabilities:16];
}

+ (id)postUpgradeDescriptorRequireInexpensiveNetworking
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:@"com.apple.triald.post-upgrade-require-inexpensive-networking" supportedTaskCapabilities:27];
}

+ (id)setupAssistantFetchDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:@"com.apple.triald.setup-assistant-fetch" supportedTaskCapabilities:19];
}

+ (id)clientTriggeredWifiDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:@"com.apple.triald.client-trigger.wifi" supportedTaskCapabilities:27];
}

+ (id)clientTriggeredCellularDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:@"com.apple.triald.client-trigger.cellular" supportedTaskCapabilities:26];
}

+ (id)clientHotfixCellularAllowBatteryDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:@"com.apple.triald.hotfix.cellular-allow-battery-true" supportedTaskCapabilities:2];
}

+ (id)clientHotfixWifiDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:@"com.apple.triald.hotfix.wifi-allow-battery-false" supportedTaskCapabilities:11];
}

+ (id)maintenanceWorkDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:@"com.apple.triald.maintenance" supportedTaskCapabilities:24];
}

@end