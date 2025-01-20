@interface NNMKFetchesSyncServiceServer
- (NNMKFetchesSyncServiceServer)initWithQueue:(id)a3;
- (NNMKFetchesSyncServiceServerDelegate)delegate;
- (id)reportComposedMessageSendingProgress:(id)a3;
- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4;
- (void)notifyFetchRequestCompleted:(id)a3;
- (void)notifyOldMessagesAvailable:(id)a3;
- (void)readProtobufData:(id)a3 type:(unint64_t)a4;
- (void)requestPrepareForFullSync:(id)a3;
- (void)setDelegate:(id)a3;
- (void)successfullySentProtobufWithIDSIdentifier:(id)a3;
- (void)warnErrorDownloadingContentForMessage:(id)a3 notificationPriority:(BOOL)a4 userRequested:(BOOL)a5;
@end

@implementation NNMKFetchesSyncServiceServer

- (NNMKFetchesSyncServiceServer)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NNMKFetchesSyncServiceServer;
  return [(NNMKSyncServiceEndpoint *)&v4 initWithIDSServiceName:@"com.apple.private.alloy.mail.fetches" queue:a3];
}

- (void)requestPrepareForFullSync:(id)a3
{
  id v5 = [a3 data];
  id v4 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v5 type:1 priority:200 timeoutCategory:2 allowCloudDelivery:0];
}

- (void)warnErrorDownloadingContentForMessage:(id)a3 notificationPriority:(BOOL)a4 userRequested:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v8 = 100;
  if (a5) {
    uint64_t v8 = 200;
  }
  if (a4) {
    uint64_t v9 = 300;
  }
  else {
    uint64_t v9 = v8;
  }
  id v11 = [a3 data];
  id v10 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v11 type:3 priority:v9 timeoutCategory:2 allowCloudDelivery:v6 | v5];
}

- (void)notifyOldMessagesAvailable:(id)a3
{
  id v4 = a3;
  id v7 = [&unk_26F131850 stringValue];
  BOOL v5 = [v4 data];

  id v6 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v5 type:4 priority:200 repeatPreventionId:v7 timeoutCategory:2 allowCloudDelivery:0];
}

- (void)notifyFetchRequestCompleted:(id)a3
{
  id v5 = [a3 data];
  id v4 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v5 type:5 priority:200 timeoutCategory:2 allowCloudDelivery:0];
}

- (id)reportComposedMessageSendingProgress:(id)a3
{
  id v4 = [a3 data];
  id v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:6 priority:200 timeoutCategory:0 allowCloudDelivery:1];

  return v5;
}

- (void)successfullySentProtobufWithIDSIdentifier:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained fetchesSyncServiceServer:self didSendProtobufSuccessfullyWithIDSIdentifier:v5];
}

- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  p_delegate = &self->_delegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained fetchesSyncServiceServer:self didFailSendingProtobufWithIDSIdentifier:v7 errorCode:a4];
}

- (void)readProtobufData:(id)a3 type:(unint64_t)a4
{
  id v8 = a3;
  switch(a4)
  {
    case 1uLL:
      id v6 = [[NNMKProtoFetchRequest alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceServer:self didRequestFetch:v6];
      goto LABEL_12;
    case 2uLL:
      id v6 = [[NNMKProtoMoreMessagesRequest alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceServer:self didRequestMoreMessages:v6];
      goto LABEL_12;
    case 3uLL:
      id v6 = [[NNMKProtoMoreMessagesForConversationRequest alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceServer:self didRequestMoreMessagesForConversation:v6];
      goto LABEL_12;
    case 4uLL:
      id v6 = [[NNMKProtoContentRequest alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceServer:self didRequestContent:v6];
      goto LABEL_12;
    case 5uLL:
      id v6 = [[NNMKProtoFullSyncRequest alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceServer:self didRequestFullSync:v6];
      goto LABEL_12;
    case 6uLL:
      id v6 = [[NNMKProtoInitialSyncFinishedNotification alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceServer:self didNotifyInitialSyncFinished:v6];
      goto LABEL_12;
    case 8uLL:
      id v6 = [[NNMKProtoHaltSyncRequest alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceServer:self didRequestHaltSync:v6];
      goto LABEL_12;
    case 9uLL:
      id v6 = [[NNMKProtoMoreMessagesBatchRequest alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceServer:self didRequestMoreMessagesInBatch:v6];
      goto LABEL_12;
    case 0xAuLL:
      id v6 = [[NNMKProtoFetchBatchRequest alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceServer:self didRequestFetchInBatch:v6];
      goto LABEL_12;
    case 0xBuLL:
      id v6 = [[NNMKProtoWebKitStatusNotification alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceServer:self didNotifyAboutWebKitStatus:v6];
LABEL_12:

      break;
    default:
      break;
  }
}

- (NNMKFetchesSyncServiceServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNMKFetchesSyncServiceServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end