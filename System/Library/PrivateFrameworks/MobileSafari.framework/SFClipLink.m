@interface SFClipLink
+ (double)iconHeight;
+ (id)localizedCaptionForClipNamed:(id)a3 action:(int64_t)a4;
+ (id)localizedUppercaseStringForAction:(int64_t)a3;
- (BOOL)siteRequestsShowCard;
- (NSString)actionCaption;
- (NSString)actionTitle;
- (NSString)appName;
- (NSString)bundleIdentifier;
- (NSString)clipName;
- (NSURL)url;
- (SFClipLink)initWithURL:(id)a3 bundleIdentifier:(id)a4 actionTitle:(id)a5;
- (UIImage)icon;
- (void)getClipAttributesWithCompletionHandler:(id)a3;
- (void)setActionCaption:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)setAppName:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setClipName:(id)a3;
- (void)setIcon:(id)a3;
- (void)setSiteRequestsShowCard:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation SFClipLink

+ (double)iconHeight
{
  return 29.0;
}

+ (id)localizedUppercaseStringForAction:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
  {
    v4 = &stru_1EDA07C28;
  }
  else
  {
    _WBSLocalizedString();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)localizedCaptionForClipNamed:(id)a3 action:(int64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case 2:
      v6 = NSString;
      goto LABEL_7;
    case 1:
      v6 = NSString;
      goto LABEL_7;
    case 0:
      v6 = NSString;
LABEL_7:
      v7 = _WBSLocalizedString();
      objc_msgSend(v6, "stringWithFormat:", v7, v5);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
  }
  v8 = &stru_1EDA07C28;
LABEL_9:

  return v8;
}

- (SFClipLink)initWithURL:(id)a3 bundleIdentifier:(id)a4 actionTitle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SFClipLink;
  v12 = [(SFClipLink *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a4);
    uint64_t v14 = [v11 localizedUppercaseString];
    actionTitle = v13->_actionTitle;
    v13->_actionTitle = (NSString *)v14;

    v16 = v13;
  }

  return v13;
}

- (void)getClipAttributesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    id v5 = (void *)getCPSClipMetadataRequestClass_softClass;
    uint64_t v19 = getCPSClipMetadataRequestClass_softClass;
    if (!getCPSClipMetadataRequestClass_softClass)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getCPSClipMetadataRequestClass_block_invoke;
      v15[3] = &unk_1E54EA8A0;
      v15[4] = &v16;
      __getCPSClipMetadataRequestClass_block_invoke((uint64_t)v15);
      id v5 = (void *)v17[3];
    }
    v6 = v5;
    _Block_object_dispose(&v16, 8);
    if [(objc_class *)v6 instancesRespondToSelector:sel_initWithURL_fallbackClipBundleID_]&& ([(objc_class *)v6 instancesRespondToSelector:sel_requestMetadataWithCompletion_])
    {
      v7 = (void *)[[v6 alloc] initWithURL:self->_url fallbackClipBundleID:self->_bundleIdentifier];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_2;
      v9[3] = &unk_1E54EB608;
      id v11 = self;
      id v12 = v4;
      id v10 = v7;
      id v8 = v7;
      [v8 requestMetadataWithCompletion:v9];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke;
      block[3] = &unk_1E54EB568;
      id v14 = v4;
      dispatch_async(MEMORY[0x1E4F14428], block);
      id v8 = v14;
    }
  }
}

