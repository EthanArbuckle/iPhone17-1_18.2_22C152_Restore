@interface TVRCDeviceEventManager
- (TVRCDevice)device;
- (TVRCDeviceEventManager)initWithDevice:(id)a3 responseHandler:(id)a4;
- (id)eventResponseHandler;
- (void)sendEvent:(id)a3 options:(id)a4;
- (void)setDevice:(id)a3;
- (void)setEventResponseHandler:(id)a3;
@end

@implementation TVRCDeviceEventManager

- (TVRCDeviceEventManager)initWithDevice:(id)a3 responseHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TVRCDeviceEventManager;
  v9 = [(TVRCDeviceEventManager *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id eventResponseHandler = v9->_eventResponseHandler;
    v9->_id eventResponseHandler = (id)v10;

    objc_storeStrong((id *)&v9->_device, a3);
  }

  return v9;
}

- (void)sendEvent:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(TVRCDevice *)self->_device connectionState] == 2)
  {
    objc_initWeak(&location, self);
    id v8 = +[TVRCXPCClient sharedInstance];
    v9 = [(TVRCDevice *)self->_device identifier];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __44__TVRCDeviceEventManager_sendEvent_options___block_invoke;
    v12[3] = &unk_2647AF8D0;
    objc_copyWeak(&v15, &location);
    id v13 = v6;
    id v14 = v7;
    [v8 sendEvent:v13 toDeviceWithIdentifier:v9 options:v14 response:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    id eventResponseHandler = self->_eventResponseHandler;
    if (eventResponseHandler)
    {
      v11 = TVRCMakeError(100, 0);
      (*((void (**)(id, id, void, void, void *))eventResponseHandler + 2))(eventResponseHandler, v6, 0, 0, v11);
    }
  }
}

void __44__TVRCDeviceEventManager_sendEvent_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = [WeakRetained eventResponseHandler];

  if (v8)
  {
    v9 = [WeakRetained eventResponseHandler];
    ((void (**)(void, void, id, void, id))v9)[2](v9, *(void *)(a1 + 32), v10, *(void *)(a1 + 40), v6);
  }
}

- (TVRCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (id)eventResponseHandler
{
  return self->_eventResponseHandler;
}

- (void)setEventResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventResponseHandler, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end