@interface UIMessageActivity
+ (id)applicationBundleID;
+ (int64_t)activityCategory;
+ (unint64_t)_xpcAttributes;
+ (void)_preheatAsyncIfNeeded;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)isCollaborative;
- (BOOL)isContentManaged;
- (LPLinkMetadata)linkMetadata;
- (MFMessageComposeViewController)messageComposeViewController;
- (NSString)sourceApplicationBundleID;
- (SFCollaborationItem)collaborationItem;
- (SFPeopleSuggestion)peopleSuggestion;
- (id)_backgroundPreheatBlock;
- (id)_bundleIdentifierForActivityImageCreation;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)_cleanup;
- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)prepareWithActivityItems:(id)a3;
- (void)setCollaborationItem:(id)a3;
- (void)setIsCollaborative:(BOOL)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setLinkMetadata:(id)a3;
- (void)setMessageComposeViewController:(id)a3;
- (void)setPeopleSuggestion:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSourceApplicationBundleID:(id)a3;
@end

@implementation UIMessageActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

+ (int64_t)activityCategory
{
  return 1;
}

+ (id)applicationBundleID
{
  return @"com.apple.MobileSMS";
}

- (void)dealloc
{
  [(MFMessageComposeViewController *)self->_messageComposeViewController setMessageComposeDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)UIMessageActivity;
  [(UIMessageActivity *)&v3 dealloc];
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.Message";
}

- (id)_bundleIdentifierForActivityImageCreation
{
  uint64_t v2 = objc_opt_class();
  return (id)[v2 applicationBundleID];
}

- (id)activityTitle
{
  uint64_t v2 = _ShareSheetBundle();
  objc_super v3 = [v2 localizedStringForKey:@"Message[Activity]" value:@"Messages" table:@"Localizable"];

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(UIMessageActivity *)self sourceApplicationBundleID];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B50] mainBundle];
    id v7 = [v8 bundleIdentifier];
  }
  v9 = [(id)objc_opt_class() applicationBundleID];
  char CanDisplayActivityForApplicationWithBundleID = _UIActivityCanDisplayActivityForApplicationWithBundleID((uint64_t)v9);

  if ((CanDisplayActivityForApplicationWithBundleID & 1) == 0)
  {
    v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0AD8000, v11, OS_LOG_TYPE_DEFAULT, "UIMessageActivity: Can't display activity", buf, 2u);
    }
    BOOL v31 = 0;
    goto LABEL_44;
  }
  v11 = [(objc_class *)getIMSharedMessageSendingUtilitiesClass() sharedInstance];
  if (([v11 canSendText] & 1) == 0)
  {
    v12 = share_sheet_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0AD8000, v12, OS_LOG_TYPE_DEFAULT, "UIMessageActivity: Can't send text", buf, 2u);
    }
    goto LABEL_42;
  }
  v12 = [(objc_class *)getMCProfileConnectionClass_1() sharedConnection];
  if (([v12 mayShareToMessagesForOriginatingAppBundleID:v7 originatingAccountIsManaged:[(UIMessageActivity *)self isContentManaged]] & 1) == 0)
  {
    v32 = share_sheet_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v33 = "UIMessageActivity: Can't share to Messages";
LABEL_40:
      _os_log_impl(&dword_1A0AD8000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 2u);
    }
LABEL_41:

LABEL_42:
    BOOL v31 = 0;
    goto LABEL_43;
  }
  int v13 = [v11 isMMSEnabled];
  int v14 = [v11 isRichMessagingEnabled];
  int v15 = [v11 isMessagingEnabled];
  if (v13) {
    uint64_t v16 = 18511;
  }
  else {
    uint64_t v16 = 18437;
  }
  if (v14) {
    uint64_t v17 = 202;
  }
  else {
    uint64_t v17 = 0;
  }
  if (v14) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = 128;
  }
  uint64_t v19 = 74;
  if (v15) {
    uint64_t v19 = 0;
  }
  uint64_t v59 = v19;
  uint64_t v60 = v18;
  uint64_t v20 = _UIActivityItemCountOfType(v4, 2);
  uint64_t v21 = _UIActivityItemCountOfType(v4, 64);
  if (([v11 canSendPhotos:v20 videos:v21 audioClips:_UIActivityItemCountOfType(v4, 4096)] & 1) == 0)
  {
    v32 = share_sheet_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v33 = "UIMessageActivity: Can't send content";
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  unint64_t v22 = v16 | v17;
  v57 = v12;
  id v58 = v7;
  if ((_UIActivityItemTypes() & 8) != 0)
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v23 = v4;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v75 objects:v84 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      unint64_t v55 = v16 | v17;
      uint64_t v26 = *(void *)v76;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v76 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v28 isFileURL])
            {
              v29 = _UIActivityUTIForURL(v28);
              char v30 = [v11 isSupportedAttachmentUTI:v29];

              if (v30)
              {

                v12 = v57;
                id v7 = v58;
                unint64_t v22 = v55;
                goto LABEL_47;
              }
            }
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v75 objects:v84 count:16];
        if (v25) {
          continue;
        }
        break;
      }

      v12 = v57;
      unint64_t v22 = v55 & 0x48C7;
      id v7 = v58;
    }
    else
    {

      v22 &= 0x48C7u;
    }
  }
