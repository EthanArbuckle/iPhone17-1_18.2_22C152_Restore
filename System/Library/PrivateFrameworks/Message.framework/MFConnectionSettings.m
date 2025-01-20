@interface MFConnectionSettings
- (BOOL)allowsTrustPrompt;
- (BOOL)isNonAppInitiated;
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
- (void)setIsNonAppInitiated:(BOOL)a3;
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
  v5 = [(MFConnectionSettings *)self hostname];
  [v4 setHostname:v5];

  v6 = [(MFConnectionSettings *)self serviceName];
  [v4 setServiceName:v6];

  v7 = [(MFConnectionSettings *)self certUIService];
  [v4 setCertUIService:v7];

  objc_msgSend(v4, "setPortNumber:", -[MFConnectionSettings portNumber](self, "portNumber"));
  objc_msgSend(v4, "setConnectionServiceType:", -[MFConnectionSettings connectionServiceType](self, "connectionServiceType"));
  objc_msgSend(v4, "setUsesSSL:", -[MFConnectionSettings usesSSL](self, "usesSSL"));
  objc_msgSend(v4, "setUsesOpportunisticSockets:", -[MFConnectionSettings usesOpportunisticSockets](self, "usesOpportunisticSockets"));
  objc_msgSend(v4, "setTryDirectSSL:", -[MFConnectionSettings tryDirectSSL](self, "tryDirectSSL"));
  objc_msgSend(v4, "setAllowsTrustPrompt:", -[MFConnectionSettings allowsTrustPrompt](self, "allowsTrustPrompt"));
  v8 = [(MFConnectionSettings *)self sourceApplicationBundleIdentifier];
  [v4 setSourceApplicationBundleIdentifier:v8];

  v9 = [(MFConnectionSettings *)self accountIdentifier];
  [v4 setAccountIdentifier:v9];

  v10 = [(MFConnectionSettings *)self networkAccountIdentifier];
  [v4 setNetworkAccountIdentifier:v10];

  objc_msgSend(v4, "setIsNonAppInitiated:", -[MFConnectionSettings isNonAppInitiated](self, "isNonAppInitiated"));
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
    sourceApplicationBundleIdentifier = &stru_1EFF11268;
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

- (BOOL)isNonAppInitiated
{
  return self->_isNonAppInitiated;
}

- (void)setIsNonAppInitiated:(BOOL)a3
{
  self->_isNonAppInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_clientCertificates, 0);
  objc_storeStrong((id *)&self->_certUIService, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
}

@end