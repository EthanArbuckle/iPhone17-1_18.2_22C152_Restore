@interface NNMKMessagesSyncServiceServer
- (NNMKMessagesSyncServiceServer)initWithQueue:(id)a3;
- (NNMKMessagesSyncServiceServerDelegate)delegate;
- (id)addMessages:(id)a3 notificationPriority:(BOOL)a4;
- (id)deleteMessages:(id)a3 notificationPriority:(BOOL)a4;
- (id)notifyInitialMessageSyncFailed:(id)a3;
- (id)sendBatchedFetchResult:(id)a3;
- (id)sendBatchedInitialMessagesSync:(id)a3;
- (id)sendCoalescedBatchedFetchResult:(id)a3;
- (id)sendInitialMessagesSync:(id)a3;
- (id)sendMoreMessages:(id)a3;
- (id)sendMoreMessagesForConversation:(id)a3;
- (id)updateMailboxSelection:(id)a3;
- (id)updateMessagesStatus:(id)a3 notificationPriority:(BOOL)a4;
- (void)connectivityChanged;
- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4;
- (void)readProtobufData:(id)a3 type:(unint64_t)a4;
- (void)readResourceAtURL:(id)a3 metadata:(id)a4;
- (void)setDelegate:(id)a3;
- (void)spaceBecameAvailable;
- (void)successfullySentProtobufWithIDSIdentifier:(id)a3;
@end

@implementation NNMKMessagesSyncServiceServer

- (NNMKMessagesSyncServiceServer)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NNMKMessagesSyncServiceServer;
  return [(NNMKSyncServiceEndpoint *)&v4 initWithIDSServiceName:@"com.apple.private.alloy.mail.sync.messages" queue:a3];
}

- (id)updateMessagesStatus:(id)a3 notificationPriority:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 300;
  }
  else {
    uint64_t v5 = 200;
  }
  v6 = [a3 data];
  v7 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v6 type:1 priority:v5 timeoutCategory:0 allowCloudDelivery:0];

  return v7;
}

- (id)deleteMessages:(id)a3 notificationPriority:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 300;
  }
  else {
    uint64_t v5 = 200;
  }
  v6 = [a3 data];
  v7 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v6 type:2 priority:v5 timeoutCategory:0 allowCloudDelivery:0];

  return v7;
}

- (id)addMessages:(id)a3 notificationPriority:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 300;
  }
  else {
    uint64_t v5 = 200;
  }
  v6 = [a3 data];
  v7 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v6 type:3 priority:v5 timeoutCategory:1 allowCloudDelivery:0];

  return v7;
}

- (id)sendInitialMessagesSync:(id)a3
{
  objc_super v4 = [a3 data];
  uint64_t v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:4 priority:200 timeoutCategory:1 allowCloudDelivery:1];

  return v5;
}

- (id)notifyInitialMessageSyncFailed:(id)a3
{
  objc_super v4 = [a3 data];
  uint64_t v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:11 priority:200 timeoutCategory:0 allowCloudDelivery:1];

  return v5;
}

- (id)sendBatchedInitialMessagesSync:(id)a3
{
  objc_super v4 = [a3 data];
  uint64_t v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:9 priority:200 timeoutCategory:1 allowCloudDelivery:1];

  return v5;
}

- (id)sendMoreMessages:(id)a3
{
  objc_super v4 = [a3 data];
  uint64_t v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:5 priority:200 timeoutCategory:1 allowCloudDelivery:1];

  return v5;
}

- (id)sendMoreMessagesForConversation:(id)a3
{
  objc_super v4 = [a3 data];
  uint64_t v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:6 priority:200 timeoutCategory:1 allowCloudDelivery:1];

  return v5;
}

- (id)sendBatchedFetchResult:(id)a3
{
  objc_super v4 = [a3 data];
  uint64_t v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:7 priority:200 timeoutCategory:1 allowCloudDelivery:1];

  return v5;
}

- (id)sendCoalescedBatchedFetchResult:(id)a3
{
  objc_super v4 = [a3 data];
  uint64_t v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:10 priority:200 timeoutCategory:2 allowCloudDelivery:1];

  return v5;
}

- (id)updateMailboxSelection:(id)a3
{
  objc_super v4 = [a3 data];
  uint64_t v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:8 priority:200 timeoutCategory:0 allowCloudDelivery:1];

  return v5;
}

- (void)successfullySentProtobufWithIDSIdentifier:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained messagesSyncServiceServer:self didSendProtobufSuccessfullyWithIDSIdentifier:v5];
}

- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  p_delegate = &self->_delegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained messagesSyncServiceServer:self didFailSendingProtobufWithIDSIdentifier:v7 errorCode:a4];
}

- (void)readProtobufData:(id)a3 type:(unint64_t)a4
{
  id v8 = a3;
  switch(a4)
  {
    case 1uLL:
      v6 = [[NNMKProtoMessageStatusUpdates alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceServer:self didUpdateMessagesStatus:v6];
      goto LABEL_9;
    case 2uLL:
      v6 = [[NNMKProtoMessageDeletions alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceServer:self didDeleteMessages:v6];
      goto LABEL_9;
    case 3uLL:
      v6 = [[NNMKProtoCompactMessagesRequest alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceServer:self didRequestCompactMessages:v6];
      goto LABEL_9;
    case 4uLL:
      v6 = [[NNMKProtoMessagesFilteredOutWarning alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceServer:self didWarnMessagesFilteredOut:v6];
      goto LABEL_9;
    case 5uLL:
      v6 = [[NNMKProtoSendMessageRequest alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceServer:self didRequestSendMessage:v6];
      goto LABEL_9;
    case 6uLL:
      v6 = [[NNMKProtoMailboxSelection alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceServer:self didUpdateMailboxSelection:v6];
      goto LABEL_9;
    case 7uLL:
      v6 = [[NNMKProtoMessageMailboxMoves alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messagesSyncServiceServer:self didMoveMessages:v6];
LABEL_9:

      break;
    default:
      break;
  }
}

- (void)readResourceAtURL:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:@"type"];
  unsigned int v9 = [v8 unsignedIntValue];

  v10 = [v7 objectForKeyedSubscript:@"messageId"];

  v11 = [v10 stringValue];

  if (v9 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained messagesSyncServiceServer:self didRecieveAttachmentsAtURL:v6 composedMessageId:v11];
  }
  else
  {
    v13 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKMessagesSyncServiceServer readResourceAtURL:metadata:](v9, v13);
    }
  }
}

- (void)spaceBecameAvailable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained messagesSyncServiceServerSpaceBecameAvailable:self];
}

- (void)connectivityChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained messagesSyncServiceServerConnectivityChanged:self];
}

- (NNMKMessagesSyncServiceServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNMKMessagesSyncServiceServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)readResourceAtURL:(uint64_t)a1 metadata:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D3DF000, a2, OS_LOG_TYPE_ERROR, "Unknown type: %lu", (uint8_t *)&v2, 0xCu);
}

@end