LABEL_47:
  if ((_UIActivityItemTypes() & 0x800) == 0) {
    goto LABEL_77;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v35 = v4;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v71 objects:v83 count:16];
  if (!v36)
  {

    v22 &= ~0x800uLL;
    goto LABEL_77;
  }
  uint64_t v37 = v36;
  unint64_t v56 = v22;
  int v38 = 0;
  uint64_t v39 = *(void *)v72;
  id v62 = v4;
  while (2)
  {
    for (uint64_t j = 0; j != v37; ++j)
    {
      if (*(void *)v72 != v39) {
        objc_enumerationMutation(v35);
      }
      v41 = *(void **)(*((void *)&v71 + 1) + 8 * j);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v42 = [(UIActivity *)self _dataTypeIdentifierForActivityItem:v41];
        if ([v11 isSupportedAttachmentUTI:v42])
        {

          goto LABEL_75;
        }
        v43 = share_sheet_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v82 = v42;
          _os_log_impl(&dword_1A0AD8000, v43, OS_LOG_TYPE_DEFAULT, "UIMessageActivity: Unsupported attachment type %@", buf, 0xCu);
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        v42 = [v41 registeredTypeIdentifiers];
        uint64_t v44 = [v42 countByEnumeratingWithState:&v67 objects:v80 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          int v61 = v38;
          id v46 = v35;
          uint64_t v47 = *(void *)v68;
          while (2)
          {
            for (uint64_t k = 0; k != v45; ++k)
            {
              if (*(void *)v68 != v47) {
                objc_enumerationMutation(v42);
              }
              if ([v11 isSupportedAttachmentUTI:*(void *)(*((void *)&v67 + 1) + 8 * k)])
              {
                int v38 = 1;
                id v35 = v46;
                id v4 = v62;
                goto LABEL_69;
              }
            }
            uint64_t v45 = [v42 countByEnumeratingWithState:&v67 objects:v80 count:16];
            if (v45) {
              continue;
            }
            break;
          }
          id v35 = v46;
          id v4 = v62;
          int v38 = v61;
        }
      }
LABEL_69:
    }
    uint64_t v37 = [v35 countByEnumeratingWithState:&v71 objects:v83 count:16];
    if (v37) {
      continue;
    }
    break;
  }

  if ((v38 & 1) == 0)
  {
    v12 = v57;
    unint64_t v22 = v56 & 0xFFFFFFFFFFFFF7FFLL;
    id v7 = v58;
    goto LABEL_77;
  }
LABEL_75:
  v12 = v57;
  id v7 = v58;
  unint64_t v22 = v56;
LABEL_77:
  if ((_UIActivityItemTypes() & 0x4000) != 0)
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v49 = v4;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v63 objects:v79 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v64;
      while (2)
      {
        for (uint64_t m = 0; m != v51; ++m)
        {
          if (*(void *)v64 != v52) {
            objc_enumerationMutation(v49);
          }
          uint64_t v54 = *(void *)(*((void *)&v63 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && [MEMORY[0x1E4F9F6B8] isSWYActivityItemProvider:v54])
          {

            goto LABEL_89;
          }
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v63 objects:v79 count:16];
        if (v51) {
          continue;
        }
        break;
      }

      v22 &= ~0x4000uLL;
LABEL_89:
      v12 = v57;
      id v7 = v58;
    }
    else
    {

      v22 &= ~0x4000uLL;
    }
  }
  if ((_UIActivityItemTypes() & v22) == 0) {
    goto LABEL_42;
  }
  BOOL v31 = (_UIActivityItemTypes() & (v59 | v60)) == 0;
LABEL_43:

LABEL_44:
  return v31;
}

