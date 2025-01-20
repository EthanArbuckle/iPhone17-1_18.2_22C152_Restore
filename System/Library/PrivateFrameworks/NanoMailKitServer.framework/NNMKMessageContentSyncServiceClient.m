@interface NNMKMessageContentSyncServiceClient
- (NNMKMessageContentSyncServiceClient)initWithQueue:(id)a3;
- (NNMKMessageContentSyncServiceClientDelegate)delegate;
- (void)readProtobufData:(id)a3 type:(unint64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NNMKMessageContentSyncServiceClient

- (NNMKMessageContentSyncServiceClient)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NNMKMessageContentSyncServiceClient;
  return [(NNMKSyncServiceEndpoint *)&v4 initWithIDSServiceName:@"com.apple.private.alloy.mail.sync.content" queue:a3];
}

- (void)readProtobufData:(id)a3 type:(unint64_t)a4
{
  id v8 = a3;
  switch(a4)
  {
    case 3uLL:
      v6 = [[NNMKProtoInitialContentSyncCompletedNotification alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messageContentSyncServiceClient:self didNotifyInitialContentSyncCompleted:v6];
      break;
    case 2uLL:
      v6 = [[NNMKProtoAttachmentSync alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messageContentSyncServiceClient:self didSyncAttachment:v6];
      break;
    case 1uLL:
      v6 = [[NNMKProtoMessageContentSync alloc] initWithData:v8];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained messageContentSyncServiceClient:self didSyncMessageContent:v6];
      break;
    default:
      goto LABEL_8;
  }

LABEL_8:
}

- (NNMKMessageContentSyncServiceClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNMKMessageContentSyncServiceClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end