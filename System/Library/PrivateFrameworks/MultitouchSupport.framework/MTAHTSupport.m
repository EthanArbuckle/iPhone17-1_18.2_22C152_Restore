@interface MTAHTSupport
+ (id)allDevices;
+ (id)allInterfaces;
+ (id)getDeviceInServiceTree:(unsigned int)a3;
+ (id)getInterfaceInServiceTree:(unsigned int)a3;
+ (id)sharedInstance;
- (Class)AHTDevice;
- (Class)AHTInterface;
- (MTAHTSupport)init;
- (NSBundle)bundle;
- (void)setAHTDevice:(Class)a3;
- (void)setAHTInterface:(Class)a3;
- (void)setBundle:(id)a3;
@end

@implementation MTAHTSupport

- (MTAHTSupport)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTAHTSupport;
  v2 = [(MTAHTSupport *)&v11 init];
  if (v2
    && (uint64_t v3 = [objc_alloc(MEMORY[0x263F086E0]) initWithPath:@"/System/Library/PrivateFrameworks/AppleHIDTransportSupport.framework"], bundle = v2->_bundle, v2->_bundle = (NSBundle *)v3, bundle, -[NSBundle load](v2->_bundle, "load")))
  {
    uint64_t v5 = [(NSBundle *)v2->_bundle classNamed:@"AHTDevice"];
    Class AHTDevice = v2->_AHTDevice;
    v2->_Class AHTDevice = (Class)v5;

    uint64_t v7 = [(NSBundle *)v2->_bundle classNamed:@"AHTInterface"];
    Class AHTInterface = v2->_AHTInterface;
    v2->_Class AHTInterface = (Class)v7;

    v9 = v2;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__MTAHTSupport_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __30__MTAHTSupport_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

+ (id)allDevices
{
  v2 = [a1 sharedInstance];
  uint64_t v3 = objc_msgSend((id)objc_msgSend(v2, "AHTDevice"), "performSelector:", sel_allDevices);

  return v3;
}

+ (id)getDeviceInServiceTree:(unsigned int)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = +[MTAHTSupport allDevices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    v10 = v7;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v4);
      }
      id v7 = *(id *)(*((void *)&v18 + 1) + 8 * v9);

      io_registry_entry_t parent = a3;
      io_registry_entry_t v11 = a3;
      if (a3)
      {
        do
        {
          uint64_t v16 = 0;
          IORegistryEntryGetParentEntry(v11, "IOService", &parent);
          IORegistryEntryGetRegistryEntryID(parent, &v16);
          uint64_t v12 = v16;
          uint64_t v13 = [v7 registryID];
          io_registry_entry_t v11 = parent;
        }
        while (v12 != v13 && parent != 0);
        if (parent) {
          break;
        }
      }
      ++v9;
      v10 = v7;
      if (v9 == v6)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v6) {
          goto LABEL_3;
        }

        goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_16:
    id v7 = 0;
  }

  return v7;
}

+ (id)allInterfaces
{
  v2 = [a1 sharedInstance];
  uint64_t v3 = objc_msgSend((id)objc_msgSend(v2, "AHTInterface"), "performSelector:", sel_allInterfaces);

  return v3;
}

+ (id)getInterfaceInServiceTree:(unsigned int)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = +[MTAHTSupport allInterfaces];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    v10 = v7;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v4);
      }
      id v7 = *(id *)(*((void *)&v18 + 1) + 8 * v9);

      io_registry_entry_t parent = a3;
      io_registry_entry_t v11 = a3;
      if (a3)
      {
        do
        {
          uint64_t v16 = 0;
          IORegistryEntryGetParentEntry(v11, "IOService", &parent);
          IORegistryEntryGetRegistryEntryID(parent, &v16);
          uint64_t v12 = v16;
          uint64_t v13 = [v7 registryID];
          io_registry_entry_t v11 = parent;
        }
        while (v12 != v13 && parent != 0);
        if (parent) {
          break;
        }
      }
      ++v9;
      v10 = v7;
      if (v9 == v6)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v6) {
          goto LABEL_3;
        }

        goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_16:
    id v7 = 0;
  }

  return v7;
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBundle:(id)a3
{
}

- (Class)AHTDevice
{
  return self->_AHTDevice;
}

- (void)setAHTDevice:(Class)a3
{
}

- (Class)AHTInterface
{
  return self->_AHTInterface;
}

- (void)setAHTInterface:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AHTInterface, 0);
  objc_storeStrong((id *)&self->_AHTDevice, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end