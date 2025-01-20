@interface WLKAppInstaller
+ (id)defaultAppInstaller;
- (WLKAppInstaller)init;
- (void)installAppForInstallable:(id)a3 progressHandler:(id)a4 completion:(id)a5;
- (void)installAppForInstallable:(id)a3 sceneIdentifier:(id)a4 offer:(id)a5 progressHandler:(id)a6 completion:(id)a7;
- (void)installAppForInstallable:(id)a3 sceneIdentifier:(id)a4 progressHandler:(id)a5 completion:(id)a6;
@end

@implementation WLKAppInstaller

+ (id)defaultAppInstaller
{
  if (defaultAppInstaller___once != -1) {
    dispatch_once(&defaultAppInstaller___once, &__block_literal_global_33);
  }
  v2 = (void *)defaultAppInstaller___defaultAppInstaller;

  return v2;
}

uint64_t __38__WLKAppInstaller_defaultAppInstaller__block_invoke()
{
  defaultAppInstaller___defaultAppInstaller = objc_alloc_init(WLKAppInstaller);

  return MEMORY[0x1F41817F8]();
}

- (WLKAppInstaller)init
{
  v8.receiver = self;
  v8.super_class = (Class)WLKAppInstaller;
  v2 = [(WLKAppInstaller *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.WatchListKit.WLKAppInstaller", 0);
    installQueue = v2->_installQueue;
    v2->_installQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    installSessions = v2->_installSessions;
    v2->_installSessions = v5;
  }
  return v2;
}

- (void)installAppForInstallable:(id)a3 progressHandler:(id)a4 completion:(id)a5
{
}

- (void)installAppForInstallable:(id)a3 sceneIdentifier:(id)a4 progressHandler:(id)a5 completion:(id)a6
{
}

- (void)installAppForInstallable:(id)a3 sceneIdentifier:(id)a4 offer:(id)a5 progressHandler:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    installQueue = self->_installQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke;
    v18[3] = &unk_1E620B488;
    id v19 = v12;
    id v20 = v14;
    id v21 = v13;
    v22 = self;
    id v23 = v15;
    id v24 = v16;
    dispatch_async(installQueue, v18);
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"installable must be non-nil"];
  }
}

void __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke(uint64_t a1)
{
  v2 = [[_WLKAppInstallSession alloc] initWithInstallable:*(void *)(a1 + 32) offer:*(void *)(a1 + 40) sceneIdentifier:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 56) + 16) addObject:v2];
  NSLog(&cfstr_Wlkappinstalle_0.isa, v2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_2;
  v9[3] = &unk_1E620B438;
  v10 = v2;
  id v11 = *(id *)(a1 + 64);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_4;
  v5[3] = &unk_1E620B460;
  uint64_t v3 = *(void *)(a1 + 56);
  v6 = v10;
  uint64_t v7 = v3;
  id v8 = *(id *)(a1 + 72);
  v4 = v10;
  [(_WLKAppInstallSession *)v4 beginInstallationWithProgressHandler:v9 completion:v5];
}

void __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_2(uint64_t a1, double a2)
{
  NSLog(&cfstr_Wlkappinstalle_1.isa, *(void *)&a2, *(void *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_3;
    block[3] = &unk_1E620B060;
    id v7 = v4;
    double v8 = a2;
    dispatch_async(v5, block);
  }
}

uint64_t __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40));
}

void __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_Wlkappinstalle_2.isa, a1[4]);
  [*(id *)(a1[5] + 16) removeObject:a1[4]];
  v4 = (void *)a1[6];
  if (v4)
  {
    v5 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_5;
    block[3] = &unk_1E620AF40;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, block);
  }
}

uint64_t __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installSessions, 0);

  objc_storeStrong((id *)&self->_installQueue, 0);
}

@end