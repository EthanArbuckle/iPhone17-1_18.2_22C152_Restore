@interface SUPolicyFactory
- (SUCorePolicy)corePolicy;
- (SUCorePolicy)rollbackPolicy;
- (SUDownloadOptions)downloadOptions;
- (SUInstallOptions)installOptions;
- (SUPolicyFactory)init;
- (SUPolicyGlobalOptions)globalOptions;
- (SURollbackOptions)rollbackOptions;
- (SUScanOptions)scanOptions;
- (id)_SUAssetTypeForScanOptions:(id)a3;
- (id)existingExtensionOfClass:(Class)a3 inPolicy:(id)a4;
- (unint64_t)coreMDMPathForSUSPath:(unint64_t)a3;
- (void)augmentCorePolicy:(id)a3 WithApplyPolicy:(id)a4;
- (void)augmentCorePolicy:(id)a3 WithDocumentationDownloadPolicy:(id)a4;
- (void)augmentCorePolicy:(id)a3 WithDocumentationScanPolicy:(id)a4;
- (void)augmentCorePolicy:(id)a3 WithGlobalPolicy:(id)a4;
- (void)augmentCorePolicy:(id)a3 WithLoadBrainPolicy:(id)a4;
- (void)augmentCorePolicy:(id)a3 WithPreflightPolicy:(id)a4;
- (void)augmentCorePolicy:(id)a3 WithPreparePolicy:(id)a4;
- (void)augmentCorePolicy:(id)a3 WithResumePolicy:(id)a4;
- (void)augmentCorePolicy:(id)a3 WithRollbackPolicy:(id)a4;
- (void)augmentCorePolicy:(id)a3 WithSUDownloadPolicy:(id)a4;
- (void)augmentCorePolicy:(id)a3 WithSUScanPolicy:(id)a4;
- (void)augmentCorePolicy:(id)a3 WithSuspendPolicy:(id)a4;
- (void)augmentPolicy:(id)a3;
- (void)createCorePolicy;
- (void)createRollbackPolicy;
- (void)modifyPolicy:(id)a3 forTypes:(id)a4;
- (void)removePolicyExtensionOfClass:(Class)a3 forPolicy:(id)a4;
- (void)setDownloadOptions:(id)a3;
- (void)setGlobalOptions:(id)a3;
- (void)setInstallOptions:(id)a3;
- (void)setPolicyExtension:(id)a3 forPolicy:(id)a4;
- (void)setRollbackOptions:(id)a3;
- (void)setScanOptions:(id)a3;
@end

@implementation SUPolicyFactory

- (SUPolicyFactory)init
{
  v10.receiver = self;
  v10.super_class = (Class)SUPolicyFactory;
  v2 = [(SUPolicyFactory *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.softwareupdateservices.SUPolicyFactoryQueue", v3);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v4;

    v6 = v2->_stateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __23__SUPolicyFactory_init__block_invoke;
    block[3] = &unk_26447C878;
    v9 = v2;
    dispatch_sync(v6, block);
  }
  return v2;
}

uint64_t __23__SUPolicyFactory_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;

  v6 = objc_alloc_init(SUPolicyGlobalOptions);
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 24);
  *(void *)(v7 + 24) = v6;

  uint64_t v9 = *(void *)(a1 + 32);
  objc_super v10 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = 0;

  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;

  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 48);
  *(void *)(v13 + 48) = 0;

  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 56);
  *(void *)(v15 + 56) = 0;

  [*(id *)(a1 + 32) createCorePolicy];
  v17 = *(void **)(a1 + 32);
  return [v17 createRollbackPolicy];
}

- (void)setGlobalOptions:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__SUPolicyFactory_setGlobalOptions___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

uint64_t __36__SUPolicyFactory_setGlobalOptions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) modifyPolicy:*(void *)(*(void *)(a1 + 32) + 8) forTypes:&unk_26CEBD2C0];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  return [v2 modifyPolicy:v3 forTypes:&unk_26CEBD2D8];
}

