@interface UIMailActivity
+ (id)applicationBundleID;
+ (int64_t)activityCategory;
+ (unint64_t)_xpcAttributes;
- ($7D24B5AD5894795FD85A0EE1D817D743)_checkCanSendMail;
- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_managesOwnPresentation;
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_restoreDraft;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)canShareURLThroughMail:(id)a3;
- (BOOL)hasAnyAccount;
- (BOOL)hasValidAccountForSending;
- (BOOL)isContentManaged;
- (BOOL)keyboardVisible;
- (MFMailComposeViewController)mailComposeViewController;
- (NSString)autosaveIdentifier;
- (NSString)sourceApplicationBundleID;
- (NSString)subject;
- (SFCollaborationItem)collaborationItem;
- (UIMailActivity)init;
- (id)_backgroundPreheatBlock;
- (id)_bundleIdentifierForActivityImageCreation;
- (id)_mailDraftRestorationURL;
- (id)_stateRestorationDraftIsAvailable;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)_cleanup;
- (void)_deleteMailDraftIdentifierRestorationArchive:(id)a3;
- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4;
- (void)_saveDraft:(id)a3;
- (void)autosaveWithHandler:(id)a3;
- (void)dealloc;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)prepareWithActivityItems:(id)a3;
- (void)setAutosaveIdentifier:(id)a3;
- (void)setCollaborationItem:(id)a3;
- (void)setHasAnyAccount:(BOOL)a3;
- (void)setHasValidAccountForSending:(BOOL)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setKeyboardVisible:(BOOL)a3;
- (void)setMailComposeViewController:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSourceApplicationBundleID:(id)a3;
- (void)setSubject:(id)a3;
@end

@implementation UIMailActivity

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
  return @"com.apple.mobilemail";
}

- (UIMailActivity)init
{
  v7.receiver = self;
  v7.super_class = (Class)UIMailActivity;
  uint64_t v2 = [(UIActivity *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_canSendMailLock._os_unfair_lock_opaque = 0;
    v2->_canSendMailChecked = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __22__UIMailActivity_init__block_invoke;
    v5[3] = &unk_1E5A21900;
    v6 = v2;
    sh_dispatch_on_main_queue(v5);
  }
  return v3;
}

void __22__UIMailActivity_init__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4FB1438];
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = NSString;
  id v5 = [v2 activityType];
  v4 = [v3 stringWithFormat:@"_$_%@_Restoration_$_", v5];
  [v1 registerObjectForStateRestoration:v2 restorationIdentifier:v4];
}

- (void)dealloc
{
  [(NSString *)self->_autosaveIdentifier setMailComposeDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)UIMailActivity;
  [(UIMailActivity *)&v3 dealloc];
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.Mail";
}

- (id)_bundleIdentifierForActivityImageCreation
{
  uint64_t v2 = objc_opt_class();
  return (id)[v2 applicationBundleID];
}

- (id)activityTitle
{
  uint64_t v2 = _ShareSheetBundle();
  objc_super v3 = [v2 localizedStringForKey:@"Mail[Activity]" value:@"Mail" table:@"Localizable"];

  return v3;
}

- (id)_mailDraftRestorationURL
{
  objc_super v3 = NSString;
  v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v5 = [v4 objectAtIndex:0];
  v6 = [(UIMailActivity *)self activityType];
  objc_super v7 = [v3 stringWithFormat:@"%@/%@.savedMailDraftIdentifier.data", v5, v6];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v7 isDirectory:0];
  return v8;
}

- (void)_saveDraft:(id)a3
{
  v10[8] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UIMailActivity *)self _mailDraftRestorationURL];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v6 encodeObject:v4 forKey:@"kSavedMailDraftIdentifierKey"];
  objc_super v7 = [v6 encodedData];
  v10[0] = 0;
  [v7 writeToURL:v5 options:805306369 error:v10];
  id v8 = v10[0];

  if (v8)
  {
    v9 = share_sheet_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(UIMailActivity *)(uint64_t)v4 _saveDraft:v9];
    }
  }
  [v6 finishEncoding];
}

- (void)_deleteMailDraftIdentifierRestorationArchive:(id)a3
{
  v5[8] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5[0] = 0;
  [v4 removeItemAtURL:v3 error:v5];
}

- (id)_stateRestorationDraftIsAvailable
{
  v15[8] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = [(UIMailActivity *)self _mailDraftRestorationURL];
  if (v3 && [(UIMailActivity *)self canShareURLThroughMail:v3])
  {
    v15[0] = 0;
    uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:0 error:v15];
    id v5 = v15[0];
    v6 = v5;
    int v7 = 0;
    id v8 = 0;
    uint64_t v9 = 0;
    if (v4 && !v5)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:0];
      [v8 setRequiresSecureCoding:1];
      uint64_t v9 = [v8 decodeObjectOfClass:objc_opt_class() forKey:@"kSavedMailDraftIdentifierKey"];
      if (v9) {
        int v7 = [(objc_class *)getMFMailComposeViewControllerClass() hasAutosavedMessageWithIdentifier:v9];
      }
      else {
        int v7 = 0;
      }
    }

    v12 = (void *)v4;
    v10 = (void *)v9;
    [v8 finishDecoding];
    v11 = (void *)v9;
    if (!v7)
    {
      [(UIMailActivity *)self _deleteMailDraftIdentifierRestorationArchive:v3];
      v11 = 0;
    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  id v13 = v11;

  return v13;
}

