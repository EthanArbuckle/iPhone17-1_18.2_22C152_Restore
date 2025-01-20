@interface SFCollaborationPerformer
- (BOOL)didCancel;
- (BOOL)isRunning;
- (BOOL)requiresParticipants;
- (NSString)activityType;
- (OS_dispatch_queue)performQueue;
- (SFCollaborationCloudSharingResult)cloudSharingResult;
- (SFCollaborationCreationDelegate)creationDelegate;
- (SFCollaborationItem)collaborationItem;
- (SFCollaborationPerformer)initWithCollaborationItem:(id)a3 activityType:(id)a4 context:(id)a5;
- (SFCollaborationPerformer)initWithCollaborationItem:(id)a3 activityType:(id)a4 deviceScreenScale:(double)a5;
- (SFCollaborationPerformerDelegate)delegate;
- (double)deviceScreenScale;
- (void)_createCollaborationRequestWithCompletionHandler:(id)a3;
- (void)_createSharingURLForCollaborationRequest:(id)a3;
- (void)_didCreateCollaborationWithResult:(id)a3;
- (void)_fetchCollaborationAppInfoIfNeeded:(id)a3;
- (void)_handleSubitemInSharedFolder;
- (void)_handleUnsharedFolderWithSharedSubitems;
- (void)_performAfterFolderCheck;
- (void)_performWithAddParticipantsAllowed:(BOOL)a3;
- (void)cancel;
- (void)perform;
- (void)setCreationDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidCancel:(BOOL)a3;
- (void)setPerformQueue:(id)a3;
- (void)setRequiresParticipants:(BOOL)a3;
@end

@implementation SFCollaborationPerformer

- (SFCollaborationPerformer)initWithCollaborationItem:(id)a3 activityType:(id)a4 deviceScreenScale:(double)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SFCollaborationPerformer;
  v11 = [(SFCollaborationPerformer *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_collaborationItem, a3);
    uint64_t v13 = [v10 copy];
    activityType = v12->_activityType;
    v12->_activityType = (NSString *)v13;

    v12->_deviceScreenScale = a5;
    v12->_requiresParticipants = 0;
    v15 = share_sheet_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl(&dword_1A5389000, v15, OS_LOG_TYPE_DEFAULT, "New Collaboration Performer for item:%@ activityType:%@", buf, 0x16u);
    }

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.sharesheet.SFCollaborationPerformer.performQueue", v16);
    performQueue = v12->_performQueue;
    v12->_performQueue = (OS_dispatch_queue *)v17;
  }
  return v12;
}

- (SFCollaborationPerformer)initWithCollaborationItem:(id)a3 activityType:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  [a5 deviceScreenScale];
  id v10 = -[SFCollaborationPerformer initWithCollaborationItem:activityType:deviceScreenScale:](self, "initWithCollaborationItem:activityType:deviceScreenScale:", v9, v8);

  return v10;
}

- (void)perform
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = gelato_sharing_log();
  v4 = gelato_sharing_log();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self->_collaborationItem);

  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PerformCollaboration", "", buf, 2u);
  }

  [(SFCollaborationPerformer *)self setDidCancel:0];
  self->_isRunning = 1;
  v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, "performing Collaboration Performer:%@", buf, 0xCu);
  }

  v7 = [(SFCollaborationPerformer *)self creationDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    id v9 = [(SFCollaborationPerformer *)self creationDelegate];
    id v10 = [(SFCollaborationPerformer *)self collaborationItem];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __35__SFCollaborationPerformer_perform__block_invoke;
    v14[3] = &unk_1E5BBC4A0;
    objc_copyWeak(&v15, (id *)buf);
    [v9 addParticipantsAllowedForCollaborationItem:v10 completionHandler:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(SFCollaborationPerformer *)self collaborationItem];
      uint64_t v13 = [v12 identifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl(&dword_1A5389000, v11, OS_LOG_TYPE_DEFAULT, "Collaboration performer for item %@ assuming Add Participants Allowed is true because the creation delegate doesn't implement the delegate function", buf, 0xCu);
    }
    [(SFCollaborationPerformer *)self _performWithAddParticipantsAllowed:1];
  }
}

