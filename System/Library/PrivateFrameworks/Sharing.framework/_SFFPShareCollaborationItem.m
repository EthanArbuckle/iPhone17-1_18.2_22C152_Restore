@interface _SFFPShareCollaborationItem
- (BOOL)hasSeparateSendCopyRepresentation;
- (BOOL)isCollaborativeURL;
- (BOOL)isInSharedFolder;
- (BOOL)isLocalStorage;
- (BOOL)isShared;
- (BOOL)isThirdPartyFileProviderBacked;
- (BOOL)isiCloudDrive;
- (NSString)additionalContentIdentifier;
- (NSURL)fileURL;
- (NSURL)managedFileURL;
- (NSURL)sendCopyRepresentationURL;
- (_SFFPShareCollaborationItem)initWithFileURL:(id)a3 itemProvider:(id)a4 activityItem:(id)a5 defaultCollaboration:(BOOL)a6 managedFileURL:(id)a7;
- (id)_defaultLoadingOptionsSummary;
- (void)_loadMetadataIfNeeded;
- (void)loadCopyRepresentationURLWithCompletionHandler:(id)a3;
- (void)setManagedFileURL:(id)a3;
- (void)setSendCopyRepresentationURL:(id)a3;
@end

@implementation _SFFPShareCollaborationItem

- (_SFFPShareCollaborationItem)initWithFileURL:(id)a3 itemProvider:(id)a4 activityItem:(id)a5 defaultCollaboration:(BOOL)a6 managedFileURL:(id)a7
{
  BOOL v8 = a6;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v15;
    }
    else {
      id v17 = (id)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v13];
    }
    id v14 = v17;
  }
  if (v13 && v14 && ([v14 canLoadObjectOfClass:objc_opt_class()] & 1) == 0) {
    [v14 registerObject:v13 visibility:0];
  }
  v18 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://www.apple.com/icloud/"];
  v28.receiver = self;
  v28.super_class = (Class)_SFFPShareCollaborationItem;
  v19 = [(SFCollaborationItem *)&v28 initWithItemProvider:v14 activityItem:v15 placeholderActivityItem:v18 defaultCollaboration:v8];
  if (v19)
  {
    v19->_isShared = +[SFCollaborationUtilities isSharedFileURL:v13 isLocalStorageFileURL:&v19->_isLocalStorage isiCloudDriveFileURL:&v19->_isiCloudDrive isInSharedFolder:&v19->_isInSharedFolder];
    v19->_BOOL isThirdPartyFileProviderBacked = +[SFCollaborationUtilities isThirdPartyFileProviderBackedURL:v13];
    objc_storeStrong((id *)&v19->_fileURL, a3);
    objc_storeStrong((id *)&v19->_managedFileURL, a7);
    [(SFCollaborationItem *)v19 setType:0];
    v20 = share_sheet_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = "yes";
      if (v19->_isShared) {
        v22 = "yes";
      }
      else {
        v22 = "no";
      }
      BOOL isInSharedFolder = v19->_isInSharedFolder;
      BOOL isThirdPartyFileProviderBacked = v19->_isThirdPartyFileProviderBacked;
      if (v19->_isiCloudDrive) {
        v25 = "yes";
      }
      else {
        v25 = "no";
      }
      *(_DWORD *)buf = 138413570;
      if (isInSharedFolder) {
        v26 = "yes";
      }
      else {
        v26 = "no";
      }
      v30 = v19;
      __int16 v31 = 2112;
      if (!isThirdPartyFileProviderBacked) {
        v21 = "no";
      }
      id v32 = v13;
      __int16 v33 = 2080;
      v34 = v22;
      __int16 v35 = 2080;
      v36 = v25;
      __int16 v37 = 2080;
      v38 = v26;
      __int16 v39 = 2080;
      v40 = v21;
      _os_log_impl(&dword_1A5389000, v20, OS_LOG_TYPE_DEFAULT, "%@: fileURL:%@ isShared:%s isiCloudDrive:%s isInSharedFolder:%s isThirdPartyFileProviderBacked:%s", buf, 0x3Eu);
    }

    [(_SFFPShareCollaborationItem *)v19 _loadMetadataIfNeeded];
  }

  return v19;
}