- (BOOL)_restoreDraft
{
  id v3 = [(UIMailActivity *)self _stateRestorationDraftIsAvailable];
  if (v3)
  {
    uint64_t v4 = [(UIMailActivity *)self mailComposeViewController];
    [v4 recoverAutosavedMessageWithIdentifier:v3];
  }
  return v3 != 0;
}

- (void)autosaveWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(UIMailActivity *)self mailComposeViewController];
  [v5 autosaveWithHandler:v4];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v5 = [(id)objc_opt_class() applicationBundleID];
  char CanDisplayActivityForApplicationWithBundleID = _UIActivityCanDisplayActivityForApplicationWithBundleID((uint64_t)v5);

  if ((CanDisplayActivityForApplicationWithBundleID & 1) == 0)
  {
    v12 = share_sheet_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = 0;
      id v13 = "UIMailActivity: Can't display activity";
      v14 = (uint8_t *)&v18;
LABEL_14:
      _os_log_impl(&dword_1A0AD8000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    }
LABEL_15:

    return 0;
  }
  $7D24B5AD5894795FD85A0EE1D817D743 v7 = ($7D24B5AD5894795FD85A0EE1D817D743)[(UIMailActivity *)self _checkCanSendMail];
  id v8 = [(objc_class *)getMCProfileConnectionClass_0() sharedConnection];
  uint64_t v9 = [v8 hasAnyMailAccountIgnoringFiltering];

  [(UIMailActivity *)self setHasAnyAccount:v9];
  if ([(UIMailActivity *)self isContentManaged]) {
    int v10 = 1;
  }
  else {
    int v10 = 2;
  }
  [(UIMailActivity *)self setHasValidAccountForSending:(v10 & *(_DWORD *)&v7) != 0];
  if ([(UIMailActivity *)self hasAnyAccount]
    && ![(UIMailActivity *)self hasValidAccountForSending])
  {
    v12 = share_sheet_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      id v13 = "UIMailActivity: No valid account for sending";
      v14 = (uint8_t *)&v17;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (a3) {
    return (_UIActivityItemTypes() & 0x98F) != 0;
  }
  v15 = [(UIMailActivity *)self _stateRestorationDraftIsAvailable];
  BOOL v11 = v15 != 0;

  return v11;
}

- (BOOL)canShareURLThroughMail:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 scheme];
    if (v5)
    {
      v6 = (void *)v5;
      $7D24B5AD5894795FD85A0EE1D817D743 v7 = [v4 host];

      if (v7) {
        goto LABEL_6;
      }
    }
  }
  if (![v4 isFileURL])
  {
    int v10 = share_sheet_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[UIMailActivity canShareURLThroughMail:](v4);
    }
    goto LABEL_11;
  }
  id v8 = v4;
  [v8 fileSystemRepresentation];
  if (!sandbox_extension_issue_file())
  {
    int v10 = share_sheet_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[UIMailActivity canShareURLThroughMail:](v8, v10);
    }
LABEL_11:

    BOOL v9 = 0;
    goto LABEL_12;
  }
LABEL_6:
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- ($7D24B5AD5894795FD85A0EE1D817D743)_checkCanSendMail
{
  id v3 = share_sheet_log();
  id v4 = share_sheet_log();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);

  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CheckCanSendMail", " enableTelemetry=YES ", buf, 2u);
  }

  os_unfair_lock_lock(&self->_canSendMailLock);
  if (!self->_canSendMailChecked)
  {
    v6 = [(objc_class *)getMCProfileConnectionClass_0() sharedConnection];
    $7D24B5AD5894795FD85A0EE1D817D743 v7 = [MEMORY[0x1E4F28B50] mainBundle];
    id v8 = [v7 bundleIdentifier];

    if ([v6 canSendMail:v8 sourceAccountManagement:1]) {
      char v9 = 2;
    }
    else {
      char v9 = 0;
    }
    *(&self->_managesOwnPresentationChecked + 1) = *(&self->_managesOwnPresentationChecked + 1) & 0xFD | v9;
    *(&self->_managesOwnPresentationChecked + 1) = *(&self->_managesOwnPresentationChecked + 1) & 0xFE | [v6 canSendMail:v8 sourceAccountManagement:2];
    self->_canSendMailChecked = 1;
  }
  $7D24B5AD5894795FD85A0EE1D817D743 v10 = ($7D24B5AD5894795FD85A0EE1D817D743)*((unsigned __int8 *)&self->_managesOwnPresentationChecked + 1);
  os_unfair_lock_unlock(&self->_canSendMailLock);
  BOOL v11 = share_sheet_log();
  v12 = share_sheet_log();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v11, OS_SIGNPOST_INTERVAL_END, v13, "CheckCanSendMail", " enableTelemetry=YES ", v15, 2u);
  }

  return v10;
}

