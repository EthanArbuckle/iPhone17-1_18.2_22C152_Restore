@interface NRSCDInterfaceConfig
- (id)description;
@end

@implementation NRSCDInterfaceConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerEndpointDictionary, 0);
  objc_storeStrong((id *)&self->_ipv6Addresses, 0);
  objc_storeStrong((id *)&self->_ipv4Addresses, 0);
  objc_storeStrong((id *)&self->_scdKeyLink, 0);
  objc_storeStrong((id *)&self->_scdKeyIPv6, 0);
  objc_storeStrong((id *)&self->_scdKeyIPv4, 0);

  objc_storeStrong((id *)&self->_interfaceName, 0);
}

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithString:@"NRSCDInterfaceConfig["];
  interfaceName = self->_interfaceName;
  uint64_t interfaceIndex = self->_interfaceIndex;
  if (interfaceIndex && self->_isLinkActive)
  {
    v6 = self->_ipv4Addresses;
    if ([(NSMutableArray *)v6 count])
    {

LABEL_6:
      v8 = "";
      goto LABEL_8;
    }
    id v7 = [(NSMutableArray *)self->_ipv6Addresses count];

    if (v7) {
      goto LABEL_6;
    }
  }
  v8 = "!";
LABEL_8:
  [v3 appendFormat:@"%@(%u), %savailable, v4:[%@], v6:[%@]", interfaceName, interfaceIndex, v8, self->_ipv4Addresses, self->_ipv6Addresses];
  [v3 appendString:@"]"];

  return v3;
}

@end