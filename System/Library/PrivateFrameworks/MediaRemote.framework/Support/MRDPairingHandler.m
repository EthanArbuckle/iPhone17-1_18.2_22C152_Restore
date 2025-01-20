@interface MRDPairingHandler
- (MRDPairingHandler)init;
- (NSMutableDictionary)handlers;
- (void)addHandlerForRouteUID:(id)a3 completion:(id)a4;
- (void)performHandlerForRouteUID:(id)a3 passcode:(id)a4;
@end

@implementation MRDPairingHandler

- (MRDPairingHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRDPairingHandler;
  v2 = [(MRDPairingHandler *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    handlers = v2->_handlers;
    v2->_handlers = v3;
  }
  return v2;
}

- (void)addHandlerForRouteUID:(id)a3 completion:(id)a4
{
  if (a3 && a4)
  {
    handlers = self->_handlers;
    id v6 = a3;
    id v7 = objc_retainBlock(a4);
    [(NSMutableDictionary *)handlers setObject:v7 forKey:v6];
  }
}

- (void)performHandlerForRouteUID:(id)a3 passcode:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v10 = v6;
    handlers = self->_handlers;
    id v8 = a3;
    v9 = [(NSMutableDictionary *)handlers objectForKeyedSubscript:v8];
    [(NSMutableDictionary *)self->_handlers removeObjectForKey:v8];

    if (v9) {
      ((void (**)(void, id))v9)[2](v9, v10);
    }

    id v6 = v10;
  }
}

- (NSMutableDictionary)handlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end