- (id)_backgroundPreheatBlock
{
  id v3 = [(id)objc_opt_class() applicationBundleID];
  id location = 0;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__UIMailActivity__backgroundPreheatBlock__block_invoke;
  v7[3] = &unk_1E5A21AB8;
  id v8 = v3;
  id v4 = v3;
  objc_copyWeak(&v9, &location);
  os_signpost_id_t v5 = (void *)MEMORY[0x1A6229A90](v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v5;
}

void __41__UIMailActivity__backgroundPreheatBlock__block_invoke(uint64_t a1)
{
  _UIActivityCanDisplayActivityForApplicationWithBundleID(*(void *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _checkCanSendMail];
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  id v118 = a3;
  v134 = self;
  if ([(UIMailActivity *)self hasValidAccountForSending])
  {
    id v4 = objc_alloc(getMFMailComposeViewControllerClass());
    if ([(UIMailActivity *)self isContentManaged]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    v6 = (NSString *)[v4 initWithURL:0 sourceAccountManagement:v5];
    autosaveIdentifier = self->_autosaveIdentifier;
    self->_autosaveIdentifier = v6;

    [(NSString *)self->_autosaveIdentifier setMailComposeDelegate:self];
    [(NSString *)self->_autosaveIdentifier setKeyboardVisible:[(UIMailActivity *)self keyboardVisible]];
    id v8 = [(UIMailActivity *)self collaborationItem];
    v127 = [v8 cloudSharingResult];

    if (!v127
      || ([(UIMailActivity *)self collaborationItem],
          id v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 type],
          v9,
          v10 == 2))
    {
LABEL_45:
      v40 = [(UIMailActivity *)v134 autosaveIdentifier];
      if (v40)
      {
        Class MFMailComposeViewControllerClass = getMFMailComposeViewControllerClass();
        v42 = [(UIMailActivity *)v134 autosaveIdentifier];
        LODWORD(MFMailComposeViewControllerClass) = [(objc_class *)MFMailComposeViewControllerClass hasAutosavedMessageWithIdentifier:v42];

        if (MFMailComposeViewControllerClass)
        {
          v43 = v134->_autosaveIdentifier;
          v44 = [(UIMailActivity *)v134 autosaveIdentifier];
          [(NSString *)v43 recoverAutosavedMessageWithIdentifier:v44];
        }
      }
      if ([v118 count] || !-[UIMailActivity _restoreDraft](v134, "_restoreDraft"))
      {
        id v132 = [MEMORY[0x1E4F1CA48] array];
        v129 = [MEMORY[0x1E4F1CA48] array];
        _UIActivityItemsGetStringsAndURLs(v118, 1);
        long long v162 = 0u;
        long long v163 = 0u;
        long long v160 = 0u;
        long long v161 = 0u;
        id v120 = (id)objc_claimAutoreleasedReturnValue();
        LOBYTE(v45) = 0;
        uint64_t v46 = [v120 countByEnumeratingWithState:&v160 objects:v171 count:16];
        if (!v46)
        {
          id obj = 0;
LABEL_69:

          goto LABEL_70;
        }
        id obj = 0;
        uint64_t v47 = *(void *)v161;
LABEL_52:
        uint64_t v48 = 0;
        while (1)
        {
          if (*(void *)v161 != v47) {
            objc_enumerationMutation(v120);
          }
          v49 = *(void **)(*((void *)&v160 + 1) + 8 * v48);
          if (!obj)
          {
            id obj = [(UIActivity *)v134 _subjectForActivityItem:v49];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            LOBYTE(v45) = 1;
            goto LABEL_63;
          }
          unint64_t v50 = [v49 length];
          uint64_t v51 = v50 >= 0x400 ? 1024 : v50;
          objc_msgSend(v49, "rangeOfString:options:range:", @"<html", 1, 0, v51);
          if (v52) {
            break;
          }
LABEL_63:
          if (v46 == ++v48)
          {
            uint64_t v46 = [v120 countByEnumeratingWithState:&v160 objects:v171 count:16];
            if (!v46) {
              goto LABEL_69;
            }
            goto LABEL_52;
          }
        }
        id v45 = v49;

        if (v45)
        {
          id v53 = v45;
          v54 = v134;
          goto LABEL_101;
        }
LABEL_70:
        long long v158 = 0u;
        long long v159 = 0u;
        long long v156 = 0u;
        long long v157 = 0u;
        id v55 = v120;
        uint64_t v56 = [v55 countByEnumeratingWithState:&v156 objects:v170 count:16];
        if (!v56)
        {

          goto LABEL_102;
        }
        id v57 = 0;
        uint64_t v58 = *(void *)v157;
LABEL_72:
        uint64_t v59 = 0;
        while (1)
        {
          if (*(void *)v157 != v58) {
            objc_enumerationMutation(v55);
          }
          uint64_t v60 = *(void *)(*((void *)&v156 + 1) + 8 * v59);
          if (!v57)
          {
            if (v45)
            {
              v61 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1EF308000];
            }
            else
            {
              v61 = [MEMORY[0x1E4F28E78] stringWithCapacity:0];
            }
            id v57 = v61;
          }
          if (!obj)
          {
            id obj = [(UIActivity *)v134 _subjectForActivityItem:v60];
          }
          if ([v57 length])
          {
            if (v45)
            {
              v62 = [v57 mutableString];
              [v62 appendString:@"\n"];

LABEL_86:
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v57 appendAttributedString:v60];
              }
              else
              {
                id v63 = objc_alloc(MEMORY[0x1E4F28B18]);
                v64 = [NSString stringWithFormat:@"%@", v60];
                v65 = (void *)[v63 initWithString:v64];
                [v57 appendAttributedString:v65];
              }
              goto LABEL_91;
            }
            [v57 appendString:@"\n"];
          }
          else if (v45)
          {
            goto LABEL_86;
          }
          [v57 appendString:v60];
LABEL_91:
          if (v56 == ++v59)
          {
            uint64_t v56 = [v55 countByEnumeratingWithState:&v156 objects:v170 count:16];
            if (v56) {
              goto LABEL_72;
            }

            if (((v57 != 0) & v45) == 1)
            {
              v66 = (void *)[objc_alloc(MEMORY[0x1E4FB1368]) initWithAttributedString:v57];
              id v67 = [NSString alloc];
              v68 = [v66 HTMLData];
              v69 = (void *)[v67 initWithData:v68 encoding:4];

              if ([v69 length])
              {
                id v70 = v69;
              }
              else
              {
                id v70 = [v57 string];

                id v57 = v70;
              }

              id v53 = v70;
            }
            else
            {
              id v53 = v57;
            }
            v54 = v134;
            if (v53)
            {
LABEL_101:
              v126 = v53;
              -[NSString setMessageBody:isHTML:](v54->_autosaveIdentifier, "setMessageBody:isHTML:");
              goto LABEL_103;
            }
LABEL_102:
            v126 = 0;
LABEL_103:
            long long v154 = 0u;
            long long v155 = 0u;
            long long v152 = 0u;
            long long v153 = 0u;
            _UIActivityItemsGetImages(v118, 0, 0);
            id v130 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v71 = [v130 countByEnumeratingWithState:&v152 objects:v169 count:16];
            if (!v71) {
              goto LABEL_120;
            }
            uint64_t v72 = *(void *)v153;
            uint64_t v128 = *MEMORY[0x1E4F22610];
            uint64_t v73 = *MEMORY[0x1E4F22678];
            uint64_t v74 = 1;
            while (2)
            {
              uint64_t v75 = 0;
LABEL_106:
              if (*(void *)v153 != v72) {
                objc_enumerationMutation(v130);
              }
              v76 = *(UIImage **)(*((void *)&v152 + 1) + 8 * v75);
              [(UIImage *)v76 size];
              BOOL v79 = v78 < 512.0 && v77 <= 512.0;
              v80 = [(UIActivity *)v134 _attachmentNameForActivityItem:v76];
              if ([v80 length])
              {
                if (v79) {
                  goto LABEL_113;
                }
LABEL_117:
                v81 = UIImageJPEGRepresentation(v76, 0.8);
                [v132 addObject:v128];
                [(NSString *)v134->_autosaveIdentifier addAttachmentData:v81 mimeType:@"image/jpeg" fileName:v80];
              }
              else
              {
                v82 = @"jpg";
                if (v79) {
                  v82 = @"png";
                }
                uint64_t v83 = [NSString stringWithFormat:@"Image-%ld.%@", v74, v82];

                ++v74;
                v80 = (void *)v83;
                if (!v79) {
                  goto LABEL_117;
                }
LABEL_113:
                v81 = UIImagePNGRepresentation(v76);
                [v132 addObject:v73];
                [(NSString *)v134->_autosaveIdentifier addAttachmentData:v81 mimeType:@"image/png" fileName:v80];
              }

              if (v71 == ++v75)
              {
                uint64_t v71 = [v130 countByEnumeratingWithState:&v152 objects:v169 count:16];
                if (v71) {
                  continue;
                }
LABEL_120:

                uint64_t v148 = 0;
                v149 = &v148;
                uint64_t v150 = 0x2020000000;
                uint64_t v151 = 1;
                long long v144 = 0u;
                long long v145 = 0u;
                long long v146 = 0u;
                long long v147 = 0u;
                id v84 = v118;
                uint64_t v85 = [v84 countByEnumeratingWithState:&v144 objects:v168 count:16];
                p_isa = (id *)&v134->super.super.isa;
                if (!v85) {
                  goto LABEL_174;
                }
                id v131 = *(id *)v145;
                CFStringRef inTagClass = (const __CFString *)*MEMORY[0x1E4F22500];
                CFStringRef v123 = (const __CFString *)*MEMORY[0x1E4F224F8];
                uint64_t v124 = *MEMORY[0x1E4F22688];
                uint64_t v122 = *MEMORY[0x1E4F224D0];
                v119 = (void *)*MEMORY[0x1E4F224C8];
                CFStringRef inConformsToUTI = (const __CFString *)*MEMORY[0x1E4F22680];
                while (2)
                {
                  uint64_t v87 = 0;
LABEL_123:
                  if (*(id *)v145 != v131) {
                    objc_enumerationMutation(v84);
                  }
                  v88 = *(void **)(*((void *)&v144 + 1) + 8 * v87);
                  if (!obj)
                  {
                    id obj = [p_isa _subjectForActivityItem:v88];
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v139[0] = MEMORY[0x1E4F143A8];
                    v139[1] = 3221225472;
                    v139[2] = __43__UIMailActivity_prepareWithActivityItems___block_invoke;
                    v139[3] = &unk_1E5A21AE0;
                    v143 = &v148;
                    v140 = v129;
                    id v141 = v132;
                    v142 = p_isa;
                    [v88 enumerateKeysAndObjectsUsingBlock:v139];

                    v89 = v140;
                    goto LABEL_129;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v89 = v88;
                    if ([(__CFString *)v89 isFileURL]
                      && [p_isa canShareURLThroughMail:v89])
                    {
                      _UIActivityUTIForURL(v89);
                      v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      if ([(__CFString *)v90 isEqualToString:v122])
                      {
                        v91 = v119;

                        v90 = v91;
                        p_isa = (id *)&v134->super.super.isa;
                      }
                      if (v90)
                      {
                        if (UTTypeConformsTo(v90, inConformsToUTI)
                          && (v92 = (void *)softLinkQLTypeCopyUTIForURLAndMimeType(v89, @"application/octet-stream")) != 0)
                        {
                          v93 = v92;

                          v94 = @"application/octet-stream";
                          p_isa = (id *)&v134->super.super.isa;
                        }
                        else
                        {
                          v94 = (__CFString *)UTTypeCopyPreferredTagWithClass(v90, inTagClass);
                          if (!v94)
                          {
                            uint64_t v107 = softLinkQLTypeCopyBestMimeTypeForURLAndMimeType(v89, 0);
                            if (v107) {
                              v94 = (__CFString *)v107;
                            }
                            else {
                              v94 = @"application/octet-stream";
                            }
                          }
                          v93 = v90;
                        }
                        if ([(__CFString *)v93 isEqualToString:v124])
                        {
                          v108 = NSString;
                          v109 = [(__CFString *)v89 path];
                          v110 = [v108 stringWithContentsOfFile:v109 encoding:4 error:0];

                          if (v110) {
                            [v129 addObject:v110];
                          }

                          p_isa = (id *)&v134->super.super.isa;
                        }
                        else
                        {
                          [v132 addObject:v93];
                        }
                        id v111 = (id)[p_isa[22] _addAttachmentWithFileURL:v89 mimeType:v94];
                      }
                    }
                    goto LABEL_129;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v89 = [p_isa _dataTypeIdentifierForActivityItem:v88];
                    if (v89) {
                      goto LABEL_143;
                    }
                    v98 = CGImageSourceCreateWithData((CFDataRef)v88, 0);
                    v99 = v98;
                    if (!v98)
                    {
                      v89 = 0;
                      goto LABEL_129;
                    }
                    CGImageSourceGetType(v98);
                    v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    CFRelease(v99);
                    if (v89)
                    {
LABEL_143:
                      v95 = (__CFString *)UTTypeCopyPreferredTagWithClass(v89, inTagClass);
                      if (v95) {
                        goto LABEL_144;
                      }
                      CFStringRef v100 = UTTypeCopyPreferredTagWithClass(v89, v123);
                      if (v100)
                      {
                        v101 = [@"aep" stringByAppendingPathExtension:v100];
                        v95 = (__CFString *)softLinkQLTypeCopyBestMimeTypeForFileNameAndMimeType(v101, 0);

                        CFRelease(v100);
                        p_isa = (id *)&v134->super.super.isa;
                        if (v95)
                        {
LABEL_144:
                          v96 = [p_isa _attachmentNameForActivityItem:v88];
                          if ([v96 length])
                          {
                            v97 = v96;
                          }
                          else
                          {
                            v102 = NSString;
                            uint64_t v103 = v149[3];
                            v149[3] = v103 + 1;
                            v97 = objc_msgSend(v102, "stringWithFormat:", @"Attachment-%ld", v103);

                            v104 = (__CFString *)UTTypeCopyPreferredTagWithClass(v89, v123);
                            if (v104)
                            {
                              uint64_t v105 = [v97 stringByAppendingPathExtension:v104];

                              v97 = (void *)v105;
                            }

                            p_isa = (id *)&v134->super.super.isa;
                          }
                          if ([(__CFString *)v89 isEqualToString:v124])
                          {
                            v106 = (void *)[[NSString alloc] initWithData:v88 encoding:4];
                            if (v106) {
                              [v129 addObject:v106];
                            }

                            p_isa = (id *)&v134->super.super.isa;
                          }
                          else
                          {
                            [v132 addObject:v89];
                          }
                          [p_isa[22] addAttachmentData:v88 mimeType:v95 fileName:v97];
                          CFRelease(v95);
                        }
                      }
                    }
LABEL_129:

                    p_isa = (id *)&v134->super.super.isa;
                  }
                  if (v85 == ++v87)
                  {
                    uint64_t v112 = [v84 countByEnumeratingWithState:&v144 objects:v168 count:16];
                    uint64_t v85 = v112;
                    if (!v112)
                    {
LABEL_174:

                      if (obj) {
                        [(UIMailActivity *)v134 setSubject:obj];
                      }
                      if ([v132 count]) {
                        [(NSString *)v134->_autosaveIdentifier setUTITypes:v132];
                      }
                      v113 = _UIActivityItemsGetWebURLs(v84, 1);
                      if ([v113 count]) {
                        [(NSString *)v134->_autosaveIdentifier setContentURLs:v113];
                      }
                      v114 = _UIActivityItemsGetStrings(v84, 0);
                      if (v114) {
                        [v129 addObjectsFromArray:v114];
                      }
                      if ([v129 count]) {
                        [(NSString *)v134->_autosaveIdentifier setContentText:v129];
                      }

                      _Block_object_dispose(&v148, 8);
                      goto LABEL_185;
                    }
                    continue;
                  }
                  goto LABEL_123;
                }
              }
              goto LABEL_106;
            }
          }
        }
      }
      goto LABEL_187;
    }
    BOOL v11 = [v127 error];

    if (v11)
    {
      v12 = share_sheet_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[UIMailActivity prepareWithActivityItems:](v127);
      }
      goto LABEL_44;
    }
    __int16 v17 = (void *)MEMORY[0x1E4F9F6B8];
    __int16 v18 = [(UIMailActivity *)v134 collaborationItem];
    v19 = [v18 options];
    id v166 = 0;
    id v165 = 0;
    id v164 = 0;
    [v17 getCKSharingOptionsFromOptions:v19 accessType:&v166 permissionType:&v165 allowOthersToInvite:&v164];
    v12 = v166;
    id v20 = v165;
    id v21 = v164;

    v22 = [(UIMailActivity *)v134 collaborationItem];
    BOOL v23 = [v22 type] == 1;

    if (v23)
    {
      v24 = [(UIMailActivity *)v134 collaborationItem];
      v25 = [v24 containerSetupInfo];
    }
    else
    {
      v25 = 0;
    }
    v35 = [(UIMailActivity *)v134 collaborationItem];
    BOOL v36 = [v35 type] == 0;

    if (v36)
    {
      v115 = [(UIMailActivity *)v134 collaborationItem];
      v37 = [v115 fileURL];

      if (v37 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v39 = +[UISUISecurityScopedResource sandboxingURLWrapperWithFileURL:v37 allowedAccess:2];
        if (v39)
        {
          v116 = v134->_autosaveIdentifier;
          v117 = [v127 share];
          -[NSString _setCKShareURLWrapper:share:permissionType:allowOthersToInvite:](v116, "_setCKShareURLWrapper:share:permissionType:allowOthersToInvite:", v39, v117, (int)[v20 intValue], objc_msgSend(v21, "BOOLValue"));
        }
        else
        {
          v117 = share_sheet_log();
          if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR)) {
            -[UIMailActivity prepareWithActivityItems:]((uint64_t)v37, v117);
          }
        }

        goto LABEL_43;
      }
    }
    else
    {
      v37 = 0;
    }
    v38 = v134->_autosaveIdentifier;
    v39 = [v127 share];
    -[NSString _setCKShare:setupContainerInfo:permissionType:allowOthersToInvite:](v38, "_setCKShare:setupContainerInfo:permissionType:allowOthersToInvite:", v39, v25, (int)[v20 intValue], objc_msgSend(v21, "BOOLValue"));
