@interface _SFCKShareCollaborationItem
- (BOOL)_canShowOptions;
- (BOOL)isLoading;
- (BOOL)isLoadingContainerSetupInfo;
- (BOOL)isServiceManatee;
- (CKAllowedSharingOptions)ckOptions;
- (CKContainerSetupInfo)containerSetupInfo;
- (CKShare)updatedShare;
- (LPLinkMetadata)linkMetadata;
- (LPLinkMetadata)postSharelinkMetadata;
- (_SFCKShareCollaborationItem)initWithItemProvider:(id)a3 activityItem:(id)a4;
- (id)_defaultLoadingOptionsSummary;
- (void)_didLoadContainerSetupInfo:(id)a3;
- (void)_loadCKContainerSetupInfoIfNeeded;
- (void)_startLoading;
- (void)setCkOptions:(id)a3;
- (void)setContainerSetupInfo:(id)a3;
- (void)setIsLoadingContainerSetupInfo:(BOOL)a3;
- (void)setPostSharelinkMetadata:(id)a3;
- (void)setUpdatedShare:(id)a3;
@end

@implementation _SFCKShareCollaborationItem

- (_SFCKShareCollaborationItem)initWithItemProvider:(id)a3 activityItem:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = a4;
  v9 = [v7 URLWithString:@"https://www.apple.com/icloud/"];
  v14.receiver = self;
  v14.super_class = (Class)_SFCKShareCollaborationItem;
  v10 = [(SFCollaborationItem *)&v14 initWithItemProvider:v6 activityItem:v8 placeholderActivityItem:v9 defaultCollaboration:1];

  if (v10)
  {
    [(SFCollaborationItem *)v10 setType:1];
    v10->_isServiceManatee = +[SFCollaborationUtilities isServiceManateeCKShareItemProvider:v6];
    v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (v10->_isServiceManatee) {
        v12 = "yes";
      }
      else {
        v12 = "no";
      }
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      __int16 v17 = 2080;
      v18 = v12;
      _os_log_impl(&dword_1A5389000, v11, OS_LOG_TYPE_DEFAULT, "%@: isServiceManatee:%s", buf, 0x16u);
    }
  }
  return v10;
}

- (BOOL)_canShowOptions
{
  return ![(_SFCKShareCollaborationItem *)self isServiceManatee];
}

- (id)_defaultLoadingOptionsSummary
{
  v2 = [(SFCollaborationItem *)self itemProvider];
  BOOL v3 = +[SFCollaborationUtilities isPreCKShareItemProvider:v2];

  if (v3)
  {
    v4 = +[SFCollaborationUtilities defaultCKOptionsSummary];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isLoading
{
  v4.receiver = self;
  v4.super_class = (Class)_SFCKShareCollaborationItem;
  return [(SFCollaborationItem *)&v4 isLoading]
      || [(_SFCKShareCollaborationItem *)self isLoadingContainerSetupInfo];
}

- (void)_startLoading
{
  v3.receiver = self;
  v3.super_class = (Class)_SFCKShareCollaborationItem;
  [(SFCollaborationItem *)&v3 _startLoading];
  [(_SFCKShareCollaborationItem *)self _loadCKContainerSetupInfoIfNeeded];
}

- (void)_loadCKContainerSetupInfoIfNeeded
{
  objc_super v3 = [(_SFCKShareCollaborationItem *)self containerSetupInfo];

  if (!v3)
  {
    [(_SFCKShareCollaborationItem *)self setIsLoadingContainerSetupInfo:1];
    id location = 0;
    objc_initWeak(&location, self);
    objc_super v4 = [(SFCollaborationItem *)self itemProvider];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64___SFCKShareCollaborationItem__loadCKContainerSetupInfoIfNeeded__block_invoke;
    v5[3] = &unk_1E5BBE3C8;
    objc_copyWeak(&v6, &location);
    +[SFCollaborationUtilities loadCKContainerForItemProvider:v4 completionHandler:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_didLoadContainerSetupInfo:(id)a3
{
  id v4 = a3;
  [(_SFCKShareCollaborationItem *)self setIsLoadingContainerSetupInfo:0];
  [(_SFCKShareCollaborationItem *)self setContainerSetupInfo:v4];

  [(SFCollaborationItem *)self _updateLoadingState];
}

- (LPLinkMetadata)linkMetadata
{
  uint64_t v3 = [(_SFCKShareCollaborationItem *)self updatedShare];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(_SFCKShareCollaborationItem *)self containerSetupInfo];

    if (v5)
    {
      id v6 = [(_SFCKShareCollaborationItem *)self updatedShare];
      v7 = [(_SFCKShareCollaborationItem *)self containerSetupInfo];
      id v8 = +[SFCollaborationUtilities createLinkMetadataWithCKShare:v6 containerSetupInfo:v7];
      [(_SFCKShareCollaborationItem *)self setPostSharelinkMetadata:v8];
    }
  }
  v9 = [(_SFCKShareCollaborationItem *)self postSharelinkMetadata];

  if (!v9)
  {
    v10 = [(SFCollaborationItem *)self itemProvider];
    v11 = +[SFCollaborationUtilities createLinkMetadataWithCKShareItemProvider:v10];
    [(_SFCKShareCollaborationItem *)self setPostSharelinkMetadata:v11];
  }

  return [(_SFCKShareCollaborationItem *)self postSharelinkMetadata];
}

- (BOOL)isServiceManatee
{
  return self->_isServiceManatee;
}

- (CKAllowedSharingOptions)ckOptions
{
  return self->_ckOptions;
}

- (void)setCkOptions:(id)a3
{
}

- (CKShare)updatedShare
{
  return self->_updatedShare;
}

- (void)setUpdatedShare:(id)a3
{
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (void)setContainerSetupInfo:(id)a3
{
}

- (BOOL)isLoadingContainerSetupInfo
{
  return self->_isLoadingContainerSetupInfo;
}

- (void)setIsLoadingContainerSetupInfo:(BOOL)a3
{
  self->_isLoadingContainerSetupInfo = a3;
}

- (LPLinkMetadata)postSharelinkMetadata
{
  return self->_postSharelinkMetadata;
}

- (void)setPostSharelinkMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postSharelinkMetadata, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);
  objc_storeStrong((id *)&self->_updatedShare, 0);

  objc_storeStrong((id *)&self->_ckOptions, 0);
}

@end