- (void)setScanOptions:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__SUPolicyFactory_setScanOptions___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

uint64_t __34__SUPolicyFactory_setScanOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _SUAssetTypeForScanOptions:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) _SUAssetTypeForScanOptions:*(void *)(*(void *)(a1 + 32) + 32)];
  char v4 = [v2 isEqualToString:v3];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) createCorePolicy];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 32) disableSplatCombo]) {
    [*(id *)(*(void *)(a1 + 32) + 8) setDisableSplatCombo:1];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 32) disablePreSoftwareUpdateStaging])
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setEnablePreSUStaging:0];
    [*(id *)(*(void *)(a1 + 32) + 8) setEnablePreSUStagingForOptionalAssets:0];
  }
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[1];
  return [v5 modifyPolicy:v6 forTypes:&unk_26CEBD2F0];
}

- (void)setDownloadOptions:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SUPolicyFactory_setDownloadOptions___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

uint64_t __38__SUPolicyFactory_setDownloadOptions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[1];
  return [v2 modifyPolicy:v3 forTypes:&unk_26CEBD308];
}

- (void)setInstallOptions:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__SUPolicyFactory_setInstallOptions___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

uint64_t __37__SUPolicyFactory_setInstallOptions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[1];
  return [v2 modifyPolicy:v3 forTypes:&unk_26CEBD320];
}

- (void)setRollbackOptions:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SUPolicyFactory_setRollbackOptions___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

uint64_t __38__SUPolicyFactory_setRollbackOptions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  return [v2 modifyPolicy:v3 forTypes:&unk_26CEBD338];
}

- (SUPolicyGlobalOptions)globalOptions
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__20;
  uint64_t v11 = __Block_byref_object_dispose__20;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__SUPolicyFactory_globalOptions__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUPolicyGlobalOptions *)v4;
}

void __32__SUPolicyFactory_globalOptions__block_invoke(uint64_t a1)
{
}

- (SUScanOptions)scanOptions
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__20;
  uint64_t v11 = __Block_byref_object_dispose__20;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__SUPolicyFactory_scanOptions__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUScanOptions *)v4;
}

void __30__SUPolicyFactory_scanOptions__block_invoke(uint64_t a1)
{
}

- (SUDownloadOptions)downloadOptions
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__20;
  uint64_t v11 = __Block_byref_object_dispose__20;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__SUPolicyFactory_downloadOptions__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUDownloadOptions *)v4;
}

void __34__SUPolicyFactory_downloadOptions__block_invoke(uint64_t a1)
{
}

- (SUInstallOptions)installOptions
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__20;
  uint64_t v11 = __Block_byref_object_dispose__20;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__SUPolicyFactory_installOptions__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUInstallOptions *)v4;
}

void __33__SUPolicyFactory_installOptions__block_invoke(uint64_t a1)
{
}

- (SURollbackOptions)rollbackOptions
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__20;
  uint64_t v11 = __Block_byref_object_dispose__20;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__SUPolicyFactory_rollbackOptions__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SURollbackOptions *)v4;
}

void __34__SUPolicyFactory_rollbackOptions__block_invoke(uint64_t a1)
{
}

- (SUCorePolicy)corePolicy
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__20;
  uint64_t v11 = __Block_byref_object_dispose__20;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __29__SUPolicyFactory_corePolicy__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUCorePolicy *)v4;
}

void __29__SUPolicyFactory_corePolicy__block_invoke(uint64_t a1)
{
}

- (SUCorePolicy)rollbackPolicy
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__20;
  uint64_t v11 = __Block_byref_object_dispose__20;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__SUPolicyFactory_rollbackPolicy__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUCorePolicy *)v4;
}

void __33__SUPolicyFactory_rollbackPolicy__block_invoke(uint64_t a1)
{
}

