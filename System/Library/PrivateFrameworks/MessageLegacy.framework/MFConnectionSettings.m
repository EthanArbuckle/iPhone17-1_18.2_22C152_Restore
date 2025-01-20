@interface MFConnectionSettings
- (BOOL)allowsTrustPrompt;
- (BOOL)tryDirectSSL;
- (BOOL)usesOpportunisticSockets;
- (BOOL)usesSSL;
- (NSArray)clientCertificates;
- (NSString)accountIdentifier;
- (NSString)certUIService;
- (NSString)hostname;
- (NSString)networkAccountIdentifier;
- (NSString)serviceName;
- (NSString)sourceApplicationBundleIdentifier;
- (__CFString)connectionServiceType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)portNumber;
- (void)dealloc;
- (void)setAccountIdentifier:(id)a3;
- (void)setAllowsTrustPrompt:(BOOL)a3;
- (void)setCertUIService:(id)a3;
- (void)setClientCertificates:(id)a3;
- (void)setConnectionServiceType:(__CFString *)a3;
- (void)setHostname:(id)a3;
- (void)setNetworkAccountIdentifier:(id)a3;
- (void)setPortNumber:(unsigned int)a3;
- (void)setServiceName:(id)a3;
- (void)setSourceApplicationBundleIdentifier:(id)a3;
- (void)setTryDirectSSL:(BOOL)a3;
- (void)setUsesOpportunisticSockets:(BOOL)a3;
- (void)setUsesSSL:(BOOL)a3;
@end

@implementation MFConnectionSettings

- (void)dealloc
{
  connectionServiceType = self->_connectionServiceType;
  if (connectionServiceType) {
    CFRelease(connectionServiceType);
  }
  v4.receiver = self;
  v4.super_class = (Class)MFConnectionSettings;
  [(MFConnectionSettings *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setHostname:", -[MFConnectionSettings hostname](self, "hostname"));
  objc_msgSend(v4, "setServiceName:", -[MFConnectionSettings serviceName](self, "serviceName"));
  objc_msgSend(v4, "setCertUIService:", -[MFConnectionSettings certUIService](self, "certUIService"));
  objc_msgSend(v4, "setPortNumber:", -[MFConnectionSettings portNumber](self, "portNumber"));
  objc_msgSend(v4, "setConnectionServiceType:", -[MFConnectionSettings connectionServiceType](self, "connectionServiceType"));
  objc_msgSend(v4, "setUsesSSL:", -[MFConnectionSettings usesSSL](self, "usesSSL"));
  objc_msgSend(v4, "setUsesOpportunisticSockets:", -[MFConnectionSettings usesOpportunisticSockets](self, "usesOpportunisticSockets"));
  objc_msgSend(v4, "setTryDirectSSL:", -[MFConnectionSettings tryDirectSSL](self, "tryDirectSSL"));
  objc_msgSend(v4, "setAllowsTrustPrompt:", -[MFConnectionSettings allowsTrustPrompt](self, "allowsTrustPrompt"));
  objc_msgSend(v4, "setSourceApplicationBundleIdentifier:", -[MFConnectionSettings sourceApplicationBundleIdentifier](self, "sourceApplicationBundleIdentifier"));
  objc_msgSend(v4, "setAccountIdentifier:", -[MFConnectionSettings accountIdentifier](self, "accountIdentifier"));
  objc_msgSend(v4, "setNetworkAccountIdentifier:", -[MFConnectionSettings networkAccountIdentifier](self, "networkAccountIdentifier"));
  return v4;
}

- (__CFString)connectionServiceType
{
  return self->_connectionServiceType;
}

- (void)setConnectionServiceType:(__CFString *)a3
{
  connectionServiceType = self->_connectionServiceType;
  if (connectionServiceType != a3)
  {
    if (connectionServiceType) {
      CFRelease(connectionServiceType);
    }
    if (a3) {
      v6 = (__CFString *)CFRetain(a3);
    }
    else {
      v6 = 0;
    }
    self->_connectionServiceType = v6;
  }
}

- (id)description
{
  v2 = "";
  if (self->_usesSSL) {
    v3 = "";
  }
  else {
    v3 = "No";
  }
  id v4 = "direct";
  if (!self->_tryDirectSSLConnection) {
    id v4 = "indirect";
  }
  if (self->_usesOpportunisticSockets) {
    v5 = " (opportunistic)";
  }
  else {
    v5 = "";
  }
  v6 = " disallows trust prompt";
  if (self->_allowsTrustPrompt) {
    v6 = "";
  }
  sourceApplicationBundleIdentifier = (__CFString *)self->_sourceApplicationBundleIdentifier;
  if (sourceApplicationBundleIdentifier) {
    v2 = ", source application: ";
  }
  else {
    sourceApplicationBundleIdentifier = &stru_1F265CF90;
  }
  return (id)[NSString stringWithFormat:@"%@<%@>:%d %s SSL (%s)%s%s%s%@", self->_hostname, self->_serviceName, self->_portNumber, v3, v4, v5, v6, v2, sourceApplicationBundleIdentifier];
}

- (BOOL)tryDirectSSL
{
  return self->_tryDirectSSLConnection;
}

- (void)setTryDirectSSL:(BOOL)a3
{
  self->_tryDirectSSLConnection = a3;
}

- (NSString)certUIService
{
  return self->_certUIService;
}

- (void)setCertUIService:(id)a3
{
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSArray)clientCertificates
{
  return self->_clientCertificates;
}

- (void)setClientCertificates:(id)a3
{
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)networkAccountIdentifier
{
  return self->_networkAccountIdentifier;
}

- (void)setNetworkAccountIdentifier:(id)a3
{
}

- (unsigned)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(unsigned int)a3
{
  self->_portNumber = a3;
}

- (BOOL)usesSSL
{
  return self->_usesSSL;
}

- (void)setUsesSSL:(BOOL)a3
{
  self->_usesSSL = a3;
}

- (BOOL)usesOpportunisticSockets
{
  return self->_usesOpportunisticSockets;
}

- (void)setUsesOpportunisticSockets:(BOOL)a3
{
  self->_usesOpportunisticSockets = a3;
}

- (BOOL)allowsTrustPrompt
{
  return self->_allowsTrustPrompt;
}

- (void)setAllowsTrustPrompt:(BOOL)a3
{
  self->_allowsTrustPrompt = a3;
}

@end