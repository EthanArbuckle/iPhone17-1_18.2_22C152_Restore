@interface PDSharingChannelHandle
+ (id)createHandleForDescriptor:(id)a3 queue:(id)a4;
+ (void)descriptorsForAccountDevices:(id)a3;
- (BOOL)wasChannelCreatedLocally;
- (PDSharingChannelEndpoint)endpoint;
- (PDSharingChannelHandle)initWithEndpoint:(id)a3 queue:(id)a4 delegate:(id)a5 dataSource:(id)a6;
- (PDSharingChannelHandleDataSource)dataSource;
- (PDSharingChannelHandleDelegate)delegate;
- (id)_initWithQueue:(id)a3 delegate:(id)a4 dataSource:(id)a5;
- (id)transportIdentifier;
- (void)attachWithCompletion:(id)a3;
- (void)closeWithCompletion:(id)a3;
- (void)descriptorsForAccountDevices:(id)a3;
- (void)didInvalidate;
- (void)fetchHandleTransferToken:(id)a3;
- (void)invalidateForTransfer;
- (void)markMessageAsHandled:(id)a3;
- (void)markMessageAsHandled:(id)a3 completion:(id)a4;
- (void)pingWithCompletion:(id)a3;
- (void)relinquishWithCompletion:(id)a3;
- (void)remoteDeviceInformation:(id)a3;
- (void)sendMessage:(id)a3 completion:(id)a4;
- (void)setEndpoint:(id)a3;
- (void)startProximityAdvertisementOfType:(unint64_t)a3 completion:(id)a4;
- (void)startProximityDetectionForAdvertisement:(id)a3 completion:(id)a4;
- (void)universalShareURLWithDecoration:(id)a3 completion:(id)a4;
@end

@implementation PDSharingChannelHandle

- (id)_initWithQueue:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PDSharingChannelHandle;
  v10 = (id *)[(PDSharingChannelHandle *)&v13 _initWithQueue:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak(v10 + 2, v8);
    objc_storeWeak(v11 + 3, v9);
  }

  return v11;
}

- (PDSharingChannelHandle)initWithEndpoint:(id)a3 queue:(id)a4 delegate:(id)a5 dataSource:(id)a6
{
  id v11 = a3;
  v12 = [(PDSharingChannelHandle *)self _initWithQueue:a4 delegate:a5 dataSource:a6];
  objc_super v13 = (PDSharingChannelHandle *)v12;
  if (v12) {
    objc_storeStrong(v12 + 1, a3);
  }

  return v13;
}

+ (id)createHandleForDescriptor:(id)a3 queue:(id)a4
{
  return 0;
}

- (void)didInvalidate
{
  v4.receiver = self;
  v4.super_class = (Class)PDSharingChannelHandle;
  [(PDSharingChannelHandle *)&v4 didInvalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sharingChannelHandle:self wasInvalidatedRemotelyForEndpoint:self->_endpoint];
}

- (void)pingWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(PDSharingChannelHandle *)self createActionAssertion];
  if (v5)
  {
    v6 = [(PDSharingChannelHandle *)self replyQueue];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001B0930;
    v9[3] = &unk_100733E38;
    id v10 = v6;
    id v12 = v4;
    id v11 = v5;
    id v8 = v6;
    [WeakRetained pingForHandle:self completion:v9];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)attachWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(PDSharingChannelHandle *)self createActionAssertion];
  if (v5)
  {
    v6 = [(PDSharingChannelHandle *)self replyQueue];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001B0B4C;
    v9[3] = &unk_100733E38;
    id v10 = v6;
    id v12 = v4;
    id v11 = v5;
    id v8 = v6;
    [WeakRetained attachForHandle:self completion:v9];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDSharingChannelHandle *)self createActionAssertion];
  if (v8)
  {
    id v9 = [(PDSharingChannelHandle *)self replyQueue];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001B0D80;
    v12[3] = &unk_100733E38;
    id v13 = v9;
    id v15 = v7;
    id v14 = v8;
    id v11 = v9;
    [WeakRetained sendMessageTo:self message:v6 completion:v12];
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)closeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(PDSharingChannelHandle *)self createActionAssertion];
  if (v5)
  {
    id v6 = [(PDSharingChannelHandle *)self replyQueue];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001B0FA8;
    v9[3] = &unk_100733E38;
    id v10 = v6;
    id v12 = v4;
    id v11 = v5;
    id v8 = v6;
    [WeakRetained closeForHandle:self completion:v9];
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)relinquishWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(PDSharingChannelHandle *)self createActionAssertion];
  if (v5)
  {
    id v6 = [(PDSharingChannelHandle *)self replyQueue];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001B11D0;
    v9[3] = &unk_100733E38;
    id v10 = v6;
    id v12 = v4;
    id v11 = v5;
    id v8 = v6;
    [WeakRetained relinquishForHandle:self completion:v9];
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)markMessageAsHandled:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  [WeakRetained didHandleMessageForHandle:self message:v5 completion:&stru_10073CAF0];
}

- (void)markMessageAsHandled:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  [WeakRetained didHandleMessageForHandle:self message:v8 completion:v7];
}

- (void)universalShareURLWithDecoration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDSharingChannelHandle *)self createActionAssertion];
  if (v8)
  {
    id v9 = [(PDSharingChannelHandle *)self replyQueue];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001B1510;
    v12[3] = &unk_10073CB18;
    id v13 = v9;
    id v15 = v7;
    id v14 = v8;
    id v11 = v9;
    [WeakRetained universalShareURLForHandle:self urlDecoration:v6 completion:v12];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)fetchHandleTransferToken:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  [WeakRetained fetchHandleTransferTokenForHandle:self completion:v5];
}

- (void)remoteDeviceInformation:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  [WeakRetained remoteDeviceInformationForHandle:self completion:v5];
}

- (void)startProximityAdvertisementOfType:(unint64_t)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  [WeakRetained startProximityAdvertisementForHandle:self type:a3 completion:v7];
}

- (void)startProximityDetectionForAdvertisement:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  [WeakRetained startProximityDetectionForHandle:self advertisement:v8 completion:v7];
}

+ (void)descriptorsForAccountDevices:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (BOOL)wasChannelCreatedLocally
{
  return [(PDSharingChannelEndpoint *)self->_endpoint channelType] == (id)1
      && [(PDSharingChannelEndpoint *)self->_endpoint mailboxStatus] == (id)2;
}

- (id)transportIdentifier
{
  return [(PDSharingChannelEndpoint *)self->_endpoint transportIdentifier];
}

- (void)descriptorsForAccountDevices:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  [WeakRetained descriptorsForAccountDevicesForHandle:self completion:v5];
}

- (void)invalidateForTransfer
{
}

- (PDSharingChannelEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (PDSharingChannelHandleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDSharingChannelHandleDelegate *)WeakRetained;
}

- (PDSharingChannelHandleDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PDSharingChannelHandleDataSource *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end