@interface SFCollaborationUtilities
+ (BOOL)canDeleteShareForCollaborationItem:(id)a3;
+ (BOOL)hasiWorkSendCopyRepresentationForItemProvider:(id)a3;
+ (BOOL)isCKShareItemProvider:(id)a3;
+ (BOOL)isCollaborationItemPrivateShare:(id)a3;
+ (BOOL)isHeroCollaborationActivityType:(id)a3;
+ (BOOL)isOplockError:(id)a3 updatedShare:(id *)a4;
+ (BOOL)isPostCKShareItemProvider:(id)a3;
+ (BOOL)isPreCKShareItemProvider:(id)a3;
+ (BOOL)isSWYActivityItemProvider:(id)a3;
+ (BOOL)isServiceManateeCKShareItemProvider:(id)a3;
+ (BOOL)isSharedFileURL:(id)a3 isLocalStorageFileURL:(BOOL *)a4 isiCloudDriveFileURL:(BOOL *)a5 isInSharedFolder:(BOOL *)a6;
+ (BOOL)isThirdPartyFileProviderBackedURL:(id)a3;
+ (NSString)_copyRepresentationTypeIdentifier;
+ (NSString)defaultCKOptionsSummary;
+ (id)_dataForFilepath:(id)a3;
+ (id)baseCollaborationDictionaryFromCollaborationItem:(id)a3;
+ (id)ckShareDictionaryFromCKShare:(id)a3 setupInfo:(id)a4;
+ (id)createItemProviderForFileURL:(id)a3;
+ (id)createLinkMetadataWithCKShare:(id)a3 containerSetupInfo:(id)a4;
+ (id)createLinkMetadataWithCKShareItemProvider:(id)a3;
+ (id)descriptionForShareOptions:(id)a3;
+ (id)fileCollaborationItemFromActivityItems:(id)a3;
+ (id)fileShareDictionaryFromFileURLItems:(id)a3;
+ (id)optionsFromCKShare:(id)a3 previousCKOptions:(id)a4 newCKOptions:(id *)a5;
+ (id)underlyingCKErrorForError:(id)a3;
+ (id)urlFromActivityItem:(id)a3 allowsLoading:(BOOL)a4;
+ (id)urlRequestsForCollaborationItems:(id)a3;
+ (void)_addParticipantsAllowedForShare:(id)a3 completionHandler:(id)a4;
+ (void)_addParticipantsAllowedForURL:(id)a3 share:(id)a4 collaborationService:(id)a5 completionHandler:(id)a6;
+ (void)_copyRepresentationTypeIdentifier;
+ (void)_findOriginatingSharedItemInParentItems:(id)a3 forSubitem:(id)a4 completionHandler:(id)a5;
+ (void)_loadCKShareWithMetadataForItemProvider:(id)a3 completionHandler:(id)a4;
+ (void)_loadShareOptionsForCKShareItemProvider:(id)a3 completionHandler:(id)a4;
+ (void)_loadShareOptionsForSWYItemProvider:(id)a3 completionHandler:(id)a4;
+ (void)_processRemainingActivityItems:(id)a3 toFinalActivityItems:(id)a4 onQueue:(id)a5 completion:(id)a6;
+ (void)addParticipantsAllowedForCollaborationItem:(id)a3 collaborationService:(id)a4 completionHandler:(id)a5;
+ (void)addParticipantsAllowedForURL:(id)a3 share:(id)a4 completionHandler:(id)a5;
+ (void)canShowShareOptionsForCollaborationItem:(id)a3 service:(id)a4 completionHandler:(id)a5;
+ (void)createMailContentForRequest:(id)a3 completionHandler:(id)a4;
+ (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4;
+ (void)deleteSharingURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5;
+ (void)findOriginatingSharedItemForSubitemURL:(id)a3 completionHandler:(id)a4;
+ (void)getCKSharingOptionsFromOptions:(id)a3 accessType:(id *)a4 permissionType:(id *)a5 allowOthersToInvite:(id *)a6;
+ (void)getFailureTitle:(id *)a3 message:(id *)a4 error:(id)a5;
+ (void)isShareOwnerOrAdminForCollaborationItem:(id)a3 service:(id)a4 completionHandler:(id)a5;
+ (void)isShareOwnerOrAdminForFileURL:(id)a3 completionHandler:(id)a4;
+ (void)isShareOwnerOrAdminForShare:(id)a3 completionHandler:(id)a4;
+ (void)loadCKContainerForItemProvider:(id)a3 completionHandler:(id)a4;
+ (void)loadCKShareItemProvider:(id)a3 completionHandler:(id)a4;
+ (void)loadCKShareItemProvider:(id)a3 onlyPostShare:(BOOL)a4 completionHandler:(id)a5;
+ (void)loadMetadataForFileURL:(id)a3 completionHandler:(id)a4;
+ (void)loadMetadataForItemProvider:(id)a3 completionHandler:(id)a4;
+ (void)loadPendingCollaborationForItemProvider:(id)a3 completionHandler:(id)a4;
+ (void)loadSendCopyRepresentationIfNeededForActivityItems:(id)a3 completion:(id)a4;
+ (void)loadSendCopyRepresentationIfNeededForItemProvider:(id)a3 completion:(id)a4;
+ (void)loadShareOptionsForItemProvider:(id)a3 completionHandler:(id)a4;
+ (void)loadiWorkCopyRepresentationURLForItemProvider:(id)a3 completionHandler:(id)a4;
+ (void)requestSharedURLForCollaborationItem:(id)a3 collaborationService:(id)a4 completionHandler:(id)a5;
+ (void)requestSharedURLForURL:(id)a3 completionHandler:(id)a4;
+ (void)shareStatusForURL:(id)a3 completionHandler:(id)a4;
@end

@implementation SFCollaborationUtilities

+ (id)baseCollaborationDictionaryFromCollaborationItem:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 metadata];
  [v5 setObject:v6 forKeyedSubscript:@"CollaborationMetadata"];

  v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "type"));
  [v5 setObject:v7 forKeyedSubscript:@"CollaborationType"];

  v8 = [v4 shareOptions];
  [v5 setObject:v8 forKeyedSubscript:@"CollaborationShareOptions"];

  v9 = [v4 shareOptions];

  v10 = [v9 optionsGroups];
  [v5 setObject:v10 forKeyedSubscript:@"CollaborationOptions"];

  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"CollaborationMode"];

  return v5;
}

+ (BOOL)isCKShareItemProvider:(id)a3
{
  id v3 = a3;
  id v4 = get_CKCloudKitPreShareType();
  if ([v3 hasItemConformingToTypeIdentifier:v4])
  {
    char v5 = 1;
  }
  else
  {
    v6 = get_CKCloudKitPostShareType();
    char v5 = [v3 hasItemConformingToTypeIdentifier:v6];
  }
  return v5;
}

+ (BOOL)isPreCKShareItemProvider:(id)a3
{
  id v3 = a3;
  id v4 = get_CKCloudKitPreShareType();
  char v5 = [v3 hasItemConformingToTypeIdentifier:v4];

  return v5;
}

+ (BOOL)isPostCKShareItemProvider:(id)a3
{
  id v3 = a3;
  id v4 = get_CKCloudKitPostShareType();
  char v5 = [v3 hasItemConformingToTypeIdentifier:v4];

  return v5;
}

+ (void)getCKSharingOptionsFromOptions:(id)a3 accessType:(id *)a4 permissionType:(id *)a5 allowOthersToInvite:(id *)a6
{
  id v9 = a3;
  if ([v9 count])
  {
    uint64_t v10 = soft_CKSharingAccessTypeFromOptionsGroups(v9);
    id v11 = v9;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    v12 = (uint64_t (*)(id))getCKSharingPermissionTypeFromOptionsGroupsSymbolLoc_ptr;
    v22 = getCKSharingPermissionTypeFromOptionsGroupsSymbolLoc_ptr;
    if (!getCKSharingPermissionTypeFromOptionsGroupsSymbolLoc_ptr)
    {
      v13 = (void *)CloudKitLibrary_0();
      v20[3] = (uint64_t)dlsym(v13, "CKSharingPermissionTypeFromOptionsGroups");
      getCKSharingPermissionTypeFromOptionsGroupsSymbolLoc_ptr = (_UNKNOWN *)v20[3];
      v12 = (uint64_t (*)(id))v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v12) {
      +[SFCollaborationUtilities getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:]();
    }
    uint64_t v14 = v12(v11);

    v15 = v11;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    v16 = (uint64_t (*))getCKSharingAllowOthersToInviteFromOptionsGroupsSymbolLoc_ptr;
    v22 = getCKSharingAllowOthersToInviteFromOptionsGroupsSymbolLoc_ptr;
    if (!getCKSharingAllowOthersToInviteFromOptionsGroupsSymbolLoc_ptr)
    {
      v17 = (void *)CloudKitLibrary_0();
      v20[3] = (uint64_t)dlsym(v17, "CKSharingAllowOthersToInviteFromOptionsGroups");
      getCKSharingAllowOthersToInviteFromOptionsGroupsSymbolLoc_ptr = (_UNKNOWN *)v20[3];
      v16 = (uint64_t (*))v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v16) {
      +[SFCollaborationUtilities getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:]();
    }
    uint64_t v18 = v16(v15);
  }
  else
  {
    v15 = share_sheet_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:]();
    }
    uint64_t v10 = 0;
    uint64_t v14 = 0;
    uint64_t v18 = 0;
  }

  *a4 = [NSNumber numberWithInteger:v10];
  *a5 = [NSNumber numberWithInteger:v14];
  *a6 = [NSNumber numberWithBool:v18];
}

+ (id)ckShareDictionaryFromCKShare:(id)a3 setupInfo:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = gelato_sharing_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_INFO, "Creating dictionary from ckShare: %@", buf, 0xCu);
  }

  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v16 = 0;
  id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v16];
  id v10 = v16;
  id v11 = v10;
  if (v9)
  {
    [v8 setValue:v9 forKey:@"share"];
  }
  else if (v10)
  {
    [v8 setObject:v10 forKey:@"shareError"];
  }
  id v15 = v11;
  v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v15];
  id v13 = v15;

  if (v12)
  {
    [v8 setValue:v12 forKey:@"setupInfo"];
  }
  else if (v13)
  {
    [v8 setObject:v13 forKey:@"setupInfoError"];
  }

  return v8;
}

+ (NSString)defaultCKOptionsSummary
{
  v2 = [getCKAllowedSharingOptionsClass() standardOptions];
  id v3 = [v2 shareOptions];
  id v4 = [v3 summary];

  return (NSString *)v4;
}

+ (void)deleteSharingURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = share_sheet_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_1A5389000, v10, OS_LOG_TYPE_DEFAULT, "remove sharingURL:%@ with containerSetupInfo:%@", (uint8_t *)&v11, 0x16u);
  }

  [getCloudSharingClass() removeFromShareURL:v7 containerSetupInfo:v8 completionHandler:v9];
}

+ (void)_loadShareOptionsForCKShareItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 canLoadObjectOfClass:getCKAllowedSharingOptionsClass()])
  {
    id v7 = gelato_sharing_log();
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v5);

    id v9 = gelato_sharing_log();
    id v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A5389000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CollaborationLoadShareOptionsForCKShareItemProvider", "", buf, 2u);
    }

    id CKAllowedSharingOptionsClass = getCKAllowedSharingOptionsClass();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __86__SFCollaborationUtilities__loadShareOptionsForCKShareItemProvider_completionHandler___block_invoke;
    v14[3] = &unk_1E5BBF548;
    os_signpost_id_t v16 = v8;
    id v15 = v6;
    id v12 = (id)[v5 loadObjectOfClass:CKAllowedSharingOptionsClass completionHandler:v14];
  }
  else
  {
    __int16 v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities _loadShareOptionsForCKShareItemProvider:completionHandler:]();
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

void __86__SFCollaborationUtilities__loadShareOptionsForCKShareItemProvider_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (!v7)
  {
    os_signpost_id_t v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __86__SFCollaborationUtilities__loadShareOptionsForCKShareItemProvider_completionHandler___block_invoke_cold_1();
    }
  }
  id v9 = gelato_sharing_log();
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 40);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CollaborationLoadShareOptionsForCKShareItemProvider", "", v14, 2u);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  __int16 v13 = [v7 shareOptions];
  (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v7);
}

+ (void)loadCKShareItemProvider:(id)a3 completionHandler:(id)a4
{
}

+ (void)loadCKShareItemProvider:(id)a3 onlyPostShare:(BOOL)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = gelato_sharing_log();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v7);

  os_signpost_id_t v11 = gelato_sharing_log();
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CollaborationLoadCKShareItemProvider", "", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5BBF570;
  os_signpost_id_t v33 = v10;
  id v13 = v8;
  id v32 = v13;
  id v14 = _Block_copy(aBlock);
  id v15 = get_CKCloudKitPostShareType();
  int v16 = [v7 hasItemConformingToTypeIdentifier:v15];

  if (v16)
  {
    id CKPostSharingContextClass = getCKPostSharingContextClass();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_165;
    v27[3] = &unk_1E5BBF5C0;
    BOOL v30 = a4;
    id v18 = &v28;
    id v19 = v7;
    id v28 = v19;
    id v29 = v14;
    id v20 = (id)[v19 loadObjectOfClass:CKPostSharingContextClass completionHandler:v27];

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v21 = get_CKCloudKitPreShareType();
  int v22 = [v7 hasItemConformingToTypeIdentifier:v21];

  if (v22)
  {
    id CKPreSharingContextClass = getCKPreSharingContextClass();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_167;
    v25[3] = &unk_1E5BBF598;
    id v18 = &v26;
    id v26 = v14;
    id v24 = (id)[v7 loadObjectOfClass:CKPreSharingContextClass completionHandler:v25];
    goto LABEL_8;
  }
LABEL_9:
}

