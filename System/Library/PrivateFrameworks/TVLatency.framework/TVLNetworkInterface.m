@interface TVLNetworkInterface
- (NSString)interfaceName;
- (NSString)ipv4;
- (NSString)ipv6;
- (TVLNetworkInterface)initWithInterfaceType:(unint64_t)a3 interfaceName:(id)a4;
- (unint64_t)interfaceType;
@end

@implementation TVLNetworkInterface

- (TVLNetworkInterface)initWithInterfaceType:(unint64_t)a3 interfaceName:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TVLNetworkInterface;
  v7 = [(TVLNetworkInterface *)&v18 init];
  v8 = v7;
  if (v7)
  {
    v7->_interfaceType = a3;
    uint64_t v9 = [v6 copy];
    interfaceName = v8->_interfaceName;
    v8->_interfaceName = (NSString *)v9;

    v11 = _IPAddress(2, v8->_interfaceName);
    uint64_t v12 = [v11 copy];
    ipv4 = v8->_ipv4;
    v8->_ipv4 = (NSString *)v12;

    v14 = _IPAddress(30, v8->_interfaceName);
    uint64_t v15 = [v14 copy];
    ipid v6 = v8->_ipv6;
    v8->_ipid v6 = (NSString *)v15;
  }
  return v8;
}

- (unint64_t)interfaceType
{
  return self->_interfaceType;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (NSString)ipv4
{
  return self->_ipv4;
}

- (NSString)ipv6
{
  return self->_ipv6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv6, 0);
  objc_storeStrong((id *)&self->_ipv4, 0);

  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end