@interface MFDAMessageStoreSaveDraftRequest
- (BOOL)isUserRequested;
- (BOOL)shouldSend;
- (MFDAMessageStoreSaveDraftRequest)initWithMessage:(id)a3 mailbox:(id)a4;
- (unint64_t)generationNumber;
@end

@implementation MFDAMessageStoreSaveDraftRequest

- (MFDAMessageStoreSaveDraftRequest)initWithMessage:(id)a3 mailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MFDADraftMessage alloc];
  if (_nextClientID_onceToken != -1) {
    dispatch_once(&_nextClientID_onceToken, &__block_literal_global_29);
  }
  id v9 = (id)_nextClientID___clientID;
  objc_sync_enter(v9);
  uint64_t v10 = [(id)_nextClientID___clientID unsignedIntegerValue] + 1;
  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v10];
  v12 = (void *)_nextClientID___clientID;
  _nextClientID___clientID = v11;

  objc_sync_exit(v9);
  v13 = [(MFDADraftMessage *)v8 initWithMailMessage:v6 clientID:v10];
  v20.receiver = self;
  v20.super_class = (Class)MFDAMessageStoreSaveDraftRequest;
  v14 = [(DADraftMessageRequest *)&v20 initWithRequestType:4 message:v13 send:0];
  if (v14)
  {
    uint64_t v15 = [v6 messageIDHeader];
    messageIDHeader = v14->_messageIDHeader;
    v14->_messageIDHeader = (NSString *)v15;

    uint64_t v17 = [v7 copy];
    folderID = v14->_folderID;
    v14->_folderID = (NSString *)v17;
  }
  return v14;
}

- (unint64_t)generationNumber
{
  return 0;
}

- (BOOL)shouldSend
{
  return 1;
}

- (BOOL)isUserRequested
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_messageIDHeader, 0);
}

@end