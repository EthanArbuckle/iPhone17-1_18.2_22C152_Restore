@interface AFKEndpointInterfacePowerlogDisplay
- (AFKEndpointInterfacePowerlogDisplay)initWithService:(unsigned int)a3 andIOKitComposition:(id)a4;
- (BOOL)valid;
- (PLIOKitOperatorComposition)comp;
- (void)cancel;
- (void)setComp:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation AFKEndpointInterfacePowerlogDisplay

- (AFKEndpointInterfacePowerlogDisplay)initWithService:(unsigned int)a3 andIOKitComposition:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AFKEndpointInterfacePowerlogDisplay;
  v7 = [(AFKEndpointInterface *)&v12 initWithService:v4];
  v8 = v7;
  if (v7)
  {
    [(AFKEndpointInterfacePowerlogDisplay *)v7 setValid:1];
    [(AFKEndpointInterfacePowerlogDisplay *)v8 setComp:v6];
    if (IOServiceAddInterestNotification((IONotificationPortRef)[v6 ioNotifyPort], v4, "IOGeneralInterest", (IOServiceInterestCallback)serviceInterestCallback, v8, &v8->_notification))
    {
      v9 = PLLogDisplay();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEFAULT, "Error trying to setup IO service interest notification", v11, 2u);
      }
    }
  }

  return v8;
}

- (void)cancel
{
  io_object_t notification = self->_notification;
  if (notification) {
    IOObjectRelease(notification);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFKEndpointInterfacePowerlogDisplay;
  [(AFKEndpointInterface *)&v4 cancel];
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (PLIOKitOperatorComposition)comp
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_comp);
  return (PLIOKitOperatorComposition *)WeakRetained;
}

- (void)setComp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end