@interface SXFrameworkAssembly
- (NSArray)assemblies;
- (SXFrameworkAssembly)init;
@end

@implementation SXFrameworkAssembly

- (SXFrameworkAssembly)init
{
  v52[41] = *MEMORY[0x263EF8340];
  v51.receiver = self;
  v51.super_class = (Class)SXFrameworkAssembly;
  v2 = [(SXFrameworkAssembly *)&v51 init];
  if (v2)
  {
    SXSetupLogging();
    v50 = v2;
    id v3 = objc_alloc_init(MEMORY[0x263F6C6E8]);
    v49 = [v3 assemblies];

    v48 = objc_alloc_init(SXCoreAssembly);
    v52[0] = v48;
    v47 = objc_alloc_init(SXDOMAssembly);
    v52[1] = v47;
    v46 = objc_alloc_init(SXComponentAssembly);
    v52[2] = v46;
    v45 = objc_alloc_init(SXTangierAssembly);
    v52[3] = v45;
    v44 = objc_alloc_init(SXActionAssembly);
    v52[4] = v44;
    v43 = objc_alloc_init(SXBookmarkAssembly);
    v52[5] = v43;
    v42 = objc_alloc_init(SXFullscreenAssembly);
    v52[6] = v42;
    v41 = objc_alloc_init(SXStyleAssembly);
    v52[7] = v41;
    v40 = objc_alloc_init(SXAdAssembly);
    v52[8] = v40;
    v39 = objc_alloc_init(SXComponentInsertionAssembly);
    v52[9] = v39;
    v38 = objc_alloc_init(SXQuickLookAssembly);
    v52[10] = v38;
    v37 = objc_alloc_init(SXSubscriptionAssembly);
    v52[11] = v37;
    v36 = objc_alloc_init(SXOfferUpsellScenarioAssembly);
    v52[12] = v36;
    v35 = objc_alloc_init(SXLayoutAssembly);
    v52[13] = v35;
    v34 = objc_alloc_init(SXManagerAssembly);
    v52[14] = v34;
    v33 = objc_alloc_init(SXRenderingConfigurationAssembly);
    v52[15] = v33;
    v32 = objc_alloc_init(SXNewsletterAssembly);
    v52[16] = v32;
    v31 = objc_alloc_init(SXFormatAssembly);
    v52[17] = v31;
    v30 = objc_alloc_init(SXTextComponentAssembly);
    v52[18] = v30;
    v29 = objc_alloc_init(SXVideoComponentAssembly);
    v52[19] = v29;
    v28 = objc_alloc_init(SXContainerComponentAssembly);
    v52[20] = v28;
    v27 = objc_alloc_init(SXDataTableComponentAssembly);
    v52[21] = v27;
    v26 = objc_alloc_init(SXEmbedVideoComponentAssembly);
    v52[22] = v26;
    v25 = objc_alloc_init(SXEmbedComponentAssembly);
    v52[23] = v25;
    v24 = objc_alloc_init(SXImageComponentAssembly);
    v52[24] = v24;
    v23 = objc_alloc_init(SXLineComponentAssembly);
    v52[25] = v23;
    v22 = objc_alloc_init(SXScalableImageComponentAssembly);
    v52[26] = v22;
    v21 = objc_alloc_init(SXMapComponentAssembly);
    v52[27] = v21;
    v19 = objc_alloc_init(SXStripGalleryComponentAssembly);
    v52[28] = v19;
    v18 = objc_alloc_init(SXMosaicGalleryComponentAssembly);
    v52[29] = v18;
    v17 = objc_alloc_init(SXSectionComponentAssembly);
    v52[30] = v17;
    v4 = objc_alloc_init(SXAudioComponentAssembly);
    v52[31] = v4;
    v5 = objc_alloc_init(SXWebContentComponentAssembly);
    v52[32] = v5;
    v6 = objc_alloc_init(SXQuickLookComponentAssembly);
    v52[33] = v6;
    v7 = objc_alloc_init(SXFlexibleSpacerComponentAssembly);
    v52[34] = v7;
    v8 = objc_alloc_init(SXButtonComponentAssembly);
    v52[35] = v8;
    v9 = objc_alloc_init(SXSubscriptionButtonComponentAssembly);
    v52[36] = v9;
    v10 = objc_alloc_init(SXIssueCoverComponentAssembly);
    v52[37] = v10;
    v11 = objc_alloc_init(SXPlaceholderArticleThumbnailComponentAssembly);
    v52[38] = v11;
    v12 = objc_alloc_init(SXArticleLinkComponentAssembly);
    v52[39] = v12;
    v13 = objc_alloc_init(SXAdvertisementComponentAssembly);
    v52[40] = v13;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:41];

    v2 = v50;
    uint64_t v14 = [v49 arrayByAddingObjectsFromArray:v20];
    assemblies = v50->_assemblies;
    v50->_assemblies = (NSArray *)v14;
  }
  return v2;
}

- (NSArray)assemblies
{
  return self->_assemblies;
}

- (void).cxx_destruct
{
}

@end