uint64_t __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E54EB5E0;
  id v8 = v3;
  id v11 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2 && ![v2 clipIncompatibleWithCurrentDevice])
  {
    id v4 = [*(id *)(a1 + 32) invocationPolicy];
    if ([v4 isEligible] & 1) != 0 || (objc_msgSend(v4, "isRecoverable"))
    {
      uint64_t v5 = [*(id *)(a1 + 32) clipBundleID];
      char v6 = objc_msgSend(v5, "safari_isCaseInsensitiveEqualToString:", *(void *)(*(void *)(a1 + 48) + 24));

      if (v6)
      {
        uint64_t v7 = [*(id *)(a1 + 32) fullAppName];
        uint64_t v8 = *(void *)(a1 + 48);
        id v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;

        uint64_t v10 = [*(id *)(a1 + 32) clipName];
        uint64_t v11 = *(void *)(a1 + 48);
        id v12 = v10;
        if (!v10) {
          id v12 = *(void **)(v11 + 40);
        }
        objc_storeStrong((id *)(v11 + 32), v12);

        if (objc_opt_respondsToSelector()) {
          uint64_t v13 = [*(id *)(a1 + 32) clipAction];
        }
        else {
          uint64_t v13 = 0;
        }
        uint64_t v19 = [(id)objc_opt_class() localizedUppercaseStringForAction:v13];
        uint64_t v20 = *(void *)(a1 + 48);
        v21 = *(void **)(v20 + 48);
        *(void *)(v20 + 48) = v19;

        uint64_t v22 = [(id)objc_opt_class() localizedCaptionForClipNamed:*(void *)(*(void *)(a1 + 48) + 40) action:v13];
        uint64_t v23 = *(void *)(a1 + 48);
        v24 = *(void **)(v23 + 56);
        *(void *)(v23 + 56) = v22;

        +[SFClipLink iconHeight];
        uint64_t v26 = v25;
        uint64_t v28 = *(void *)(a1 + 32);
        v27 = *(void **)(a1 + 40);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_27;
        v30[3] = &unk_1E54EB5B8;
        id v29 = *(id *)(a1 + 56);
        uint64_t v32 = v26;
        v30[4] = *(void *)(a1 + 48);
        id v31 = v29;
        [v27 requestDownloadedIconWithMetadata:v28 completion:v30];

        goto LABEL_21;
      }
      id v14 = WBS_LOG_CHANNEL_PREFIXBanners();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v15 = "Not showing App Clip Banner because the URL corresponds to a different app clip bundle identifier";
        uint64_t v16 = v14;
        os_log_type_t v17 = OS_LOG_TYPE_INFO;
LABEL_17:
        _os_log_impl(&dword_18C354000, v16, v17, v15, buf, 2u);
      }
    }
    else
    {
      uint64_t v18 = WBS_LOG_CHANNEL_PREFIXBanners();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v15 = "Not showing App Clip Banner because the app clip cannot be launched";
        uint64_t v16 = v18;
        os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_17;
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_21:

    return;
  }
  id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);

  v3();
}

void __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_2_28;
  v6[3] = &unk_1E54EB590;
  id v7 = v3;
  id v4 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __53__SFClipLink_getClipAttributesWithCompletionHandler___block_invoke_2_28(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    double v2 = _SFScreenScale();
    id v3 = objc_alloc(MEMORY[0x1E4FB1818]);
    id v4 = [*(id *)(a1 + 32) path];
    id v5 = (void *)[v3 initWithContentsOfFile:v4];

    id v6 = objc_alloc(MEMORY[0x1E4F6F1E8]);
    id v7 = v5;
    uint64_t v8 = objc_msgSend(v6, "initWithCGImage:scale:", objc_msgSend(v7, "CGImage"), v2);
    id v9 = objc_alloc(MEMORY[0x1E4F6F248]);
    v19[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    uint64_t v11 = (void *)[v9 initWithImages:v10];

    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", *(double *)(a1 + 56), *(double *)(a1 + 56), v2);
    [v12 setShape:5];
    uint64_t v13 = [v11 imageForDescriptor:v12];
    id v14 = v13;
    if (v13)
    {
      v15 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v16 = [v13 CGImage];
      [v14 scale];
      os_log_type_t v17 = objc_msgSend(v15, "imageWithCGImage:scale:orientation:", v16, 0);
      [*(id *)(a1 + 40) setIcon:v17];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v18 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v18();
  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)clipName
{
  return self->_clipName;
}

- (void)setClipName:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
}

- (NSString)actionCaption
{
  return self->_actionCaption;
}

- (void)setActionCaption:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (BOOL)siteRequestsShowCard
{
  return self->_siteRequestsShowCard;
}

- (void)setSiteRequestsShowCard:(BOOL)a3
{
  self->_siteRequestsShowCard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_actionCaption, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_clipName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end