LABEL_43:

LABEL_44:
    goto LABEL_45;
  }
  if (![(UIMailActivity *)self hasAnyAccount]
    && ![(UIMailActivity *)self isContentManaged])
  {
    _UIActivityItemsGetStringsAndURLs(v118, 0);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    uint64_t v13 = [obj countByEnumeratingWithState:&v135 objects:v167 count:16];
    if (v13)
    {
      v126 = 0;
      v127 = 0;
      uint64_t v14 = *(void *)v136;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v136 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v135 + 1) + 8 * i);
          if (v127) {
            [v127 appendFormat:@"\n%@", *(void *)(*((void *)&v135 + 1) + 8 * i)];
          }
          else {
            v127 = (void *)[v16 mutableCopy];
          }
          if (!v126)
          {
            v126 = [(UIActivity *)self _subjectForActivityItem:v16];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v135 objects:v167 count:16];
      }
      while (v13);
    }
    else
    {
      v126 = 0;
      v127 = 0;
    }
    if (MessageLibrary_sOnce != -1) {
      dispatch_once(&MessageLibrary_sOnce, &__block_literal_global_324);
    }
    if ([v127 length]) {
      goto LABEL_33;
    }
    v26 = [(objc_class *)getMCProfileConnectionClass_0() sharedConnection];
    v27 = getMCFeatureAccountModificationAllowed();
    BOOL v28 = [v26 effectiveBoolValueForSetting:v27] == 2;

    if (v28
      || ([MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ACCOUNTS_AND_PASSWORDS&path=ADD_ACCOUNT"], v29 = objc_claimAutoreleasedReturnValue(), objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace"), v30 = objc_claimAutoreleasedReturnValue(), char v31 = objc_msgSend(v30, "openSensitiveURL:withOptions:", v29, 0), v30, v29, (v31 & 1) == 0))
    {
LABEL_33:
      id v132 = objc_alloc_init(MEMORY[0x1E4F29088]);
      [v132 setScheme:@"mailto"];
      v129 = [MEMORY[0x1E4F1CA48] array];
      if (v126)
      {
        v32 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"subject" value:v126];
        [v129 addObject:v32];
      }
      if (v127)
      {
        v33 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"body" value:v127];
        [v129 addObject:v33];
      }
      [v132 setQueryItems:v129];
      id v120 = [v132 URL];
      if (v120)
      {
        v34 = [MEMORY[0x1E4FB1438] sharedApplication];
        [v34 openURL:v120 options:MEMORY[0x1E4F1CC08] completionHandler:0];
      }
