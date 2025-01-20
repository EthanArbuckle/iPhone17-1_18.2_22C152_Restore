@interface PDSharingLocalOnDeviceService
- (PDSharingLocalOnDeviceService)init;
- (PDSharingLocalOnDeviceService)initWithDelegate:(id)a3;
- (unint64_t)type;
- (void)checkOutstandingMessagesOn:(id)a3 completion:(id)a4;
- (void)closeEndpoint:(id)a3 completion:(id)a4;
- (void)pingEndpoint:(id)a3 completion:(id)a4;
- (void)prewarmEndpointCreationOfType:(unint64_t)a3 count:(unint64_t)a4 completion:(id)a5;
- (void)relinquishEndpoint:(id)a3 completion:(id)a4;
- (void)sendMessageTo:(id)a3 message:(id)a4 completion:(id)a5;
- (void)universalShareURLForEndpoint:(id)a3 urlDecoration:(id)a4 completion:(id)a5;
@end

@implementation PDSharingLocalOnDeviceService

- (PDSharingLocalOnDeviceService)init
{
  return 0;
}

- (PDSharingLocalOnDeviceService)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PDSharingLocalOnDeviceService;
  v5 = [(PDSharingLocalOnDeviceService *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.passd.sharingLocalOnDeviceService.internal", 0);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.passd.sharingLocalOnDeviceService.internal", 0);
    replyQueue = v6->_replyQueue;
    v6->_replyQueue = (OS_dispatch_queue *)v9;
  }
  return v6;
}

- (unint64_t)type
{
  return 3;
}

- (void)pingEndpoint:(id)a3 completion:(id)a4
{
}

- (void)sendMessageTo:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a4;
  dispatch_queue_t v9 = (void (**)(id, uint64_t, void))a5;
  id v10 = [a3 createContraEndpoint];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained endpointWasUpdated:v10 oldTransportIdentifier:0];

  v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v10 transportIdentifier];
    int v16 = 138412547;
    v17 = v14;
    __int16 v18 = 2113;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "LocalOnDeviceService: Sending message to %@ \n\n %{private}@", (uint8_t *)&v16, 0x16u);
  }
  v9[2](v9, 1, 0);

  id v15 = objc_loadWeakRetained((id *)p_delegate);
  [v15 didReceiveLocalShareMessage:v8 endpoint:v10];
}

- (void)checkOutstandingMessagesOn:(id)a3 completion:(id)a4
{
}

- (void)closeEndpoint:(id)a3 completion:(id)a4
{
  id v5 = [a3 createContraEndpoint];
  v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v7 = [v5 transportIdentifier];
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LocalOnDeviceService: Closing endpoint '%@'", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained endpointWasRemotelyTerminated:v5];
}

- (void)relinquishEndpoint:(id)a3 completion:(id)a4
{
}

- (void)universalShareURLForEndpoint:(id)a3 urlDecoration:(id)a4 completion:(id)a5
{
}

- (void)prewarmEndpointCreationOfType:(unint64_t)a3 count:(unint64_t)a4 completion:(id)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end