void __35__SFCollaborationPerformer_perform__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __35__SFCollaborationPerformer_perform__block_invoke_cold_1((uint64_t)v5, v6);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SFCollaborationPerformer_perform__block_invoke_18;
  v7[3] = &unk_1E5BBC478;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  char v9 = a2;
  sf_dispatch_on_main_queue(v7);
  objc_destroyWeak(&v8);
}

void __35__SFCollaborationPerformer_perform__block_invoke_18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performWithAddParticipantsAllowed:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_performWithAddParticipantsAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = [(SFCollaborationPerformer *)self collaborationItem];
  uint64_t v6 = [v5 type];

  if (v6 == 2)
  {
    v7 = [(SFCollaborationPerformer *)self collaborationItem];
    uint64_t v8 = [v7 isURLProviderSupported];

    goto LABEL_16;
  }
  char v9 = [(SFCollaborationPerformer *)self collaborationItem];
  BOOL v10 = +[SFCollaborationUtilities isCollaborationItemPrivateShare:v9];

  v11 = [(SFCollaborationPerformer *)self activityType];
  if ([v11 isEqualToString:@"com.apple.UIKit.activity.Mail"])
  {
  }
  else
  {
    v12 = [(SFCollaborationPerformer *)self activityType];
    char v13 = [v12 isEqualToString:&stru_1EF9BDC68];

    if ((v13 & 1) == 0)
    {
      uint64_t v8 = v3 & v10;
      if (v3 && v10) {
        goto LABEL_16;
      }
      v14 = share_sheet_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = @"YES";
        if (v10) {
          v16 = @"NO";
        }
        else {
          v16 = @"YES";
        }
        if (v3) {
          id v15 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v16;
        __int16 v48 = 2112;
        v49 = v15;
        _os_log_impl(&dword_1A5389000, v14, OS_LOG_TYPE_DEFAULT, "not requesting Participants for Collaboration creation since access type is public (%@) or adding participants is not allowed (%@)", buf, 0x16u);
      }
    }
  }
  uint64_t v8 = 0;
LABEL_16:
  [(SFCollaborationPerformer *)self setRequiresParticipants:v8];
  uint64_t v17 = share_sheet_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [(SFCollaborationPerformer *)self collaborationItem];
    v19 = [v18 identifier];
    BOOL v20 = [(SFCollaborationPerformer *)self requiresParticipants];
    v21 = @"NO";
    if (v20) {
      v21 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v19;
    __int16 v48 = 2112;
    v49 = v21;
    _os_log_impl(&dword_1A5389000, v17, OS_LOG_TYPE_DEFAULT, "Collaboration performer for item %@ beginning perform with requiresParticipants:%@", buf, 0x16u);
  }
  id v22 = [(SFCollaborationPerformer *)self delegate];
  char v23 = objc_opt_respondsToSelector();

  id v24 = [(SFCollaborationPerformer *)self delegate];
  if (v23)
  {
    objc_msgSend(v24, "didBeginCreationForCollaborationPerformer:requiresAddParticipants:", self, -[SFCollaborationPerformer requiresParticipants](self, "requiresParticipants"));
  }
  else
  {
    char v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) == 0) {
      goto LABEL_25;
    }
    id v24 = [(SFCollaborationPerformer *)self delegate];
    [v24 didBeginCreationForCollaborationPerformer:self];
  }