- (void)createCorePolicy
{
  id v3 = objc_alloc(MEMORY[0x263F77B80]);
  id v4 = [(SUPolicyFactory *)self _SUAssetTypeForScanOptions:self->_scanOption];
  v5 = [MEMORY[0x263F77BA0] getAssetTypeForKind:2 usingFamily:1];
  id v6 = (SUCorePolicy *)[v3 initWithSoftwareUpdateAssetType:v4 documentationAssetType:v5 usingPolicies:0 usingExtensions:0];

  [(SUPolicyFactory *)self augmentPolicy:v6];
  corePolicy = self->_corePolicy;
  self->_corePolicy = v6;
}

- (void)createRollbackPolicy
{
  id v3 = objc_alloc(MEMORY[0x263F77B80]);
  id v4 = [MEMORY[0x263F77BA0] getAssetTypeForKind:7 usingFamily:1];
  v5 = [MEMORY[0x263F77BA0] getAssetTypeForKind:2 usingFamily:1];
  id v6 = (SUCorePolicy *)[v3 initWithSoftwareUpdateAssetType:v4 documentationAssetType:v5 usingPolicies:0 usingExtensions:0];

  [(SUPolicyFactory *)self augmentPolicy:v6];
  rollbackPolicy = self->_rollbackPolicy;
  self->_rollbackPolicy = v6;
}

- (void)augmentPolicy:(id)a3
{
  id v4 = a3;
  v5 = +[SUPreferences sharedInstance];
  int v6 = [v5 queryCustomerBuilds];

  if (v6)
  {
    uint64_t v7 = v4;
    id v8 = 0;
LABEL_6:
    [v7 setReleaseType:v8];
    goto LABEL_8;
  }
  uint64_t v9 = +[SUPreferences sharedInstance];
  if ([v9 useEmptyPatches])
  {
    BOOL v10 = +[SUUtility currentReleaseTypeIsInternal];

    if (!v10) {
      goto LABEL_8;
    }
    id v8 = @"Empty";
    uint64_t v7 = v4;
    goto LABEL_6;
  }

LABEL_8:
  uint64_t v11 = +[SUPreferences sharedInstance];
  objc_msgSend(v4, "setDisableSplatCombo:", objc_msgSend(v11, "disableSplombo"));

  id v12 = +[SUPreferences sharedInstance];
  objc_msgSend(v4, "setEnablePreSUStaging:", objc_msgSend(v12, "enablePreSUStaging"));

  uint64_t v13 = +[SUPreferences sharedInstance];
  objc_msgSend(v4, "setEnablePreSUStagingForOptionalAssets:", objc_msgSend(v13, "enablePreSUStagingForOptionalAssets"));

  v14 = +[SUPreferences sharedInstance];
  uint64_t v15 = [v14 ssoUsernameForPersonalization];
  if (!v15)
  {
LABEL_11:

    goto LABEL_12;
  }
  v16 = (void *)v15;
  v17 = +[SUPreferences sharedInstance];
  v18 = [v17 ssoTokenForPersonalization];

  if (v18)
  {
    SULogInfo(@"SSO UserName and Token are set for personalization, setting it in policy", v19, v20, v21, v22, v23, v24, v25, v44);
    v26 = +[SUPreferences sharedInstance];
    v27 = [v26 ssoTokenForPersonalization];
    v14 = [v27 dataUsingEncoding:4];

    v28 = +[SUPreferences sharedInstance];
    v29 = [v28 ssoUsernameForPersonalization];
    v30 = [v29 dataUsingEncoding:4];

    char v45 = 0;
    v31 = objc_msgSend(MEMORY[0x263EFF990], "dataWithCapacity:", objc_msgSend(v30, "length") + objc_msgSend(v14, "length") + 1);
    [v31 appendData:v30];
    [v31 appendBytes:&v45 length:1];
    [v31 appendData:v14];
    [v4 setSsoToken:v31];

    goto LABEL_11;
  }
LABEL_12:
  v32 = [[SUPolicyGlobal alloc] initWithGlobalOptions:self->_globalOptions];
  [(SUPolicyFactory *)self augmentCorePolicy:v4 WithGlobalPolicy:v32];

  v33 = [[SUPolicyScanSoftwareUpdate alloc] initWithScanOptions:self->_scanOption];
  [(SUPolicyFactory *)self augmentCorePolicy:v4 WithSUScanPolicy:v33];

  v34 = [[SUPolicyScanSUDocumentation alloc] initWithScanOptions:0];
  [(SUPolicyFactory *)self augmentCorePolicy:v4 WithDocumentationScanPolicy:v34];

  v35 = objc_alloc_init(SUPolicyDocumentationDownload);
  [(SUPolicyFactory *)self augmentCorePolicy:v4 WithDocumentationDownloadPolicy:v35];

  v36 = objc_alloc_init(SUPolicyScanBrain);
  [(SUPolicyFactory *)self augmentCorePolicy:v4 WithLoadBrainPolicy:v36];

  v37 = objc_alloc_init(SUPolicy);
  [(SUPolicyFactory *)self augmentCorePolicy:v4 WithPreflightPolicy:v37];

  v38 = [[SUPolicyDownload alloc] initWithDownloadOptions:0];
  [(SUPolicyFactory *)self augmentCorePolicy:v4 WithSUDownloadPolicy:v38];

  v39 = objc_alloc_init(SUPolicy);
  [(SUPolicyFactory *)self augmentCorePolicy:v4 WithPreparePolicy:v39];

  v40 = objc_alloc_init(SUPolicy);
  [(SUPolicyFactory *)self augmentCorePolicy:v4 WithSuspendPolicy:v40];

  v41 = objc_alloc_init(SUPolicy);
  [(SUPolicyFactory *)self augmentCorePolicy:v4 WithResumePolicy:v41];

  v42 = [[SUPolicyApply alloc] initWithInstallOptions:0];
  [(SUPolicyFactory *)self augmentCorePolicy:v4 WithApplyPolicy:v42];

  v43 = [[SUPolicyRollback alloc] initWithRollbackOptions:0];
  [(SUPolicyFactory *)self augmentCorePolicy:v4 WithRollbackPolicy:v43];
}