- (NSString)additionalContentIdentifier
{
  return (NSString *)@"com.apple.sharing.collaborationuserdefaults.content-identifier.file-urls";
}

- (void)_loadMetadataIfNeeded
{
  v3 = [(_SFFPShareCollaborationItem *)self fileURL];

  if (v3)
  {
    v4 = [(_SFFPShareCollaborationItem *)self managedFileURL];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [(_SFFPShareCollaborationItem *)self fileURL];
    }
    v7 = v6;

    [(SFCollaborationItem *)self setIsLoadingMetadata:1];
    BOOL v8 = [(SFCollaborationItem *)self workQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52___SFFPShareCollaborationItem__loadMetadataIfNeeded__block_invoke;
    v10[3] = &unk_1E5BBBD18;
    id v11 = v7;
    v12 = self;
    id v9 = v7;
    dispatch_async(v8, v10);
  }
}

- (BOOL)isCollaborativeURL
{
  if ([(_SFFPShareCollaborationItem *)self isiCloudDrive]) {
    return 1;
  }
  if ([(_SFFPShareCollaborationItem *)self isiCloudDrive]) {
    return 0;
  }
  v4 = [(SFCollaborationItem *)self metadata];
  BOOL v3 = v4 != 0;

  return v3;
}

- (BOOL)hasSeparateSendCopyRepresentation
{
  v2 = [(SFCollaborationItem *)self itemProvider];
  BOOL v3 = +[SFCollaborationUtilities hasiWorkSendCopyRepresentationForItemProvider:v2];

  return v3;
}

- (id)_defaultLoadingOptionsSummary
{
  if ([(_SFFPShareCollaborationItem *)self isiCloudDrive]
    && ![(_SFFPShareCollaborationItem *)self isShared])
  {
    BOOL v3 = +[SFCollaborationUtilities defaultCKOptionsSummary];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)loadCopyRepresentationURLWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(_SFFPShareCollaborationItem *)self hasSeparateSendCopyRepresentation]
    && ([(_SFFPShareCollaborationItem *)self sendCopyRepresentationURL],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    id location = 0;
    objc_initWeak(&location, self);
    BOOL v8 = [(SFCollaborationItem *)self itemProvider];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78___SFFPShareCollaborationItem_loadCopyRepresentationURLWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E5BBE418;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    +[SFCollaborationUtilities loadiWorkCopyRepresentationURLForItemProvider:v8 completionHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = [(_SFFPShareCollaborationItem *)self sendCopyRepresentationURL];
    if (v6)
    {
      (*((void (**)(id, void *))v4 + 2))(v4, v6);
    }
    else
    {
      v7 = [(_SFFPShareCollaborationItem *)self fileURL];
      (*((void (**)(id, void *))v4 + 2))(v4, v7);
    }
  }
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)isLocalStorage
{
  return self->_isLocalStorage;
}

- (BOOL)isiCloudDrive
{
  return self->_isiCloudDrive;
}

- (BOOL)isThirdPartyFileProviderBacked
{
  return self->_isThirdPartyFileProviderBacked;
}

- (BOOL)isShared
{
  return self->_isShared;
}

- (BOOL)isInSharedFolder
{
  return self->_isInSharedFolder;
}

- (NSURL)sendCopyRepresentationURL
{
  return self->_sendCopyRepresentationURL;
}

- (void)setSendCopyRepresentationURL:(id)a3
{
}

- (NSURL)managedFileURL
{
  return self->_managedFileURL;
}

- (void)setManagedFileURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedFileURL, 0);
  objc_storeStrong((id *)&self->_sendCopyRepresentationURL, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end