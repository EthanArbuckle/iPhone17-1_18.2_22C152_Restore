@interface SiriCoreSiriConnectionInfo
- (BOOL)forceReconnect;
- (BOOL)imposePolicyBan;
- (BOOL)isForceOnDeviceOnlyDictationEnabled;
- (BOOL)prefersWWAN;
- (BOOL)requiresURLSession;
- (BOOL)skipPeer;
- (BOOL)useWiFiHint;
- (NSError)skipPeerErrorReason;
- (NSString)aceHost;
- (NSString)assistantIdentifier;
- (NSString)connectionId;
- (NSString)languageCode;
- (NSString)peerAssistantIdentifier;
- (NSURL)url;
- (SAConnectionPolicy)connectionPolicy;
- (SAConnectionPolicyRoute)connectionPolicyRoute;
- (double)timeout;
- (id)description;
- (void)_appendPotentiallyNilString:(id)a3 toMutableString:(id)a4;
- (void)setAceHost:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setConnectionId:(id)a3;
- (void)setConnectionPolicy:(id)a3;
- (void)setConnectionPolicyRoute:(id)a3;
- (void)setForceOnDeviceOnlyDictation:(BOOL)a3;
- (void)setForceReconnect:(BOOL)a3;
- (void)setImposePolicyBan:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setPeerAssistantIdentifier:(id)a3;
- (void)setPrefersWWAN:(BOOL)a3;
- (void)setRequiresURLSession:(BOOL)a3;
- (void)setSkipPeer:(BOOL)a3;
- (void)setSkipPeerErrorReason:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setUrl:(id)a3;
- (void)setUseWiFiHint:(BOOL)a3;
@end

@implementation SiriCoreSiriConnectionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionPolicy, 0);
  objc_storeStrong((id *)&self->_connectionId, 0);
  objc_storeStrong((id *)&self->_peerAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_skipPeerErrorReason, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_aceHost, 0);
  objc_storeStrong((id *)&self->_connectionPolicyRoute, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setForceOnDeviceOnlyDictation:(BOOL)a3
{
  self->_forceOnDeviceOnlyDictation = a3;
}

- (BOOL)isForceOnDeviceOnlyDictationEnabled
{
  return self->_forceOnDeviceOnlyDictation;
}

- (void)setConnectionPolicy:(id)a3
{
}

- (SAConnectionPolicy)connectionPolicy
{
  return self->_connectionPolicy;
}

- (void)setRequiresURLSession:(BOOL)a3
{
  self->_requiresURLSession = a3;
}

- (BOOL)requiresURLSession
{
  return self->_requiresURLSession;
}

- (void)setImposePolicyBan:(BOOL)a3
{
  self->_imposePolicyBan = a3;
}

- (BOOL)imposePolicyBan
{
  return self->_imposePolicyBan;
}

- (void)setConnectionId:(id)a3
{
}

- (NSString)connectionId
{
  return self->_connectionId;
}

- (void)setPeerAssistantIdentifier:(id)a3
{
}

- (NSString)peerAssistantIdentifier
{
  return self->_peerAssistantIdentifier;
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setForceReconnect:(BOOL)a3
{
  self->_forceReconnect = a3;
}

- (BOOL)forceReconnect
{
  return self->_forceReconnect;
}

- (void)setSkipPeerErrorReason:(id)a3
{
}

- (NSError)skipPeerErrorReason
{
  return self->_skipPeerErrorReason;
}

- (void)setUseWiFiHint:(BOOL)a3
{
  self->_useWiFiHint = a3;
}

- (BOOL)useWiFiHint
{
  return self->_useWiFiHint;
}

- (void)setSkipPeer:(BOOL)a3
{
  self->_skipPeer = a3;
}

- (BOOL)skipPeer
{
  return self->_skipPeer;
}

- (void)setPrefersWWAN:(BOOL)a3
{
  self->_prefersWWAN = a3;
}

- (BOOL)prefersWWAN
{
  return self->_prefersWWAN;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setAceHost:(id)a3
{
}

- (NSString)aceHost
{
  return self->_aceHost;
}

- (void)setConnectionPolicyRoute:(id)a3
{
}

- (SAConnectionPolicyRoute)connectionPolicyRoute
{
  return self->_connectionPolicyRoute;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"<"];
  v4 = [(id)objc_opt_class() description];
  [v3 appendString:v4];

  objc_msgSend(v3, "appendFormat:", @": %p", self);
  [v3 appendString:@"\n\tURL: "];
  v5 = [(NSURL *)self->_url description];
  [(SiriCoreSiriConnectionInfo *)self _appendPotentiallyNilString:v5 toMutableString:v3];

  [v3 appendString:@"\n\tACE Host: "];
  [(SiriCoreSiriConnectionInfo *)self _appendPotentiallyNilString:self->_aceHost toMutableString:v3];
  [v3 appendString:@"\n\tLanguage Code: "];
  [(SiriCoreSiriConnectionInfo *)self _appendPotentiallyNilString:self->_languageCode toMutableString:v3];
  [v3 appendString:@"\n\tPrefers WWAN: "];
  if (self->_prefersWWAN) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 appendString:v6];
  [v3 appendString:@"\n\tTimeout: "];
  [v3 appendFormat:@"%.2f", *(void *)&self->_timeout];
  [v3 appendString:@"\n\tConnection Policy: "];
  v7 = [(SAConnectionPolicy *)self->_connectionPolicy description];
  [(SiriCoreSiriConnectionInfo *)self _appendPotentiallyNilString:v7 toMutableString:v3];

  [v3 appendString:@"\n\tConnection Policy Route: "];
  v8 = [(SAConnectionPolicyRoute *)self->_connectionPolicyRoute description];
  [(SiriCoreSiriConnectionInfo *)self _appendPotentiallyNilString:v8 toMutableString:v3];

  [v3 appendString:@">"];

  return v3;
}

- (void)_appendPotentiallyNilString:(id)a3 toMutableString:(id)a4
{
  if (!a3) {
    a3 = @"(nil)";
  }
  [a4 appendString:a3];
}

@end