void __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSClassFromString(&cfstr_Cksharingconte.isa);
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 share];
    id v6 = [v4 containerSetupInfo];
  }
  else
  {
    id v6 = 0;
    id v5 = 0;
  }
  id v7 = gelato_sharing_log();
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)os_signpost_id_t v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CollaborationLoadCKShareItemProvider", "", v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_165(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    goto LABEL_7;
  }
  id v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_165_cold_1();
  }

  if (*(unsigned char *)(a1 + 48)
    || (id v8 = *(void **)(a1 + 32),
        get_CKCloudKitPreShareType(),
        os_signpost_id_t v9 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v8) = [v8 hasItemConformingToTypeIdentifier:v9],
        v9,
        !v8))
  {
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    os_signpost_id_t v10 = *(void **)(a1 + 32);
    id CKPreSharingContextClass = getCKPreSharingContextClass();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_166;
    v13[3] = &unk_1E5BBF598;
    id v14 = *(id *)(a1 + 40);
    id v12 = (id)[v10 loadObjectOfClass:CKPreSharingContextClass completionHandler:v13];
  }
}

void __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_166(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_166_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_167(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_166_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_loadCKShareWithMetadataForItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = gelato_sharing_log();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v5);

  os_signpost_id_t v9 = gelato_sharing_log();
  os_signpost_id_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CollaborationLoadCKShareWithMetadataForItemProvider", "", buf, 2u);
  }

  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __86__SFCollaborationUtilities__loadCKShareWithMetadataForItemProvider_completionHandler___block_invoke;
  int v22 = &unk_1E5BBF548;
  id v23 = v6;
  os_signpost_id_t v24 = v8;
  id v11 = v6;
  id v12 = _Block_copy(&v19);
  id v13 = get_CKCloudKitPostShareType();
  int v14 = objc_msgSend(v5, "hasItemConformingToTypeIdentifier:", v13, v19, v20, v21, v22);

  if (v14)
  {
    id CKPostSharingContextClass = getCKPostSharingContextClass();
LABEL_8:
    id v18 = (id)[v5 loadObjectOfClass:CKPostSharingContextClass completionHandler:v12];
    goto LABEL_9;
  }
  int v16 = get_CKCloudKitPreShareType();
  int v17 = [v5 hasItemConformingToTypeIdentifier:v16];

  if (v17)
  {
    id CKPostSharingContextClass = getCKPreSharingContextClass();
    goto LABEL_8;
  }
LABEL_9:
}

void __86__SFCollaborationUtilities__loadCKShareWithMetadataForItemProvider_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_165_cold_1();
    }
  }
  NSClassFromString(&cfstr_Cksharingconte.isa);
  if (objc_opt_isKindOfClass())
  {
    id v8 = v5;
    os_signpost_id_t v9 = [v8 share];
    os_signpost_id_t v10 = [v8 containerSetupInfo];
    id v11 = [v8 allowedOptions];

    id v12 = [v11 shareOptions];
  }
  else
  {
    os_signpost_id_t v9 = 0;
    os_signpost_id_t v10 = 0;
    id v12 = 0;
  }
  id v13 = gelato_sharing_log();
  int v14 = v13;
  os_signpost_id_t v15 = *(void *)(a1 + 40);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)int v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v14, OS_SIGNPOST_INTERVAL_END, v15, "CollaborationLoadCKShareWithMetadataForItemProvider", "", v16, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)loadCKContainerForItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  id v7 = (void *)get_CKCloudKitContainerSetupInfoTypeSymbolLoc_ptr;
  uint64_t v27 = get_CKCloudKitContainerSetupInfoTypeSymbolLoc_ptr;
  if (!get_CKCloudKitContainerSetupInfoTypeSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __get_CKCloudKitContainerSetupInfoTypeSymbolLoc_block_invoke;
    int v22 = &unk_1E5BBBFF8;
    id v23 = &v24;
    id v8 = (void *)CloudKitLibrary_0();
    v25[3] = (uint64_t)dlsym(v8, "_CKCloudKitContainerSetupInfoType");
    get_CKCloudKitContainerSetupInfoTypeSymbolLoc_ptr = *(void *)(v23[1] + 24);
    id v7 = (void *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v7) {
    +[SFCollaborationUtilities loadCKContainerForItemProvider:completionHandler:]();
  }
  if ([v5 hasItemConformingToTypeIdentifier:*v7])
  {
    os_signpost_id_t v9 = gelato_sharing_log();
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v5);

    id v11 = gelato_sharing_log();
    id v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A5389000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CollaborationLoadCKContainerForItemProvider", "", buf, 2u);
    }

    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    id v13 = (void *)getCKContainerSetupInfoClass_softClass_0;
    uint64_t v27 = getCKContainerSetupInfoClass_softClass_0;
    if (!getCKContainerSetupInfoClass_softClass_0)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      uint64_t v21 = __getCKContainerSetupInfoClass_block_invoke_0;
      int v22 = &unk_1E5BBBFF8;
      id v23 = &v24;
      __getCKContainerSetupInfoClass_block_invoke_0((uint64_t)buf);
      id v13 = (void *)v25[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v24, 8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__SFCollaborationUtilities_loadCKContainerForItemProvider_completionHandler___block_invoke;
    v16[3] = &unk_1E5BBF548;
    os_signpost_id_t v18 = v10;
    id v17 = v6;
    id v15 = (id)[v5 loadObjectOfClass:v14 completionHandler:v16];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __77__SFCollaborationUtilities_loadCKContainerForItemProvider_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = gelato_sharing_log();
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v5, OS_SIGNPOST_INTERVAL_END, v6, "CollaborationLoadCKContainerForItemProvider", "", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)isServiceManateeCKShareItemProvider:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__SFCollaborationUtilities_isServiceManateeCKShareItemProvider___block_invoke;
  v9[3] = &unk_1E5BBF5E8;
  id v11 = &v12;
  id v5 = v4;
  os_signpost_id_t v10 = v5;
  +[SFCollaborationUtilities loadCKContainerForItemProvider:v3 completionHandler:v9];
  dispatch_time_t v6 = dispatch_time(0, 200000000);
  dispatch_semaphore_wait(v5, v6);
  char v7 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

intptr_t __64__SFCollaborationUtilities_isServiceManateeCKShareItemProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 containerOptions];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 isServiceManatee];

  dispatch_semaphore_t v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

+ (BOOL)isCollaborationItemPrivateShare:(id)a3
{
  id v3 = [a3 options];
  if ([v3 count])
  {
    BOOL v4 = soft_CKSharingAccessTypeFromOptionsGroups(v3) == 1;
  }
  else
  {
    id v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities isCollaborationItemPrivateShare:]();
    }

    BOOL v4 = 0;
  }

  return v4;
}

+ (id)createLinkMetadataWithCKShareItemProvider:(id)a3
{
  id v4 = a3;
  if ([a1 isPostCKShareItemProvider:v4])
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__7;
    uint64_t v27 = __Block_byref_object_dispose__7;
    id v28 = 0;
    uint64_t v17 = 0;
    os_signpost_id_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__7;
    uint64_t v21 = __Block_byref_object_dispose__7;
    id v22 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__SFCollaborationUtilities_createLinkMetadataWithCKShareItemProvider___block_invoke;
    v13[3] = &unk_1E5BBF610;
    char v15 = &v23;
    int v16 = &v17;
    dispatch_time_t v6 = v5;
    uint64_t v14 = v6;
    [a1 loadCKShareItemProvider:v4 onlyPostShare:1 completionHandler:v13];
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v6, v7);
    uint64_t v8 = v24[5];
    if (v8)
    {
      os_signpost_id_t v9 = +[SFCollaborationUtilities createLinkMetadataWithCKShare:v8 containerSetupInfo:v18[5]];
    }
    else
    {
      os_signpost_id_t v10 = share_sheet_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_1A5389000, v10, OS_LOG_TYPE_DEFAULT, "timed out to load post CKShare to provide metadata.", v12, 2u);
      }

      os_signpost_id_t v9 = 0;
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    os_signpost_id_t v9 = 0;
  }

  return v9;
}

void __70__SFCollaborationUtilities_createLinkMetadataWithCKShareItemProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  os_signpost_id_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)createLinkMetadataWithCKShare:(id)a3 containerSetupInfo:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  uint64_t v7 = (void *)getLPiCloudSharingMetadataClass_softClass;
  uint64_t v43 = getLPiCloudSharingMetadataClass_softClass;
  if (!getLPiCloudSharingMetadataClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __getLPiCloudSharingMetadataClass_block_invoke;
    v45 = &unk_1E5BBBFF8;
    v46 = &v40;
    __getLPiCloudSharingMetadataClass_block_invoke((uint64_t)buf);
    uint64_t v7 = (void *)v41[3];
  }
  uint64_t v8 = v7;
  _Block_object_dispose(&v40, 8);
  id v9 = objc_alloc_init(v8);
  os_signpost_id_t v10 = getCKShareTitleKey();
  id v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, v40);
  [v9 setTitle:v11];

  id v12 = [v6 containerOptions];
  id v13 = [v12 applicationBundleIdentifierOverrideForContainerAccess];

  if ([v13 length])
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v13 allowPlaceholder:1 error:0];
    char v15 = [v14 URL];

    if (v15)
    {
      int v16 = (void *)MEMORY[0x1E4F28B50];
      uint64_t v17 = [v14 URL];
      os_signpost_id_t v18 = [v16 bundleWithURL:v17];

      if (v18)
      {
        uint64_t v19 = [v18 infoDictionary];
        uint64_t v20 = [v19 objectForKeyedSubscript:@"CFBundleDisplayName"];
        [v9 setApplication:v20];
        uint64_t v21 = share_sheet_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v20;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v13;
          _os_log_impl(&dword_1A5389000, v21, OS_LOG_TYPE_DEFAULT, "Setting application to:%@ for bundleIdentifier: %@", buf, 0x16u);
        }

LABEL_16:
        goto LABEL_17;
      }
    }
    else
    {
      id v22 = share_sheet_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        +[SFCollaborationUtilities createLinkMetadataWithCKShare:containerSetupInfo:].cold.5();
      }
    }
    os_signpost_id_t v18 = share_sheet_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities createLinkMetadataWithCKShare:containerSetupInfo:].cold.4(v14);
    }
    goto LABEL_16;
  }
  uint64_t v14 = share_sheet_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    +[SFCollaborationUtilities createLinkMetadataWithCKShare:containerSetupInfo:]();
  }
LABEL_17:

  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v23 = (void *)getCKShareThumbnailImageDataKeySymbolLoc_ptr;
  uint64_t v43 = getCKShareThumbnailImageDataKeySymbolLoc_ptr;
  if (!getCKShareThumbnailImageDataKeySymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __getCKShareThumbnailImageDataKeySymbolLoc_block_invoke;
    v45 = &unk_1E5BBBFF8;
    v46 = &v40;
    uint64_t v24 = (void *)CloudKitLibrary_0();
    uint64_t v25 = dlsym(v24, "CKShareThumbnailImageDataKey");
    *(void *)(v46[1] + 24) = v25;
    getCKShareThumbnailImageDataKeySymbolLoc_ptr = *(void *)(v46[1] + 24);
    uint64_t v23 = (void *)v41[3];
  }
  _Block_object_dispose(&v40, 8);
  if (!v23) {
    +[SFCollaborationUtilities createLinkMetadataWithCKShare:containerSetupInfo:]();
  }
  uint64_t v26 = objc_msgSend(v5, "objectForKeyedSubscript:", *v23, v40);
  if (v26)
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2050000000;
    uint64_t v27 = (void *)getLPImageClass_softClass;
    uint64_t v43 = getLPImageClass_softClass;
    if (!getLPImageClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __getLPImageClass_block_invoke;
      v45 = &unk_1E5BBBFF8;
      v46 = &v40;
      __getLPImageClass_block_invoke((uint64_t)buf);
      uint64_t v27 = (void *)v41[3];
    }
    id v28 = v27;
    _Block_object_dispose(&v40, 8);
    id v29 = [v28 alloc];
    BOOL v30 = objc_msgSend(v29, "initWithData:MIMEType:", v26, @"image/png", v40);
    [v9 setIcon:v30];
LABEL_24:

    goto LABEL_25;
  }
  v39 = share_sheet_log();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl(&dword_1A5389000, v39, OS_LOG_TYPE_DEFAULT, "Falling back to using App Icon for bundleIdentifier:%@", buf, 0xCu);
  }

  if (![v13 length])
  {
    BOOL v30 = share_sheet_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities createLinkMetadataWithCKShare:containerSetupInfo:]();
    }
    goto LABEL_24;
  }
  if ([v13 containsString:@"com.apple."])
  {
    BOOL v30 = share_sheet_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl(&dword_1A5389000, v30, OS_LOG_TYPE_DEFAULT, "Not defaulting an icon for %@. Please file a radar!", buf, 0xCu);
    }
    goto LABEL_24;
  }