LABEL_185:
    }
LABEL_187:
  }
}

void __43__UIMailActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  inUTI = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x1E4F22660])
    && !UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x1E4F225F8]))
  {
    id v8 = (__CFString *)UTTypeCopyDescription(inUTI);
    id v9 = NSString;
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void *)(v10 + 24);
    *(void *)(v10 + 24) = v11 + 1;
    v12 = [v9 stringWithFormat:@"%@-%ld", v8, v11];
    uint64_t v13 = (__CFString *)UTTypeCopyPreferredTagWithClass(inUTI, (CFStringRef)*MEMORY[0x1E4F224F8]);
    if (v13)
    {
      uint64_t v14 = [v12 stringByAppendingPathExtension:v13];

      v12 = (void *)v14;
    }
    if ([(__CFString *)inUTI isEqualToString:*MEMORY[0x1E4F22688]])
    {
      v15 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
      if (v15) {
        [*(id *)(a1 + 32) addObject:v15];
      }
    }
    else
    {
      [*(id *)(a1 + 40) addObject:inUTI];
    }
    [*(id *)(*(void *)(a1 + 48) + 176) addAttachmentData:v7 mimeType:inUTI fileName:v12];
    *a4 = 1;
  }
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__UIMailActivity__prepareWithActivityItems_completion___block_invoke;
  v8[3] = &unk_1E5A21B08;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(UIActivity *)self _loadItemProvidersFromActivityItems:a3 completion:v8];
}

