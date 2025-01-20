@interface SSApplicationScreenshotSupplementalDataCapturer
+ (id)settingsForDocumentCapture:(BOOL)a3 elementIdentifier:(id)a4;
- (SSApplicationScreenshotSupplementalDataCapturer)init;
- (void)_sendRequestForEnvironmentElement:(id)a3 info:(id)a4 completionBlock:(id)a5;
- (void)captureDocumentForEnvironmentElement:(id)a3 withCompletionBlock:(id)a4;
- (void)captureMetadataForEnvironmentElement:(id)a3 withCompletionBlock:(id)a4;
@end

@implementation SSApplicationScreenshotSupplementalDataCapturer

- (SSApplicationScreenshotSupplementalDataCapturer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSApplicationScreenshotSupplementalDataCapturer;
  v2 = [(SSApplicationScreenshotSupplementalDataCapturer *)&v6 init];
  uint64_t v3 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  openAppService = v2->_openAppService;
  v2->_openAppService = (FBSOpenApplicationService *)v3;

  return v2;
}

- (void)captureMetadataForEnvironmentElement:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_class();
  v9 = [v6 elementIdentifier];
  v10 = [v8 settingsForDocumentCapture:0 elementIdentifier:v9];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __108__SSApplicationScreenshotSupplementalDataCapturer_captureMetadataForEnvironmentElement_withCompletionBlock___block_invoke;
  v13[3] = &unk_2644ED620;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [(SSApplicationScreenshotSupplementalDataCapturer *)self _sendRequestForEnvironmentElement:v11 info:v10 completionBlock:v13];
}

void __108__SSApplicationScreenshotSupplementalDataCapturer_captureMetadataForEnvironmentElement_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 info];
    id v7 = [v3 objectForSetting:3];

    v4 = objc_alloc_init(SSEnvironmentElementMetadataUpdate);
    v5 = [*(id *)(a1 + 32) identifier];
    [(SSEnvironmentElementMetadataUpdate *)v4 setEnvironmentElementIdentifier:v5];

    [(SSEnvironmentElementMetadataUpdate *)v4 setMetadata:v7];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

- (void)captureDocumentForEnvironmentElement:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_class();
  v9 = [v6 elementIdentifier];
  v10 = [v8 settingsForDocumentCapture:1 elementIdentifier:v9];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __108__SSApplicationScreenshotSupplementalDataCapturer_captureDocumentForEnvironmentElement_withCompletionBlock___block_invoke;
  v13[3] = &unk_2644ED620;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [(SSApplicationScreenshotSupplementalDataCapturer *)self _sendRequestForEnvironmentElement:v11 info:v10 completionBlock:v13];
}

void __108__SSApplicationScreenshotSupplementalDataCapturer_captureDocumentForEnvironmentElement_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 info];
    id v7 = [v3 objectForSetting:4];

    v4 = objc_alloc_init(SSEnvironmentElementDocumentUpdate);
    v5 = [*(id *)(a1 + 32) identifier];
    [(SSEnvironmentElementDocumentUpdate *)v4 setEnvironmentElementIdentifier:v5];

    [(SSEnvironmentElementDocumentUpdate *)v4 setDocument:v7];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

+ (id)settingsForDocumentCapture:(BOOL)a3 elementIdentifier:(id)a4
{
  v4 = (objc_class *)MEMORY[0x263F29C78];
  id v5 = a4;
  id v6 = objc_alloc_init(v4);
  [v6 setFlag:BSSettingFlagForBool() forSetting:7];
  [v6 setObject:v5 forSetting:10];

  return v6;
}

- (void)_sendRequestForEnvironmentElement:(id)a3 info:(id)a4 completionBlock:(id)a5
{
  v24[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 supportsMetadataCapture])
  {
    id v11 = objc_alloc(MEMORY[0x263F1C930]);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __106__SSApplicationScreenshotSupplementalDataCapturer__sendRequestForEnvironmentElement_info_completionBlock___block_invoke;
    v20[3] = &unk_2644ED648;
    id v21 = v10;
    id v12 = (void *)[v11 initWithInfo:v9 timeout:MEMORY[0x263EF83A0] forResponseOnQueue:v20 withHandler:0.0];
    v13 = (void *)MEMORY[0x263F3F778];
    uint64_t v14 = *MEMORY[0x263F3F580];
    v22 = v12;
    v23[0] = v14;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    v23[1] = *MEMORY[0x263F3F598];
    v24[0] = v15;
    v24[1] = MEMORY[0x263EFFA88];
    v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    v17 = [v13 optionsWithDictionary:v16];

    openAppService = self->_openAppService;
    v19 = [v8 bundleIdentifier];
    [(FBSOpenApplicationService *)openAppService openApplication:v19 withOptions:v17 completion:0];
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __106__SSApplicationScreenshotSupplementalDataCapturer__sendRequestForEnvironmentElement_info_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 error];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end