LABEL_25:
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  v31 = (void *)getLPSharedObjectMetadataClass_softClass;
  uint64_t v43 = getLPSharedObjectMetadataClass_softClass;
  if (!getLPSharedObjectMetadataClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __getLPSharedObjectMetadataClass_block_invoke;
    v45 = &unk_1E5BBBFF8;
    v46 = &v40;
    __getLPSharedObjectMetadataClass_block_invoke((uint64_t)buf);
    v31 = (void *)v41[3];
  }
  id v32 = v31;
  _Block_object_dispose(&v40, 8);
  id v33 = objc_alloc_init(v32);
  objc_msgSend(v33, "setSpecialization:", v9, v40);
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  v34 = (void *)getLPLinkMetadataClass_softClass;
  uint64_t v43 = getLPLinkMetadataClass_softClass;
  if (!getLPLinkMetadataClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __getLPLinkMetadataClass_block_invoke;
    v45 = &unk_1E5BBBFF8;
    v46 = &v40;
    __getLPLinkMetadataClass_block_invoke((uint64_t)buf);
    v34 = (void *)v41[3];
  }
  v35 = v34;
  _Block_object_dispose(&v40, 8);
  id v36 = objc_alloc_init(v35);
  v37 = objc_msgSend(v5, "URL", v40);
  [v36 setOriginalURL:v37];

  [v36 setSpecialization:v33];

  return v36;
}

+ (id)optionsFromCKShare:(id)a3 previousCKOptions:(id)a4 newCKOptions:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [getCKAllowedSharingOptionsClass() resolvedOptionsFromOptions:v7 forExistingShare:v8];

  if (a5) {
    *a5 = v9;
  }
  os_signpost_id_t v10 = [v9 shareOptions];

  return v10;
}

+ (id)fileShareDictionaryFromFileURLItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = gelato_sharing_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v3;
    _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_INFO, "Creating dictionary from fileURLs: %@", buf, 0xCu);
  }

  if ([v3 count])
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([v3 count])
    {
      [v5 setObject:v3 forKeyedSubscript:@"fileURLs"];
      id v6 = [MEMORY[0x1E4F1CA48] array];
      [v5 setObject:v6 forKeyedSubscript:@"files"];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = v3;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            __64__SFCollaborationUtilities_fileShareDictionaryFromFileURLItems___block_invoke(v8, *(void **)(*((void *)&v13 + 1) + 8 * v11++), v6);
          }
          while (v9 != v11);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
          uint64_t v9 = v8;
        }
        while (v8);
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __64__SFCollaborationUtilities_fileShareDictionaryFromFileURLItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v10 = 0;
  id v6 = [v4 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&v10];
  id v7 = v10;
  if (v6)
  {
    [v5 addObject:v6];
  }
  else
  {
    uint64_t v8 = gelato_sharing_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v4 absoluteString];
      *(_DWORD *)buf = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_INFO, "Failed to create bookmark data for URL: %@ %@", buf, 0x16u);
    }
  }
}

+ (BOOL)isThirdPartyFileProviderBackedURL:(id)a3
{
  id v3 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v4 = (void *)getFPProviderDomainClass_softClass;
  uint64_t v18 = getFPProviderDomainClass_softClass;
  if (!getFPProviderDomainClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getFPProviderDomainClass_block_invoke;
    v14[3] = &unk_1E5BBBFF8;
    void v14[4] = &v15;
    __getFPProviderDomainClass_block_invoke((uint64_t)v14);
    id v4 = (void *)v16[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v15, 8);
  id v13 = 0;
  id v6 = [v5 providerDomainForURL:v3 error:&v13];
  id v7 = v13;
  if (!v6)
  {
    uint64_t v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities isThirdPartyFileProviderBackedURL:]((uint64_t)v3);
    }

    goto LABEL_9;
  }
  uint64_t v8 = [v6 providerID];
  char v9 = [v8 isEqualToString:@"com.apple.FileProvider.LocalStorage"];

  if (v9)
  {
LABEL_9:
    LOBYTE(v10) = 0;
    goto LABEL_10;
  }
  int v10 = [v6 isiCloudDriveProvider] ^ 1;
LABEL_10:

  return v10;
}

+ (BOOL)isSharedFileURL:(id)a3 isLocalStorageFileURL:(BOOL *)a4 isiCloudDriveFileURL:(BOOL *)a5 isInSharedFolder:(BOOL *)a6
{
  id v9 = a3;
  int v10 = [getFPItemManagerClass() defaultManager];
  id v19 = 0;
  uint64_t v11 = [v10 itemForURL:v9 error:&v19];
  id v12 = v19;

  if (!v11)
  {
    id v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities isSharedFileURL:isLocalStorageFileURL:isiCloudDriveFileURL:isInSharedFolder:]((uint64_t)v9);
    }
  }
  if (a4) {
    *a4 = v11 != 0;
  }
  int v14 = [v11 isShared];
  if (a5)
  {
    uint64_t v15 = [v11 itemID];
    long long v16 = [v15 providerID];
    *a5 = objc_msgSend(v16, "fp_isiCloudDriveOrCloudDocsIdentifier");
  }
  if (a6)
  {
    if (v14) {
      char v17 = [v11 isTopLevelSharedItem] ^ 1;
    }
    else {
      char v17 = 0;
    }
    *a6 = v17;
  }

  return v14;
}

+ (id)fileCollaborationItemFromActivityItems:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          if (!objc_msgSend(v9, "type", (void)v11)) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  id v9 = 0;
LABEL_12:

  return v9;
}

+ (id)urlFromActivityItem:(id)a3 allowsLoading:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
LABEL_15:
    id v7 = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
LABEL_4:
    id v7 = v6;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || a4)
      {
        id v6 = [v5 shareItemURL];
        goto LABEL_4;
      }
      int v10 = share_sheet_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_1A5389000, v10, OS_LOG_TYPE_DEFAULT, "Activity item %@ is an item provider, skipping load for URL since we only want placeholder values", (uint8_t *)&v12, 0xCu);
      }
    }
    goto LABEL_15;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  id v9 = v8;
  if (v8 && SFIsStringURLSafelyConvertible(v8)) {
    id v7 = v9;
  }
  else {
    id v7 = 0;
  }

LABEL_18:

  return v7;
}

+ (id)createItemProviderForFileURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = gelato_sharing_log();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, v3);

  id v6 = gelato_sharing_log();
  id v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CollaborationCreateItemProviderForFileURL", "", buf, 2u);
  }

  uint64_t v8 = [v3 pathExtension];
  if (!v8
    || (PreferredIdentifierForTag = (void *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F442E0], v8, 0)) == 0)
  {
    PreferredIdentifierForTag = [(id)*MEMORY[0x1E4F44378] identifier];
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__SFCollaborationUtilities_createItemProviderForFileURL___block_invoke;
  v13[3] = &unk_1E5BBF638;
  id v14 = v3;
  os_signpost_id_t v15 = v5;
  id v11 = v3;
  [v10 registerFileRepresentationForTypeIdentifier:PreferredIdentifierForTag fileOptions:1 visibility:0 loadHandler:v13];

  return v10;
}

uint64_t __57__SFCollaborationUtilities_createItemProviderForFileURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = gelato_sharing_log();
  os_signpost_id_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v5, OS_SIGNPOST_INTERVAL_END, v6, "CollaborationCreateItemProviderForFileURL", "", v8, 2u);
  }

  (*((void (**)(id, void, void, void))v3 + 2))(v3, *(void *)(a1 + 32), 0, 0);
  return 0;
}

+ (void)requestSharedURLForCollaborationItem:(id)a3 collaborationService:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = gelato_sharing_log();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, v7);

  int v12 = gelato_sharing_log();
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CollaborationRequestSharedURLForCollaborationItem", "", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5BBF660;
  os_signpost_id_t v36 = v11;
  id v14 = v9;
  id v35 = v14;
  os_signpost_id_t v15 = _Block_copy(aBlock);
  if (![v7 type])
  {
    id v16 = v7;
    char v17 = [v16 fileURL];
    if ([v16 isiCloudDrive])
    {
      if (v8)
      {
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke_200;
        v32[3] = &unk_1E5BBF688;
        id v33 = v15;
        [v8 requestSharedURLForFileOrFolderURL:v17 completionHandler:v32];
      }
      else
      {
        uint64_t v27 = share_sheet_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          +[SFCollaborationUtilities requestSharedURLForCollaborationItem:collaborationService:completionHandler:]();
        }

        (*((void (**)(void *, void, void))v15 + 2))(v15, 0, 0);
      }
    }
    else
    {
      uint64_t v42 = 0;
      uint64_t v43 = &v42;
      uint64_t v44 = 0x2050000000;
      uint64_t v20 = (void *)get_SWStartCollaborationActionClass_softClass;
      uint64_t v45 = get_SWStartCollaborationActionClass_softClass;
      if (!get_SWStartCollaborationActionClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v38 = 3221225472;
        v39 = __get_SWStartCollaborationActionClass_block_invoke;
        uint64_t v40 = &unk_1E5BBBFF8;
        v41 = &v42;
        __get_SWStartCollaborationActionClass_block_invoke((uint64_t)buf);
        uint64_t v20 = (void *)v43[3];
      }
      id v21 = v20;
      _Block_object_dispose(&v42, 8);
      id v22 = [v16 metadata];
      uint64_t v23 = [v21 actionWithMetadata:v22];

      if (SharedWithYouCoreLibrary())
      {
        uint64_t v24 = (void *)SharedWithYouCoreLibrary();
        if (dlsym(v24, "SWPerformActionForDocumentURL"))
        {
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke_202;
          v30[3] = &unk_1E5BBF6B0;
          id v31 = v15;
          ((void (*)(void *, void *, void *))softLinkSWPerformActionForDocumentURL[0])(v17, v23, v30);
        }
      }
    }
    goto LABEL_29;
  }
  if ([v7 type] == 1)
  {
    id v16 = [v7 itemProvider];
    if (+[SFCollaborationUtilities isPostCKShareItemProvider:v16])
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke_2;
      v28[3] = &unk_1E5BBF6D8;
      id v29 = v15;
      +[SFCollaborationUtilities loadCKShareItemProvider:v16 onlyPostShare:1 completionHandler:v28];
    }
    else
    {
      uint64_t v25 = share_sheet_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[SFCollaborationUtilities requestSharedURLForCollaborationItem:collaborationService:completionHandler:]();
      }

      (*((void (**)(void *, void, void))v15 + 2))(v15, 0, 0);
    }
LABEL_29:

    goto LABEL_30;
  }
  if ([v7 type] == 2)
  {
    uint64_t v18 = [v7 cloudSharingResult];
    id v19 = [v18 sharingURL];

    (*((void (**)(void *, void *, void))v15 + 2))(v15, v19, 0);
  }
  else
  {
    uint64_t v26 = share_sheet_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities requestSharedURLForCollaborationItem:collaborationService:completionHandler:](v7);
    }

    (*((void (**)(void *, void, void))v15 + 2))(v15, 0, 0);
  }
LABEL_30:
}

void __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = gelato_sharing_log();
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)id v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CollaborationRequestSharedURLForCollaborationItem", "", v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke_200(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke_202(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = [v8 url];
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v7, v6);
}

void __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 URL];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, 0);
}

+ (void)requestSharedURLForURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = gelato_sharing_log();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v5);

  os_signpost_id_t v9 = gelato_sharing_log();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CollaborationRequestSharedURLForURL", "", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__SFCollaborationUtilities_requestSharedURLForURL_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5BBF660;
  id v18 = v6;
  os_signpost_id_t v19 = v8;
  id v11 = v6;
  int v12 = _Block_copy(aBlock);
  id CloudSharingClass = getCloudSharingClass();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__SFCollaborationUtilities_requestSharedURLForURL_completionHandler___block_invoke_204;
  v15[3] = &unk_1E5BBF700;
  id v16 = v12;
  id v14 = v12;
  [CloudSharingClass existingShareForFileOrFolderURL:v5 completionHandler:v15];
}

void __69__SFCollaborationUtilities_requestSharedURLForURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = gelato_sharing_log();
  os_signpost_id_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)id v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CollaborationRequestSharedURLForURL", "", v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__SFCollaborationUtilities_requestSharedURLForURL_completionHandler___block_invoke_204(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)findOriginatingSharedItemForSubitemURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = [getFPItemManagerClass() defaultManager];
  id v20 = 0;
  os_signpost_id_t v9 = [v8 itemForURL:v6 error:&v20];
  id v10 = v20;

  if (v9)
  {
    id location = 0;
    objc_initWeak(&location, a1);
    id v11 = [getFPItemManagerClass() defaultManager];
    int v12 = [v9 itemID];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__SFCollaborationUtilities_findOriginatingSharedItemForSubitemURL_completionHandler___block_invoke;
    v14[3] = &unk_1E5BBF728;
    id v15 = v6;
    id v17 = v7;
    objc_copyWeak(&v18, &location);
    id v16 = v9;
    [v11 fetchParentsForItemID:v12 recursively:1 completionHandler:v14];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    id v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities isSharedFileURL:isLocalStorageFileURL:isiCloudDriveFileURL:isInSharedFolder:]((uint64_t)v6);
    }

    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v10);
  }
}

void __85__SFCollaborationUtilities_findOriginatingSharedItemForSubitemURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _findOriginatingSharedItemInParentItems:v5 forSubitem:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    os_signpost_id_t v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __85__SFCollaborationUtilities_findOriginatingSharedItemForSubitemURL_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

+ (void)_findOriginatingSharedItemInParentItems:(id)a3 forSubitem:(id)a4 completionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  os_signpost_id_t v9 = (void (**)(id, void *, void))a5;
  id v10 = v8;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v22;
    id v15 = v10;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v7);
        }
        id v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v17 isShared])
        {
          id v18 = v17;
          os_signpost_id_t v19 = v15;
          id v15 = v18;
        }
        else
        {
          uint64_t v20 = [v15 fileURL];
          os_signpost_id_t v19 = v13;
          id v13 = (void *)v20;
        }
      }
      uint64_t v12 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
  else
  {
    id v13 = 0;
    id v15 = v10;
  }
  v9[2](v9, v13, 0);
}

