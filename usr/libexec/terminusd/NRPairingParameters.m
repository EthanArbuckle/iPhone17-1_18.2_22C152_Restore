@interface NRPairingParameters
@end

@implementation NRPairingParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);

  objc_storeStrong((id *)&self->_localInterfaceName, 0);
}

@end