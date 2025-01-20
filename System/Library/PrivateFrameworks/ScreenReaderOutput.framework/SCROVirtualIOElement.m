@interface SCROVirtualIOElement
+ (id)systemElement;
- (SCROVirtualIOElement)init;
- (id)_initWithToken:(int)a3;
- (id)bluetoothAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (int)identifier;
- (int)transport;
- (unsigned)ioObject;
@end

@implementation SCROVirtualIOElement

+ (id)systemElement
{
  if (systemElement_onceToken != -1) {
    dispatch_once(&systemElement_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)systemElement__systemElement;

  return v2;
}

uint64_t __37__SCROVirtualIOElement_systemElement__block_invoke()
{
  v0 = [SCROVirtualIOElement alloc];
  uint64_t v1 = [(SCROVirtualIOElement *)v0 _initWithToken:kSCROSystemVirtualBrailleDisplayToken];
  systemElement__systemElement = v1;

  return MEMORY[0x270F9A758](v1);
}

- (SCROVirtualIOElement)init
{
  return (SCROVirtualIOElement *)-[SCROVirtualIOElement _initWithToken:](self, "_initWithToken:");
}

- (id)_initWithToken:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCROVirtualIOElement;
  id result = [(SCROVirtualIOElement *)&v5 init];
  if (result) {
    *((_DWORD *)result + 2) = a3;
  }
  return result;
}

- (unsigned)ioObject
{
  return 0;
}

- (int)transport
{
  return 8;
}

- (int)identifier
{
  return self->_token;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_opt_new();
}

- (id)bluetoothAddress
{
  return @"00:11:22:33:FF:EE";
}

@end