+ (BOOL)hasiWorkSendCopyRepresentationForItemProvider:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[SFCollaborationUtilities _copyRepresentationTypeIdentifier];
  if (v4) {
    char v5 = [v3 hasItemConformingToTypeIdentifier:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (void)loadiWorkCopyRepresentationURLForItemProvider:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (+[SFCollaborationUtilities hasiWorkSendCopyRepresentationForItemProvider:v5])
  {
    id v7 = gelato_sharing_log();
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v5);

    os_signpost_id_t v9 = gelato_sharing_log();
    id v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A5389000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SendCopyRepresentationLoadForItemProvider", "", buf, 2u);
    }

    uint64_t v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_1A5389000, v11, OS_LOG_TYPE_DEFAULT, "Loading send copy representation for item provider %@", buf, 0xCu);
    }

    uint64_t v12 = +[SFCollaborationUtilities _copyRepresentationTypeIdentifier];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke;
    v14[3] = &unk_1E5BBF778;
    os_signpost_id_t v16 = v8;
    id v15 = v6;
    id v13 = (id)[v5 loadInPlaceFileRepresentationForTypeIdentifier:v12 completionHandler:v14];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

void __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (v7)
  {
    if ((a3 & 1) == 0)
    {
      os_signpost_id_t v9 = share_sheet_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v7;
        _os_log_impl(&dword_1A5389000, v9, OS_LOG_TYPE_DEFAULT, "Send copy representation was not loaded in place. Current URL: %@", buf, 0xCu);
      }
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke_207;
    v17[3] = &unk_1E5BBF750;
    id v10 = v7;
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v18 = v10;
    uint64_t v20 = v11;
    id v19 = v12;
    [v10 coordinateReadingWithSaveToTempDir:1 options:8 completionHandler:v17];
  }
  else
  {
    id v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke_cold_1();
    }

    uint64_t v14 = gelato_sharing_log();
    id v15 = v14;
    os_signpost_id_t v16 = *(void *)(a1 + 40);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A5389000, v15, OS_SIGNPOST_INTERVAL_END, v16, "SendCopyRepresentationLoadForItemProvider", "", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke_207(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (!v5)
  {
    id v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke_207_cold_1();
    }

    id v7 = (void *)a1[4];
  }
  id v9 = v7;
  id v10 = share_sheet_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v9;
    _os_log_impl(&dword_1A5389000, v10, OS_LOG_TYPE_DEFAULT, "Loaded send copy representation at URL %@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v11 = gelato_sharing_log();
  uint64_t v12 = v11;
  os_signpost_id_t v13 = a1[6];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v12, OS_SIGNPOST_INTERVAL_END, v13, "SendCopyRepresentationLoadForItemProvider", "", (uint8_t *)&v14, 2u);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

+ (NSString)_copyRepresentationTypeIdentifier
{
  uint64_t v2 = (void *)_copyRepresentationTypeIdentifier_copyRepresentationTypeIdentifier;
  if (_copyRepresentationTypeIdentifier_copyRepresentationTypeIdentifier) {
    return (NSString *)[v2 copy];
  }
  if (SharedWithYouCoreLibrary())
  {
    id v3 = (void *)SharedWithYouCoreLibrary();
    if (dlsym(v3, "SWCopyRepresentationTypeIdentifier"))
    {
      uint64_t v10 = 0;
      uint64_t v11 = &v10;
      uint64_t v12 = 0x2020000000;
      uint64_t v4 = (id *)getSWCopyRepresentationTypeIdentifierSymbolLoc_ptr;
      uint64_t v13 = getSWCopyRepresentationTypeIdentifierSymbolLoc_ptr;
      if (!getSWCopyRepresentationTypeIdentifierSymbolLoc_ptr)
      {
        id v5 = (void *)SharedWithYouCoreLibrary();
        v11[3] = (uint64_t)dlsym(v5, "SWCopyRepresentationTypeIdentifier");
        getSWCopyRepresentationTypeIdentifierSymbolLoc_ptr = v11[3];
        uint64_t v4 = (id *)v11[3];
      }
      _Block_object_dispose(&v10, 8);
      if (!v4) {
        +[SFCollaborationUtilities _copyRepresentationTypeIdentifier]();
      }
LABEL_13:
      objc_storeStrong((id *)&_copyRepresentationTypeIdentifier_copyRepresentationTypeIdentifier, *v4);
      goto LABEL_14;
    }
  }
  if (SharedWithYouCoreLibrary())
  {
    id v6 = (void *)SharedWithYouCoreLibrary();
    if (dlsym(v6, "UTCopyRepresentationTypeIdentifier"))
    {
      uint64_t v10 = 0;
      uint64_t v11 = &v10;
      uint64_t v12 = 0x2020000000;
      uint64_t v4 = (id *)getUTCopyRepresentationTypeIdentifierSymbolLoc_ptr;
      uint64_t v13 = getUTCopyRepresentationTypeIdentifierSymbolLoc_ptr;
      if (!getUTCopyRepresentationTypeIdentifierSymbolLoc_ptr)
      {
        id v7 = (void *)SharedWithYouCoreLibrary();
        v11[3] = (uint64_t)dlsym(v7, "UTCopyRepresentationTypeIdentifier");
        getUTCopyRepresentationTypeIdentifierSymbolLoc_ptr = v11[3];
        uint64_t v4 = (id *)v11[3];
      }
      _Block_object_dispose(&v10, 8);
      if (!v4) {
        +[SFCollaborationUtilities _copyRepresentationTypeIdentifier]();
      }
      goto LABEL_13;
    }
  }
LABEL_14:
  uint64_t v2 = (void *)_copyRepresentationTypeIdentifier_copyRepresentationTypeIdentifier;
  if (!_copyRepresentationTypeIdentifier_copyRepresentationTypeIdentifier)
  {
    id v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities _copyRepresentationTypeIdentifier]();
    }

    uint64_t v2 = (void *)_copyRepresentationTypeIdentifier_copyRepresentationTypeIdentifier;
  }
  return (NSString *)[v2 copy];
}

+ (BOOL)isSWYActivityItemProvider:(id)a3
{
  id v3 = a3;
  uint64_t v4 = get_SWPendingCollaborationTypeIdentifier();
  char v5 = [v3 hasItemConformingToTypeIdentifier:v4];

  return v5;
}

+ (void)_loadShareOptionsForSWYItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = getUTCollaborationOptionsTypeIdentifier();
  int v8 = [v5 hasItemConformingToTypeIdentifier:v7];

  if (v8)
  {
    id v9 = gelato_sharing_log();
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v5);

    uint64_t v11 = gelato_sharing_log();
    uint64_t v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A5389000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CollaborationLoadShareOptionsForSWYItemProvider", "", buf, 2u);
    }

    uint64_t v13 = getUTCollaborationOptionsTypeIdentifier();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke;
    v25[3] = &unk_1E5BBF7A0;
    os_signpost_id_t v27 = v10;
    id v26 = v6;
    [v5 loadItemForTypeIdentifier:v13 options:0 completionHandler:v25];

    int v14 = v26;
LABEL_11:

    goto LABEL_15;
  }
  id v15 = get_SWPendingCollaborationTypeIdentifier();
  int v16 = [v5 hasItemConformingToTypeIdentifier:v15];

  if (v16)
  {
    id v17 = gelato_sharing_log();
    os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, v5);

    id v19 = gelato_sharing_log();
    uint64_t v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A5389000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "CollaborationLoadShareOptionsForSWYItemProvider", "", buf, 2u);
    }

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke_212;
    v22[3] = &unk_1E5BBF7C8;
    os_signpost_id_t v24 = v18;
    id v23 = v6;
    +[SFCollaborationUtilities loadPendingCollaborationForItemProvider:v5 completionHandler:v22];
    int v14 = v23;
    goto LABEL_11;
  }
  long long v21 = share_sheet_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    +[SFCollaborationUtilities _loadShareOptionsForSWYItemProvider:completionHandler:]();
  }

  (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
LABEL_15:
}

void __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (!v7)
  {
    int v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke_cold_1();
    }
  }
  id v9 = gelato_sharing_log();
  os_signpost_id_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 40);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CollaborationLoadShareOptionsForSWYItemProvider", "", v12, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke_212(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 collaborationMetadata];
  id v5 = [v4 defaultShareOptions];

  if (!v5)
  {
    id v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke_212_cold_1(v3);
    }
  }
  id v7 = gelato_sharing_log();
  int v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)os_signpost_id_t v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CollaborationLoadShareOptionsForSWYItemProvider", "", v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)loadSendCopyRepresentationIfNeededForItemProvider:(id)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!+[SFCollaborationUtilities hasiWorkSendCopyRepresentationForItemProvider:v5])
  {
    if (+[SFCollaborationUtilities isCKShareItemProvider:](SFCollaborationUtilities, "isCKShareItemProvider:", v5)|| +[SFCollaborationUtilities isSWYActivityItemProvider:v5])
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v7 = [v5 registeredTypeIdentifiers];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v37;
        uint64_t v11 = *MEMORY[0x1E4F44470];
        uint64_t v12 = *MEMORY[0x1E4F44408];
LABEL_7:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v7);
          }
          int v14 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(*((void *)&v36 + 1) + 8 * v13)];
          if (([v14 conformsToType:v11] & 1) != 0
            || ([v14 conformsToType:v12] & 1) != 0)
          {
            break;
          }

          if (v9 == ++v13)
          {
            uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v9) {
              goto LABEL_7;
            }
            goto LABEL_14;
          }
        }

        if (!v14) {
          goto LABEL_19;
        }
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_215;
        aBlock[3] = &unk_1E5BBF7F0;
        id v15 = v6;
        id v35 = v15;
        int v16 = _Block_copy(aBlock);
        if ([v14 conformsToType:v11])
        {
          if ([v5 canLoadObjectOfClass:objc_opt_class()])
          {
            uint64_t v17 = objc_opt_class();
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_218;
            v32[3] = &unk_1E5BBF818;
            os_signpost_id_t v18 = &v33;
            id v33 = v16;
            id v19 = v32;
          }
          else
          {
            if (![v5 canLoadObjectOfClass:objc_opt_class()])
            {
              os_signpost_id_t v24 = [v14 identifier];
              v28[0] = MEMORY[0x1E4F143A8];
              v28[1] = 3221225472;
              v28[2] = __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_3;
              v28[3] = &unk_1E5BBF868;
              os_signpost_id_t v18 = &v29;
              id v29 = v16;
              [v5 loadItemForTypeIdentifier:v24 options:0 completionHandler:v28];

              goto LABEL_28;
            }
            uint64_t v17 = objc_opt_class();
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_2;
            v30[3] = &unk_1E5BBF840;
            os_signpost_id_t v18 = &v31;
            id v31 = v16;
            id v19 = v30;
          }
          id v23 = (id)[v5 loadObjectOfClass:v17 completionHandler:v19];
        }
        else
        {
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_4;
          v25[3] = &unk_1E5BBF8B8;
          os_signpost_id_t v18 = &v26;
          id v26 = v16;
          id v27 = v15;
          id v22 = (id)[v5 loadFileRepresentationForContentType:v14 openInPlace:0 completionHandler:v25];
        }
LABEL_28:

        goto LABEL_29;
      }
LABEL_14:

LABEL_19:
      uint64_t v20 = share_sheet_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        long long v21 = [v5 registeredTypeIdentifiers];
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v21;
        _os_log_impl(&dword_1A5389000, v20, OS_LOG_TYPE_DEFAULT, "Could not find send copy type in item provider with type identifiers: %@", buf, 0xCu);
      }
    }
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    goto LABEL_29;
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke;
  v40[3] = &unk_1E5BBF688;
  id v41 = v6;
  +[SFCollaborationUtilities loadiWorkCopyRepresentationURLForItemProvider:v5 completionHandler:v40];

LABEL_29:
}

