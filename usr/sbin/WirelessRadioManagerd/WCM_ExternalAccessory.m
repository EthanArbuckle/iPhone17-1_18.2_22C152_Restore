@interface WCM_ExternalAccessory
+ (id)create;
- (WCM_ExternalAccessory)init;
- (int)eaConnection;
- (void)dealloc;
- (void)setEaConnection:(int)a3;
@end

@implementation WCM_ExternalAccessory

+ (id)create
{
  return objc_alloc_init(WCM_ExternalAccessoryIOS);
}

- (WCM_ExternalAccessory)init
{
  v3.receiver = self;
  v3.super_class = (Class)WCM_ExternalAccessory;
  return [(WCM_ExternalAccessory *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WCM_ExternalAccessory;
  [(WCM_ExternalAccessory *)&v2 dealloc];
}

- (int)eaConnection
{
  return self->_eaConnection;
}

- (void)setEaConnection:(int)a3
{
  self->_eaConnection = a3;
}

@end