LABEL_25:
  v26 = [(SFCollaborationPerformer *)self collaborationItem];
  v27 = [v26 metadata];
  if (v27)
  {
LABEL_28:

    goto LABEL_29;
  }
  v27 = [(SFCollaborationPerformer *)self collaborationItem];
  v28 = [v27 shareOptions];
  if (v28)
  {

    goto LABEL_28;
  }
  v36 = [(SFCollaborationPerformer *)self collaborationItem];
  v37 = [v36 metadataLoadError];
  BOOL v38 = v37 == 0;

  if (v38)
  {
LABEL_29:
    v29 = [(SFCollaborationPerformer *)self collaborationItem];
    if (![v29 type])
    {
      v30 = [(SFCollaborationPerformer *)self creationDelegate];
      if (objc_opt_respondsToSelector())
      {
        v31 = [(SFCollaborationPerformer *)self creationDelegate];
        char v32 = objc_opt_respondsToSelector();

        if (v32)
        {
          *(void *)buf = 0;
          objc_initWeak((id *)buf, self);
          v33 = [(SFCollaborationPerformer *)self collaborationItem];
          v34 = [v33 fileURL];

          v35 = [(SFCollaborationPerformer *)self creationDelegate];
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __63__SFCollaborationPerformer__performWithAddParticipantsAllowed___block_invoke;
          v45[3] = &unk_1E5BBC4F0;
          objc_copyWeak(&v46, (id *)buf);
          [v35 shareStatusForURL:v34 completionHandler:v45];

          objc_destroyWeak(&v46);
          objc_destroyWeak((id *)buf);
          return;
        }
        goto LABEL_35;
      }
    }
LABEL_35:
    [(SFCollaborationPerformer *)self _performAfterFolderCheck];
    return;
  }
  v39 = share_sheet_log();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
    -[SFCollaborationPerformer _performWithAddParticipantsAllowed:](self, v39);
  }

  v40 = [(SFCollaborationPerformer *)self delegate];
  char v41 = objc_opt_respondsToSelector();

  if (v41)
  {
    v42 = [(SFCollaborationPerformer *)self delegate];
    v43 = [(SFCollaborationPerformer *)self collaborationItem];
    v44 = [v43 metadataLoadError];
    [v42 didFailCreationForCollaborationPerformer:self error:v44];
  }
  [(SFCollaborationPerformer *)self cancel];
}

void __63__SFCollaborationPerformer__performWithAddParticipantsAllowed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__SFCollaborationPerformer__performWithAddParticipantsAllowed___block_invoke_2;
  v6[3] = &unk_1E5BBC4C8;
  v7[1] = a2;
  objc_copyWeak(v7, (id *)(a1 + 32));
  sf_dispatch_on_main_queue(v6);
  objc_destroyWeak(v7);
}

void __63__SFCollaborationPerformer__performWithAddParticipantsAllowed___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = (id *)(a1 + 32);
  if (v1 == 5)
  {
    id WeakRetained = objc_loadWeakRetained(v2);
    [WeakRetained _handleSubitemInSharedFolder];
  }
  else if (v1 == 6)
  {
    id WeakRetained = objc_loadWeakRetained(v2);
    [WeakRetained _handleUnsharedFolderWithSharedSubitems];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(v2);
    [WeakRetained _performAfterFolderCheck];
  }
}

- (void)_handleUnsharedFolderWithSharedSubitems
{
  BOOL v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Collaboration item is an unshared folder with shared subitems", buf, 2u);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v4 = [(SFCollaborationPerformer *)self creationDelegate];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke;
  v5[3] = &unk_1E5BBC590;
  objc_copyWeak(&v6, (id *)buf);
  [v4 canShareFolderContainingExistingSharedItemsWithCompletionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v3 = share_sheet_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Received user permission to override shared subitems", buf, 2u);
    }

    v4 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v7[2] = __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke_36;
    v7[3] = &unk_1E5BBC568;
    objc_copyWeak(&v8, v4);
    [WeakRetained _createCollaborationRequestWithCompletionHandler:v7];

    objc_destroyWeak(&v8);
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 32));
    [v6 cancel];
  }
}

void __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke_36(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke_2;
  v5[3] = &unk_1E5BBC540;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v4 = v3;
  id v6 = v4;
  sf_dispatch_on_main_queue(v5);

  objc_destroyWeak(&v7);
}

void __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained creationDelegate];
  uint64_t v5 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke_3;
  v6[3] = &unk_1E5BBC518;
  objc_copyWeak(&v7, v2);
  [v4 createSharingURLForCollaborationRequest:v5 completionHandler:v6];

  objc_destroyWeak(&v7);
}

