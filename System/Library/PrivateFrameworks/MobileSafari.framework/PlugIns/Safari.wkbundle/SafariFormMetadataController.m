@interface SafariFormMetadataController
- (void)didFindSearchURLTemplateString:(id)a3 inFrame:(id)a4 pageController:(id)a5;
- (void)invalidate;
@end

@implementation SafariFormMetadataController

- (void)invalidate
{
  quickWebsiteSearchEventListener = self->_quickWebsiteSearchEventListener;
  self->_quickWebsiteSearchEventListener = 0;

  v4.receiver = self;
  v4.super_class = (Class)SafariFormMetadataController;
  [(_SFFormMetadataController *)&v4 invalidate];
}

- (void)didFindSearchURLTemplateString:(id)a3 inFrame:(id)a4 pageController:(id)a5
{
  id v28 = a3;
  id v11 = a4;
  quickWebsiteSearchEventListener = self->_quickWebsiteSearchEventListener;
  if (!quickWebsiteSearchEventListener)
  {
    v13 = (void *)MEMORY[0x263F1FAB8];
    id v14 = a5;
    v17 = objc_msgSend_remoteObjectInterfaceWithProtocol_(v13, v15, (uint64_t)&unk_26E95A990, v16);
    v21 = objc_msgSend__remoteObjectRegistry(v14, v18, v19, v20);

    objc_msgSend_remoteObjectProxyWithInterface_(v21, v22, (uint64_t)v17, v23);
    v24 = (QuickWebsiteSearchEventListener *)objc_claimAutoreleasedReturnValue();
    v25 = self->_quickWebsiteSearchEventListener;
    self->_quickWebsiteSearchEventListener = v24;

    quickWebsiteSearchEventListener = self->_quickWebsiteSearchEventListener;
  }
  v26 = objc_msgSend_URL(v11, v8, v9, v10);
  objc_msgSend_didAutoDetectSiteSpecificSearchProviderWithOriginatingURL_searchURLTemplate_(quickWebsiteSearchEventListener, v27, (uint64_t)v26, (uint64_t)v28);
}

- (void).cxx_destruct
{
}

@end