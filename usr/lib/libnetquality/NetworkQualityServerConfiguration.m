@interface NetworkQualityServerConfiguration
+ (unsigned)defaultIdleTimeout;
- (BOOL)bonjourEnabled;
- (BOOL)l4sEnabled;
- (BOOL)mirrorServerIP;
- (BOOL)tlsEnabled;
- (NetworkQualityServerConfiguration)init;
- (int)listenPort;
- (unint64_t)networkServiceType;
- (unsigned)httpProtocol;
- (unsigned)idleTimeoutSeconds;
- (void)setBonjourEnabled:(BOOL)a3;
- (void)setHttpProtocol:(unsigned int)a3;
- (void)setIdleTimeoutSeconds:(unsigned int)a3;
- (void)setL4sEnabled:(BOOL)a3;
- (void)setListenPort:(int)a3;
- (void)setMirrorServerIP:(BOOL)a3;
- (void)setNetworkServiceType:(unint64_t)a3;
- (void)setTlsEnabled:(BOOL)a3;
@end

@implementation NetworkQualityServerConfiguration

- (NetworkQualityServerConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)NetworkQualityServerConfiguration;
  result = [(NetworkQualityServerConfiguration *)&v3 init];
  if (result)
  {
    *(void *)&result->_httpProtocol = 0xFFFFFFFF00000000;
    result->_idleTimeoutSeconds = 5;
    *(_WORD *)&result->_tlsEnabled = 257;
    result->_mirrorServerIP = 0;
    result->_networkServiceType = 0;
  }
  return result;
}

+ (unsigned)defaultIdleTimeout
{
  return 5;
}

- (unsigned)httpProtocol
{
  return self->_httpProtocol;
}

- (void)setHttpProtocol:(unsigned int)a3
{
  self->_httpProtocol = a3;
}

- (int)listenPort
{
  return self->_listenPort;
}

- (void)setListenPort:(int)a3
{
  self->_listenPort = a3;
}

- (unsigned)idleTimeoutSeconds
{
  return self->_idleTimeoutSeconds;
}

- (void)setIdleTimeoutSeconds:(unsigned int)a3
{
  self->_idleTimeoutSeconds = a3;
}

- (BOOL)tlsEnabled
{
  return self->_tlsEnabled;
}

- (void)setTlsEnabled:(BOOL)a3
{
  self->_tlsEnabled = a3;
}

- (BOOL)bonjourEnabled
{
  return self->_bonjourEnabled;
}

- (void)setBonjourEnabled:(BOOL)a3
{
  self->_bonjourEnabled = a3;
}

- (BOOL)mirrorServerIP
{
  return self->_mirrorServerIP;
}

- (void)setMirrorServerIP:(BOOL)a3
{
  self->_mirrorServerIP = a3;
}

- (BOOL)l4sEnabled
{
  return self->_l4sEnabled;
}

- (void)setL4sEnabled:(BOOL)a3
{
  self->_l4sEnabled = a3;
}

- (unint64_t)networkServiceType
{
  return self->_networkServiceType;
}

- (void)setNetworkServiceType:(unint64_t)a3
{
  self->_networkServiceType = a3;
}

@end