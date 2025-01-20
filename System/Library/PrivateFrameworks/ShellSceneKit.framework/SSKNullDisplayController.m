@interface SSKNullDisplayController
- (BOOL)isConnectedToDisplay:(id)a3;
- (SSKNullDisplayController)init;
- (id)displayConfigurationForIdentity:(id)a3;
- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayTransformUpdater:(id)a5 caDisplayQueue:(id)a6 assertion:(id)a7;
- (void)displayIdentityDidDisconnect:(id)a3;
- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4;
@end

@implementation SSKNullDisplayController

- (SSKNullDisplayController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSKNullDisplayController;
  v2 = [(SSKNullDisplayController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    connectedDisplays = v2->_connectedDisplays;
    v2->_connectedDisplays = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayTransformUpdater:(id)a5 caDisplayQueue:(id)a6 assertion:(id)a7
{
  id v10 = a7;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(SSKDisplayAssertionPreferences);
  [(SSKDisplayAssertionPreferences *)v13 setWantsControlOfDisplay:1];
  [v10 updateWithPreferences:v13];

  [(NSMutableDictionary *)self->_connectedDisplays setObject:v11 forKey:v12];
}

- (void)displayIdentityDidDisconnect:(id)a3
{
}

- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4
{
}

- (BOOL)isConnectedToDisplay:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_connectedDisplays objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)displayConfigurationForIdentity:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_connectedDisplays objectForKey:a3];
}

- (void).cxx_destruct
{
}

@end