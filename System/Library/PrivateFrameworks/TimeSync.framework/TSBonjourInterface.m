@interface TSBonjourInterface
- (BOOL)startAddressLookupWithError:(id *)a3;
- (BOOL)startResolveWithError:(id *)a3;
- (BOOL)stopAddressLookup;
- (BOOL)stopResolve;
- (NSArray)ipv4Addresses;
- (NSArray)ipv6Addresses;
- (NSString)interfaceName;
- (TSBonjourIPv4Address)ipv4Address;
- (TSBonjourIPv6Address)ipv6Address;
- (TSBonjourInterface)init;
- (TSBonjourInterface)initWithServiceName:(id)a3 type:(id)a4 andDomain:(id)a5 onInterfaceIndex:(unsigned int)a6 andName:(id)a7;
- (TSBonjourInterfaceDelegate)delegate;
- (TSBonjourNode)node;
- (void)dealloc;
- (void)pokeIPv6Destination;
- (void)resolvedWithHostTarget:(const char *)a3 port:(unsigned __int16)a4;
- (void)setDelegate:(id)a3;
- (void)setIpv4Address:(id)a3;
- (void)setIpv4Addresses:(id)a3;
- (void)setIpv6Address:(id)a3;
- (void)setIpv6Addresses:(id)a3;
- (void)setNode:(id)a3;
@end

@implementation TSBonjourInterface

- (TSBonjourInterface)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[TSBonjourInterface init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

- (TSBonjourInterface)initWithServiceName:(id)a3 type:(id)a4 andDomain:(id)a5 onInterfaceIndex:(unsigned int)a6 andName:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)TSBonjourInterface;
  v16 = [(TSBonjourInterface *)&v28 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    name = v16->_name;
    v16->_name = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    type = v16->_type;
    v16->_type = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    domain = v16->_domain;
    v16->_domain = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    interfaceName = v16->_interfaceName;
    v16->_interfaceName = (NSString *)v23;

    v16->_interfaceIndex = a6;
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.timesync.address.resolve", 0);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v25;
  }
  return v16;
}

- (void)resolvedWithHostTarget:(const char *)a3 port:(unsigned __int16)a4
{
  int v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(NSString *)self->_name UTF8String];
    v8 = [(NSString *)self->_type UTF8String];
    v9 = [(NSString *)self->_domain UTF8String];
    id v10 = [(TSBonjourInterface *)self interfaceName];
    int v13 = 136316418;
    id v14 = v7;
    __int16 v15 = 2080;
    v16 = v8;
    __int16 v17 = 2080;
    v18 = v9;
    __int16 v19 = 2080;
    uint64_t v20 = [v10 UTF8String];
    __int16 v21 = 2080;
    v22 = a3;
    __int16 v23 = 1024;
    int v24 = v4;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Resolved service with name %s type %s domain %s on interface %s to host %s port %hu\n", (uint8_t *)&v13, 0x3Au);
  }
  v11 = (NSString *)[[NSString alloc] initWithUTF8String:a3];
  hostTarget = self->_hostTarget;
  self->_hostTarget = v11;

  self->_port = v4;
  [(TSBonjourInterface *)self startAddressLookupWithError:0];
}

- (BOOL)startResolveWithError:(id *)a3
{
  if (self->_resolveRef) {
    return 1;
  }
  DNSServiceErrorType v6 = DNSServiceResolve(&self->_resolveRef, 0x100000u, self->_interfaceIndex, [(NSString *)self->_name UTF8String], [(NSString *)self->_type UTF8String], [(NSString *)self->_domain UTF8String], (DNSServiceResolveReply)TSBIResolvedServiceReply, self);
  if (a3 && v6)
  {
    TSBonjourErrorFromErrorCode(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v7;
  }
  else
  {
    if (!v6)
    {
      DNSServiceSetDispatchQueue(self->_resolveRef, (dispatch_queue_t)self->_queue);
      return 1;
    }
    return 0;
  }
  return result;
}

- (BOOL)stopResolve
{
  resolveRef = self->_resolveRef;
  if (resolveRef)
  {
    DNSServiceRefDeallocate(self->_resolveRef);
    self->_resolveRef = 0;
  }
  return resolveRef != 0;
}

- (BOOL)startAddressLookupWithError:(id *)a3
{
  p_addressRef = &self->_addressRef;
  if (self->_addressRef) {
    return 1;
  }
  [(TSBonjourInterface *)self setIpv4Addresses:0];
  [(TSBonjourInterface *)self setIpv6Addresses:0];
  DNSServiceErrorType AddrInfo = DNSServiceGetAddrInfo(p_addressRef, 0x100000u, self->_interfaceIndex, 0, [(NSString *)self->_hostTarget UTF8String], (DNSServiceGetAddrInfoReply)TSBIGetAddrReply, self);
  if (a3 && AddrInfo)
  {
    TSBonjourErrorFromErrorCode(AddrInfo);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v8;
  }
  else
  {
    if (!AddrInfo)
    {
      DNSServiceSetDispatchQueue(self->_addressRef, (dispatch_queue_t)self->_queue);
      return 1;
    }
    return 0;
  }
  return result;
}

- (BOOL)stopAddressLookup
{
  addressRef = self->_addressRef;
  if (addressRef)
  {
    DNSServiceRefDeallocate(addressRef);
    self->_addressRef = 0;
  }
  return 0;
}

- (void)pokeIPv6Destination
{
  id v3 = [(TSBonjourInterface *)self ipv6Address];
  [v3 pokeDestinationAtPort:self->_port onInterfaceIndex:self->_interfaceIndex];
}

- (void)dealloc
{
  resolveRef = self->_resolveRef;
  if (resolveRef) {
    DNSServiceRefDeallocate(resolveRef);
  }
  addressRef = self->_addressRef;
  if (addressRef) {
    DNSServiceRefDeallocate(addressRef);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSBonjourInterface;
  [(TSBonjourInterface *)&v5 dealloc];
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (TSBonjourIPv4Address)ipv4Address
{
  return self->_ipv4Address;
}

- (void)setIpv4Address:(id)a3
{
}

- (NSArray)ipv4Addresses
{
  return self->_ipv4Addresses;
}

- (void)setIpv4Addresses:(id)a3
{
}

- (TSBonjourIPv6Address)ipv6Address
{
  return self->_ipv6Address;
}

- (void)setIpv6Address:(id)a3
{
}

- (NSArray)ipv6Addresses
{
  return self->_ipv6Addresses;
}

- (void)setIpv6Addresses:(id)a3
{
}

- (TSBonjourInterfaceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSBonjourInterfaceDelegate *)a3;
}

- (TSBonjourNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  self->_node = (TSBonjourNode *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv6Addresses, 0);
  objc_storeStrong((id *)&self->_ipv6Address, 0);
  objc_storeStrong((id *)&self->_ipv4Addresses, 0);
  objc_storeStrong((id *)&self->_ipv4Address, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_hostTarget, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end