- (id)_backgroundPreheatBlock
{
  return &__block_literal_global_11;
}

void __44__UIMessageActivity__backgroundPreheatBlock__block_invoke()
{
  v0 = [(objc_class *)getIMSharedMessageSendingUtilitiesClass() sharedInstance];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__UIMessageActivity__backgroundPreheatBlock__block_invoke_2;
  block[3] = &unk_1E5A21900;
  id v3 = v0;
  id v1 = v0;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __44__UIMessageActivity__backgroundPreheatBlock__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) canSendText];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 isMMSEnabled];
  }
  return result;
}

+ (void)_preheatAsyncIfNeeded
{
  unsigned __int8 v2 = atomic_load(__shouldPreheatMessageActivity);
  if (v2)
  {
    id v4 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__UIMessageActivity__preheatAsyncIfNeeded__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = a1;
    dispatch_async(v4, block);
  }
}

void __42__UIMessageActivity__preheatAsyncIfNeeded__block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v2, OS_LOG_TYPE_DEFAULT, "Starting Message activity preheating", buf, 2u);
  }

  unsigned __int8 v3 = atomic_load(__shouldPreheatMessageActivity);
  if (v3)
  {
    v5 = share_sheet_log();
    v6 = share_sheet_log();
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, *(const void **)(a1 + 32));

    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)id v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PreheatMessageActivity", "framework=MessageUI", v23, 2u);
    }

    Class MFMessageComposeViewControllerClass = getMFMessageComposeViewControllerClass();
    v8 = share_sheet_log();
    v9 = share_sheet_log();
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, *(const void **)(a1 + 32));

    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)unint64_t v22 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v8, OS_SIGNPOST_INTERVAL_END, v10, "PreheatMessageActivity", (const char *)&unk_1A0BA1E03, v22, 2u);
    }
  }
  else
  {
    Class MFMessageComposeViewControllerClass = 0;
  }
  unsigned __int8 v11 = atomic_load(__shouldPreheatMessageActivity);
  if (v11)
  {
    v12 = share_sheet_log();
    int v13 = share_sheet_log();
    os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, *(const void **)(a1 + 32));

    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PreheatMessageActivity", "framework=ChatKit", v21, 2u);
    }

    [(objc_class *)MFMessageComposeViewControllerClass _preloadDependencies];
    int v15 = share_sheet_log();
    uint64_t v16 = share_sheet_log();
    os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, *(const void **)(a1 + 32));

    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v15, OS_SIGNPOST_INTERVAL_END, v17, "PreheatMessageActivity", (const char *)&unk_1A0BA1E03, v20, 2u);
    }
  }
  atomic_store(0, __shouldPreheatMessageActivity);
  uint64_t v18 = share_sheet_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_1A0AD8000, v18, OS_LOG_TYPE_DEFAULT, "Finished Message activity preheating", v19, 2u);
  }
}

- (void)setSessionID:(id)a3
{
}

