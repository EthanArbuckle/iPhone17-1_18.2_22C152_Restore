@interface SNConnectionInfoInternal
- (BOOL)deviceIsInWalkaboutExperimentGroup;
- (BOOL)forceOnDeviceOnlyDictation;
- (BOOL)forceReconnect;
- (BOOL)imposePolicyBan;
- (BOOL)prefersWWAN;
- (BOOL)skipPeer;
- (BOOL)useWiFiHint;
- (BOOL)usesPeerManagedSync;
- (BOOL)usesProxyConnection;
- (NSError)skipPeerErrorReason;
- (NSString)aceHost;
- (NSString)assistantIdentifier;
- (NSString)connectionId;
- (NSString)languageCode;
- (NSString)peerAssistantIdentifier;
- (NSString)peerType;
- (NSString)peerVersion;
- (NSString)productTypePrefix;
- (SAConnectionPolicy)connectionPolicy;
- (SAConnectionPolicy)policy;
- (SAConnectionPolicyRoute)connectionPolicyRoute;
- (SAConnectionPolicyRoute)policyRoute;
- (SNConnectionInfoInternal)init;
- (double)timeout;
- (int64_t)communicationProtocolTechnology;
- (int64_t)connectionProtocolTechnology;
- (void)setAceHost:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setCommunicationProtocolTechnology:(int64_t)a3;
- (void)setConnectionId:(id)a3;
- (void)setConnectionPolicy:(id)a3;
- (void)setConnectionPolicyRoute:(id)a3;
- (void)setConnectionProtocolTechnology:(int64_t)a3;
- (void)setDeviceIsInWalkaboutExperimentGroup:(BOOL)a3;
- (void)setForceOnDeviceOnlyDictation:(BOOL)a3;
- (void)setForceReconnect:(BOOL)a3;
- (void)setImposePolicyBan:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setPeerAssistantIdentifier:(id)a3;
- (void)setPeerType:(id)a3;
- (void)setPeerVersion:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setPolicyRoute:(id)a3;
- (void)setPrefersWWAN:(BOOL)a3;
- (void)setProductTypePrefix:(id)a3;
- (void)setSkipPeer:(BOOL)a3;
- (void)setSkipPeerErrorReason:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setUseWiFiHint:(BOOL)a3;
- (void)setUsesPeerManagedSync:(BOOL)a3;
- (void)setUsesProxyConnection:(BOOL)a3;
@end

@implementation SNConnectionInfoInternal

- (SAConnectionPolicy)policy
{
  v2 = ConnectionInfo.policy.getter();

  return (SAConnectionPolicy *)v2;
}

- (void)setPolicy:(id)a3
{
  id v5 = a3;
  v6 = self;
  ConnectionInfo.policy.setter((uint64_t)a3);
}

- (SAConnectionPolicyRoute)policyRoute
{
  v2 = ConnectionInfo.policyRoute.getter();

  return (SAConnectionPolicyRoute *)v2;
}

- (void)setPolicyRoute:(id)a3
{
  id v5 = a3;
  v6 = self;
  ConnectionInfo.policyRoute.setter((uint64_t)a3);
}

- (SNConnectionInfoInternal)init
{
  return (SNConnectionInfoInternal *)ConnectionInfo.init()();
}

- (int64_t)connectionProtocolTechnology
{
  v2 = self;
  int64_t v3 = ConnectionInfo.connectionProtocolTechnology.getter();

  return v3;
}

- (void)setConnectionProtocolTechnology:(int64_t)a3
{
}

- (int64_t)communicationProtocolTechnology
{
  v2 = self;
  int64_t v3 = ConnectionInfo.communicationProtocolTechnology.getter();

  return v3;
}

- (void)setCommunicationProtocolTechnology:(int64_t)a3
{
}

- (NSString)assistantIdentifier
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.assistantIdentifier.getter);
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (NSString)peerAssistantIdentifier
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.peerAssistantIdentifier.getter);
}

- (void)setPeerAssistantIdentifier:(id)a3
{
}

- (NSString)connectionId
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.connectionId.getter);
}

- (void)setConnectionId:(id)a3
{
}

- (NSString)aceHost
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.aceHost.getter);
}

- (void)setAceHost:(id)a3
{
}

- (NSString)languageCode
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.languageCode.getter);
}

- (void)setLanguageCode:(id)a3
{
}