uint64_t __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_215(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_215_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_218(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_4(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_5;
    v7[3] = &unk_1E5BBF890;
    id v8 = v5;
    id v9 = *(id *)(a1 + 40);
    [v8 coordinateReadingWithSaveToTempDir:a3 ^ 1u completionHandler:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke_207_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)loadSendCopyRepresentationIfNeededForActivityItems:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[v6 mutableCopy];
  id v8 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v9 = [v6 count];

  uint64_t v10 = [v8 arrayWithCapacity:v9];
  uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v12 = dispatch_queue_create("com.apple.sharing.collaborationUtilities.loadItems", v11);

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForActivityItems_completion___block_invoke;
  v17[3] = &unk_1E5BBCDE0;
  id v18 = v7;
  id v19 = v10;
  dispatch_queue_t v20 = v12;
  id v21 = v5;
  id v13 = v5;
  int v14 = v12;
  id v15 = v10;
  id v16 = v7;
  dispatch_async(v14, v17);
}

uint64_t __90__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForActivityItems_completion___block_invoke(void *a1)
{
  return +[SFCollaborationUtilities _processRemainingActivityItems:a1[4] toFinalActivityItems:a1[5] onQueue:a1[6] completion:a1[7]];
}

+ (void)_processRemainingActivityItems:(id)a3 toFinalActivityItems:(id)a4 onQueue:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v9 firstObject];
  if (v13)
  {
    int v14 = (void *)v13;
    while (1)
    {
      [v9 removeObjectAtIndex:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      [v10 addObject:v14];
      uint64_t v15 = [v9 firstObject];

      int v14 = (void *)v15;
      if (!v15) {
        goto LABEL_5;
      }
    }
    id v17 = v14;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke;
    v22[3] = &unk_1E5BBF908;
    id v23 = v11;
    id v24 = v10;
    id v25 = v17;
    id v26 = v9;
    id v27 = v12;
    id v18 = v12;
    id v16 = v10;
    +[SFCollaborationUtilities loadSendCopyRepresentationIfNeededForItemProvider:v17 completion:v22];
  }
  else
  {
LABEL_5:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke_224;
    block[3] = &unk_1E5BBC9C8;
    id v20 = v10;
    id v21 = v12;
    id v16 = v12;
    id v17 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v18 = v21;
  }
}

void __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke_2;
  v6[3] = &unk_1E5BBF8E0;
  id v7 = v3;
  uint64_t v4 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v11 = a1[4];
  id v12 = a1[8];
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke_2(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  if (v3)
  {
    objc_msgSend(v2, "addObject:");
  }
  else
  {
    [v2 addObject:a1[6]];
    uint64_t v4 = share_sheet_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke_2_cold_1((uint64_t)(a1 + 6), v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return +[SFCollaborationUtilities _processRemainingActivityItems:a1[7] toFinalActivityItems:a1[5] onQueue:a1[8] completion:a1[9]];
}

uint64_t __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke_224(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)loadShareOptionsForItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[SFCollaborationUtilities isSWYActivityItemProvider:v5])
  {
    +[SFCollaborationUtilities _loadShareOptionsForSWYItemProvider:v5 completionHandler:v6];
  }
  else if (+[SFCollaborationUtilities isCKShareItemProvider:v5])
  {
    +[SFCollaborationUtilities _loadShareOptionsForCKShareItemProvider:v5 completionHandler:v6];
  }
  else
  {
    uint64_t v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities loadShareOptionsForItemProvider:completionHandler:]();
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

+ (BOOL)isHeroCollaborationActivityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.UIKit.activity.Message"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"com.apple.InCallService.ShareExtension"];
  }

  return v4;
}

+ (void)loadMetadataForItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__7;
  id v21 = __Block_byref_object_dispose__7;
  id v22 = 0;
  if (+[SFCollaborationUtilities isCKShareItemProvider:v5])
  {
    uint64_t v7 = gelato_sharing_log();
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v5);

    uint64_t v9 = gelato_sharing_log();
    uint64_t v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A5389000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CollaborationLoadMetadataForItemProvider", "", buf, 2u);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke;
    v12[3] = &unk_1E5BBF930;
    int v14 = &v17;
    os_signpost_id_t v15 = v8;
    id v13 = v6;
    +[SFCollaborationUtilities _loadCKShareWithMetadataForItemProvider:v5 completionHandler:v12];
  }
  else
  {
    id v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities loadMetadataForItemProvider:completionHandler:]();
    }

    (*((void (**)(id, uint64_t))v6 + 2))(v6, v18[5]);
  }
  _Block_object_dispose(&v17, 8);
}

void __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v7 URL];
  id v11 = [v10 absoluteString];

  id v12 = [v7 URL];
  id v13 = [v12 fragment];

  if (v13
    && ([NSString stringWithFormat:@"#%@", v13],
        int v14 = objc_claimAutoreleasedReturnValue(),
        [v11 stringByReplacingOccurrencesOfString:v14 withString:&stru_1EF9BDC68],
        os_signpost_id_t v15 = objc_claimAutoreleasedReturnValue(),
        v14,
        v15))
  {
    id v16 = getCKShareTitleKey();
    uint64_t v17 = [v7 objectForKeyedSubscript:v16];

    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x2020000000;
    id v18 = (void *)getCKShareTypeKeySymbolLoc_ptr;
    uint64_t v43 = getCKShareTypeKeySymbolLoc_ptr;
    if (!getCKShareTypeKeySymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      long long v37 = __getCKShareTypeKeySymbolLoc_block_invoke;
      long long v38 = &unk_1E5BBBFF8;
      long long v39 = &v40;
      uint64_t v19 = (void *)CloudKitLibrary_0();
      v41[3] = (uint64_t)dlsym(v19, "CKShareTypeKey");
      getCKShareTypeKeySymbolLoc_ptr = *(void *)(v39[1] + 24);
      id v18 = (void *)v41[3];
    }
    _Block_object_dispose(&v40, 8);
    if (!v18) {
      __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke_cold_2();
    }
    id v33 = (void *)v17;
    id v34 = v8;
    id v20 = [v7 objectForKeyedSubscript:*v18];
    if (v20)
    {
      id v21 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v20];
    }
    else
    {
      id v21 = 0;
    }
    id v22 = [v9 optionsGroups];
    uint64_t v23 = [v22 count];

    if (!v23)
    {
      id v24 = share_sheet_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke_cold_3();
      }
    }
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x2050000000;
    id v25 = (void *)get_SWCollaborationMetadataClass_softClass;
    uint64_t v43 = get_SWCollaborationMetadataClass_softClass;
    if (!get_SWCollaborationMetadataClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      long long v37 = __get_SWCollaborationMetadataClass_block_invoke;
      long long v38 = &unk_1E5BBBFF8;
      long long v39 = &v40;
      __get_SWCollaborationMetadataClass_block_invoke((uint64_t)buf);
      id v25 = (void *)v41[3];
    }
    id v26 = v25;
    _Block_object_dispose(&v40, 8);
    uint64_t v27 = [[v26 alloc] initWithCollaborationIdentifier:v15 title:v33 defaultShareOptions:v9 creationDate:0 contentType:v21 initiatorHandle:0 initiatorNameComponents:0];
    uint64_t v28 = *(void *)(a1[5] + 8);
    id v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    id v8 = v34;
  }
  else
  {
    os_signpost_id_t v15 = share_sheet_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke_cold_1(v7);
    }
  }

  BOOL v30 = gelato_sharing_log();
  id v31 = v30;
  os_signpost_id_t v32 = a1[6];
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v31, OS_SIGNPOST_INTERVAL_END, v32, "CollaborationLoadMetadataForItemProvider", "", buf, 2u);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)loadPendingCollaborationForItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[SFCollaborationUtilities isSWYActivityItemProvider:v5])
  {
    id v7 = gelato_sharing_log();
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v5);

    id v9 = gelato_sharing_log();
    uint64_t v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A5389000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CollaborationLoadPendingForItemProvider", "", buf, 2u);
    }

    id v11 = get_SWPendingCollaborationTypeIdentifier();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__SFCollaborationUtilities_loadPendingCollaborationForItemProvider_completionHandler___block_invoke;
    v12[3] = &unk_1E5BBF958;
    os_signpost_id_t v14 = v8;
    id v13 = v6;
    [v5 loadItemForTypeIdentifier:v11 options:0 completionHandler:v12];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __86__SFCollaborationUtilities_loadPendingCollaborationForItemProvider_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = gelato_sharing_log();
  os_signpost_id_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CollaborationLoadPendingForItemProvider", "", (uint8_t *)&v12, 2u);
  }

  uint64_t v10 = share_sheet_log();
  id v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1A5389000, v11, OS_LOG_TYPE_DEFAULT, "Loaded pending collaboration: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __86__SFCollaborationUtilities_loadPendingCollaborationForItemProvider_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)loadMetadataForFileURL:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"SFCollaborationUtilities.m" lineNumber:1255 description:@"fileURL is nil."];
  }
  os_signpost_id_t v9 = [[SFCollaborationFileMetadataLoader alloc] initWithFileURL:v7];
  uint64_t v10 = gelato_sharing_log();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, v7);

  int v12 = gelato_sharing_log();
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CollaborationLoadMetadataForFileURL", "", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__SFCollaborationUtilities_loadMetadataForFileURL_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5BBF980;
  id v20 = v8;
  os_signpost_id_t v21 = v11;
  uint64_t v19 = v9;
  id v14 = v8;
  os_signpost_id_t v15 = v9;
  id v16 = _Block_copy(aBlock);
  [MEMORY[0x1E4F28CA0] addFilePresenter:v15];
  [(SFCollaborationFileMetadataLoader *)v15 loadMetadataWithCompletionHandler:v16];
}

void __69__SFCollaborationUtilities_loadMetadataForFileURL_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = gelato_sharing_log();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CollaborationLoadMetadataForFileURL", "", v10, 2u);
  }

  [MEMORY[0x1E4F28CA0] removeFilePresenter:a1[4]];
  (*(void (**)(void))(a1[5] + 16))();
}

+ (void)addParticipantsAllowedForCollaborationItem:(id)a3 collaborationService:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  if ([v8 type] != 1)
  {
    if (![v8 type])
    {
      os_signpost_id_t v15 = [v8 fileURL];
      [a1 _addParticipantsAllowedForURL:v15 share:0 collaborationService:v9 completionHandler:v10];

      goto LABEL_10;
    }
    id v14 = share_sheet_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A5389000, v14, OS_LOG_TYPE_DEFAULT, "SWY add participants allowed check is not supported", (uint8_t *)location, 2u);
    }

    goto LABEL_8;
  }
  os_signpost_id_t v11 = [v8 itemProvider];
  BOOL v12 = +[SFCollaborationUtilities isPostCKShareItemProvider:v11];

  if (!v12)
  {
LABEL_8:
    v10[2](v10, 1, 0);
    goto LABEL_10;
  }
  location[0] = 0;
  objc_initWeak(location, a1);
  id v13 = [v8 itemProvider];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __110__SFCollaborationUtilities_addParticipantsAllowedForCollaborationItem_collaborationService_completionHandler___block_invoke;
  v16[3] = &unk_1E5BBF9A8;
  id v18 = v10;
  objc_copyWeak(&v19, location);
  id v17 = v9;
  +[SFCollaborationUtilities loadCKShareItemProvider:v13 onlyPostShare:1 completionHandler:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(location);
LABEL_10:
}

void __110__SFCollaborationUtilities_addParticipantsAllowedForCollaborationItem_collaborationService_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _addParticipantsAllowedForURL:0 share:v4 collaborationService:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (void)addParticipantsAllowedForURL:(id)a3 share:(id)a4 completionHandler:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  if (v8 | v9)
  {
    if (v8)
    {
      id location = 0;
      objc_initWeak(&location, a1);
      id CloudSharingClass = getCloudSharingClass();
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __81__SFCollaborationUtilities_addParticipantsAllowedForURL_share_completionHandler___block_invoke;
      v16[3] = &unk_1E5BBF9D0;
      id v17 = v10;
      objc_copyWeak(&v18, &location);
      [CloudSharingClass existingShareForFileOrFolderURL:v8 completionHandler:v16];
      objc_destroyWeak(&v18);

      objc_destroyWeak(&location);
    }
    else
    {
      [a1 _addParticipantsAllowedForShare:v9 completionHandler:v10];
    }
  }
  else
  {
    BOOL v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"Called _addParticipantsAllowedForURL:share:completionHandler: with nil URL and nil CKShare";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v14 = [v12 errorWithDomain:@"com.apple.sharesheet.addParticipantsAllowed" code:0 userInfo:v13];

    os_signpost_id_t v15 = share_sheet_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities addParticipantsAllowedForURL:share:completionHandler:](v14);
    }

    (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 1, v14);
  }
}

void __81__SFCollaborationUtilities_addParticipantsAllowedForURL_share_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v15 = a2;
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = v8;
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _addParticipantsAllowedForShare:v7 completionHandler:*(void *)(a1 + 32)];

    goto LABEL_10;
  }
  if (!v8) {
    goto LABEL_6;
  }
  os_signpost_id_t v11 = [v8 domain];
  BOOL v12 = getCKErrorDomain();
  if (([v11 isEqualToString:v12] & 1) == 0)
  {

    goto LABEL_8;
  }
  uint64_t v13 = [v9 code];

  if (v13 != 12)
  {
LABEL_8:
    id v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_9;
  }
LABEL_6:
  id v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_9:
  v14();
LABEL_10:
}

+ (void)_addParticipantsAllowedForURL:(id)a3 share:(id)a4 collaborationService:(id)a5 completionHandler:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  id v11 = a5;
  BOOL v12 = (void (**)(id, uint64_t, void *))a6;
  if (!(v9 | v10))
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = @"Called _addParticipantsAllowedForURL:share:collaborationService:completionHandler: with nil URL and nil CKShare";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v15 = [v13 errorWithDomain:@"com.apple.sharesheet.addParticipantsAllowed" code:0 userInfo:v14];

    id v16 = share_sheet_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities _addParticipantsAllowedForURL:share:collaborationService:completionHandler:](v15);
    }
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v20 = @"requestAddParticipantsAllowedForURL:share:completionHandler: has not yet been implemented";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v15 = [v17 errorWithDomain:@"com.apple.sharesheet.addParticipantsAllowed" code:0 userInfo:v18];

    id v16 = share_sheet_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities _addParticipantsAllowedForURL:share:collaborationService:completionHandler:](v15);
    }
LABEL_8:

    v12[2](v12, 1, v15);
    goto LABEL_9;
  }
  [v11 requestAddParticipantsAllowedForURL:v9 share:v10 completionHandler:v12];
LABEL_9:
}

