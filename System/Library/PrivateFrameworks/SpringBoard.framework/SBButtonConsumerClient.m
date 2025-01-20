@interface SBButtonConsumerClient
- (BOOL)canReceiveEvents;
- (BOOL)isApplication;
- (BOOL)isEntitledToConsumeButtonsInBackground;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRunningVisible;
- (BOOL)isSuspended;
- (FBSServiceFacilityClientHandle)systemServiceClient;
- (NSMutableSet)registrations;
- (id)description;
- (unint64_t)hash;
- (void)setApplication:(BOOL)a3;
- (void)setEntitledToConsumeButtonsInBackground:(BOOL)a3;
- (void)setRegistrations:(id)a3;
- (void)setRunningVisible:(BOOL)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setSystemServiceClient:(id)a3;
@end

@implementation SBButtonConsumerClient

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_systemServiceClient withName:@"systemServiceClient" skipIfNil:0];
  id v5 = (id)[v3 appendBool:self->_entitledToConsumeButtonsInBackground withName:@"entitledToConsumeButtonsInBackground"];
  id v6 = (id)[v3 appendBool:self->_application withName:@"application"];
  id v7 = (id)[v3 appendBool:self->_runningVisible withName:@"runningVisible"];
  id v8 = (id)[v3 appendBool:self->_suspended withName:@"suspended"];
  v9 = [v3 build];

  return v9;
}

- (NSMutableSet)registrations
{
  return self->_registrations;
}

- (BOOL)canReceiveEvents
{
  if (self->_suspended) {
    return 0;
  }
  if (self->_application && !self->_entitledToConsumeButtonsInBackground) {
    return self->_runningVisible;
  }
  return 1;
}

- (FBSServiceFacilityClientHandle)systemServiceClient
{
  return self->_systemServiceClient;
}

- (void)setSystemServiceClient:(id)a3
{
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (void)setRunningVisible:(BOOL)a3
{
  self->_runningVisible = a3;
}

- (void)setRegistrations:(id)a3
{
}

- (void)setEntitledToConsumeButtonsInBackground:(BOOL)a3
{
  self->_entitledToConsumeButtonsInBackground = a3;
}

- (void)setApplication:(BOOL)a3
{
  self->_application = a3;
}

- (BOOL)isEqual:(id)a3
{
  systemServiceClient = self->_systemServiceClient;
  id v4 = [a3 systemServiceClient];
  LOBYTE(systemServiceClient) = [(FBSServiceFacilityClientHandle *)systemServiceClient isEqual:v4];

  return (char)systemServiceClient;
}

- (unint64_t)hash
{
  return [(FBSServiceFacilityClientHandle *)self->_systemServiceClient hash];
}

- (BOOL)isEntitledToConsumeButtonsInBackground
{
  return self->_entitledToConsumeButtonsInBackground;
}

- (BOOL)isApplication
{
  return self->_application;
}

- (BOOL)isRunningVisible
{
  return self->_runningVisible;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_systemServiceClient, 0);
}

@end