- (void)setRecipients:(id)a3
{
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v92 = a3;
  atomic_store(0, __shouldPreheatMessageActivity);
  id v4 = (MFMessageComposeViewController *)objc_alloc_init(getMFMessageComposeViewControllerClass());
  messageComposeViewController = self->_messageComposeViewController;
  self->_messageComposeViewController = v4;

  [(MFMessageComposeViewController *)self->_messageComposeViewController setMessageComposeDelegate:self];
  v6 = [(UIMessageActivity *)self collaborationItem];
  int v7 = 0;
  BOOL v8 = 0;
  v98 = v6;
  if (![(UIMessageActivity *)self isCollaborative])
  {
    if ([v6 type])
    {
      v9 = [v6 itemProvider];
      if ([v9 supportsMessagesSendCopyRepresentation]) {
        BOOL v8 = (unint64_t)[v92 count] > 1;
      }
      else {
        BOOL v8 = 0;
      }

      os_signpost_id_t v10 = [v6 itemProvider];
      int v7 = [v10 supportsMessagesSendCopyRepresentation] ^ 1;
    }
    else
    {
      int v7 = 0;
      BOOL v8 = 0;
    }
  }
  v101 = self;
  if (v6) {
    int v11 = v7;
  }
  else {
    int v11 = 1;
  }
  char v102 = v11 | v8;
  if (((v11 | v8) & 1) == 0)
  {
    v12 = self;
    if (objc_opt_respondsToSelector())
    {
      int v13 = self->_messageComposeViewController;
      os_signpost_id_t v14 = share_sheet_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = [v6 itemProvider];
        uint64_t v16 = [v6 shareOptions];
        os_signpost_id_t v17 = [v98 metadata];
        [(UIMessageActivity *)v101 isCollaborative];
        uint64_t v18 = NSStringFromBOOL();
        *(_DWORD *)buf = 138413058;
        v123 = v15;
        __int16 v124 = 2112;
        v125 = v16;
        __int16 v126 = 2112;
        v127 = v17;
        __int16 v128 = 2112;
        v129 = v18;
        _os_log_impl(&dword_1A0AD8000, v14, OS_LOG_TYPE_DEFAULT, "insertCollaborationItemProvider:%@ collaborationShareOptions:%@ collaborationMetadata:%@ isCollaboration:%@", buf, 0x2Au);
      }
      uint64_t v19 = [v98 itemProvider];
      uint64_t v20 = [v98 shareOptions];
      uint64_t v21 = [v98 metadata];
      [(MFMessageComposeViewController *)v13 insertCollaborationItemProvider:v19 collaborationShareOptions:v20 collaborationMetadata:v21 isCollaboration:[(UIMessageActivity *)v101 isCollaborative]];
    }
    else
    {
      unint64_t v22 = share_sheet_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [v6 itemProvider];
        uint64_t v24 = [v6 options];
        uint64_t v25 = [v6 metadata];
        [(UIMessageActivity *)v101 isCollaborative];
        uint64_t v26 = NSStringFromBOOL();
        *(_DWORD *)buf = 138413058;
        v123 = v23;
        __int16 v124 = 2112;
        v125 = v24;
        __int16 v126 = 2112;
        v127 = v25;
        __int16 v128 = 2112;
        v129 = v26;
        _os_log_impl(&dword_1A0AD8000, v22, OS_LOG_TYPE_DEFAULT, "insertCollaborationItemProvider:%@ collaborationOptions:%@ collaborationMetadata:%@ isCollaboration:%@", buf, 0x2Au);

        v12 = v101;
      }

      v27 = v12->_messageComposeViewController;
      int v13 = [v98 itemProvider];
      uint64_t v19 = [v98 options];
      uint64_t v20 = [v98 metadata];
      [(MFMessageComposeViewController *)v27 insertCollaborationItemProvider:v13 collaborationOptions:v19 collaborationMetadata:v20 isCollaboration:[(UIMessageActivity *)v12 isCollaborative]];
    }
  }
  v28 = _UIActivityItemsGetStringsAndURLs(v92, 0);
  v29 = objc_opt_new();
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  obuint64_t j = v28;
  uint64_t v30 = [obj countByEnumeratingWithState:&v115 objects:v121 count:16];
  unint64_t v31 = 0x1E4F1C000uLL;
  v96 = v29;
  if (v30)
  {
    uint64_t v32 = v30;
    uint64_t v33 = *(void *)v116;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v116 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = *(void *)(*((void *)&v115 + 1) + 8 * v34);
        uint64_t v36 = [*(id *)(v31 + 2832) URLWithString:v35];
        uint64_t v37 = v36;
        if (!v36) {
          goto LABEL_30;
        }
        uint64_t v38 = [v36 scheme];
        if (!v38) {
          goto LABEL_30;
        }
        uint64_t v39 = (void *)v38;
        v40 = [v37 host];
        if (!v40 || ([v37 isFileURL] & 1) != 0)
        {

LABEL_30:
          [v29 addObject:v35];
          goto LABEL_31;
        }
        v41 = [(LPLinkMetadata *)v101->_linkMetadata originalURL];
        if ([v37 isEqual:v41])
        {

          v29 = v96;
        }
        else
        {
          v42 = [(LPLinkMetadata *)v101->_linkMetadata URL];
          int v104 = [v37 isEqual:v42];

          v29 = v96;
          unint64_t v31 = 0x1E4F1C000;
          if (!v104) {
            goto LABEL_30;
          }
        }
        id v43 = objc_alloc_init(getLPSharingMetadataWrapperClass());
        [v43 setHasFetchedSubresources:1];
        [v43 setMetadata:v101->_linkMetadata];
        uint64_t v44 = v101->_messageComposeViewController;
        id v45 = v37;
        id v46 = [v43 dataRepresentation];
        uint64_t v47 = v44;
        unint64_t v31 = 0x1E4F1C000;
        [(MFMessageComposeViewController *)v47 addRichLinkData:v46 withWebpageURL:v45];

LABEL_31:
        ++v34;
      }
      while (v32 != v34);
      uint64_t v48 = [obj countByEnumeratingWithState:&v115 objects:v121 count:16];
      uint64_t v32 = v48;
    }
    while (v48);
  }

  [v29 componentsJoinedByString:@" "];
  v91 = p_isa = (id *)&v101->super.super.isa;
  -[MFMessageComposeViewController setBody:](v101->_messageComposeViewController, "setBody:");
  uint64_t v50 = [MEMORY[0x1E4F1CA48] array];
  v97 = [MEMORY[0x1E4F1CA48] array];
  _UIActivityItemsGetAttachments(v92);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v105 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v51 = [v105 countByEnumeratingWithState:&v111 objects:v120 count:16];
  uint64_t v52 = v98;
  if (!v51) {
    goto LABEL_87;
  }
  uint64_t v53 = v51;
  uint64_t v54 = *(void *)v112;
  uint64_t v94 = *MEMORY[0x1E4F22610];
  uint64_t v93 = *MEMORY[0x1E4F22678];
  CFStringRef inTagClass = (const __CFString *)*MEMORY[0x1E4F224F8];
  uint64_t v103 = *MEMORY[0x1E4F22688];
  uint64_t v100 = 1;
  v99 = v50;
  do
  {
    for (uint64_t i = 0; i != v53; ++i)
    {
      if (*(void *)v112 != v54) {
        objc_enumerationMutation(v105);
      }
      unint64_t v56 = *(void **)(*((void *)&v111 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ((v102 & 1) == 0)
        {
          if (![v52 type]
            || ([v52 itemProvider],
                v57 = objc_claimAutoreleasedReturnValue(),
                int v58 = [v57 supportsMessagesSendCopyRepresentation],
                v57,
                v58))
          {
            share_sheet_log();
            uint64_t v59 = (UIImage *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v59->super, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A0AD8000, &v59->super, OS_LOG_TYPE_DEFAULT, "not providing file URL as attachment because we already provided a collaboration item with a file.", buf, 2u);
            }
            goto LABEL_84;
          }
        }
        uint64_t v59 = [p_isa _attachmentNameForActivityItem:v56];
        [p_isa[20] addAttachmentURL:v56 withAlternateFilename:v59];
        _UIActivityUTIForURL(v56);
        uint64_t v60 = (UIImage *)objc_claimAutoreleasedReturnValue();
        if (![(UIImage *)v60 isEqualToString:v103])
        {
          long long v77 = v50;
          long long v78 = v60;
          goto LABEL_82;
        }
        long long v64 = NSString;
        long long v65 = [v56 path];
        long long v66 = [v64 stringWithContentsOfFile:v65 encoding:4 error:0];

        if (v66) {
          [v97 addObject:v66];
        }

        uint64_t v50 = v99;
LABEL_83:

        goto LABEL_84;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v59 = [p_isa _dataTypeIdentifierForActivityItem:v56];
        if (v59) {
          goto LABEL_51;
        }
        v79 = CGImageSourceCreateWithData((CFDataRef)v56, 0);
        if (v79)
        {
          v80 = v79;
          CGImageSourceGetType(v79);
          uint64_t v59 = (UIImage *)objc_claimAutoreleasedReturnValue();
          CFRelease(v80);
          if (!v59) {
            goto LABEL_84;
          }
LABEL_51:
          uint64_t v60 = [p_isa _attachmentNameForActivityItem:v56];
          if (![(UIImage *)v60 length])
          {
            objc_msgSend(NSString, "stringWithFormat:", @"Attachment-%ld", v100);
            int v61 = (UIImage *)objc_claimAutoreleasedReturnValue();

            CFStringRef v62 = UTTypeCopyPreferredTagWithClass((CFStringRef)v59, inTagClass);
            if (v62)
            {
              CFStringRef v63 = v62;
              uint64_t v60 = [(UIImage *)v61 stringByAppendingPathExtension:v62];

              CFRelease(v63);
              ++v100;
            }
            else
            {
              ++v100;
              uint64_t v60 = v61;
            }
            uint64_t v52 = v98;
            uint64_t v50 = v99;
          }
          [p_isa[20] addAttachmentData:v56 typeIdentifier:v59 filename:v60];
          if ([(UIImage *)v59 isEqualToString:v103])
          {
            v81 = (void *)[[NSString alloc] initWithData:v56 encoding:4];
            if (v81) {
              [v97 addObject:v81];
            }

            goto LABEL_83;
          }
          long long v77 = v50;
          long long v78 = v59;
LABEL_82:
          [v77 addObject:v78];
          goto LABEL_83;
        }
        uint64_t v59 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        uint64_t v59 = v56;
        [(UIImage *)v59 size];
        BOOL v69 = v68 < 512.0 && v67 <= 512.0;
        long long v70 = [p_isa _attachmentNameForActivityItem:v59];
        if (![v70 length])
        {
          long long v71 = @"jpg";
          if (v69) {
            long long v71 = @"png";
          }
          uint64_t v72 = [NSString stringWithFormat:@"Image-%ld.%@", v100, v71];

          ++v100;
          p_isa = (id *)&v101->super.super.isa;
          long long v70 = (void *)v72;
        }
        if (v69)
        {
          long long v73 = UIImagePNGRepresentation(v59);
          id v74 = p_isa[20];
          long long v75 = v73;
          uint64_t v76 = v93;
        }
        else
        {
          long long v73 = UIImageJPEGRepresentation(v59, 0.8);
          id v74 = p_isa[20];
          long long v75 = v73;
          uint64_t v76 = v94;
        }
        [v74 addAttachmentData:v75 typeIdentifier:v76 filename:v70];
        [v50 addObject:v76];

        uint64_t v52 = v98;
      }
LABEL_84:
    }
    uint64_t v53 = [v105 countByEnumeratingWithState:&v111 objects:v120 count:16];
  }
  while (v53);
