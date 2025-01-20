@interface ICPeerMessageController
- (ICPeerMessageController)init;
- (ICPeerMessageControllerDelegate)delegate;
- (id)deviceRequestsForUUID:(id)a3;
- (id)sendMessage:(void *)a3 toDevices:(id)a4;
- (id)sendMessage:(void *)a3 toSource:(id)a4 completionBlock:(id)a5;
- (id)sendMessage:(void *)a3 toSources:(id)a4;
- (id)sendNote:(id)a3 toDevices:(id)a4;
- (void)disconnectedFromSource:(id)a3;
- (void)handleKeepAliveMessage:(const void *)a3 fromDevice:(id)a4;
- (void)handleMessage:(id)a3 fromSource:(id)a4;
- (void)handleNoteMessage:(const void *)a3 fromDevice:(id)a4 data:(id)a5;
- (void)handleRequestNoteMessage:(const void *)a3 fromDevice:(id)a4;
- (void)requestNote:(id)a3 from:(id)a4;
- (void)sendKeepAlive;
- (void)sendMediaURL:(id)a3 toSource:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ICPeerMessageController

- (ICPeerMessageController)init
{
  v10.receiver = self;
  v10.super_class = (Class)ICPeerMessageController;
  v2 = [(ICPeerMessageController *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceRequests = v2->_deviceRequests;
    v2->_deviceRequests = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sourceToDevices = v2->_sourceToDevices;
    v2->_sourceToDevices = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceUUIDToSource = v2->_deviceUUIDToSource;
    v2->_deviceUUIDToSource = v7;
  }
  return v2;
}

- (id)deviceRequestsForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_deviceRequests objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableDictionary *)self->_deviceRequests setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (void)requestNote:(id)a3 from:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (__CFString *)a4;
  v8 = os_log_create("com.apple.notes", "networking");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 UUIDString];
    objc_super v10 = (void *)v9;
    v11 = @"(null)";
    if (v7) {
      v11 = v7;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_INFO, "<< Request note %@ from %@.", buf, 0x16u);
  }
  double v12 = peernetworking::PeerNetworkMessage::PeerNetworkMessage((peernetworking::PeerNetworkMessage *)buf);
  v22 |= 1u;
  int v24 = 7;
  v17[0] = 0;
  v17[1] = 0;
  objc_msgSend(v6, "getUUIDBytes:", v17, v12);
  v22 |= 4u;
  uint64_t v13 = v23;
  if (!v23) {
    operator new();
  }
  *(_DWORD *)(v23 + 32) |= 1u;
  if (!google::protobuf::internal::empty_string_) {
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  }
  if (*(void *)(v13 + 40) == google::protobuf::internal::empty_string_) {
    operator new();
  }
  MEMORY[0x1C877D5C0]();
  if (v7)
  {
    v16 = v7;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  }
  else
  {
    v14 = 0;
  }
  id v15 = [(ICPeerMessageController *)self sendMessage:buf toDevices:v14];
  if (v7) {

  }
  peernetworking::PeerNetworkMessage::~PeerNetworkMessage((peernetworking::PeerNetworkMessage *)buf);
}

- (id)sendNote:(id)a3 toDevices:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7 && ![v7 count])
  {
    v17 = 0;
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.notes", "networking");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_super v10 = [v6 identifier];
      *(_DWORD *)buf = 138412290;
      v21 = v10;
      _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, "<< Send note %@.", buf, 0xCu);
    }
    double v11 = peernetworking::PeerNetworkMessage::PeerNetworkMessage((peernetworking::PeerNetworkMessage *)buf);
    v22 |= 1u;
    int v24 = 7;
    double v12 = objc_msgSend(v6, "uuid", v11, 0, 0);
    [v12 getUUIDBytes:&v19];

    v22 |= 2u;
    uint64_t v13 = v23;
    if (!v23) {
      operator new();
    }
    *(_DWORD *)(v23 + 32) |= 1u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*(void *)(v13 + 40) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5C0]();
    v14 = [v6 document];
    v22 |= 2u;
    uint64_t v15 = v23;
    if (!v23) {
      operator new();
    }
    *(_DWORD *)(v23 + 32) |= 2u;
    uint64_t v16 = *(void *)(v15 + 48);
    if (!v16) {
      operator new();
    }
    [v14 saveToArchive:v16];

    v17 = [(ICPeerMessageController *)self sendMessage:buf toDevices:v8];
    peernetworking::PeerNetworkMessage::~PeerNetworkMessage((peernetworking::PeerNetworkMessage *)buf);
  }

  return v17;
}