void __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performAfterFolderCheck];
}

- (void)_handleSubitemInSharedFolder
{
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Collaboration item is a file in a shared folder", buf, 2u);
  }

  id v4 = [(SFCollaborationPerformer *)self creationDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(SFCollaborationPerformer *)self creationDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      *(void *)buf = 0;
      objc_initWeak((id *)buf, self);
      id v7 = [(SFCollaborationPerformer *)self creationDelegate];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __56__SFCollaborationPerformer__handleSubitemInSharedFolder__block_invoke;
      v8[3] = &unk_1E5BBC590;
      objc_copyWeak(&v9, (id *)buf);
      [v7 canManageShareForDocumentInSharedFolderWithCompletionHandler:v8];

      objc_destroyWeak(&v9);
      objc_destroyWeak((id *)buf);
      return;
    }
  }
  else
  {
  }
  [(SFCollaborationPerformer *)self _performAfterFolderCheck];
}

void __56__SFCollaborationPerformer__handleSubitemInSharedFolder__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (a2)
  {
    id v4 = [WeakRetained creationDelegate];
    [v4 manageShareForDocumentInSharedFolder];
  }
  else
  {
    [WeakRetained cancel];
  }
}

- (void)_createSharingURLForCollaborationRequest:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  if (![(SFCollaborationPerformer *)self requiresParticipants])
  {
    id v7 = [(SFCollaborationPerformer *)self creationDelegate];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke_46;
    v10[3] = &unk_1E5BBC518;
    id v8 = &v11;
    objc_copyWeak(&v11, &location);
    [v7 createSharingURLForCollaborationRequest:v4 completionHandler:v10];
    goto LABEL_5;
  }
  id v5 = [(SFCollaborationPerformer *)self creationDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SFCollaborationPerformer *)self creationDelegate];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke;
    v12[3] = &unk_1E5BBC518;
    id v8 = &v13;
    objc_copyWeak(&v13, &location);
    [v7 createSharingURLWithParticipantsForCollaborationRequest:v4 completionHandler:v12];
LABEL_5:

    objc_destroyWeak(v8);
    goto LABEL_9;
  }
  id v9 = share_sheet_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[SFCollaborationPerformer _createSharingURLForCollaborationRequest:](v9);
  }

  [(SFCollaborationPerformer *)self cancel];
LABEL_9:
  objc_destroyWeak(&location);
}

void __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke_2;
  v5[3] = &unk_1E5BBC5B8;
  id v4 = v3;
  id v6 = v4;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  sf_dispatch_on_main_queue(v5);
  objc_destroyWeak(&v7);
}

void __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) error];
  if (v2)
  {

LABEL_4:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _didCreateCollaborationWithResult:*(void *)(a1 + 32)];
    goto LABEL_5;
  }
  id v3 = [*(id *)(a1 + 32) sharingURL];

  if (v3) {
    goto LABEL_4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cancel];
LABEL_5:
}

void __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke_46(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke_2_47;
  v5[3] = &unk_1E5BBC540;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v4 = v3;
  id v6 = v4;
  sf_dispatch_on_main_queue(v5);

  objc_destroyWeak(&v7);
}

void __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke_2_47(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didCreateCollaborationWithResult:*(void *)(a1 + 32)];
}

- (void)_performAfterFolderCheck
{
  id location = 0;
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__SFCollaborationPerformer__performAfterFolderCheck__block_invoke;
  v3[3] = &unk_1E5BBC568;
  objc_copyWeak(&v4, &location);
  [(SFCollaborationPerformer *)self _createCollaborationRequestWithCompletionHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __52__SFCollaborationPerformer__performAfterFolderCheck__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SFCollaborationPerformer__performAfterFolderCheck__block_invoke_2;
  v5[3] = &unk_1E5BBC540;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v4 = v3;
  id v6 = v4;
  sf_dispatch_on_main_queue(v5);

  objc_destroyWeak(&v7);
}

void __52__SFCollaborationPerformer__performAfterFolderCheck__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _createSharingURLForCollaborationRequest:*(void *)(a1 + 32)];
}