LABEL_87:
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v82 = v92;
  uint64_t v83 = [v82 countByEnumeratingWithState:&v107 objects:v119 count:16];
  if (v83)
  {
    uint64_t v84 = v83;
    uint64_t v85 = *(void *)v108;
    while (2)
    {
      for (uint64_t j = 0; j != v84; ++j)
      {
        if (*(void *)v108 != v85) {
          objc_enumerationMutation(v82);
        }
        uint64_t v87 = [(UIActivity *)v101 _subjectForActivityItem:*(void *)(*((void *)&v107 + 1) + 8 * j)];
        if (v87)
        {
          v88 = (void *)v87;
          p_isa = (id *)&v101->super.super.isa;
          [(MFMessageComposeViewController *)v101->_messageComposeViewController setSubject:v87];

          goto LABEL_97;
        }
      }
      uint64_t v84 = [v82 countByEnumeratingWithState:&v107 objects:v119 count:16];
      p_isa = (id *)&v101->super.super.isa;
      if (v84) {
        continue;
      }
      break;
    }
  }
LABEL_97:

  v89 = _UIActivityItemsGetStrings(v82, 0);
  if (v89) {
    [v97 addObjectsFromArray:v89];
  }
  if ([v50 count]) {
    [p_isa[20] setUTITypes:v50];
  }
  v90 = _UIActivityItemsGetWebURLs(v82, 1);
  if ([v90 count]) {
    [p_isa[20] setContentURLs:v90];
  }
  if ([v97 count]) {
    [p_isa[20] setContentText:v97];
  }
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__UIMessageActivity__prepareWithActivityItems_completion___block_invoke;
  v8[3] = &unk_1E5A21B08;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(UIActivity *)self _loadItemProvidersFromActivityItems:a3 completion:v8];
}

