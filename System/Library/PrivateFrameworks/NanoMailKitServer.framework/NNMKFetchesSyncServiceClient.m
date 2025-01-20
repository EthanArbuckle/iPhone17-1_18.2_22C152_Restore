@interface NNMKFetchesSyncServiceClient
- (NNMKFetchesSyncServiceClient)initWithQueue:(id)a3;
- (NNMKFetchesSyncServiceClientDelegate)delegate;
- (id)notifyCompanionAboutWebKitStatus:(id)a3;
- (id)notifyInitialSyncFinished:(id)a3;
- (id)requestContent:(id)a3 highPriority:(BOOL)a4;
- (id)requestFetch:(id)a3;
- (id)requestFullSync:(id)a3;
- (id)requestHaltSync:(id)a3;
- (id)requestMoreMessagesInBatch:(id)a3;
- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4;
- (void)readProtobufData:(id)a3 type:(unint64_t)a4;
- (void)requestMoreMessagesForConversation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)successfullySentProtobufWithIDSIdentifier:(id)a3;
@end

@implementation NNMKFetchesSyncServiceClient

- (NNMKFetchesSyncServiceClient)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NNMKFetchesSyncServiceClient;
  return [(NNMKSyncServiceEndpoint *)&v4 initWithIDSServiceName:@"com.apple.private.alloy.mail.fetches" queue:a3];
}

- (id)requestFetch:(id)a3
{
  objc_super v4 = [a3 data];
  v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:10 priority:200 timeout:1 allowCloudDelivery:20.0];

  return v5;
}

- (id)requestMoreMessagesInBatch:(id)a3
{
  objc_super v4 = [a3 data];
  v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:9 priority:200 timeoutCategory:2 allowCloudDelivery:1];

  return v5;
}

- (void)requestMoreMessagesForConversation:(id)a3
{
  objc_super v4 = NSString;
  id v5 = a3;
  v6 = [v5 conversationId];
  v7 = [v5 beforeDateReceived];
  id v10 = [v4 stringWithFormat:@"%lu-%@-%@", 3, v6, v7];

  v8 = [v5 data];

  id v9 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v8 type:3 priority:200 repeatPreventionId:v10 timeoutCategory:2 allowCloudDelivery:1];
}

- (id)requestContent:(id)a3 highPriority:(BOOL)a4
{
  id v5 = NSString;
  id v6 = a3;
  unsigned int v7 = [v6 highPriority];
  v8 = [v6 messageId];
  id v9 = [v5 stringWithFormat:@"%lu-%d-%@", 4, v7, v8];

  id v10 = [v6 data];

  v11 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v10 type:4 priority:200 repeatPreventionId:v9 timeoutCategory:0 allowCloudDelivery:1];

  return v11;
}

- (id)requestFullSync:(id)a3
{
  objc_super v4 = [a3 data];
  id v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:5 priority:200 timeoutCategory:0 allowCloudDelivery:1];

  return v5;
}

- (id)requestHaltSync:(id)a3
{
  objc_super v4 = [a3 data];
  id v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:8 priority:200 timeoutCategory:0 allowCloudDelivery:0];

  return v5;
}

- (id)notifyInitialSyncFinished:(id)a3
{
  objc_super v4 = [a3 data];
  id v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:6 priority:200 timeoutCategory:0 allowCloudDelivery:1];

  return v5;
}

- (id)notifyCompanionAboutWebKitStatus:(id)a3
{
  objc_super v4 = [a3 data];
  id v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:11 priority:200 timeoutCategory:0 allowCloudDelivery:1];

  return v5;
}

- (void)successfullySentProtobufWithIDSIdentifier:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained fetchesSyncServiceClient:self didSendProtobufSuccessfullyWithIDSIdentifier:v5];
}

- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  p_delegate = &self->_delegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained fetchesSyncServiceClient:self didFailSendingProtobufWithIDSIdentifier:v7 errorCode:a4];
}

- (void)readProtobufData:(id)a3 type:(unint64_t)a4
{
  id v8 = a3;
  switch(a4)
  {
    case 1uLL:
      id v6 = [[NNMKProtoPrepareForFullSyncRequest alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceClient:self didRequestPrepareForFullSync:v6];
      goto LABEL_7;
    case 3uLL:
      id v6 = [[NNMKProtoErrorDownloadingContentForMessageWarning alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceClient:self didWarnErrorDownloadingContentForMessage:v6];
      goto LABEL_7;
    case 4uLL:
      id v6 = [[NNMKProtoOldMessagesAvailableNotification alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceClient:self didNotifyOldMessagesAvailable:v6];
      goto LABEL_7;
    case 5uLL:
      id v6 = [[NNMKProtoFetchRequestCompletedNotification alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceClient:self didNotifyFetchRequestCompleted:v6];
      goto LABEL_7;
    case 6uLL:
      id v6 = [[NNMKProtoComposedMessageSendingProgressReport alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained fetchesSyncServiceClient:self didReportComposedMessageSendingProgress:v6];
LABEL_7:

      break;
    default:
      break;
  }
}

- (NNMKFetchesSyncServiceClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNMKFetchesSyncServiceClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end