- (BOOL)prefersWWAN
{
  v2 = self;
  char v3 = ConnectionInfo.prefersWWAN.getter();

  return v3 & 1;
}

- (void)setPrefersWWAN:(BOOL)a3
{
}

- (BOOL)skipPeer
{
  v2 = self;
  char v3 = ConnectionInfo.skipPeer.getter();

  return v3 & 1;
}

- (void)setSkipPeer:(BOOL)a3
{
}

- (BOOL)useWiFiHint
{
  v2 = self;
  char v3 = ConnectionInfo.useWiFiHint.getter();

  return v3 & 1;
}

- (void)setUseWiFiHint:(BOOL)a3
{
}

- (NSError)skipPeerErrorReason
{
  v2 = self;
  id v3 = ConnectionInfo.skipPeerErrorReason.getter();

  if (v3)
  {
    v4 = (void *)_convertErrorToNSError(_:)();
  }
  else
  {
    v4 = 0;
  }

  return (NSError *)v4;
}

- (void)setSkipPeerErrorReason:(id)a3
{
  id v5 = self;
  id v4 = a3;
  ConnectionInfo.skipPeerErrorReason.setter((uint64_t)a3);
}

- (BOOL)forceReconnect
{
  v2 = self;
  char v3 = ConnectionInfo.forceReconnect.getter();

  return v3 & 1;
}

- (void)setForceReconnect:(BOOL)a3
{
}

- (double)timeout
{
  v2 = self;
  double v3 = ConnectionInfo.timeout.getter();

  return v3;
}

- (void)setTimeout:(double)a3
{
}

- (BOOL)imposePolicyBan
{
  v2 = self;
  char v3 = ConnectionInfo.imposePolicyBan.getter();

  return v3 & 1;
}

- (void)setImposePolicyBan:(BOOL)a3
{
}

- (SAConnectionPolicy)connectionPolicy
{
  v2 = ConnectionInfo.policy.getter();

  return (SAConnectionPolicy *)v2;
}

- (void)setConnectionPolicy:(id)a3
{
  id v5 = a3;
  v6 = self;
  ConnectionInfo.connectionPolicy.setter(a3);
}

- (SAConnectionPolicyRoute)connectionPolicyRoute
{
  v2 = ConnectionInfo.policyRoute.getter();

  return (SAConnectionPolicyRoute *)v2;
}

- (void)setConnectionPolicyRoute:(id)a3
{
  id v5 = a3;
  v6 = self;
  ConnectionInfo.connectionPolicyRoute.setter(a3);
}

- (BOOL)forceOnDeviceOnlyDictation
{
  v2 = self;
  char v3 = ConnectionInfo.forceOnDeviceOnlyDictation.getter();

  return v3 & 1;
}

- (void)setForceOnDeviceOnlyDictation:(BOOL)a3
{
}

- (NSString)productTypePrefix
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.productTypePrefix.getter);
}

- (void)setProductTypePrefix:(id)a3
{
}

- (NSString)peerType
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.peerType.getter);
}

- (void)setPeerType:(id)a3
{
}

- (NSString)peerVersion
{
  return (NSString *)@objc ConnectionInfo.assistantIdentifier.getter(self, (uint64_t)a2, (void (*)(void))ConnectionInfo.peerVersion.getter);
}

- (void)setPeerVersion:(id)a3
{
}

- (BOOL)deviceIsInWalkaboutExperimentGroup
{
  v2 = self;
  char v3 = ConnectionInfo.deviceIsInWalkaboutExperimentGroup.getter();

  return v3 & 1;
}

- (void)setDeviceIsInWalkaboutExperimentGroup:(BOOL)a3
{
}

- (BOOL)usesProxyConnection
{
  v2 = self;
  char v3 = ConnectionInfo.usesProxyConnection.getter();

  return v3 & 1;
}

- (void)setUsesProxyConnection:(BOOL)a3
{
}

- (BOOL)usesPeerManagedSync
{
  v2 = self;
  char v3 = ConnectionInfo.usesPeerManagedSync.getter();

  return v3 & 1;
}

- (void)setUsesPeerManagedSync:(BOOL)a3
{
}

- (void).cxx_destruct
{
  memcpy(__dst, (char *)self + OBJC_IVAR___SNConnectionInfoInternal_connectionConfiguration, 0x204uLL);
  outlined release of ConnectionConfiguration(__dst);
}

@end