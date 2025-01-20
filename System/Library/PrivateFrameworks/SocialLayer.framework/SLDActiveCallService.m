@interface SLDActiveCallService
+ (id)remoteObjectProtocol;
+ (id)sharedService;
- (UISSlotMachine)activeCallViewSlotMachine;
- (id)_lookupActiveTUConversation;
- (id)slotMachineForViewIdentifier:(id)a3;
- (void)activeCallViewForStyle:(id)a3 maxWidth:(double)a4 layerContextID:(unint64_t)a5 reply:(id)a6;
- (void)setActiveCallViewSlotMachine:(id)a3;
@end

@implementation SLDActiveCallService

+ (id)remoteObjectProtocol
{
  return &unk_1EEC4CB80;
}

+ (id)sharedService
{
  if (sharedService_onceToken_8 != -1) {
    dispatch_once(&sharedService_onceToken_8, &__block_literal_global_19);
  }
  v2 = (void *)sharedService_sService_8;
  return v2;
}

uint64_t __37__SLDActiveCallService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(SLDActiveCallService);
  uint64_t v1 = sharedService_sService_8;
  sharedService_sService_8 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (UISSlotMachine)activeCallViewSlotMachine
{
  activeCallViewSlotMachine = self->_activeCallViewSlotMachine;
  if (!activeCallViewSlotMachine)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB3480]);
    v5 = objc_alloc_init(SLDActiveCallViewSlotDrawer);
    v6 = (UISSlotMachine *)[v4 initWithSlotDrawer:v5 options:0];
    v7 = self->_activeCallViewSlotMachine;
    self->_activeCallViewSlotMachine = v6;

    activeCallViewSlotMachine = self->_activeCallViewSlotMachine;
  }
  return activeCallViewSlotMachine;
}

- (void)activeCallViewForStyle:(id)a3 maxWidth:(double)a4 layerContextID:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  if (a4 <= 0.0)
  {
    v13 = (void (**)(id, void))a6;
    v18 = SLDaemonLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SLDActiveCallService activeCallViewForStyle:maxWidth:layerContextID:reply:]((uint64_t)self, v18);
    }

    v13[2](v13, 0);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F29268];
    v12 = (void (**)(id, void *))a6;
    v13 = [v11 currentConnection];
    v14 = [(SLDActiveCallService *)self _lookupActiveTUConversation];
    v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 messagesGroupPhotoData];
      v17 = [v15 displayName];
    }
    else
    {
      uint64_t v16 = 0;
      v17 = &stru_1EEC19158;
    }
    v24 = (void *)v16;
    v19 = +[SLDActiveCallViewSlotTag tagForMaxWidth:v15 != 0 callActive:v16 activeCallGroupPhotoData:v17 activeCallDisplayName:a4];
    v20 = [v19 resolvedStyleForStyle:v10];
    [(SLDRemoteRenderingService *)self _viewIDForStyle:v20 tag:v19];
    v22 = id v21 = v10;
    [(SLDRemoteRenderingService *)self _connection:v13 onlyNeedsViewWithIdentifier:v22];
    v23 = [(SLDRemoteRenderingService *)self _remoteContentForViewIdentifier:v22 layerContextID:a5 connection:v13];
    v12[2](v12, v23);

    [(SLDRemoteRenderingService *)self _connectionTouchedView:v22];
    id v10 = v21;
  }
}

- (id)slotMachineForViewIdentifier:(id)a3
{
  id v4 = [a3 tag];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(SLDActiveCallService *)self activeCallViewSlotMachine];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_lookupActiveTUConversation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  v3 = [v2 conversationManager];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = objc_msgSend(v3, "activeConversations", 0);
  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 state] == 3)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)setActiveCallViewSlotMachine:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)activeCallViewForStyle:(uint64_t)a1 maxWidth:(NSObject *)a2 layerContextID:reply:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "[SLDActiveCallService: %p] 0.0 was provided for the max width of the requested view. This is undefined behavior and should be sanitized before invoking this xpc interface!", (uint8_t *)&v2, 0xCu);
}

@end