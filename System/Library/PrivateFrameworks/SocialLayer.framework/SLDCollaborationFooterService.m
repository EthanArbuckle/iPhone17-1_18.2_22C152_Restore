@interface SLDCollaborationFooterService
+ (id)nameFromNameComponents:(id)a3;
+ (id)remoteObjectProtocol;
+ (id)sharedService;
+ (void)slotForModel:(id)a3 maxWidth:(double)a4 completion:(id)a5;
+ (void)slotForModelNeedingNameAndEmail:(id)a3 maxWidth:(double)a4 completion:(id)a5;
- (UISSlotMachine)footerViewSlotMachine;
- (id)slotMachineForViewIdentifier:(id)a3;
- (void)footerViewForModel:(id)a3 style:(id)a4 maxWidth:(double)a5 layerContextID:(unint64_t)a6 reply:(id)a7;
- (void)setFooterViewSlotMachine:(id)a3;
@end

@implementation SLDCollaborationFooterService

+ (id)remoteObjectProtocol
{
  return &unk_1EEC3B608;
}

+ (id)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedService_sService;
  return v2;
}

uint64_t __46__SLDCollaborationFooterService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(SLDCollaborationFooterService);
  uint64_t v1 = sharedService_sService;
  sharedService_sService = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (UISSlotMachine)footerViewSlotMachine
{
  footerViewSlotMachine = self->_footerViewSlotMachine;
  if (!footerViewSlotMachine)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB3480]);
    v5 = objc_alloc_init(SLDCollaborationFooterSlotDrawer);
    v6 = (UISSlotMachine *)[v4 initWithSlotDrawer:v5 options:0];
    v7 = self->_footerViewSlotMachine;
    self->_footerViewSlotMachine = v6;

    footerViewSlotMachine = self->_footerViewSlotMachine;
  }
  return footerViewSlotMachine;
}

- (id)slotMachineForViewIdentifier:(id)a3
{
  id v4 = [a3 tag];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(SLDCollaborationFooterService *)self footerViewSlotMachine];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)footerViewForModel:(id)a3 style:(id)a4 maxWidth:(double)a5 layerContextID:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = (void (**)(id, void))a7;
  if (a5 <= 0.0)
  {
    v18 = SLDaemonLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationFooterService footerViewForModel:style:maxWidth:layerContextID:reply:]((uint64_t)self, v18);
    }

    v14[2](v14, 0);
  }
  else
  {
    v15 = [MEMORY[0x1E4F29268] currentConnection];
    v16 = objc_opt_class();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__SLDCollaborationFooterService_footerViewForModel_style_maxWidth_layerContextID_reply___block_invoke;
    v19[3] = &unk_1E58A8860;
    id v20 = v13;
    v21 = self;
    id v22 = v15;
    unint64_t v24 = a6;
    v23 = v14;
    id v17 = v15;
    [v16 slotForModel:v12 maxWidth:v19 completion:a5];
  }
}

void __88__SLDCollaborationFooterService_footerViewForModel_style_maxWidth_layerContextID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v7 = [v4 resolvedStyleForStyle:v3];
  v5 = [*(id *)(a1 + 40) _viewIDForStyle:v7 tag:v4];

  [*(id *)(a1 + 40) _connection:*(void *)(a1 + 48) onlyNeedsViewWithIdentifier:v5];
  v6 = [*(id *)(a1 + 40) _remoteContentForViewIdentifier:v5 layerContextID:*(void *)(a1 + 64) connection:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 40) _connectionTouchedView:v5];
}