+ (void)_addParticipantsAllowedForShare:(id)a3 completionHandler:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id CloudSharingClass = getCloudSharingClass();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__SFCollaborationUtilities__addParticipantsAllowedForShare_completionHandler___block_invoke;
    v12[3] = &unk_1E5BBF9F8;
    id v13 = v6;
    [CloudSharingClass sharingStatusForShare:v5 completionHandler:v12];
    id v8 = v13;
  }
  else
  {
    unint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @"Called _addParticipantsAllowedForShare:completionHandler: with nil CKShare";
    unint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v8 = [v9 errorWithDomain:@"com.apple.sharesheet.addParticipantsAllowed" code:0 userInfo:v10];

    id v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities _addParticipantsAllowedForURL:share:collaborationService:completionHandler:](v8);
    }

    (*((void (**)(id, uint64_t, void *))v6 + 2))(v6, 1, v8);
  }
}

void __78__SFCollaborationUtilities__addParticipantsAllowedForShare_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_dataForFilepath:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
    if ([v4 isFileURL])
    {
      id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (void)canShowShareOptionsForCollaborationItem:(id)a3 service:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [v7 itemProvider];
  BOOL v11 = +[SFCollaborationUtilities isPostCKShareItemProvider:v10];

  if ([v7 type])
  {
    if (v11)
    {
      BOOL v12 = [v7 itemProvider];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_3;
      v15[3] = &unk_1E5BBF6D8;
      id v16 = v9;
      +[SFCollaborationUtilities loadCKShareItemProvider:v12 onlyPostShare:1 completionHandler:v15];
    }
    else
    {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    }
  }
  else
  {
    id v13 = v7;
    if ([v13 isShared])
    {
      uint64_t v14 = [v13 fileURL];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke;
      v17[3] = &unk_1E5BBFA48;
      id v18 = v9;
      [v8 isShareOwnerOrAdminForFileURL:v14 completionHandler:v17];
    }
    else
    {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    }
  }
}

void __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_2;
  v3[3] = &unk_1E5BBFA20;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_4;
  v3[3] = &unk_1E5BBFA48;
  id v4 = *(id *)(a1 + 32);
  +[SFCollaborationUtilities isShareOwnerOrAdminForShare:a2 completionHandler:v3];
}

void __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_4(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_5;
  v3[3] = &unk_1E5BBFA20;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (void)isShareOwnerOrAdminForCollaborationItem:(id)a3 service:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 type])
  {
    unint64_t v10 = [v7 itemProvider];
    BOOL v11 = +[SFCollaborationUtilities isPostCKShareItemProvider:v10];

    if (v11)
    {
      BOOL v12 = [v7 itemProvider];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_3;
      v15[3] = &unk_1E5BBF6D8;
      id v16 = v9;
      +[SFCollaborationUtilities loadCKShareItemProvider:v12 onlyPostShare:1 completionHandler:v15];
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
    }
  }
  else
  {
    id v13 = v7;
    if [v13 isShared] && (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [v13 fileURL];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke;
      v17[3] = &unk_1E5BBFA48;
      id v18 = v9;
      [v8 isShareOwnerOrAdminForFileURL:v14 completionHandler:v17];
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
    }
  }
}

void __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke(uint64_t a1, char a2, char a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5BBFA70;
  id v6 = *(id *)(a1 + 32);
  char v7 = a2;
  char v8 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

void __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_4;
  v3[3] = &unk_1E5BBFA48;
  id v4 = *(id *)(a1 + 32);
  +[SFCollaborationUtilities isShareOwnerOrAdminForShare:a2 completionHandler:v3];
}

void __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_4(uint64_t a1, char a2, char a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_5;
  v5[3] = &unk_1E5BBFA70;
  id v6 = *(id *)(a1 + 32);
  char v7 = a2;
  char v8 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

+ (void)isShareOwnerOrAdminForFileURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id CloudSharingClass = getCloudSharingClass();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__SFCollaborationUtilities_isShareOwnerOrAdminForFileURL_completionHandler___block_invoke;
    v9[3] = &unk_1E5BBFA98;
    id v10 = v5;
    id v11 = v6;
    [CloudSharingClass existingShareForFileOrFolderURL:v10 completionHandler:v9];
  }
  else
  {
    char v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities isShareOwnerOrAdminForFileURL:completionHandler:]();
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

void __76__SFCollaborationUtilities_isShareOwnerOrAdminForFileURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    char v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __76__SFCollaborationUtilities_isShareOwnerOrAdminForFileURL_completionHandler___block_invoke_cold_1();
    }
  }
  +[SFCollaborationUtilities isShareOwnerOrAdminForShare:v6 completionHandler:*(void *)(a1 + 40)];
}

+ (void)isShareOwnerOrAdminForShare:(id)a3 completionHandler:(id)a4
{
  id v12 = a3;
  id v5 = (void (**)(id, uint64_t, void))a4;
  id v6 = v12;
  if (!v12)
  {
    v5[2](v5, 1, 0);
    id v6 = 0;
  }
  id v7 = [v6 currentUserParticipant];
  uint64_t v8 = [v7 role];

  LODWORD(v9) = [v12 publicPermission] == 2 || objc_msgSend(v12, "publicPermission") == 3;
  BOOL v10 = v8 == 1;
  id v11 = [v12 currentUserParticipant];
  if ([v11 role] == 2) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v9;
  }

  v5[2](v5, v10, v9);
}

+ (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = gelato_sharing_log();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v5);

  uint64_t v9 = gelato_sharing_log();
  BOOL v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CollaborationCreateSharingURL", "", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5BBFAC0;
  os_signpost_id_t v62 = v8;
  id v11 = v6;
  id v61 = v11;
  id v12 = _Block_copy(aBlock);
  id v13 = [v5 fileOrFolderURL];

  if (v13)
  {
    id CloudSharingClass = getCloudSharingClass();
    id v15 = [v5 fileOrFolderURL];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_265;
    v57[3] = &unk_1E5BBFB10;
    v58 = (SFCollaborationCloudSharingResult *)v5;
    id v59 = v12;
    [CloudSharingClass sharingStatusForFileOrFolderURL:v15 completionHandler:v57];

    id v16 = v58;
    goto LABEL_6;
  }
  id v17 = [v5 share];

  if (v17)
  {
    id v18 = [v5 share];
    uint64_t v19 = [v18 URL];
    if (!v19)
    {
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v20 = (void *)v19;
    uint64_t v21 = [v5 share];
    id v22 = [v21 participants];
    if ((unint64_t)[v22 count] < 2)
    {
LABEL_12:

      goto LABEL_13;
    }
    uint64_t v23 = [v5 emailAddresses];
    if ([v23 count])
    {

      goto LABEL_12;
    }
    uint64_t v40 = [v5 phoneNumbers];
    uint64_t v41 = [v40 count];

    if (v41)
    {
LABEL_14:
      id v24 = [v5 share];
      id v25 = [v24 participants];
      unint64_t v26 = [v25 count];

      if (v26 > 1)
      {
        id v34 = getCloudSharingClass();
        id v35 = [v5 share];
        v50 = [v5 setupInfo];
        v49 = [v5 emailAddresses];
        uint64_t v36 = [v5 phoneNumbers];
        long long v37 = [v5 permissionType];
        uint64_t v48 = (int)[v37 intValue];
        long long v38 = [v5 allowOthersToInvite];
        uint64_t v39 = [v38 BOOLValue];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_2;
        v51[3] = &unk_1E5BBFA98;
        v52 = (SFCollaborationCloudSharingResult *)v5;
        id v53 = v12;
        [v34 addParticipantsToShare:v35 containerSetupInfo:v50 emailAddresses:v49 phoneNumbers:v36 permissionType:v48 allowOthersToInvite:v39 completionHandler:v51];

        id v16 = v52;
      }
      else
      {
        uint64_t v27 = share_sheet_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A5389000, v27, OS_LOG_TYPE_DEFAULT, "Getting status for share", buf, 2u);
        }

        id v28 = getCloudSharingClass();
        id v29 = [v5 share];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_273;
        v54[3] = &unk_1E5BBFB10;
        v55 = (SFCollaborationCloudSharingResult *)v5;
        id v56 = v12;
        [v28 sharingStatusForShare:v29 completionHandler:v54];

        id v16 = v55;
      }
      goto LABEL_6;
    }
    uint64_t v42 = share_sheet_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5389000, v42, OS_LOG_TYPE_DEFAULT, "Share exists and we are not intending to add participants, using existing share URL", buf, 2u);
    }

    uint64_t v43 = [SFCollaborationCloudSharingResult alloc];
    uint64_t v44 = [v5 collaborationItemIdentifier];
    uint64_t v45 = [v5 share];
    v46 = [v45 URL];
    uint64_t v47 = [v5 share];
    id v16 = [(SFCollaborationCloudSharingResult *)v43 initWithCollaborationItemIdentifier:v44 sharingURL:v46 share:v47 existingShare:1 error:0 mailResult:0];

    (*((void (**)(void *, SFCollaborationCloudSharingResult *))v12 + 2))(v12, v16);
  }
  else
  {
    BOOL v30 = share_sheet_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      +[SFCollaborationUtilities createSharingURLForCollaborationRequest:completionHandler:]();
    }

    id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sharesheet.sharingURLCreation" code:0 userInfo:0];
    id v31 = [SFCollaborationCloudSharingResult alloc];
    os_signpost_id_t v32 = [v5 collaborationItemIdentifier];
    id v33 = [(SFCollaborationCloudSharingResult *)v31 initWithCollaborationItemIdentifier:v32 sharingURL:0 share:0 error:v16 mailResult:0];

    (*((void (**)(void *, SFCollaborationCloudSharingResult *))v12 + 2))(v12, v33);
  }
LABEL_6:
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = gelato_sharing_log();
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v5, OS_SIGNPOST_INTERVAL_END, v6, "CollaborationCreateSharingURL", "", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_265(uint64_t a1, uint64_t a2)
{
  if (a2 == 6)
  {
    id v3 = share_sheet_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Sharing an unshared folder with shared subitems. First we need to override the share", buf, 2u);
    }

    id CloudSharingClass = getCloudSharingClass();
    id v4 = [*(id *)(a1 + 32) fileOrFolderURL];
    id v15 = [*(id *)(a1 + 32) emailAddresses];
    uint64_t v14 = [*(id *)(a1 + 32) phoneNumbers];
    id v5 = [*(id *)(a1 + 32) accessType];
    uint64_t v13 = (int)[v5 intValue];
    os_signpost_id_t v6 = [*(id *)(a1 + 32) permissionType];
    uint64_t v7 = (int)[v6 intValue];
    os_signpost_id_t v8 = [*(id *)(a1 + 32) allowOthersToInvite];
    uint64_t v9 = [v8 BOOLValue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_266;
    v20[3] = &unk_1E5BBFA98;
    BOOL v10 = &v21;
    id v21 = *(id *)(a1 + 32);
    id v11 = &v22;
    id v22 = *(id *)(a1 + 40);
    [CloudSharingClass shareFolderRemovingSubshares:v4 emailAddresses:v15 phoneNumbers:v14 accessType:v13 permissionType:v7 allowOthersToInvite:v9 completionHandler:v20];
  }
  else
  {
    id v12 = getCloudSharingClass();
    id v4 = [*(id *)(a1 + 32) fileOrFolderURL];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_268;
    v17[3] = &unk_1E5BBFA98;
    BOOL v10 = &v18;
    id v18 = *(id *)(a1 + 32);
    id v11 = &v19;
    id v19 = *(id *)(a1 + 40);
    [v12 existingShareForFileOrFolderURL:v4 completionHandler:v17];
  }
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_266(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  BOOL v10 = share_sheet_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v11)
    {
      id v12 = [v7 debugDescription];
      int v16 = 138412290;
      id v17 = v12;
      _os_log_impl(&dword_1A5389000, v10, OS_LOG_TYPE_DEFAULT, "Failed to override folder subitems' shares with error: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else if (v11)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1A5389000, v10, OS_LOG_TYPE_DEFAULT, "Created an empty share for the folder which overrode the shared subitems", (uint8_t *)&v16, 2u);
  }

  uint64_t v13 = [SFCollaborationCloudSharingResult alloc];
  uint64_t v14 = [*(id *)(a1 + 32) collaborationItemIdentifier];
  id v15 = [(SFCollaborationCloudSharingResult *)v13 initWithCollaborationItemIdentifier:v14 sharingURL:v9 share:v8 error:v7 mailResult:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_268(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = v9;
  if (!v8 || v9)
  {
    id v31 = v9;
    id v32 = v8;
    id v12 = share_sheet_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5389000, v12, OS_LOG_TYPE_DEFAULT, "File is unshared, sharing as owner", buf, 2u);
    }

    id CloudSharingClass = getCloudSharingClass();
    id v29 = [*(id *)(a1 + 32) fileOrFolderURL];
    uint64_t v13 = [*(id *)(a1 + 32) emailAddresses];
    uint64_t v14 = [*(id *)(a1 + 32) phoneNumbers];
    id v15 = [*(id *)(a1 + 32) accessType];
    uint64_t v16 = (int)[v15 intValue];
    id v17 = [*(id *)(a1 + 32) permissionType];
    uint64_t v18 = (int)[v17 intValue];
    id v19 = [*(id *)(a1 + 32) allowOthersToInvite];
    uint64_t v20 = [v19 BOOLValue];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_269;
    v38[3] = &unk_1E5BBFA98;
    uint64_t v39 = (SFCollaborationCloudSharingResult *)*(id *)(a1 + 32);
    id v40 = *(id *)(a1 + 40);
    [CloudSharingClass shareFileOrFolderURL:v29 emailAddresses:v13 phoneNumbers:v14 accessType:v16 permissionType:v18 allowOthersToInvite:v20 completionHandler:v38];

    id v21 = v39;
    id v8 = v32;
    BOOL v10 = v31;
  }
  else
  {
    if (!v7)
    {
LABEL_10:
      id v24 = share_sheet_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A5389000, v24, OS_LOG_TYPE_DEFAULT, "File is shared, getting share status", buf, 2u);
      }

      id v25 = getCloudSharingClass();
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_270;
      v33[3] = &unk_1E5BBFAE8;
      id v34 = (SFCollaborationCloudSharingResult *)v8;
      id v35 = *(id *)(a1 + 32);
      id v37 = *(id *)(a1 + 40);
      id v36 = v7;
      [v25 sharingStatusForShare:v34 completionHandler:v33];

      id v21 = v34;
      goto LABEL_13;
    }
    BOOL v11 = [*(id *)(a1 + 32) emailAddresses];
    if ([v11 count])
    {

      goto LABEL_10;
    }
    id v22 = [*(id *)(a1 + 32) phoneNumbers];
    uint64_t v23 = [v22 count];

    if (v23) {
      goto LABEL_10;
    }
    unint64_t v26 = share_sheet_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5389000, v26, OS_LOG_TYPE_DEFAULT, "File is shared and we are not intending to add participants, using existing share URL", buf, 2u);
    }

    uint64_t v27 = [SFCollaborationCloudSharingResult alloc];
    id v28 = [*(id *)(a1 + 32) collaborationItemIdentifier];
    id v21 = [(SFCollaborationCloudSharingResult *)v27 initWithCollaborationItemIdentifier:v28 sharingURL:v7 share:v8 existingShare:1 error:0 mailResult:0];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