- (void)modifyPolicy:(id)a3 forTypes:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        switch(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "intValue", (void)v14))
        {
          case 0u:
            uint64_t v13 = [[SUPolicyGlobal alloc] initWithGlobalOptions:self->_globalOptions];
            [(SUPolicyFactory *)self augmentCorePolicy:v6 WithGlobalPolicy:v13];
            goto LABEL_14;
          case 1u:
            uint64_t v13 = [[SUPolicyScanSoftwareUpdate alloc] initWithScanOptions:self->_scanOption];
            [(SUPolicyFactory *)self augmentCorePolicy:v6 WithSUScanPolicy:v13];
            goto LABEL_14;
          case 2u:
            uint64_t v13 = [[SUPolicyScanSUDocumentation alloc] initWithScanOptions:self->_scanOption];
            [(SUPolicyFactory *)self augmentCorePolicy:v6 WithDocumentationScanPolicy:v13];
            goto LABEL_14;
          case 4u:
            uint64_t v13 = [[SUPolicyScanBrain alloc] initWithScanOptions:self->_scanOption];
            [(SUPolicyFactory *)self augmentCorePolicy:v6 WithLoadBrainPolicy:v13];
            goto LABEL_14;
          case 6u:
            uint64_t v13 = [[SUPolicyDownload alloc] initWithDownloadOptions:self->_downloadOptions];
            [(SUPolicyFactory *)self augmentCorePolicy:v6 WithSUDownloadPolicy:v13];
            goto LABEL_14;
          case 0xAu:
            uint64_t v13 = [[SUPolicyApply alloc] initWithInstallOptions:self->_installOptions];
            [(SUPolicyFactory *)self augmentCorePolicy:v6 WithApplyPolicy:v13];
            goto LABEL_14;
          case 0xCu:
            uint64_t v13 = [[SUPolicyRollback alloc] initWithRollbackOptions:self->_rollbackOptions];
            [(SUPolicyFactory *)self augmentCorePolicy:v6 WithRollbackPolicy:v13];
LABEL_14:

            break;
          default:
            break;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)setPolicyExtension:(id)a3 forPolicy:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v8 = (void *)MEMORY[0x263EFF980];
  uint64_t v9 = [v7 policyExtensions];
  uint64_t v10 = [v8 arrayWithArray:v9];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = objc_msgSend(v7, "policyExtensions", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 removeObject:v16];
          goto LABEL_11;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [v10 addObject:v6];
  [v7 setPolicyExtensions:v10];
}

