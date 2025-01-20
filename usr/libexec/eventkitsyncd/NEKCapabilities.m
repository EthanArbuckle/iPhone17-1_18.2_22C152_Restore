@interface NEKCapabilities
+ (id)instance;
- (BOOL)_query:(id)a3;
- (BOOL)canUseDataTransfer;
- (BOOL)canUseLzfse;
- (NEKCapabilities)init;
- (NSMutableDictionary)cache;
- (void)_changed:(id)a3;
- (void)dealloc;
- (void)setCache:(id)a3;
@end

@implementation NEKCapabilities

+ (id)instance
{
  if (qword_1000C6C10 != -1) {
    dispatch_once(&qword_1000C6C10, &stru_1000A9710);
  }
  v2 = (void *)qword_1000C6C18;

  return v2;
}

- (NEKCapabilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)NEKCapabilities;
  v2 = [(NEKCapabilities *)&v6 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_changed:" name:NRPairedDeviceRegistryPairedDeviceDidChangeCapabilitiesDarwinNotification object:0];
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
    [(NEKCapabilities *)v2 setCache:v4];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NEKCapabilities;
  [(NEKCapabilities *)&v4 dealloc];
}

- (BOOL)canUseLzfse
{
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E8CD02C1-B7C0-4E12-8A44-AB54B5F52E5F"];
  LOBYTE(self) = [(NEKCapabilities *)self _query:v3];

  return (char)self;
}

- (BOOL)canUseDataTransfer
{
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E58F9466-0386-4DE7-B6CE-537A8B54C9B7"];
  LOBYTE(self) = [(NEKCapabilities *)self _query:v3];

  return (char)self;
}

- (BOOL)_query:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v6 = [(NEKCapabilities *)self cache];
  v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
    v8 = +[NRPairedDeviceRegistry sharedInstance];
    v9 = [v8 getActivePairedDevice];

    v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 supportsCapability:v4]);
    v10 = [(NEKCapabilities *)self cache];
    [v10 setObject:v7 forKeyedSubscript:v4];
  }
  os_unfair_lock_unlock(p_lock);
  unsigned __int8 v11 = [v7 BOOLValue];

  return v11;
}

- (void)_changed:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NEKCapabilities *)self cache];
  [v5 removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end