@interface ICHandoffController
+ (id)sharedController;
- (BOOL)sendMessage:(id)a3 toSource:(id)a4 error:(id *)a5;
- (ICHandoffController)init;
- (ICPeerInputStream)inputStream;
- (ICPeerMessageController)peerController;
- (ICPeerOutputStream)outputStream;
- (void)didDisconnectInputStream:(id)a3;
- (void)didReceiveInputStream:(id)a3 outputStream:(id)a4;
- (void)handleMessage:(id)a3 fromInputStream:(id)a4;
- (void)requestNoteWithIdentifier:(id)a3;
- (void)setInputStream:(id)a3;
- (void)setOutputStream:(id)a3;
- (void)setPeerController:(id)a3;
@end

@implementation ICHandoffController

+ (id)sharedController
{
  if (sharedController_once != -1) {
    dispatch_once(&sharedController_once, &__block_literal_global_51);
  }
  v2 = (void *)sharedController_sharedController;
  return v2;
}

void __39__ICHandoffController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(ICHandoffController);
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;
}

- (ICHandoffController)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICHandoffController;
  v2 = [(ICHandoffController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(ICPeerMessageController);
    peerController = v2->_peerController;
    v2->_peerController = v3;

    [(ICPeerMessageController *)v2->_peerController setDelegate:v2];
  }
  return v2;
}

- (void)setInputStream:(id)a3
{
  v7 = (ICPeerInputStream *)a3;
  v5 = self;
  objc_sync_enter(v5);
  inputStream = v5->_inputStream;
  if (inputStream != v7)
  {
    [(ICPeerInputStream *)inputStream setDelegate:0];
    objc_storeStrong((id *)&v5->_inputStream, a3);
    [(ICPeerInputStream *)v5->_inputStream setDelegate:v5];
  }
  objc_sync_exit(v5);
}

- (ICPeerInputStream)inputStream
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_inputStream;
  objc_sync_exit(v2);

  return v3;
}

- (void)didReceiveInputStream:(id)a3 outputStream:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = [[ICPeerInputStream alloc] initWithInputStream:v7];

  v8 = [[ICPeerOutputStream alloc] initWithOutputStream:v6];
  [(ICHandoffController *)self setInputStream:v9];
  [(ICHandoffController *)self setOutputStream:v8];
}

- (void)requestNoteWithIdentifier:(id)a3
{
  id v4 = a3;
  id v6 = [(ICHandoffController *)self peerController];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];

  [v6 requestNote:v5 from:0];
}

- (BOOL)sendMessage:(id)a3 toSource:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = [(ICHandoffController *)self outputStream];
  [v7 writeMessageData:v6];

  return 1;
}

- (void)handleMessage:(id)a3 fromInputStream:(id)a4
{
  id v5 = a3;
  id v6 = [(ICHandoffController *)self peerController];
  [v6 handleMessage:v5 fromSource:0];
}

- (void)didDisconnectInputStream:(id)a3
{
  id v4 = a3;
  id v5 = [(ICHandoffController *)self inputStream];

  if (v5 == v4)
  {
    [(ICHandoffController *)self setInputStream:0];
    [(ICHandoffController *)self setOutputStream:0];
  }
}

- (ICPeerOutputStream)outputStream
{
  return (ICPeerOutputStream *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOutputStream:(id)a3
{
}

- (ICPeerMessageController)peerController
{
  return (ICPeerMessageController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPeerController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerController, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
}

@end