LABEL_13:
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_269(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  BOOL v10 = [SFCollaborationCloudSharingResult alloc];
  BOOL v11 = [*(id *)(a1 + 32) collaborationItemIdentifier];
  id v12 = [(SFCollaborationCloudSharingResult *)v10 initWithCollaborationItemIdentifier:v11 sharingURL:v9 share:v8 error:v7 mailResult:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_270(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_signpost_id_t v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = a2;
    _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, "Shared file status is %ld", buf, 0xCu);
  }

  if (a2)
  {
    if (a2 == 1)
    {
      id CloudSharingClass = getCloudSharingClass();
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = [*(id *)(a1 + 40) emailAddresses];
      id v9 = [*(id *)(a1 + 40) phoneNumbers];
      BOOL v10 = [*(id *)(a1 + 40) permissionType];
      uint64_t v11 = (int)[v10 intValue];
      id v12 = [*(id *)(a1 + 40) allowOthersToInvite];
      uint64_t v13 = [v12 BOOLValue];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_271;
      v30[3] = &unk_1E5BBFA98;
      id v31 = (SFCollaborationCloudSharingResult *)*(id *)(a1 + 40);
      id v32 = *(id *)(a1 + 56);
      [CloudSharingClass addParticipantsToShare:v7 containerSetupInfo:0 emailAddresses:v8 phoneNumbers:v9 permissionType:v11 allowOthersToInvite:v13 completionHandler:v30];

      uint64_t v14 = v31;
    }
    else
    {
      uint64_t v23 = [SFCollaborationCloudSharingResult alloc];
      id v24 = [*(id *)(a1 + 40) collaborationItemIdentifier];
      uint64_t v14 = [(SFCollaborationCloudSharingResult *)v23 initWithCollaborationItemIdentifier:v24 sharingURL:*(void *)(a1 + 48) share:*(void *)(a1 + 32) existingShare:1 error:0 mailResult:0];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v15 = share_sheet_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_270_cold_1();
    }

    id v26 = getCloudSharingClass();
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = [*(id *)(a1 + 40) emailAddresses];
    uint64_t v18 = [*(id *)(a1 + 40) phoneNumbers];
    id v19 = [*(id *)(a1 + 40) permissionType];
    uint64_t v20 = (int)[v19 intValue];
    id v21 = [*(id *)(a1 + 40) allowOthersToInvite];
    uint64_t v22 = [v21 BOOLValue];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_272;
    v27[3] = &unk_1E5BBFA98;
    id v28 = (SFCollaborationCloudSharingResult *)*(id *)(a1 + 40);
    id v29 = *(id *)(a1 + 56);
    [v26 addParticipantsToShare:v16 containerSetupInfo:0 emailAddresses:v17 phoneNumbers:v18 permissionType:v20 allowOthersToInvite:v22 completionHandler:v27];

    uint64_t v14 = v28;
  }
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_271(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  BOOL v10 = [SFCollaborationCloudSharingResult alloc];
  uint64_t v11 = [*(id *)(a1 + 32) collaborationItemIdentifier];
  id v12 = [(SFCollaborationCloudSharingResult *)v10 initWithCollaborationItemIdentifier:v11 sharingURL:v9 share:v8 existingShare:1 error:v7 mailResult:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_272(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  BOOL v10 = [SFCollaborationCloudSharingResult alloc];
  uint64_t v11 = [*(id *)(a1 + 32) collaborationItemIdentifier];
  id v12 = [(SFCollaborationCloudSharingResult *)v10 initWithCollaborationItemIdentifier:v11 sharingURL:v9 share:v8 existingShare:1 error:v7 mailResult:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_273(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_signpost_id_t v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v46 = a2;
    _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, "Share status is %ld", buf, 0xCu);
  }

  if (a2)
  {
    if (a2 == 1)
    {
      id CloudSharingClass = getCloudSharingClass();
      id v33 = [*(id *)(a1 + 32) share];
      id v31 = [*(id *)(a1 + 32) setupInfo];
      id v7 = [*(id *)(a1 + 32) emailAddresses];
      id v8 = [*(id *)(a1 + 32) phoneNumbers];
      [*(id *)(a1 + 32) accessType];
      id v9 = v37 = v5;
      uint64_t v10 = (int)[v9 intValue];
      uint64_t v11 = [*(id *)(a1 + 32) permissionType];
      uint64_t v12 = (int)[v11 intValue];
      uint64_t v13 = [*(id *)(a1 + 32) allowOthersToInvite];
      char v14 = [v13 BOOLValue];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_274;
      v42[3] = &unk_1E5BBFA98;
      uint64_t v43 = (SFCollaborationCloudSharingResult *)*(id *)(a1 + 32);
      id v44 = *(id *)(a1 + 40);
      LOBYTE(v30) = v14;
      [CloudSharingClass completeShare:v33 containerSetupInfo:v31 emailAddresses:v7 phoneNumbers:v8 accessType:v10 permissionType:v12 allowOthersToInvite:v30 completionHandler:v42];

      id v5 = v37;
      id v15 = v43;
    }
    else
    {
      id v25 = [SFCollaborationCloudSharingResult alloc];
      id v26 = [*(id *)(a1 + 32) collaborationItemIdentifier];
      uint64_t v27 = [*(id *)(a1 + 32) share];
      id v28 = [v27 URL];
      id v29 = [*(id *)(a1 + 32) share];
      id v15 = [(SFCollaborationCloudSharingResult *)v25 initWithCollaborationItemIdentifier:v26 sharingURL:v28 share:v29 error:0 mailResult:0];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    uint64_t v16 = share_sheet_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_273_cold_1(v5);
    }

    id v36 = getCloudSharingClass();
    uint64_t v34 = [*(id *)(a1 + 32) share];
    id v32 = [*(id *)(a1 + 32) setupInfo];
    id v17 = [*(id *)(a1 + 32) emailAddresses];
    uint64_t v18 = [*(id *)(a1 + 32) phoneNumbers];
    [*(id *)(a1 + 32) accessType];
    id v19 = v38 = v5;
    uint64_t v20 = (int)[v19 intValue];
    id v21 = [*(id *)(a1 + 32) permissionType];
    uint64_t v22 = (int)[v21 intValue];
    uint64_t v23 = [*(id *)(a1 + 32) allowOthersToInvite];
    char v24 = [v23 BOOLValue];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_275;
    v39[3] = &unk_1E5BBFA98;
    id v40 = (SFCollaborationCloudSharingResult *)*(id *)(a1 + 32);
    id v41 = *(id *)(a1 + 40);
    LOBYTE(v30) = v24;
    [v36 completeShare:v34 containerSetupInfo:v32 emailAddresses:v17 phoneNumbers:v18 accessType:v20 permissionType:v22 allowOthersToInvite:v30 completionHandler:v39];

    id v5 = v38;
    id v15 = v40;
  }
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_274(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [SFCollaborationCloudSharingResult alloc];
  uint64_t v11 = [*(id *)(a1 + 32) collaborationItemIdentifier];
  uint64_t v12 = [(SFCollaborationCloudSharingResult *)v10 initWithCollaborationItemIdentifier:v11 sharingURL:v9 share:v8 error:v7 mailResult:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_275(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [SFCollaborationCloudSharingResult alloc];
  uint64_t v11 = [*(id *)(a1 + 32) collaborationItemIdentifier];
  uint64_t v12 = [(SFCollaborationCloudSharingResult *)v10 initWithCollaborationItemIdentifier:v11 sharingURL:v9 share:v8 error:v7 mailResult:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [SFCollaborationCloudSharingResult alloc];
  uint64_t v11 = [*(id *)(a1 + 32) collaborationItemIdentifier];
  uint64_t v12 = [(SFCollaborationCloudSharingResult *)v10 initWithCollaborationItemIdentifier:v11 sharingURL:v9 share:v8 existingShare:1 error:v7 mailResult:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)createMailContentForRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = gelato_sharing_log();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v5);

  id v9 = gelato_sharing_log();
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CollaborationCreateMailContent", "", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__SFCollaborationUtilities_createMailContentForRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5BBFB38;
  id v31 = v6;
  os_signpost_id_t v32 = v8;
  id v11 = v6;
  uint64_t v12 = _Block_copy(aBlock);
  uint64_t v13 = share_sheet_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    char v14 = [v5 sharingURL];
    id v15 = [v5 fileOrFolderURL];
    uint64_t v16 = [v5 appName];
    id v17 = [v5 share];
    *(_DWORD *)buf = 138413826;
    uint64_t v34 = v14;
    __int16 v35 = 2112;
    id v36 = v15;
    __int16 v37 = 2112;
    id v38 = v16;
    __int16 v39 = 2112;
    uint64_t v40 = 0;
    __int16 v41 = 2112;
    uint64_t v42 = 0;
    __int16 v43 = 2112;
    uint64_t v44 = 0;
    __int16 v45 = 2112;
    uint64_t v46 = v17;
    _os_log_impl(&dword_1A5389000, v13, OS_LOG_TYPE_DEFAULT, "Calling messageContentForMail SPI with sharingURL:%@, fileURL:%@, appName:%@, canEdit:%@, allowOthersToInvite:%@, containerID:%@, share:%@", buf, 0x48u);
  }
  id CloudSharingClass = getCloudSharingClass();
  id v19 = [v5 sharingURL];
  uint64_t v20 = [v5 share];
  id v21 = [v5 fileOrFolderURL];
  uint64_t v22 = [v5 appName];
  uint64_t v23 = [v5 appIconData];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __74__SFCollaborationUtilities_createMailContentForRequest_completionHandler___block_invoke_280;
  v25[3] = &unk_1E5BBFB60;
  id v26 = 0;
  id v27 = 0;
  id v28 = 0;
  id v29 = v12;
  id v24 = v12;
  [CloudSharingClass messageContentForMail:v19 share:v20 fileURL:v21 appName:v22 appIconData:v23 completionHandler:v25];
}

void __74__SFCollaborationUtilities_createMailContentForRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = gelato_sharing_log();
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A5389000, v5, OS_SIGNPOST_INTERVAL_END, v6, "CollaborationCreateMailContent", "", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__SFCollaborationUtilities_createMailContentForRequest_completionHandler___block_invoke_280(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = share_sheet_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_1A5389000, v10, OS_LOG_TYPE_DEFAULT, "Call to messageContentForMail SPI returned subject:%@, body:%@, error:%@", (uint8_t *)&v12, 0x20u);
  }

  id v11 = [[SFCollaborationCloudSharingMailResult alloc] initWithSubject:v7 body:v8 containerID:a1[4] canEdit:a1[5] allowOthersToInvite:a1[6] error:v9];
  (*(void (**)(void))(a1[7] + 16))();
}

+ (BOOL)canDeleteShareForCollaborationItem:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 1)
  {
    id v4 = [v3 itemProvider];
    LOBYTE(v5) = +[SFCollaborationUtilities isPreCKShareItemProvider:v4];
  }
  else if ([v3 type])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    int v5 = [v3 isShared] ^ 1;
  }

  return v5;
}

+ (id)descriptionForShareOptions:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  int v5 = [v4 description];
  os_signpost_id_t v6 = [v4 summary];
  id v7 = [v4 optionsGroups];

  id v8 = [v3 stringWithFormat:@"<%@ summary: %@, options: %@>", v5, v6, v7];

  return v8;
}

