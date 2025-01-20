@interface RPLReplicatorControlClient
- (BOOL)isAllowListEnabled;
- (BOOL)isReplicatorEnabled;
- (NSArray)allowList;
- (NSArray)devices;
- (RPLReplicatorControlClient)init;
- (id)pushTokenForRelationshipID:(id)a3;
- (void)setAllowList:(id)a3;
- (void)setIsReplicatorEnabled:(BOOL)a3;
@end

@implementation RPLReplicatorControlClient

- (RPLReplicatorControlClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPLReplicatorControlClient;
  v2 = [(RPLReplicatorControlClient *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC18ReplicatorServices33ReplicatorControlClientObjcBridge);
    controlClient = v2->_controlClient;
    v2->_controlClient = v3;
  }
  return v2;
}

- (NSArray)devices
{
  return (NSArray *)[(ReplicatorControlClientObjcBridge *)self->_controlClient devices];
}

- (BOOL)isReplicatorEnabled
{
  return [(ReplicatorControlClientObjcBridge *)self->_controlClient isEnabled];
}

- (void)setIsReplicatorEnabled:(BOOL)a3
{
}

- (BOOL)isAllowListEnabled
{
  return [(ReplicatorControlClientObjcBridge *)self->_controlClient isAllowListEnabled];
}

- (NSArray)allowList
{
  return (NSArray *)[(ReplicatorControlClientObjcBridge *)self->_controlClient allowList];
}

- (void)setAllowList:(id)a3
{
}

- (id)pushTokenForRelationshipID:(id)a3
{
  return [(ReplicatorControlClientObjcBridge *)self->_controlClient pushToken:a3];
}

- (void).cxx_destruct
{
}

@end