uint64_t __55__UIMailActivity__prepareWithActivityItems_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) prepareWithActivityItems:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)setRecipients:(id)a3
{
}

- (void)setSessionID:(id)a3
{
}

- (id)activityViewController
{
  return self->_autosaveIdentifier;
}

- (BOOL)_managesOwnPresentation
{
  if (self->_managesOwnPresentationChecked) {
    return _managesOwnPresentation_managesOwnPresentation != 0;
  }
  BOOL result = [(objc_class *)getMFMailComposeViewControllerClass() _canSendMailInNewScene];
  _managesOwnPresentation_managesOwnPresentation = result;
  self->_managesOwnPresentationChecked = 1;
  return result;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(UIMailActivity *)self _managesOwnPresentation];
  if (v10)
  {
    uint64_t v11 = [(UIMailActivity *)self mailComposeViewController];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__UIMailActivity__presentActivityOnViewController_animated_completion___block_invoke;
    v13[3] = &unk_1E5A21B30;
    id v14 = v8;
    v15 = self;
    BOOL v17 = a4;
    id v16 = v9;
    [v11 _presentComposeInNewWindowWithCompletion:v13];
  }
  return v10;
}

void __71__UIMailActivity__presentActivityOnViewController_animated_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    id v4 = share_sheet_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__UIMailActivity__presentActivityOnViewController_animated_completion___block_invoke_cold_1(v4);
    }

    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) mailComposeViewController];
    [v5 presentViewController:v6 animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];

    *(unsigned char *)(*(void *)(a1 + 40) + 135) = 1;
  }
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  BOOL v10 = [(UIMailActivity *)self _managesOwnPresentation];
  if (v10)
  {
    if (!v8)
    {
      if (!*(&self->_managesOwnPresentationChecked + 2))
      {
        v9[2](v9);
        id v8 = 0;
        goto LABEL_9;
      }
      id v8 = [(UIMailActivity *)self mailComposeViewController];
    }
    BOOL v11 = *(&self->_managesOwnPresentationChecked + 2) && v6;
    [v8 dismissViewControllerAnimated:v11 completion:v9];
  }