- (void)removePolicyExtensionOfClass:(Class)a3 forPolicy:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = (void *)MEMORY[0x263EFF980];
  id v6 = [v4 policyExtensions];
  id v7 = [v5 arrayWithArray:v6];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = objc_msgSend(v4, "policyExtensions", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          [v7 removeObject:v13];
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [v4 setPolicyExtensions:v7];
}

- (id)existingExtensionOfClass:(Class)a3 inPolicy:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = objc_msgSend(v5, "policyExtensions", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (void)augmentCorePolicy:(id)a3 WithGlobalPolicy:(id)a4
{
  id v11 = a3;
  stateQueue = self->_stateQueue;
  id v7 = a4;
  dispatch_assert_queue_V2(stateQueue);
  objc_msgSend(v11, "setCacheDeleteUrgency:", objc_msgSend(v7, "cacheDeleteUrgency"));
  objc_msgSend(v11, "setCheckAvailableSpace:", objc_msgSend(v7, "checkAvailableSpace"));
  uint64_t v8 = [v7 updateMetricContext];
  [v11 setUpdateMetricContext:v8];

  uint64_t v9 = [v7 updateMetricEventFields];

  id v10 = (id)[v11 setUpdateMetricEventFieldsFromDictionary:v9];
}

- (void)augmentCorePolicy:(id)a3 WithSUScanPolicy:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v7 = [v32 softwareUpdateScanPolicy];
  objc_msgSend(v7, "setAllowsCellular:", objc_msgSend(v6, "allowsCellular"));
  objc_msgSend(v7, "setDiscretionary:", objc_msgSend(v6, "discretionary"));
  objc_msgSend(v7, "setRequiresPowerPluggedIn:", objc_msgSend(v6, "requiresPowerPluggedIn"));
  objc_msgSend(v7, "setRestrictToIncremental:", objc_msgSend(v6, "restrictToIncremental"));
  objc_msgSend(v7, "setRestrictToFull:", objc_msgSend(v6, "restrictToFull"));
  objc_msgSend(v7, "setAllowSameVersion:", objc_msgSend(v6, "allowSameVersion"));
  objc_msgSend(v7, "setDownloadTimeoutSecs:", objc_msgSend(v6, "downloadTimeoutSecs"));
  uint64_t v8 = [v6 scanType];
  [v7 setRampingScanType:v8];

  uint64_t v9 = [v6 sessionID];
  [v7 setSessionId:v9];

  id v10 = [v6 scanOptions];
  id v11 = [v10 managedScanOptions];

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F77B90]);
    [v12 setSupervised:1];
    objc_msgSend(v12, "setMDMUseDelayPeriod:", objc_msgSend(v11, "useDelayPeriod") == 1);
    uint64_t v13 = [v11 requestedProductMarketingVersion];
    [v12 setRequestedPMV:v13];

    objc_msgSend(v12, "setDelayPeriodSecs:", objc_msgSend(v11, "delayPeriodSeconds"));
    objc_msgSend(v12, "setMdmSoftwareUpdatePath:", -[SUPolicyFactory coreMDMPathForSUSPath:](self, "coreMDMPathForSUSPath:", objc_msgSend(v11, "MDMSoftwareUpdatePath")));
    [(SUPolicyFactory *)self setPolicyExtension:v12 forPolicy:v32];
    SULogDebug(@"%s: managed scan options = %@, mdmExtension = %@", v14, v15, v16, v17, v18, v19, v20, (uint64_t)"-[SUPolicyFactory augmentCorePolicy:WithSUScanPolicy:]");
  }
  if ([v6 isSplatOnlyScan])
  {
    uint64_t v21 = +[SUPreferences sharedInstance];
    objc_msgSend(v7, "setAllowSameVersion:", objc_msgSend(v21, "allowSameRestoreVersionSplatUpdate"));

    id v22 = objc_alloc_init(MEMORY[0x263F77B98]);
    uint64_t v23 = [MEMORY[0x263F77D98] sharedDevice];
    uint64_t v24 = [v23 splatRestoreVersion];
    [v22 setInstalledSplatRestoreVersion:v24];

    uint64_t v25 = [MEMORY[0x263F77D98] sharedDevice];
    v26 = [v25 splatBuildVersion];
    [v22 setInstalledSplatBuildVersion:v26];

    v27 = [MEMORY[0x263F77D98] sharedDevice];
    v28 = [v27 splatProductVersion];
    [v22 setInstalledSplatProductVersion:v28];

    v29 = [MEMORY[0x263F77D98] sharedDevice];
    v30 = [v29 splatReleaseType];
    [v22 setInstalledSplatReleaseType:v30];

    v31 = +[SUPreferences sharedInstance];
    objc_msgSend(v22, "setAllowSameRestoreVersion:", objc_msgSend(v31, "allowSameRestoreVersionSplatUpdate"));

    [(SUPolicyFactory *)self setPolicyExtension:v22 forPolicy:v32];
  }
}

