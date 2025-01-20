@interface VUIAppInstallCoordinator
- (BOOL)isEqual:(id)a3;
- (NSString)contentTitle;
- (NSUUID)uuid;
- (VUIAccessViewController)accessViewController;
- (VUIAppInstallCoordinator)initWithChannelDetails:(id)a3 contentTitle:(id)a4;
- (VUIAppInstallerViewController)installerViewController;
- (WLKChannelDetails)channelDetails;
- (unint64_t)hash;
- (void)_installAppWithChannel:(id)a3 punchoutURL:(id)a4 completion:(id)a5;
- (void)installAppWithPunchoutURL:(id)a3 completion:(id)a4;
- (void)setAccessViewController:(id)a3;
- (void)setChannelDetails:(id)a3;
- (void)setContentTitle:(id)a3;
- (void)setInstallerViewController:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation VUIAppInstallCoordinator

- (VUIAppInstallCoordinator)initWithChannelDetails:(id)a3 contentTitle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VUIAppInstallCoordinator;
  v9 = [(VUIAppInstallCoordinator *)&v14 init];
  v10 = v9;
  if (v7)
  {
    if (v9)
    {
      objc_storeStrong((id *)&v9->_contentTitle, a4);
      objc_storeStrong((id *)&v10->_channelDetails, a3);
      uint64_t v11 = objc_opt_new();
      uuid = v10->_uuid;
      v10->_uuid = (NSUUID *)v11;
    }
    else
    {
      uuid = 0;
    }
  }
  else
  {
    uuid = v9;
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(VUIAppInstallCoordinator *)self uuid];
  v3 = [v2 UUIDString];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (VUIAppInstallCoordinator *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [(VUIAppInstallCoordinator *)self uuid];
    id v7 = [(VUIAppInstallCoordinator *)v5 uuid];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)installAppWithPunchoutURL:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(WLKChannelDetails *)self->_channelDetails appBundleIDs];
  char v8 = [v7 firstObject];

  if ([v8 length])
  {
    [(VUIAppInstallCoordinator *)self _installAppWithChannel:self->_channelDetails punchoutURL:v9 completion:v6];
  }
  else if (v6)
  {
    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
  }
}

- (void)_installAppWithChannel:(id)a3 punchoutURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    objc_super v14 = __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke;
    v15 = &unk_1E6DF4588;
    objc_copyWeak(&v19, &location);
    id v16 = v8;
    id v17 = v9;
    id v18 = v11;
    v12 = v13;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v14((uint64_t)v12);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v12);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else if (v10)
  {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
  }
}

void __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = +[VUIInterfaceFactory sharedInstance];
  unint64_t v4 = [v3 controllerPresenter];

  if (!v4)
  {
    unint64_t v4 = +[VUIApplicationRouter topMostVisibleViewController];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = [[VUIAppInstallerViewController alloc] initWithInstallable:*(void *)(a1 + 32) punchoutURL:*(void *)(a1 + 40)];
    id v6 = [WeakRetained contentTitle];
    if (v6) {
      [(VUIAppInstallerViewController *)v5 setLocalizedContentTitle:v6];
    }
    id v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8 == 2)
    {
      uint64_t v9 = 8;
    }
    else
    {
      id v10 = [MEMORY[0x1E4FB16C8] currentDevice];
      BOOL v11 = [v10 userInterfaceIdiom] != 0;

      uint64_t v9 = 2 * v11;
    }
    [(VUIAppInstallerViewController *)v5 setModalPresentationStyle:v9];
    [WeakRetained setInstallerViewController:v5];
    v12 = VUIDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = [*(id *)(a1 + 32) channelID];
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_INFO, "Presenting app installation flow for channel ID: %@", buf, 0xCu);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke_6;
    v15[3] = &unk_1E6DF4538;
    id v16 = *(id *)(a1 + 32);
    id v17 = v5;
    id v18 = WeakRetained;
    id v19 = *(id *)(a1 + 48);
    objc_super v14 = v5;
    [v4 presentViewController:v14 animated:1 completion:v15];
  }
}

void __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = VUIDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = [*(id *)(a1 + 32) channelID];
    *(_DWORD *)buf = 138412290;
    objc_super v14 = v3;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_INFO, "Beginning app installation flow for channel ID: %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke_7;
  v8[3] = &unk_1E6DF89B8;
  unint64_t v4 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  [v4 beginInstallingAppWithProgressHandler:0 completion:v8];
}

void __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(a1 + 32) channelID];
    *(_DWORD *)buf = 138412802;
    id v17 = v9;
    __int16 v18 = 1024;
    int v19 = a2;
    __int16 v20 = 1024;
    int v21 = a3;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "Completed app installation flow for channel ID: %@, success: %d isHeadless:%d", buf, 0x18u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  v13 = __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke_8;
  objc_super v14 = &unk_1E6DF3D58;
  id v15 = *(id *)(a1 + 40);
  if (![MEMORY[0x1E4F29060] isMainThread])
  {
    dispatch_async(MEMORY[0x1E4F14428], block);
    if (!a2) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v13((uint64_t)block);
  if (a2)
  {
LABEL_7:
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"VUIFederatedAppDidInstallNotification" object:*(void *)(a1 + 32) userInfo:0];
  }
LABEL_8:
  [*(id *)(a1 + 48) setInstallerViewController:0];
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v11 + 16))(v11, a2, a3, v7);
  }
}

void __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke_8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:0 completion:0];
}

- (WLKChannelDetails)channelDetails
{
  return self->_channelDetails;
}

- (void)setChannelDetails:(id)a3
{
}

- (NSString)contentTitle
{
  return self->_contentTitle;
}

- (void)setContentTitle:(id)a3
{
}

- (VUIAppInstallerViewController)installerViewController
{
  return self->_installerViewController;
}

- (void)setInstallerViewController:(id)a3
{
}

- (VUIAccessViewController)accessViewController
{
  return self->_accessViewController;
}

- (void)setAccessViewController:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_accessViewController, 0);
  objc_storeStrong((id *)&self->_installerViewController, 0);
  objc_storeStrong((id *)&self->_contentTitle, 0);
  objc_storeStrong((id *)&self->_channelDetails, 0);
}

@end