LABEL_9:

  return v10;
}

- (MFMailComposeViewController)mailComposeViewController
{
  return (MFMailComposeViewController *)self->_autosaveIdentifier;
}

- (void)setSubject:(id)a3
{
  id v6 = a3;
  id v4 = (NSString *)[v6 copy];
  sourceApplicationBundleID = self->_sourceApplicationBundleID;
  self->_sourceApplicationBundleID = v4;

  [(NSString *)self->_autosaveIdentifier setSubject:v6];
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
}

- (void)_cleanup
{
  *(&self->_managesOwnPresentationChecked + 2) = 0;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4 = [(UIMailActivity *)self mailComposeViewController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__UIMailActivity_encodeRestorableStateWithCoder___block_invoke;
  v5[3] = &unk_1E5A21B58;
  void v5[4] = self;
  [v4 autosaveWithHandler:v5];
}

void __49__UIMailActivity_encodeRestorableStateWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = objc_opt_class();
  Class Class = object_getClass(v5);
  if (Class == (Class)v3 || [(objc_class *)Class isSubclassOfClass:v3]) {
    [*(id *)(a1 + 32) _saveDraft:v5];
  }
}

- (SFCollaborationItem)collaborationItem
{
  return *(SFCollaborationItem **)&self->_hasValidAccountForSending;
}