- (void)augmentCorePolicy:(id)a3 WithDocumentationScanPolicy:(id)a4
{
  id v20 = a3;
  stateQueue = self->_stateQueue;
  id v7 = a4;
  dispatch_assert_queue_V2(stateQueue);
  uint64_t v8 = [v20 documentationScanPolicy];
  objc_msgSend(v8, "setAllowsCellular:", objc_msgSend(v7, "allowsCellular"));
  objc_msgSend(v8, "setDiscretionary:", objc_msgSend(v7, "discretionary"));
  objc_msgSend(v8, "setRequiresPowerPluggedIn:", objc_msgSend(v7, "requiresPowerPluggedIn"));
  objc_msgSend(v8, "setDownloadTimeoutSecs:", objc_msgSend(v7, "downloadTimeoutSecs"));
  uint64_t v9 = [v7 scanOptions];

  id v10 = [v9 managedScanOptions];

  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F77B90]);
    [v11 setSupervised:1];
    objc_msgSend(v11, "setMDMUseDelayPeriod:", objc_msgSend(v10, "useDelayPeriod") == 1);
    id v12 = [v10 requestedProductMarketingVersion];
    [v11 setRequestedPMV:v12];

    objc_msgSend(v11, "setDelayPeriodSecs:", objc_msgSend(v10, "delayPeriodSeconds"));
    objc_msgSend(v11, "setMdmSoftwareUpdatePath:", -[SUPolicyFactory coreMDMPathForSUSPath:](self, "coreMDMPathForSUSPath:", objc_msgSend(v10, "MDMSoftwareUpdatePath")));
    [(SUPolicyFactory *)self setPolicyExtension:v11 forPolicy:v20];
    SULogDebug(@"%s: managed scan options = %@, mdmExtension = %@", v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUPolicyFactory augmentCorePolicy:WithDocumentationScanPolicy:]");
  }
}