uint64_t __58__UIMessageActivity__prepareWithActivityItems_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) prepareWithActivityItems:a2];
  unsigned __int8 v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (id)activityViewController
{
  return self->_messageComposeViewController;
}

- (MFMessageComposeViewController)messageComposeViewController
{
  return self->_messageComposeViewController;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  [(UIActivity *)self activityDidFinish:a4 == 1];
}

- (void)_cleanup
{
  [(MFMessageComposeViewController *)self->_messageComposeViewController setMessageComposeDelegate:0];
  [(UIMessageActivity *)self setMessageComposeViewController:0];
}

- (SFCollaborationItem)collaborationItem
{
  return self->_collaborationItem;
}

- (void)setCollaborationItem:(id)a3
{
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (NSString)sourceApplicationBundleID
{
  return self->_sourceApplicationBundleID;
}

- (void)setSourceApplicationBundleID:(id)a3
{
}

- (SFPeopleSuggestion)peopleSuggestion
{
  return self->_peopleSuggestion;
}

- (void)setPeopleSuggestion:(id)a3
{
}

- (void)setMessageComposeViewController:(id)a3
{
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_messageComposeViewController, 0);
  objc_storeStrong((id *)&self->_peopleSuggestion, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleID, 0);
  objc_storeStrong((id *)&self->_collaborationItem, 0);
}

@end