+ (void)getFailureTitle:(id *)a3 message:(id *)a4 error:(id)a5
{
  id v7 = a5;
  SFLocalizedStringForKey(@"ERROR_TITLE_COULD_NOT_ADD_PARTICIPANTS");
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = SFLocalizedStringForKey(@"ERROR_MESSAGE_COULD_NOT_ADD_PARTICIPANTS");
  id v9 = +[SFCollaborationUtilities underlyingCKErrorForError:v7];

  uint64_t v10 = [v9 domain];
  id v11 = getCKErrorDomain();
  int v12 = [v10 isEqualToString:v11];

  if (!v12)
  {
    uint64_t v20 = [v9 domain];
    int v21 = [v20 isEqualToString:*MEMORY[0x1E4F281F8]];

    if (!v21) {
      goto LABEL_19;
    }
    uint64_t v22 = NSString;
    __int16 v14 = SFLocalizedStringForKey(@"ERROR_MESSAGE_COULD_NOT_ADD_PARTICIPANTS_WITH_ERROR_INFO");
    uint64_t v23 = [v9 localizedDescription];
    uint64_t v19 = objc_msgSend(v22, "stringWithFormat:", v14, v23);

    id v8 = (void *)v23;
    goto LABEL_17;
  }
  id v13 = [MEMORY[0x1E4F28F80] processInfo];
  __int16 v14 = [v13 processName];

  uint64_t v15 = [v9 code];
  if (v15 > 28)
  {
    switch(v15)
    {
      case 29:
        uint64_t v16 = SFLocalizedStringForKey(@"ERROR_TITLE_TOO_MANY_PARTICIPANTS");

        CFStringRef v24 = @"ERROR_MESSAGE_TOO_MANY_PARTICIPANTS";
        break;
      case 30:
        uint64_t v16 = SFLocalizedStringForKey(@"ERROR_TITLE_FILE_ALREADY_SHARED");

        CFStringRef v24 = @"ERROR_MESSAGE_FILE_ALREADY_SHARED";
        break;
      case 32:
        uint64_t v16 = SFLocalizedStringForKey(@"ERROR_TITLE_MAID");

        CFStringRef v24 = @"ERROR_MESSAGE_MAID";
        break;
      default:
        goto LABEL_18;
    }
    uint64_t v19 = SFLocalizedStringForKey(v24);
    goto LABEL_16;
  }
  if ((unint64_t)(v15 - 3) < 2)
  {
    uint64_t v16 = SFLocalizedStringForKey(@"ERROR_TITLE_NETWORK_UNAVAILABLE_OR_FAILURE");

    id v17 = NSString;
    uint64_t v18 = SFLocalizedStringForKey(@"ERROR_MESSAGE_NETWORK_UNAVAILABLE_OR_FAILURE");
    uint64_t v19 = objc_msgSend(v17, "localizedStringWithFormat:", v18, v14);

    id v8 = (void *)v18;
LABEL_16:
    id v25 = (id)v16;
    goto LABEL_17;
  }
  if (v15 == 14)
  {
    uint64_t v19 = SFLocalizedStringForKey(@"ERROR_MESSAGE_COULD_NOT_ADD_PARTICIPANTS_WITH_TRY_AGAIN");
LABEL_17:

    id v8 = (void *)v19;
  }
LABEL_18:

LABEL_19:
  if (a3) {
    *a3 = v25;
  }
  if (a4) {
    *a4 = v8;
  }
}

+ (BOOL)isOplockError:(id)a3 updatedShare:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    os_signpost_id_t v6 = +[SFCollaborationUtilities underlyingCKErrorForError:v5];
    id v7 = [v6 domain];
    id v8 = getCKErrorDomain();
    if ([v7 isEqualToString:v8])
    {
      uint64_t v9 = [v6 code];

      if (v9 == 14)
      {
        uint64_t v10 = [v6 userInfo];
        uint64_t v17 = 0;
        uint64_t v18 = &v17;
        uint64_t v19 = 0x2020000000;
        id v11 = (id *)getCKRecordChangedErrorServerRecordKeySymbolLoc_ptr;
        uint64_t v20 = getCKRecordChangedErrorServerRecordKeySymbolLoc_ptr;
        if (!getCKRecordChangedErrorServerRecordKeySymbolLoc_ptr)
        {
          int v12 = (void *)CloudKitLibrary_0();
          v18[3] = (uint64_t)dlsym(v12, "CKRecordChangedErrorServerRecordKey");
          getCKRecordChangedErrorServerRecordKeySymbolLoc_ptr = v18[3];
          id v11 = (id *)v18[3];
        }
        _Block_object_dispose(&v17, 8);
        if (!v11) {
          +[SFCollaborationUtilities isOplockError:updatedShare:]();
        }
        id v13 = *v11;
        __int16 v14 = [v10 objectForKeyedSubscript:v13];

        if (a4) {
          *a4 = v14;
        }

        BOOL v15 = 1;
        goto LABEL_13;
      }
    }
    else
    {
    }
    BOOL v15 = 0;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

+ (id)underlyingCKErrorForError:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 domain];
  id v5 = getCKErrorDomain();
  if ([v4 isEqualToString:v5]
    || ([v3 userInfo], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    id v12 = v3;
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [v3 userInfo];
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v12 = v3;
    if (isKindOfClass)
    {
      id v13 = [v3 userInfo];
      __int16 v14 = [v13 objectForKeyedSubscript:v9];

      BOOL v15 = [v3 userInfo];
      uint64_t v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F28750]];

      uint64_t v17 = [v14 domain];
      uint64_t v18 = getCKErrorDomain();
      int v19 = [v17 isEqualToString:v18];

      if (v19)
      {
        id v12 = v14;
      }
      else
      {
        id v12 = v3;
        if (v16)
        {
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v21 = v16;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
          id v12 = v3;
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v30 = v16;
            uint64_t v24 = *(void *)v32;
            while (2)
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v32 != v24) {
                  objc_enumerationMutation(v21);
                }
                id v26 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                id v27 = [v26 domain];
                id v28 = getCKErrorDomain();
                int v29 = [v27 isEqualToString:v28];

                if (v29)
                {
                  id v12 = v26;

                  goto LABEL_21;
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
              if (v23) {
                continue;
              }
              break;
            }
            id v12 = v3;
LABEL_21:
            uint64_t v16 = v30;
          }
        }
      }
    }
  }

  return v12;
}

+ (void)shareStatusForURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id CloudSharingClass = getCloudSharingClass();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__SFCollaborationUtilities_shareStatusForURL_completionHandler___block_invoke;
  v9[3] = &unk_1E5BBF9F8;
  id v10 = v5;
  id v8 = v5;
  [CloudSharingClass sharingStatusForFileOrFolderURL:v6 completionHandler:v9];
}

uint64_t __64__SFCollaborationUtilities_shareStatusForURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)urlRequestsForCollaborationItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (![v9 type])
        {
          if (!v6)
          {
            id v6 = [MEMORY[0x1E4F1CA48] array];
          }
          id v10 = [v9 fileURL];
          id v11 = [MEMORY[0x1E4F28E88] requestWithURL:v10];
          [v11 _setNonAppInitiated:1];
          [v6 addObject:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (void)getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "No options were found, providing default values for permissions", v2, v3, v4, v5, v6);
}

+ (void)getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CKShareParticipantPermission soft_CKSharingPermissionTypeFromOptionsGroups(NSArray<_SWCollaborationOptionsGroup *> *__strong)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 84, @"%s", dlerror());

  __break(1u);
}

+ (void)getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:.cold.3()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL soft_CKSharingAllowOthersToInviteFromOptionsGroups(NSArray<_SWCollaborationOptionsGroup *> *__strong)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 85, @"%s", dlerror());

  __break(1u);
}

+ (void)_loadShareOptionsForCKShareItemProvider:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "itemProvider:%@ cannot load object of class CKAllowedSharingOptions.", v2, v3, v4, v5, v6);
}

void __86__SFCollaborationUtilities__loadShareOptionsForCKShareItemProvider_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Loading CKShare Options failed with error:%@", v2, v3, v4, v5, v6);
}

void __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_165_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "failed to load CKPostSharingContext:%@", v2, v3, v4, v5, v6);
}

void __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_166_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "failed to load CKPreSharingContext:%@", v2, v3, v4, v5, v6);
}

+ (void)loadCKContainerForItemProvider:completionHandler:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *get_CKCloudKitContainerSetupInfoType(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 76, @"%s", dlerror());

  __break(1u);
}

+ (void)isCollaborationItemPrivateShare:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "No options were found, providing default value for access type", v2, v3, v4, v5, v6);
}

+ (void)createLinkMetadataWithCKShare:containerSetupInfo:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getCKShareThumbnailImageDataKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 102, @"%s", dlerror());

  __break(1u);
}

+ (void)createLinkMetadataWithCKShare:containerSetupInfo:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Failed to set icon on LP since we failed to get a bundleID", v2, v3, v4, v5, v6);
}

+ (void)createLinkMetadataWithCKShare:containerSetupInfo:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Failed to get a bundleID from containerSetupInfo:%@", v2, v3, v4, v5, v6);
}

+ (void)createLinkMetadataWithCKShare:(void *)a1 containerSetupInfo:.cold.4(void *a1)
{
  uint64_t v1 = [a1 URL];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A5389000, v2, v3, "Failed to get a bundle from appRecord.URL: %@", v4, v5, v6, v7, v8);
}

+ (void)createLinkMetadataWithCKShare:containerSetupInfo:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Failed to get a URL appRecord : %@", v2, v3, v4, v5, v6);
}

+ (void)isThirdPartyFileProviderBackedURL:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_1(&dword_1A5389000, v1, v2, "error fetching file provider domain for URL:%@ : %@", (void)v3, DWORD2(v3));
}

+ (void)isSharedFileURL:(uint64_t)a1 isLocalStorageFileURL:isiCloudDriveFileURL:isInSharedFolder:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_1(&dword_1A5389000, v1, v2, "error fetching item for URL:%@ : %@", (void)v3, DWORD2(v3));
}

+ (void)requestSharedURLForCollaborationItem:collaborationService:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Can't request SharedURL for URL:%@ because the service is nil.", v2, v3, v4, v5, v6);
}

+ (void)requestSharedURLForCollaborationItem:collaborationService:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Can't get shared URL for Pre-CKShare type.", v2, v3, v4, v5, v6);
}

+ (void)requestSharedURLForCollaborationItem:(void *)a1 collaborationService:completionHandler:.cold.3(void *a1)
{
  [a1 type];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A5389000, v1, v2, "Can't get shared URL for type:%ld", v3, v4, v5, v6, v7);
}

void __85__SFCollaborationUtilities_findOriginatingSharedItemForSubitemURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_1(&dword_1A5389000, v1, v2, "error fetching parent items for URL:%@ : %@", (void)v3, DWORD2(v3));
}

void __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Failed to load copy representation URL with error: %@", v2, v3, v4, v5, v6);
}

void __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke_207_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_1(&dword_1A5389000, v1, v2, "Failed to coordinate read for copy representation URL for file at URL %@ with error: %@", (void)v3, DWORD2(v3));
}

+ (void)_copyRepresentationTypeIdentifier
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getSWCopyRepresentationTypeIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 126, @"%s", dlerror());

  __break(1u);
}

+ (void)_loadShareOptionsForSWYItemProvider:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "itemProvider:%@ isn't conformed to UTCollaborationOptionsTypeIdentifier.", v2, v3, v4, v5, v6);
}

void __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Loading SWYShare Options failed with error:%@", v2, v3, v4, v5, v6);
}

void __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke_212_cold_1(void *a1)
{
  uint64_t v1 = [a1 collaborationMetadata];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A5389000, v2, v3, "Loading SWYShare Options failed. Pending collaboration's metadata object is %@", v4, v5, v6, v7, v8);
}

void __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_215_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Could not load send copy representation: %@", v2, v3, v4, v5, v6);
}

void __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)loadShareOptionsForItemProvider:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Only support loading options for CKShare and SWY types.", v2, v3, v4, v5, v6);
}

+ (void)loadMetadataForItemProvider:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Can't load metadata: item provider is not CKShare based : %@", v2, v3, v4, v5, v6);
}

void __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 URL];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A5389000, v2, v3, "Could not find identifier from the share URL: %@", v4, v5, v6, v7, v8);
}

void __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getCKShareTypeKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 103, @"%s", dlerror());

  __break(1u);
}

void __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "CKShare options are empty.", v2, v3, v4, v5, v6);
}

void __86__SFCollaborationUtilities_loadPendingCollaborationForItemProvider_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Failed to get pending collaboration: %@", v2, v3, v4, v5, v6);
}

+ (void)addParticipantsAllowedForURL:(void *)a1 share:completionHandler:.cold.1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A5389000, v2, v3, "%@", v4, v5, v6, v7, v8);
}

+ (void)_addParticipantsAllowedForURL:(void *)a1 share:collaborationService:completionHandler:.cold.1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A5389000, v2, v3, "%@", v4, v5, v6, v7, v8);
}

+ (void)isShareOwnerOrAdminForFileURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "no fileURL provided to figure out if it's the owner or an admin.", v2, v3, v4, v5, v6);
}

void __76__SFCollaborationUtilities_isShareOwnerOrAdminForFileURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_1(&dword_1A5389000, v1, v2, "error to get existing share for fileURL:%@ %@", (void)v3, DWORD2(v3));
}

+ (void)createSharingURLForCollaborationRequest:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Received collaboration request with neither file URL nor share", v2, v3, v4, v5, v6);
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_270_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(v2 + 40) fileOrFolderURL];
  uint64_t v4 = [v1 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  OUTLINED_FUNCTION_6(&dword_1A5389000, v0, v5, "Attempt to get sharing status for file URL %@ failed, falling back on assumption of ownership. Error: %@", (uint8_t *)&v6);
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_273_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A5389000, v2, v3, "Attempt to get sharing status failed, falling back on assumption of ownership. Error: %@", v4, v5, v6, v7, v8);
}

+ (void)isOplockError:updatedShare:.cold.1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getCKRecordChangedErrorServerRecordKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 78, @"%s", dlerror());

  __break(1u);
}

@end