- (void)augmentCorePolicy:(id)a3 WithDocumentationDownloadPolicy:(id)a4
{
  stateQueue = self->_stateQueue;
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2(stateQueue);
  id v9 = [v7 documentationDownloadPolicy];

  objc_msgSend(v9, "setAllowsCellular:", objc_msgSend(v6, "allowsCellular"));
  objc_msgSend(v9, "setDiscretionary:", objc_msgSend(v6, "discretionary"));
  objc_msgSend(v9, "setRequiresPowerPluggedIn:", objc_msgSend(v6, "requiresPowerPluggedIn"));
  objc_msgSend(v9, "setRequiresInexpensiveAccess:", objc_msgSend(v6, "allowExpensiveNetwork") ^ 1);
  uint64_t v8 = [v6 downloadTimeoutSecs];

  [v9 setDownloadTimeoutSecs:v8];
}

- (void)augmentCorePolicy:(id)a3 WithLoadBrainPolicy:(id)a4
{
  id v20 = a3;
  stateQueue = self->_stateQueue;
  id v7 = a4;
  dispatch_assert_queue_V2(stateQueue);
  uint64_t v8 = [v20 loadBrainPolicy];
  objc_msgSend(v8, "setAllowsCellular:", objc_msgSend(v7, "allowsCellular"));
  objc_msgSend(v8, "setDiscretionary:", objc_msgSend(v7, "discretionary"));
  objc_msgSend(v8, "setSkipPhase:", objc_msgSend(v7, "skipPhase"));
  id v9 = [v7 scanOptions];

  id v10 = [v9 managedScanOptions];

  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F77B90]);
    [v11 setSupervised:1];
    objc_msgSend(v11, "setMDMUseDelayPeriod:", objc_msgSend(v10, "useDelayPeriod") == 1);
    id v12 = [v10 requestedProductMarketingVersion];
    [v11 setRequestedPMV:v12];

    objc_msgSend(v11, "setDelayPeriodSecs:", objc_msgSend(v10, "delayPeriodSeconds"));
    objc_msgSend(v11, "setMdmSoftwareUpdatePath:", -[SUPolicyFactory coreMDMPathForSUSPath:](self, "coreMDMPathForSUSPath:", objc_msgSend(v10, "MDMSoftwareUpdatePath")));
    [(SUPolicyFactory *)self setPolicyExtension:v11 forPolicy:v20];
    SULogDebug(@"%s: managed scan options = %@, mdmExtension = %@", v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUPolicyFactory augmentCorePolicy:WithLoadBrainPolicy:]");
  }
}

- (void)augmentCorePolicy:(id)a3 WithPreflightPolicy:(id)a4
{
  stateQueue = self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  id v6 = [v5 downloadPreflightPolicy];

  [v6 setSkipPhase:0];
}

- (void)augmentCorePolicy:(id)a3 WithSUDownloadPolicy:(id)a4
{
  stateQueue = self->_stateQueue;
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2(stateQueue);
  id v9 = [v7 softwareUpdateDownloadPolicy];

  objc_msgSend(v9, "setAllowsCellular:", objc_msgSend(v6, "allowsCellular"));
  objc_msgSend(v9, "setDiscretionary:", objc_msgSend(v6, "discretionary"));
  objc_msgSend(v9, "setRequiresPowerPluggedIn:", objc_msgSend(v6, "requiresPowerPluggedIn"));
  objc_msgSend(v9, "setDownloadTimeoutSecs:", objc_msgSend(v6, "downloadTimeoutSecs"));
  objc_msgSend(v9, "setRequiresInexpensiveAccess:", objc_msgSend(v6, "allowExpensiveNetwork") ^ 1);
  uint64_t v8 = [v6 skipPhase];

  [v9 setSkipPhase:v8];
}