- (void)setCollaborationItem:(id)a3
{
}

- (BOOL)isContentManaged
{
  return (BOOL)self->_canSendMail;
}

- (void)setIsContentManaged:(BOOL)a3
{
  *(unsigned char *)&self->_canSendMail = a3;
}

- (NSString)sourceApplicationBundleID
{
  return (NSString *)self->_collaborationItem;
}

- (void)setSourceApplicationBundleID:(id)a3
{
}

- (NSString)subject
{
  return self->_sourceApplicationBundleID;
}

- (BOOL)keyboardVisible
{
  return *((unsigned char *)&self->_canSendMail + 1);
}

- (void)setKeyboardVisible:(BOOL)a3
{
  *((unsigned char *)&self->_canSendMail + 1) = a3;
}

- (NSString)autosaveIdentifier
{
  return self->_subject;
}

- (void)setAutosaveIdentifier:(id)a3
{
}

- (void)setMailComposeViewController:(id)a3
{
}

- (BOOL)hasAnyAccount
{
  return *((unsigned char *)&self->_canSendMail + 2);
}

- (void)setHasAnyAccount:(BOOL)a3
{
  *((unsigned char *)&self->_canSendMail + 2) = a3;
}

- (BOOL)hasValidAccountForSending
{
  return *((unsigned char *)&self->_canSendMail + 3);
}

- (void)setHasValidAccountForSending:(BOOL)a3
{
  *((unsigned char *)&self->_canSendMail + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autosaveIdentifier, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleID, 0);
  objc_storeStrong((id *)&self->_collaborationItem, 0);
  objc_storeStrong((id *)&self->_hasValidAccountForSending, 0);
}

- (void)_saveDraft:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136446722;
  id v4 = "-[UIMailActivity _saveDraft:]";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "%{public}s: Error trying to archive mail draft identifier %{public}@: %{public}@.", (uint8_t *)&v3, 0x20u);
}

- (void)canShareURLThroughMail:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 fileSystemRepresentation];
  int v4 = *__error();
  int v5 = 136315394;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "canShareURLThroughMail returning NO. Reason: Failed to issue sandbox extension for %s with error %d. ", (uint8_t *)&v5, 0x12u);
}

- (void)canShareURLThroughMail:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 absoluteString];
  OUTLINED_FUNCTION_0_0(&dword_1A0AD8000, v2, v3, "canShareURLThroughMail returning NO. Reason: unknown url recieved %@", v4, v5, v6, v7, 2u);
}

- (void)prepareWithActivityItems:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Mail Activity: couldn't get FPSandboxingURLWrapper for file URL: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)prepareWithActivityItems:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_0(&dword_1A0AD8000, v2, v3, "Mail Activity: cloudSharingResult error:%@", v4, v5, v6, v7, 2u);
}

void __71__UIMailActivity__presentActivityOnViewController_animated_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "Failed to present mail compose in new window. Presenting modally instead.", v1, 2u);
}

@end