- (void)sendMediaURL:(id)a3 toSource:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.notes", "networking");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 identifier];
    *(_DWORD *)buf = 138412290;
    int v22 = v9;
    _os_log_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_INFO, "<< Send media %@.", buf, 0xCu);
  }
  double v10 = peernetworking::PeerNetworkMessage::PeerNetworkMessage((peernetworking::PeerNetworkMessage *)buf);
  int v25 = 7;
  v23 |= 0x801u;
  uint64_t v11 = v24;
  if (!v24) {
    operator new();
  }
  objc_msgSend(v6, "identifier", v10);
  id v12 = objc_claimAutoreleasedReturnValue();
  [v12 UTF8String];
  *(_DWORD *)(v11 + 32) |= 1u;
  if (!google::protobuf::internal::empty_string_) {
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  }
  if (*(void *)(v11 + 40) == google::protobuf::internal::empty_string_) {
    operator new();
  }
  MEMORY[0x1C877D5B0]();

  uint64_t v13 = (void *)MEMORY[0x1E4F1C9B8];
  v14 = [v6 mediaURL];
  uint64_t v15 = [v13 dataWithContentsOfURL:v14];

  v23 |= 0x800u;
  uint64_t v16 = v24;
  if (!v24) {
    operator new();
  }
  id v17 = v15;
  [v17 bytes];
  [v17 length];
  *(_DWORD *)(v16 + 32) |= 2u;
  if (!google::protobuf::internal::empty_string_) {
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  }
  if (*(void *)(v16 + 48) == google::protobuf::internal::empty_string_) {
    operator new();
  }
  MEMORY[0x1C877D5C0]();
  id v20 = v7;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  id v19 = [(ICPeerMessageController *)self sendMessage:buf toSources:v18];

  peernetworking::PeerNetworkMessage::~PeerNetworkMessage((peernetworking::PeerNetworkMessage *)buf);
}

- (void)disconnectedFromSource:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_sourceToDevices objectForKeyedSubscript:v4];
  id v6 = os_log_create("com.apple.notes", "networking");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "-- Disconnected from %@.", (uint8_t *)&v7, 0xCu);
  }

  if (v5)
  {
    [(NSMutableDictionary *)self->_deviceRequests removeObjectForKey:v5];
    [(NSMutableDictionary *)self->_sourceToDevices removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_deviceUUIDToSource removeObjectForKey:v5];
  }
}

- (void)sendKeepAlive
{
  double v3 = peernetworking::PeerNetworkMessage::PeerNetworkMessage((peernetworking::PeerNetworkMessage *)v6);
  int v9 = 7;
  v7 |= 0x1001u;
  if (!v8) {
    operator new();
  }
  id v4 = [(NSMutableDictionary *)self->_deviceUUIDToSource allValues];
  id v5 = [(ICPeerMessageController *)self sendMessage:v6 toSources:v4];

  peernetworking::PeerNetworkMessage::~PeerNetworkMessage((peernetworking::PeerNetworkMessage *)v6);
}

- (void)handleNoteMessage:(const void *)a3 fromDevice:(id)a4 data:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v11 = (uint64_t *)*((void *)a3 + 5);
  if (*((char *)v11 + 23) < 0) {
    uint64_t v11 = (uint64_t *)*v11;
  }
  id v12 = (void *)[v10 initWithUUIDBytes:v11];
  uint64_t v13 = [ICTTMergeableStringVersionedDocument alloc];
  v14 = v13;
  uint64_t v15 = *((void *)a3 + 6);
  if (!v15) {
    uint64_t v15 = *(void *)(peernetworking::Note::default_instance((peernetworking::Note *)v13) + 48);
  }
  uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
  id v17 = [(ICTTVersionedDocument *)v14 initWithArchive:v15 replicaID:v16];

  v18 = +[ICNoteContext sharedContext];
  id v19 = [v18 managedObjectContext];
  id v20 = +[ICNote noteWithUUID:v12 context:v19];

  v21 = os_log_create("com.apple.notes", "networking");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    int v22 = [v12 UUIDString];
    *(_DWORD *)buf = 138412290;
    v36 = v22;
    _os_log_impl(&dword_1C3A61000, v21, OS_LOG_TYPE_INFO, ">> Handle note message %@", buf, 0xCu);
  }
  int v23 = os_log_create("com.apple.notes", "networking");
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
  if (v20)
  {
    if (v24)
    {
      int v25 = [v12 UUIDString];
      *(_DWORD *)buf = 138412290;
      v36 = v25;
      _os_log_impl(&dword_1C3A61000, v23, OS_LOG_TYPE_INFO, ">> Note update %@.", buf, 0xCu);
    }
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __61__ICPeerMessageController_handleNoteMessage_fromDevice_data___block_invoke;
    v32 = &unk_1E64A7818;
    id v26 = v20;
    id v33 = v26;
    v34 = v17;
    uint64_t v27 = [v26 performMerge:&v29];

    if (v27)
    {
      if (v27 == 2) {
        objc_msgSend(v26, "setNoteHasChanges:", MEMORY[0x1E4F1CC38], v29, v30, v31, v32);
      }
    }
    else
    {
      -[ICPeerMessageController requestNote:from:](self, "requestNote:from:", v12, v8, v29, v30, v31, v32);
    }
  }
  else
  {
    if (v24)
    {
      v28 = [v12 UUIDString];
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_impl(&dword_1C3A61000, v23, OS_LOG_TYPE_INFO, "   Ignored note update for non-shared/existant note %@.", buf, 0xCu);
    }
  }
}

