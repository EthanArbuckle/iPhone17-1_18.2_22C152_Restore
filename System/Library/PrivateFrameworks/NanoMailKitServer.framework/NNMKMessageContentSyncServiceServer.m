@interface NNMKMessageContentSyncServiceServer
- (NNMKMessageContentSyncServiceServer)initWithQueue:(id)a3;
- (NNMKMessageContentSyncServiceServerDelegate)delegate;
- (id)notifyInitialContentSyncCompleted:(id)a3;
- (id)syncAttachment:(id)a3 notificationPriority:(BOOL)a4 userRequested:(BOOL)a5;
- (id)syncMessageContent:(id)a3 notificationPriority:(BOOL)a4 userRequested:(BOOL)a5;
- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)successfullySentProtobufWithIDSIdentifier:(id)a3;
@end

@implementation NNMKMessageContentSyncServiceServer

- (NNMKMessageContentSyncServiceServer)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NNMKMessageContentSyncServiceServer;
  return [(NNMKSyncServiceEndpoint *)&v4 initWithIDSServiceName:@"com.apple.private.alloy.mail.sync.content" queue:a3];
}

- (id)syncMessageContent:(id)a3 notificationPriority:(BOOL)a4 userRequested:(BOOL)a5
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
  v10 = [a3 data];
  v11 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v10 type:1 priority:v9 timeoutCategory:1 allowCloudDelivery:v6 | v5];

  return v11;
}

- (id)syncAttachment:(id)a3 notificationPriority:(BOOL)a4 userRequested:(BOOL)a5
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
  v10 = [a3 data];
  v11 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v10 type:2 priority:v9 timeoutCategory:1 allowCloudDelivery:v6 | v5];

  return v11;
}

- (id)notifyInitialContentSyncCompleted:(id)a3
{
  objc_super v4 = [a3 data];
  BOOL v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:3 priority:200 timeoutCategory:0 allowCloudDelivery:1];

  return v5;
}

- (void)successfullySentProtobufWithIDSIdentifier:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained messageContentSyncServiceServer:self didSendProtobufSuccessfullyWithIDSIdentifier:v5];
}

- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  p_delegate = &self->_delegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained messageContentSyncServiceServer:self didFailSendingProtobufWithIDSIdentifier:v7 errorCode:a4];
}

- (NNMKMessageContentSyncServiceServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNMKMessageContentSyncServiceServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end