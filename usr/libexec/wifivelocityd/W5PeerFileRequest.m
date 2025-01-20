@interface W5PeerFileRequest
- (Class)responsePayloadClass;
- (NSString)identifier;
- (NSString)targetID;
- (W5FileTransferManager)transferManager;
- (W5Peer)peer;
- (W5PeerFileRequest)initWithPeer:(id)a3 requestType:(int64_t)a4 remotePath:(id)a5 transferManager:(id)a6 reply:(id)a7;
- (W5PeerFileTransferRequestPayload)requestPayload;
- (id)_currentVersion;
- (id)reply;
- (int64_t)controlFlags;
- (int64_t)discoveryFlags;
- (void)handleResponse:(id)a3;
- (void)setDiscoveryFlags:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPeer:(id)a3;
- (void)setReply:(id)a3;
- (void)setRequestPayload:(id)a3;
- (void)setTargetID:(id)a3;
- (void)setTransferManager:(id)a3;
@end

@implementation W5PeerFileRequest

- (W5PeerFileRequest)initWithPeer:(id)a3 requestType:(int64_t)a4 remotePath:(id)a5 transferManager:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  NSRandomData();
  id v16 = objc_claimAutoreleasedReturnValue();
  id v17 = [v16 bytes];
  id v18 = [v16 length];
  id v34 = [v16 length];
  id v33 = v17;
  v19 = v13;
  NSPrintF();
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  targetID = self->_targetID;
  self->_targetID = v20;

  v36.receiver = self;
  v36.super_class = (Class)W5PeerFileRequest;
  v22 = [(W5PeerFileRequest *)&v36 init];
  v23 = v22;
  if (v12
    && v22
    && (objc_storeStrong((id *)&v22->_peer, a3), v15)
    && (id v24 = objc_retainBlock(v15), reply = v23->_reply, v23->_reply = v24, reply, v13)
    && v14
    && (objc_storeStrong((id *)&v23->_transferManager, a6), v23->_targetID))
  {
    identifier = v23->_identifier;
    v23->_discoveryFlags = 1;
    v23->_identifier = (NSString *)@"com.apple.wifi.peer.fileTransfer";

    v27 = objc_alloc_init(W5PeerFileTransferRequestPayload);
    requestPayload = v23->_requestPayload;
    v23->_requestPayload = v27;

    v29 = [(W5PeerFileRequest *)v23 _currentVersion];
    [(W5PeerFileTransferRequestPayload *)v23->_requestPayload setVersion:v29];

    [(W5PeerFileTransferRequestPayload *)v23->_requestPayload setRemotePath:v13];
    [(W5PeerFileTransferRequestPayload *)v23->_requestPayload setType:a4];
    if (a4 == 1)
    {
      [(W5PeerFileTransferRequestPayload *)v23->_requestPayload setTargetID:v23->_targetID];
      v30 = [(W5FileTransferManager *)v23->_transferManager publicKeySelf];
      [(W5PeerFileTransferRequestPayload *)v23->_requestPayload setPublicKey:v30];

      [(W5FileTransferManager *)v23->_transferManager initializeReceiverWithTargetID:v23->_targetID];
    }
  }
  else
  {

    v32 = sub_10009756C();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 136315650;
      v38 = "-[W5PeerFileRequest initWithPeer:requestType:remotePath:transferManager:reply:]";
      __int16 v39 = 2080;
      v40 = "W5PeerFileRequest.m";
      __int16 v41 = 1024;
      int v42 = 69;
      _os_log_send_and_compose_impl();
    }

    v23 = 0;
  }

  return v23;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 error];

  if (v5)
  {
    v6 = [(W5PeerFileRequest *)self reply];
    v7 = [v4 error];
    v6[2](v6, v7, 0);
LABEL_12:

    goto LABEL_13;
  }
  v6 = [v4 payload];
  if ([v6 status] != (id)1)
  {
    id v16 = [v6 error];

    v7 = [(W5PeerFileRequest *)self reply];
    if (!v16)
    {
      NSErrorUserInfoKey v20 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v21 = @"W5PeerFileResponseUndefinedError";
      id v17 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      id v18 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:12 userInfo:v17];
      ((void (**)(void, void *, void))v7)[2](v7, v18, 0);

      goto LABEL_12;
    }
    id v15 = [v6 error];
    ((void (**)(void, void *, void))v7)[2](v7, v15, 0);
    goto LABEL_10;
  }
  v8 = [v6 publicKey];

  if (v8)
  {
    transferManager = self->_transferManager;
    v10 = [v6 publicKey];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100014CF0;
    v19[3] = &unk_1000DD610;
    v19[4] = self;
    [(W5FileTransferManager *)transferManager startW5FileReceiverWithPeerPublicKey:v10 reply:v19];

    id v11 = [objc_alloc((Class)NSURL) initFileURLWithPath:@"/var/run/com.apple.wifivelocity"];
    id v12 = +[NSString stringWithFormat:@"%@.rpftd", self->_targetID];
    id v13 = [v11 URLByAppendingPathComponent:v12 isDirectory:1];
  }
  id v14 = [v6 files];

  if (v14)
  {
    v7 = [(W5PeerFileRequest *)self reply];
    id v15 = [v6 files];
    ((void (**)(void, void, void *))v7)[2](v7, 0, v15);
LABEL_10:

    goto LABEL_12;
  }
LABEL_13:
}

- (id)_currentVersion
{
  return &off_1000EAD50;
}

- (int64_t)controlFlags
{
  v2 = [(W5PeerFileRequest *)self peer];
  id v3 = [v2 controlFlags];

  return (int64_t)v3;
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class();
}

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (NSString)targetID
{
  return self->_targetID;
}

- (void)setTargetID:(id)a3
{
}

- (int64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(int64_t)a3
{
  self->_discoveryFlags = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (W5PeerFileTransferRequestPayload)requestPayload
{
  return self->_requestPayload;
}

- (void)setRequestPayload:(id)a3
{
}

- (W5FileTransferManager)transferManager
{
  return self->_transferManager;
}

- (void)setTransferManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferManager, 0);
  objc_storeStrong((id *)&self->_requestPayload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_targetID, 0);
  objc_storeStrong(&self->_reply, 0);

  objc_storeStrong((id *)&self->_peer, 0);
}

@end