- (void)cancel
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SFCollaborationPerformer *)self collaborationItem];
    id v5 = [v4 identifier];
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Cancel Collaboration creation for collaboration item %@", (uint8_t *)&v7, 0xCu);
  }
  [(SFCollaborationPerformer *)self setDidCancel:1];
  self->_isRunning = 0;
  id v6 = [(SFCollaborationPerformer *)self delegate];
  [v6 didCancelCreationForCollaborationPerformer:self];
}

- (void)_createCollaborationRequestWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(SFCollaborationPerformer *)self collaborationItem];
    int v7 = [v6 identifier];
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Create Collaboration request for collaboration item %@", buf, 0xCu);
  }
  id v8 = [(SFCollaborationPerformer *)self collaborationItem];
  if ([v8 type] == 2)
  {
    uint64_t v9 = [SFCollaborationCloudSharingRequest alloc];
    BOOL v10 = [v8 identifier];
    id v11 = [v8 options];
    v12 = [(SFCollaborationPerformer *)self activityType];
    id v13 = -[SFCollaborationCloudSharingRequest initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:](v9, "initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:", v10, v11, 0, 0, 0, MEMORY[0x1E4F1CBF0], v12, 0, 0);

    v4[2](v4, v13);
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__SFCollaborationPerformer__createCollaborationRequestWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E5BBC608;
    id v15 = v8;
    v16 = self;
    uint64_t v17 = v4;
    [(SFCollaborationPerformer *)self _fetchCollaborationAppInfoIfNeeded:v14];

    id v13 = v15;
  }
}

void __77__SFCollaborationPerformer__createCollaborationRequestWithCompletionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] type];
  switch(v7)
  {
    case 2:
      id v15 = share_sheet_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        __77__SFCollaborationPerformer__createCollaborationRequestWithCompletionHandler___block_invoke_cold_1(v15);
      }

      [a1[5] cancel];
      (*((void (**)(void))a1[6] + 2))();
      break;
    case 1:
      v16 = [a1[4] itemProvider];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __77__SFCollaborationPerformer__createCollaborationRequestWithCompletionHandler___block_invoke_2;
      v19[3] = &unk_1E5BBC5E0;
      id v17 = a1[4];
      id v18 = a1[5];
      id v20 = v17;
      id v21 = v18;
      id v22 = v5;
      id v23 = v6;
      id v24 = a1[6];
      +[SFCollaborationUtilities loadCKShareItemProvider:v16 completionHandler:v19];

      break;
    case 0:
      id v8 = a1[4];
      uint64_t v9 = [SFCollaborationCloudSharingRequest alloc];
      BOOL v10 = [v8 identifier];
      id v11 = [a1[4] options];
      v12 = [v8 fileURL];
      id v13 = [a1[5] activityType];
      v14 = -[SFCollaborationCloudSharingRequest initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:](v9, "initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:", v10, v11, v12, 0, 0, MEMORY[0x1E4F1CBF0], v13, v5, v6);

      (*((void (**)(void))a1[6] + 2))();
      break;
  }
}

void __77__SFCollaborationPerformer__createCollaborationRequestWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v15 = a2;
  uint64_t v7 = [v5 updatedShare];
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = v15;
  }
  id v9 = v8;

  BOOL v10 = [SFCollaborationCloudSharingRequest alloc];
  id v11 = [*(id *)(a1 + 32) identifier];
  v12 = [*(id *)(a1 + 32) options];
  id v13 = [*(id *)(a1 + 40) activityType];
  v14 = -[SFCollaborationCloudSharingRequest initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:](v10, "initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:", v11, v12, 0, v9, v6, MEMORY[0x1E4F1CBF0], v13, *(void *)(a1 + 48), *(void *)(a1 + 56));

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_fetchCollaborationAppInfoIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [(SFCollaborationPerformer *)self activityType];
  int v6 = [v5 isEqualToString:@"com.apple.UIKit.activity.Mail"];

  if (v6)
  {
    [(SFCollaborationPerformer *)self deviceScreenScale];
    double v8 = v7;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__SFCollaborationPerformer__fetchCollaborationAppInfoIfNeeded___block_invoke;
    v14[3] = &unk_1E5BBC630;
    id v9 = &v15;
    id v15 = v4;
    id v10 = v4;
    SFCurrentAppIconData(v14, v8);
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__SFCollaborationPerformer__fetchCollaborationAppInfoIfNeeded___block_invoke_2;
    v12[3] = &unk_1E5BBC658;
    id v9 = &v13;
    id v13 = v4;
    id v11 = v4;
    sf_dispatch_on_main_queue(v12);
  }
}

