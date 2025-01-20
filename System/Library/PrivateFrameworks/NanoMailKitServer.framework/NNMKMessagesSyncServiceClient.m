@interface NNMKMessagesSyncServiceClient
- (NNMKMessagesSyncServiceClient)initWithQueue:(id)a3;
- (NNMKMessagesSyncServiceClientDelegate)delegate;
- (id)deleteMessages:(id)a3;
- (id)moveMessages:(id)a3;
- (id)sendAttachmentAtURL:(id)a3 forComposedMessageId:(id)a4;
- (id)sendMessage:(id)a3;
- (id)updateMailboxSelection:(id)a3;
- (id)updateMessagesStatus:(id)a3;
- (void)connectivityChanged;
- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4;
- (void)readProtobufData:(id)a3 type:(unint64_t)a4;
- (void)requestCompactMessages:(id)a3;
- (void)setDelegate:(id)a3;
- (void)successfullySentProtobufWithIDSIdentifier:(id)a3;
- (void)warnMessagesFilteredOut:(id)a3;
@end

@implementation NNMKMessagesSyncServiceClient

- (NNMKMessagesSyncServiceClient)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NNMKMessagesSyncServiceClient;
  return [(NNMKSyncServiceEndpoint *)&v4 initWithIDSServiceName:@"com.apple.private.alloy.mail.sync.messages" queue:a3];
}

- (id)updateMessagesStatus:(id)a3
{
  objc_super v4 = [a3 data];
  v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:1 priority:200 timeoutCategory:0 allowCloudDelivery:1];

  return v5;
}

- (id)deleteMessages:(id)a3
{
  objc_super v4 = [a3 data];
  v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:2 priority:200 timeoutCategory:0 allowCloudDelivery:1];

  return v5;
}

- (id)moveMessages:(id)a3
{
  objc_super v4 = [a3 data];
  v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:7 priority:200 timeoutCategory:0 allowCloudDelivery:1];

  return v5;
}

- (void)warnMessagesFilteredOut:(id)a3
{
  id v5 = [a3 data];
  id v4 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v5 type:4 priority:100 timeoutCategory:2 allowCloudDelivery:1];
}

- (void)requestCompactMessages:(id)a3
{
  id v5 = [a3 data];
  id v4 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v5 type:3 priority:100 timeoutCategory:2 allowCloudDelivery:1];
}

- (id)sendMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 data];
  int v6 = [v4 includeAttachments];

  v7 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v5 type:5 priority:200 timeoutCategory:0 allowCloudDelivery:v6 ^ 1u];

  return v7;
}

- (id)sendAttachmentAtURL:(id)a3 forComposedMessageId:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  v12[0] = @"type";
  v12[1] = @"messageId";
  v13[0] = &unk_26F131838;
  v13[1] = a4;
  int v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionaryWithObjects:v13 forKeys:v12 count:2];

  v10 = [(NNMKSyncServiceEndpoint *)self sendResourceAtURL:v8 metadata:v9 priority:200 timeoutCategory:1];

  return v10;
}

- (id)updateMailboxSelection:(id)a3
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
  [WeakRetained messagesSyncServiceClient:self didSendProtobufSuccessfullyWithIDSIdentifier:v5];
}

- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  p_delegate = &self->_delegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained messagesSyncServiceClient:self didFailSendingProtobufWithIDSIdentifier:v7 errorCode:a4];
}

- (void)connectivityChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained messagesSyncServiceClientConnectivityDidChange:self];
}

- (void)readProtobufData:(id)a3 type:(unint64_t)a4
{
  id v9 = a3;
  switch(a4)
  {
    case 1uLL:
      int v6 = [[NNMKProtoMessageStatusUpdates alloc] initWithData:v9];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceClient:self didUpdateMessagesStatus:v6];
      goto LABEL_13;
    case 2uLL:
      int v6 = [[NNMKProtoMessageDeletions alloc] initWithData:v9];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceClient:self didDeleteMessages:v6];
      goto LABEL_13;
    case 3uLL:
      int v6 = [[NNMKProtoMessageAdditions alloc] initWithData:v9];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceClient:self didAddMessages:v6];
      goto LABEL_13;
    case 5uLL:
      int v6 = [[NNMKProtoMoreMessages alloc] initWithData:v9];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceClient:self didFetchMoreMessages:v6];
      goto LABEL_13;
    case 6uLL:
      int v6 = [[NNMKProtoMoreMessagesForConversation alloc] initWithData:v9];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceClient:self didFetchMoreMessagesForConversation:v6];
      goto LABEL_13;
    case 7uLL:
      int v6 = objc_alloc_init(NNMKProtoCoalescedBatchedFetchResult);
      id v8 = [[NNMKProtoBatchedFetchResult alloc] initWithData:v9];
      [(NNMKProtoMessageStatusUpdates *)v6 addFetchResults:v8];

      goto LABEL_11;
    case 8uLL:
      int v6 = [[NNMKProtoMailboxSelection alloc] initWithData:v9];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceClient:self didUpdateMailboxSelection:v6];
      goto LABEL_13;
    case 9uLL:
      int v6 = [[NNMKProtoInitialMessagesSyncBatch alloc] initWithData:v9];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceClient:self didSendInitialMessagesSync:v6];
      goto LABEL_13;
    case 0xAuLL:
      int v6 = [[NNMKProtoCoalescedBatchedFetchResult alloc] initWithData:v9];
LABEL_11:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceClient:self didReceivedCoalescedBatchedFetchResult:v6];
      goto LABEL_13;
    case 0xBuLL:
      int v6 = [[NNMKProtoInitialMessagesSyncFailure alloc] initWithData:v9];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceClient:self didReceiveInitialMessagesSyncFailure:v6];
LABEL_13:

      break;
    default:
      break;
  }
}

- (NNMKMessagesSyncServiceClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNMKMessagesSyncServiceClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end