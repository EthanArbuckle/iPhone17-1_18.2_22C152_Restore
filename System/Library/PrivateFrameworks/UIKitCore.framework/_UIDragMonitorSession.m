@interface _UIDragMonitorSession
- (BOOL)connectedToDruid;
- (BOOL)shouldHideLocalDragDisplay;
- (NSArray)itemProviders;
- (NSDictionary)previewsByItemProviderIndex;
- (PBItemCollection)itemCollection;
- (_DUIServerSessionRemoteDragManipulation)remoteControlProxy;
- (_UIDragMonitorSession)initWithSessionIdentifier:(unsigned int)a3 remoteControlProxy:(id)a4;
- (_UIDragMonitorSessionDelegate)delegate;
- (_UIDruidDestinationConnection)druidDestinationConnection;
- (id)userInfo;
- (unsigned)sessionIdentifier;
- (void)_updateModelWithPreviewUpdates:(id)a3;
- (void)connect;
- (void)performOffscreenDrop;
- (void)requestDrop;
- (void)requestPreviews;
- (void)sawDragEndEvent;
- (void)setConnectedToDruid:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDruidDestinationConnection:(id)a3;
- (void)setItemCollection:(id)a3;
- (void)setItemProviders:(id)a3;
- (void)setPreviewsByItemProviderIndex:(id)a3;
- (void)setRemoteControlProxy:(id)a3;
- (void)setSessionIdentifier:(unsigned int)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _UIDragMonitorSession

- (_UIDragMonitorSession)initWithSessionIdentifier:(unsigned int)a3 remoteControlProxy:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIDragMonitorSession;
  v8 = [(_UIDragMonitorSession *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_sessionIdentifier = a3;
    objc_storeStrong((id *)&v8->_remoteControlProxy, a4);
    v10 = [[_UIDruidDestinationConnection alloc] initWithSessionIdentifier:v9->_sessionIdentifier systemPolicy:0];
    druidDestinationConnection = v9->_druidDestinationConnection;
    v9->_druidDestinationConnection = v10;
  }
  return v9;
}

- (void)_updateModelWithPreviewUpdates:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_UIDragMonitorSession *)self previewsByItemProviderIndex];
  v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_super v13 = objc_msgSend(v12, "preview", (void)v15);
        v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "index"));
        [v6 setObject:v13 forKey:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [(_UIDragMonitorSession *)self setPreviewsByItemProviderIndex:v6];
}

- (void)connect
{
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __32___UIDragMonitorSession_connect__block_invoke;
  v18[3] = &unk_1E5303F10;
  objc_copyWeak(&v19, &location);
  v3 = [(_UIDragMonitorSession *)self druidDestinationConnection];
  [v3 setConnectionBlock:v18];

  id v4 = [(_UIDragMonitorSession *)self druidDestinationConnection];
  [v4 setDragPreviewProviderBlock:&__block_literal_global_459];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __32___UIDragMonitorSession_connect__block_invoke_3;
  v16[3] = &unk_1E5303F58;
  objc_copyWeak(&v17, &location);
  v5 = [(_UIDragMonitorSession *)self druidDestinationConnection];
  [v5 setDropPerformBlock:v16];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __32___UIDragMonitorSession_connect__block_invoke_4;
  v14[3] = &unk_1E52EC2F0;
  objc_copyWeak(&v15, &location);
  v6 = [(_UIDragMonitorSession *)self druidDestinationConnection];
  [v6 setItemsAddedBlock:v14];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __32___UIDragMonitorSession_connect__block_invoke_5;
  v12[3] = &unk_1E52DC888;
  objc_copyWeak(&v13, &location);
  id v7 = [(_UIDragMonitorSession *)self druidDestinationConnection];
  [v7 setDragEndBlock:v12];

  uint64_t v10 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v11, &location);
  uint64_t v8 = [(_UIDragMonitorSession *)self druidDestinationConnection];
  [v8 setUpdatedPresentationBlock:&v10];

  uint64_t v9 = [(_UIDragMonitorSession *)self druidDestinationConnection];
  [v9 connect];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)requestPreviews
{
  v3 = [(_UIDragMonitorSession *)self druidDestinationConnection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40___UIDragMonitorSession_requestPreviews__block_invoke;
  v4[3] = &unk_1E52D99A8;
  v4[4] = self;
  [v3 requestVisibleItems:v4];
}

- (void)requestDrop
{
  id v2 = [(_UIDragMonitorSession *)self druidDestinationConnection];
  [v2 requestDropWithOperation:1 layerContext:0];
}

- (void)sawDragEndEvent
{
  id v2 = [(_UIDragMonitorSession *)self druidDestinationConnection];
  [v2 sawDragEndEvent];
}

- (void)performOffscreenDrop
{
  id v2 = [(_UIDragMonitorSession *)self remoteControlProxy];
  [v2 performOffscreenDrop];
}

- (BOOL)shouldHideLocalDragDisplay
{
  v3 = [(_UIDragMonitorSession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  v5 = [(_UIDragMonitorSession *)self delegate];
  char v6 = [v5 dragMonitorSessionShouldHideLocalDragDisplay:self];

  return v6;
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(unsigned int)a3
{
  self->_sessionIdentifier = a3;
}

- (NSArray)itemProviders
{
  return self->_itemProviders;
}

- (void)setItemProviders:(id)a3
{
}

- (NSDictionary)previewsByItemProviderIndex
{
  return self->_previewsByItemProviderIndex;
}

- (void)setPreviewsByItemProviderIndex:(id)a3
{
}

- (_UIDragMonitorSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIDragMonitorSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (_DUIServerSessionRemoteDragManipulation)remoteControlProxy
{
  return self->_remoteControlProxy;
}

- (void)setRemoteControlProxy:(id)a3
{
}

- (_UIDruidDestinationConnection)druidDestinationConnection
{
  return self->_druidDestinationConnection;
}

- (void)setDruidDestinationConnection:(id)a3
{
}

- (BOOL)connectedToDruid
{
  return self->_connectedToDruid;
}

- (void)setConnectedToDruid:(BOOL)a3
{
  self->_connectedToDruid = a3;
}

- (PBItemCollection)itemCollection
{
  return self->_itemCollection;
}

- (void)setItemCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemCollection, 0);
  objc_storeStrong((id *)&self->_druidDestinationConnection, 0);
  objc_storeStrong((id *)&self->_remoteControlProxy, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previewsByItemProviderIndex, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end