void __63__SFCollaborationPerformer__fetchCollaborationAppInfoIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  SFCurrentAppName();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v4, v3);
}

uint64_t __63__SFCollaborationPerformer__fetchCollaborationAppInfoIfNeeded___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_didCreateCollaborationWithResult:(id)a3
{
  id v5 = a3;
  if (![(SFCollaborationPerformer *)self didCancel])
  {
    int v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, "Did create Collaboration", buf, 2u);
    }

    double v7 = [v5 sharingURL];

    if (!v7)
    {
      double v8 = share_sheet_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SFCollaborationPerformer _didCreateCollaborationWithResult:](v5, v8);
      }
    }
    self->_isRunning = 0;
    objc_storeStrong((id *)&self->_cloudSharingResult, a3);
    id v9 = [(SFCollaborationPerformer *)self collaborationItem];
    [v9 setCloudSharingResult:v5];

    id v10 = [(SFCollaborationPerformer *)self delegate];
    [v10 didFinishCreationForCollaborationPerformer:self];
  }
  id v11 = gelato_sharing_log();
  v12 = gelato_sharing_log();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self->_collaborationItem);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v11, OS_SIGNPOST_INTERVAL_END, v13, "PerformCollaboration", "", v14, 2u);
  }
}

- (SFCollaborationItem)collaborationItem
{
  return self->_collaborationItem;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (double)deviceScreenScale
{
  return self->_deviceScreenScale;
}

- (SFCollaborationPerformerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFCollaborationPerformerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SFCollaborationCreationDelegate)creationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_creationDelegate);

  return (SFCollaborationCreationDelegate *)WeakRetained;
}

- (void)setCreationDelegate:(id)a3
{
}

- (SFCollaborationCloudSharingResult)cloudSharingResult
{
  return self->_cloudSharingResult;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (BOOL)requiresParticipants
{
  return self->_requiresParticipants;
}

- (void)setRequiresParticipants:(BOOL)a3
{
  self->_requiresParticipants = a3;
}

- (BOOL)didCancel
{
  return self->_didCancel;
}

- (void)setDidCancel:(BOOL)a3
{
  self->_didCancel = a3;
}

- (OS_dispatch_queue)performQueue
{
  return self->_performQueue;
}

- (void)setPerformQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performQueue, 0);
  objc_storeStrong((id *)&self->_cloudSharingResult, 0);
  objc_destroyWeak((id *)&self->_creationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityType, 0);

  objc_storeStrong((id *)&self->_collaborationItem, 0);
}

void __35__SFCollaborationPerformer_perform__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "Add Participants Allowed load returned error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_performWithAddParticipantsAllowed:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 collaborationItem];
  uint64_t v4 = [v3 metadataLoadError];
  int v5 = 138412290;
  int v6 = v4;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "Collaboration Performer failed because metadata was not loaded: %@", (uint8_t *)&v5, 0xCu);
}

- (void)_createSharingURLForCollaborationRequest:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A5389000, log, OS_LOG_TYPE_ERROR, "Add participants view delegate method is not implemented", v1, 2u);
}

void __77__SFCollaborationPerformer__createCollaborationRequestWithCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1A5389000, log, OS_LOG_TYPE_FAULT, "prepare Collaboration for SWY isn't supported.", v1, 2u);
}

- (void)_didCreateCollaborationWithResult:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "error:%@", (uint8_t *)&v4, 0xCu);
}

@end