+ (void)slotForModel:(id)a3 maxWidth:(double)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(id, SLDCollaborationFooterSlotTag *))a5;
  uint64_t v10 = [v8 type];
  if ((unint64_t)(v10 - 1) < 2)
  {
    [a1 slotForModelNeedingNameAndEmail:v8 maxWidth:v9 completion:a4];
  }
  else
  {
    if (v10 == 3)
    {
      v11 = [v8 optionsSummary];
      v15 = [v8 metadata];
      v16 = [v15 initiatorNameComponents];

      if (v16)
      {
        id v17 = objc_opt_class();
        v18 = [v8 metadata];
        v19 = [v18 initiatorNameComponents];
        id v13 = [v17 nameFromNameComponents:v19];
      }
      else
      {
        id v20 = SLDaemonLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = [v8 metadata];
          *(_DWORD *)buf = 138412290;
          v28 = v21;
          _os_log_impl(&dword_19BE17000, v20, OS_LOG_TYPE_DEFAULT, "Metadata has no initiator name components: %@", buf, 0xCu);
        }
        id v13 = 0;
      }
      id v22 = [v8 metadata];
      v14 = [v22 initiatorHandle];

      id v12 = 0;
      if (v13 && v14)
      {
        v23 = NSString;
        unint64_t v24 = SLFrameworkBundle();
        v25 = [v24 localizedStringForKey:@"SHARE_AS" value:&stru_1EEC19158 table:@"SocialLayer"];
        id v12 = objc_msgSend(v23, "stringWithFormat:", v25, v13, v14);
      }
    }
    else if (v10)
    {
      id v13 = 0;
      v11 = 0;
      v14 = 0;
      id v12 = 0;
    }
    else
    {
      v11 = [v8 title];
      id v12 = [v8 subtitle];
      id v13 = 0;
      v14 = 0;
    }
    v26 = [[SLDCollaborationFooterSlotTag alloc] initWithTitle:v11 subtitle:v12 maxWidth:a4];
    v9[2](v9, v26);
  }
}

+ (id)nameFromNameComponents:(id)a3
{
  return (id)[MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:a3 style:0 options:0];
}

+ (void)slotForModelNeedingNameAndEmail:(id)a3 maxWidth:(double)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = SLDaemonLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v9, OS_LOG_TYPE_DEFAULT, "Beginning fetch of name and email", buf, 2u);
  }

  getCloudSharingClass();
  if (objc_opt_respondsToSelector())
  {
    id CloudSharingClass = getCloudSharingClass();
    v11 = [v7 fileURL];
    id v12 = [v7 containerSetupInfo];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__SLDCollaborationFooterService_slotForModelNeedingNameAndEmail_maxWidth_completion___block_invoke;
    v16[3] = &unk_1E58A8888;
    id v17 = v7;
    double v19 = a4;
    id v18 = v8;
    [CloudSharingClass userNameAndEmail:v11 containerSetupInfo:v12 completionHandler:v16];

    id v13 = v17;
  }
  else
  {
    v14 = SLDaemonLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[SLDCollaborationFooterService slotForModelNeedingNameAndEmail:maxWidth:completion:](v14);
    }

    id v13 = [v7 optionsSummary];
    v15 = [[SLDCollaborationFooterSlotTag alloc] initWithTitle:v13 subtitle:&stru_1EEC19158 maxWidth:a4];
    (*((void (**)(id, SLDCollaborationFooterSlotTag *))v8 + 2))(v8, v15);
  }
}

void __85__SLDCollaborationFooterService_slotForModelNeedingNameAndEmail_maxWidth_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) optionsSummary];
  if (v8 && v7 && !v9)
  {
    v11 = NSString;
    id v12 = SLFrameworkBundle();
    id v13 = [v12 localizedStringForKey:@"SHARE_AS" value:&stru_1EEC19158 table:@"SocialLayer"];
    v14 = objc_msgSend(v11, "stringWithFormat:", v13, v7, v8);
  }
  else
  {
    v15 = SLDaemonLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __85__SLDCollaborationFooterService_slotForModelNeedingNameAndEmail_maxWidth_completion___block_invoke_cold_1((uint64_t)v9, v15);
    }

    v14 = 0;
  }
  v16 = [[SLDCollaborationFooterSlotTag alloc] initWithTitle:v10 subtitle:v14 maxWidth:*(double *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setFooterViewSlotMachine:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)footerViewForModel:(uint64_t)a1 style:(NSObject *)a2 maxWidth:layerContextID:reply:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "[SLDCollaborationFooterService: %p] 0.0 was provided for the max width of the requested view. This is undefined behavior and should be sanitized before invoking this xpc interface!", (uint8_t *)&v2, 0xCu);
}

+ (void)slotForModelNeedingNameAndEmail:(os_log_t)log maxWidth:completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "Missing CloudSharing support", v1, 2u);
}

void __85__SLDCollaborationFooterService_slotForModelNeedingNameAndEmail_maxWidth_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch name and email: %@", (uint8_t *)&v2, 0xCu);
}

@end