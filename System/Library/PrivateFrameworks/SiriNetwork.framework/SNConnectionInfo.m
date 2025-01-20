@interface SNConnectionInfo
- (BOOL)deviceIsInWalkaboutExperimentGroup;
- (BOOL)forceReconnect;
- (BOOL)imposePolicyBan;
- (BOOL)isForceOnDeviceOnlyDictationEnabled;
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
- (SAConnectionPolicyRoute)connectionPolicyRoute;
- (SNConnectionInfo)init;
- (SNConnectionInfoInternal)underlyingConnectionInfo;
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
- (void)setPrefersWWAN:(BOOL)a3;
- (void)setProductTypePrefix:(id)a3;
- (void)setSkipPeer:(BOOL)a3;
- (void)setSkipPeerErrorReason:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setUnderlyingConnectionInfo:(id)a3;
- (void)setUseWiFiHint:(BOOL)a3;
- (void)setUsesPeerManagedSync:(BOOL)a3;
- (void)setUsesProxyConnection:(BOOL)a3;
@end

@implementation SNConnectionInfo

- (SNConnectionInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)SNConnectionInfo;
  v2 = [(SNConnectionInfo *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SNConnectionInfoInternal);
    underlyingConnectionInfo = v2->_underlyingConnectionInfo;
    v2->_underlyingConnectionInfo = v3;
  }
  return v2;
}

- (void)setConnectionProtocolTechnology:(int64_t)a3
{
}

- (int64_t)connectionProtocolTechnology
{
  if ([(SNConnectionInfoInternal *)self->_underlyingConnectionInfo connectionProtocolTechnology] == 2)return 2; {
  else
  }
    return 1;
}

- (void)setCommunicationProtocolTechnology:(int64_t)a3
{
}

- (int64_t)communicationProtocolTechnology
{
  if ([(SNConnectionInfoInternal *)self->_underlyingConnectionInfo communicationProtocolTechnology] == 2)return 2; {
  else
  }
    return 1;
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (NSString)assistantIdentifier
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo assistantIdentifier];
}

- (void)setPeerAssistantIdentifier:(id)a3
{
}

- (NSString)peerAssistantIdentifier
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo peerAssistantIdentifier];
}

- (void)setConnectionId:(id)a3
{
}

- (NSString)connectionId
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo connectionId];
}

- (void)setAceHost:(id)a3
{
}

- (NSString)aceHost
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo aceHost];
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo languageCode];
}

- (void)setPrefersWWAN:(BOOL)a3
{
}

- (BOOL)prefersWWAN
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo prefersWWAN];
}

- (void)setSkipPeer:(BOOL)a3
{
}

- (BOOL)skipPeer
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo skipPeer];
}

- (void)setUseWiFiHint:(BOOL)a3
{
}

- (BOOL)useWiFiHint
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo useWiFiHint];
}

- (void)setSkipPeerErrorReason:(id)a3
{
}

- (NSError)skipPeerErrorReason
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo skipPeerErrorReason];
}

- (void)setForceReconnect:(BOOL)a3
{
}

- (BOOL)forceReconnect
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo forceReconnect];
}

- (void)setTimeout:(double)a3
{
}

- (double)timeout
{
  [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo timeout];
  return result;
}

- (void)setImposePolicyBan:(BOOL)a3
{
}

- (BOOL)imposePolicyBan
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo imposePolicyBan];
}

- (void)setConnectionPolicy:(id)a3
{
}

- (SAConnectionPolicy)connectionPolicy
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo connectionPolicy];
}

- (void)setConnectionPolicyRoute:(id)a3
{
}

- (SAConnectionPolicyRoute)connectionPolicyRoute
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo connectionPolicyRoute];
}

- (void)setForceOnDeviceOnlyDictation:(BOOL)a3
{
}

- (BOOL)isForceOnDeviceOnlyDictationEnabled
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo forceOnDeviceOnlyDictation];
}

- (void)setProductTypePrefix:(id)a3
{
}

- (NSString)productTypePrefix
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo productTypePrefix];
}

- (void)setPeerType:(id)a3
{
}

- (NSString)peerType
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo peerType];
}

- (void)setPeerVersion:(id)a3
{
}

- (NSString)peerVersion
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo peerVersion];
}

- (void)setDeviceIsInWalkaboutExperimentGroup:(BOOL)a3
{
}

- (BOOL)deviceIsInWalkaboutExperimentGroup
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo deviceIsInWalkaboutExperimentGroup];
}

- (void)setUsesProxyConnection:(BOOL)a3
{
}

- (BOOL)usesProxyConnection
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo usesProxyConnection];
}

- (void)setUsesPeerManagedSync:(BOOL)a3
{
}

- (BOOL)usesPeerManagedSync
{
  return [(SNConnectionInfoInternal *)self->_underlyingConnectionInfo usesPeerManagedSync];
}

- (SNConnectionInfoInternal)underlyingConnectionInfo
{
  return self->_underlyingConnectionInfo;
}

- (void)setUnderlyingConnectionInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end