- (void)augmentCorePolicy:(id)a3 WithPreparePolicy:(id)a4
{
  stateQueue = self->_stateQueue;
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2(stateQueue);
  id v9 = [v7 preparePolicy];

  uint64_t v8 = [v6 skipPhase];
  [v9 setSkipPhase:v8];
}

- (void)augmentCorePolicy:(id)a3 WithSuspendPolicy:(id)a4
{
  stateQueue = self->_stateQueue;
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2(stateQueue);
  id v9 = [v7 suspendPolicy];

  uint64_t v8 = [v6 skipPhase];
  [v9 setSkipPhase:v8];
}

- (void)augmentCorePolicy:(id)a3 WithResumePolicy:(id)a4
{
  stateQueue = self->_stateQueue;
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2(stateQueue);
  id v9 = [v7 resumePolicy];

  uint64_t v8 = [v6 skipPhase];
  [v9 setSkipPhase:v8];
}

- (void)augmentCorePolicy:(id)a3 WithApplyPolicy:(id)a4
{
  id v14 = a3;
  stateQueue = self->_stateQueue;
  id v7 = a4;
  dispatch_assert_queue_V2(stateQueue);
  uint64_t v8 = [v14 applyPolicy];
  objc_msgSend(v8, "setSkipPhase:", objc_msgSend(v7, "skipPhase"));
  id v9 = [v7 installOptions];

  LODWORD(v7) = [v9 isManaged];
  if (v7)
  {
    id v10 = [(SUDownloadOptions *)self->_downloadOptions descriptor];
    int v11 = [v10 updateType];

    uint64_t v12 = objc_opt_class();
    if (v11 == 4)
    {
      [(SUPolicyFactory *)self removePolicyExtensionOfClass:v12 forPolicy:v14];
    }
    else
    {
      id v13 = [(SUPolicyFactory *)self existingExtensionOfClass:v12 inPolicy:v14];
      if (!v13) {
        id v13 = objc_alloc_init(MEMORY[0x263F77B90]);
      }
      [v13 setSupervised:1];
      [(SUPolicyFactory *)self setPolicyExtension:v13 forPolicy:v14];
    }
  }
}

- (void)augmentCorePolicy:(id)a3 WithRollbackPolicy:(id)a4
{
  stateQueue = self->_stateQueue;
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2(stateQueue);
  id v8 = [v7 rollbackPolicy];

  objc_msgSend(v8, "setPerformPhase:", objc_msgSend(v6, "skipPhase") ^ 1);
  LODWORD(v7) = [v6 cancelActiveUpdate];

  [v8 setSkipCancelPreviousUpdate:v7 ^ 1];
  [v8 setAdditionalOptions:0];
  [v8 setBaseRollbackOptions:0];
}

- (unint64_t)coreMDMPathForSUSPath:(unint64_t)a3
{
  unint64_t result = a3;
  if (a3 >= 3)
  {
    SULogInfo(@"Unable to map SUS MDM SU path to SUCore MDM SU path (%lu). Returning SUCoreMDMSoftwareUpdatePathDefault", (uint64_t)a2, a3, v3, v4, v5, v6, v7, a3);
    return 0;
  }
  return result;
}

- (id)_SUAssetTypeForScanOptions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3
    && [v3 containsType:4]
    && ([v4 types],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6 == 1))
  {
    uint64_t v7 = 7;
  }
  else
  {
    uint64_t v7 = 1;
  }
  id v8 = [MEMORY[0x263F77BA0] getAssetTypeForKind:v7 usingFamily:1];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_rollbackOptions, 0);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_downloadOptions, 0);
  objc_storeStrong((id *)&self->_scanOption, 0);
  objc_storeStrong((id *)&self->_globalOptions, 0);
  objc_storeStrong((id *)&self->_rollbackPolicy, 0);
  objc_storeStrong((id *)&self->_corePolicy, 0);
}

@end