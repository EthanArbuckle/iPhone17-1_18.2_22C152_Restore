@interface STSWifiAwareConfigurationParams
@end

@implementation STSWifiAwareConfigurationParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portNumber, 0);
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_peerDHInfo, 0);
  objc_storeStrong((id *)&self->_transportKey, 0);
  objc_storeStrong((id *)&self->_channelInfo, 0);

  objc_storeStrong((id *)&self->_securityInfo, 0);
}

@end