uint64_t __61__ICPeerMessageController_handleNoteMessage_fromDevice_data___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) document];
  uint64_t v3 = [v2 mergeWithStringVersionedDocument:*(void *)(a1 + 40)];

  return v3;
}

- (void)handleRequestNoteMessage:(const void *)a3 fromDevice:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  id v8 = (uint64_t *)*((void *)a3 + 5);
  if (*((char *)v8 + 23) < 0) {
    id v8 = (uint64_t *)*v8;
  }
  id v9 = (void *)[v7 initWithUUIDBytes:v8];
  id v10 = +[ICNoteContext sharedContext];
  uint64_t v11 = [v10 managedObjectContext];
  id v12 = +[ICNote noteWithUUID:v9 context:v11];

  uint64_t v13 = os_log_create("com.apple.notes", "networking");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v9;
    _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_INFO, ">> Peer requested note %@.", buf, 0xCu);
  }

  if (v6)
  {
    id v16 = v6;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  }
  else
  {
    v14 = 0;
  }
  id v15 = [(ICPeerMessageController *)self sendNote:v12 toDevices:v14];
  if (v6) {
}
  }

- (void)handleKeepAliveMessage:(const void *)a3 fromDevice:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = os_log_create("com.apple.notes", "networking");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, ">> KeepAlive: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)handleMessage:(id)a3 fromSource:(id)a4
{
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_sourceToDevices objectForKeyedSubscript:a4];
  peernetworking::PeerNetworkMessage::PeerNetworkMessage((peernetworking::PeerNetworkMessage *)v11);
  id v8 = v6;
  BOOL v9 = google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, (char *)[v8 bytes], objc_msgSend(v8, "length"));
  if (v16 == 7)
  {
    if ((v12 & 2) != 0)
    {
      if (!v13) {
        peernetworking::PeerNetworkMessage::default_instance((peernetworking::PeerNetworkMessage *)v9);
      }
      -[ICPeerMessageController handleNoteMessage:fromDevice:data:](self, "handleNoteMessage:fromDevice:data:");
    }
    else if ((v12 & 4) != 0)
    {
      if (!v14) {
        peernetworking::PeerNetworkMessage::default_instance((peernetworking::PeerNetworkMessage *)v9);
      }
      -[ICPeerMessageController handleRequestNoteMessage:fromDevice:](self, "handleRequestNoteMessage:fromDevice:");
    }
    else if ((v12 & 0x1000) != 0)
    {
      if (!v15) {
        peernetworking::PeerNetworkMessage::default_instance((peernetworking::PeerNetworkMessage *)v9);
      }
      -[ICPeerMessageController handleKeepAliveMessage:fromDevice:](self, "handleKeepAliveMessage:fromDevice:");
    }
  }
  else
  {
    id v10 = os_log_create("com.apple.notes", "networking");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ICPeerMessageController handleMessage:fromSource:](&v16, v10);
    }
  }
  peernetworking::PeerNetworkMessage::~PeerNetworkMessage((peernetworking::PeerNetworkMessage *)v11);
}

- (id)sendMessage:(void *)a3 toDevices:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        int v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceUUIDToSource, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v12) {
          [v7 addObject:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(ICPeerMessageController *)self sendMessage:a3 toSources:v7];

  return v13;
}

- (id)sendMessage:(void *)a3 toSources:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(*(unsigned int (**)(void *))(*(void *)a3 + 72))(a3)];
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)a3, (void *)[v7 mutableBytes], objc_msgSend(v7, "length"));
  if ([v6 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = [(ICPeerMessageController *)self delegate];
          [v13 sendMessage:v7 toSource:v12 error:0];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v14 = [(ICPeerMessageController *)self delegate];
    [v14 sendMessage:v7 toSource:0 error:0];
  }
  return v7;
}

- (id)sendMessage:(void *)a3 toSource:(id)a4 completionBlock:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(id, id))a5;
  id v10 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(*(unsigned int (**)(void *))(*(void *)a3 + 72))(a3)];
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)a3, (void *)[v10 mutableBytes], objc_msgSend(v10, "length"));
  uint64_t v11 = [(ICPeerMessageController *)self delegate];
  id v14 = 0;
  [v11 sendMessage:v10 toSource:v8 error:&v14];
  id v12 = v14;

  v9[2](v9, v12);
  return v10;
}

- (ICPeerMessageControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICPeerMessageControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceUUIDToSource, 0);
  objc_storeStrong((id *)&self->_sourceToDevices, 0);
  objc_storeStrong((id *)&self->_deviceRequests, 0);
}

- (void)handleNoteMessage:(uint8_t *)buf fromDevice:(os_log_t)log data:.cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "   A+B Merge Fail: %@\n%@", buf, 0x16u);
}

- (void)handleMessage:(int *)a1 fromSource:(NSObject *)a2 .cold.1(int *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = 7;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, ">> Multi-peer protocol version mismatch (%d != %d)", (uint8_t *)v3, 0xEu);
}

@end