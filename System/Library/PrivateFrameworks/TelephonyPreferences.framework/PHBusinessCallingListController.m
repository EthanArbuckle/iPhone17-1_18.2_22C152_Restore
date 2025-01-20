@interface PHBusinessCallingListController
- (CoreTelephonyClient)ctClient;
- (PHBrandedCallingController)brandedCallingController;
- (PHBusinessCallingListController)init;
- (PHBusinessConnectCallingController)businessConnectCallingController;
- (id)groupFooterTextFor:(id)a3;
- (id)specifiers;
- (void)activeSubscriptionsDidChange;
- (void)setBrandedCallingController:(id)a3;
- (void)setBusinessConnectCallingController:(id)a3;
- (void)setCtClient:(id)a3;
- (void)willEnterForeground;
@end

@implementation PHBusinessCallingListController

- (PHBusinessCallingListController)init
{
  v16.receiver = self;
  v16.super_class = (Class)PHBusinessCallingListController;
  v2 = [(PHBusinessCallingListController *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(PHBusinessCallingListController *)v2 specifier];

    if (v4)
    {
      v5 = [(PHBusinessCallingListController *)v3 specifier];
      uint64_t v6 = [v5 propertyForKey:@"PHBrandedCallingControllerKey"];
      brandedCallingController = v3->_brandedCallingController;
      v3->_brandedCallingController = (PHBrandedCallingController *)v6;

      [(PHBrandedCallingController *)v3->_brandedCallingController setParentListController:v3];
    }
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v9 = dispatch_queue_create("PHBrandedCallingListControllerQueue", v8);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v9];
    ctClient = v3->_ctClient;
    v3->_ctClient = (CoreTelephonyClient *)v10;

    [(CoreTelephonyClient *)v3->_ctClient setDelegate:v3];
    v12 = objc_alloc_init(PHBusinessConnectCallingController);
    businessConnectCallingController = v3->_businessConnectCallingController;
    v3->_businessConnectCallingController = v12;

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v3 selector:sel_willEnterForeground name:*MEMORY[0x1E4FB2730] object:0];
  }
  return v3;
}

- (void)willEnterForeground
{
  [(PHBrandedCallingController *)self->_brandedCallingController updateBrandedCallingState];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PHBusinessCallingListController_willEnterForeground__block_invoke;
  block[3] = &unk_1E6EB2258;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__PHBusinessCallingListController_willEnterForeground__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (*v2)
  {
    id v3 = *v2;
  }
  else
  {
    v4 = self;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = [(PHBusinessCallingListController *)v4 specifier];

    if (!v6) {
      goto LABEL_14;
    }
    if (v4->_brandedCallingController) {
      goto LABEL_6;
    }
    v7 = [(PHBusinessCallingListController *)v4 specifier];
    uint64_t v8 = [v7 propertyForKey:@"PHBrandedCallingControllerKey"];
    brandedCallingController = v4->_brandedCallingController;
    v4->_brandedCallingController = (PHBrandedCallingController *)v8;

    [(PHBrandedCallingController *)v4->_brandedCallingController setParentListController:v4];
    if (v4->_brandedCallingController)
    {
LABEL_6:
      location = v2;
      uint64_t v10 = [(PHBusinessConnectCallingController *)v4->_businessConnectCallingController specifiers];
      [v5 addObjectsFromArray:v10];

      v11 = [(PHBrandedCallingController *)v4->_brandedCallingController activeContextsSupportingBrandedCalling];
      v12 = (void *)MEMORY[0x1E4F92E70];
      v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v14 = [v13 localizedStringForKey:@"BRANDED_CALLING_GROUP_HEADER" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
      v15 = [v12 groupSpecifierWithID:@"BrandedCallingGroup" name:v14];

      objc_super v16 = [(PHBusinessCallingListController *)v4 groupFooterTextFor:v11];
      [v15 setProperty:v16 forKey:*MEMORY[0x1E4F93170]];

      [v5 addObject:v15];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id obj = v11;
      uint64_t v17 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            v21 = v5;
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            v23 = [PHBrandedCallingSwitchSpecifier alloc];
            ctClient = v4->_ctClient;
            [v22 context];
            v26 = v25 = v4;
            v27 = [v22 carrierName];
            v28 = [(PHBrandedCallingSwitchSpecifier *)v23 initWithCoreTelephonyClient:ctClient context:v26 carrierName:v27];
            id v5 = v21;
            [v21 addObject:v28];

            v4 = v25;
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v18);
      }

      objc_storeStrong(location, v5);
      id v3 = *location;
    }
    else
    {
LABEL_14:
      id v3 = *v2;
    }
  }
  return v3;
}

- (void)activeSubscriptionsDidChange
{
  [(PHBrandedCallingController *)self->_brandedCallingController updateBrandedCallingState];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PHBusinessCallingListController_activeSubscriptionsDidChange__block_invoke;
  block[3] = &unk_1E6EB2258;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__PHBusinessCallingListController_activeSubscriptionsDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)groupFooterTextFor:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    v4 = NSString;
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"BRANDED_CALLING_SINGLE_CARRIER_FOOTER_TEXT" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    v7 = [v3 objectAtIndexedSubscript:0];
    uint64_t v8 = [v7 carrierName];
    objc_msgSend(v4, "stringWithFormat:", v6, v8);
    dispatch_queue_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_7;
  }
  if ([v3 count] == 2)
  {
    uint64_t v10 = NSString;
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"BRANDED_CALLING_TWO_CARRIER_FOOTER_TEXT" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    v7 = [v3 objectAtIndexedSubscript:0];
    uint64_t v8 = [v7 carrierName];
    v11 = [v3 objectAtIndexedSubscript:1];
    v12 = [v11 carrierName];
    objc_msgSend(v10, "stringWithFormat:", v6, v8, v12);
    dispatch_queue_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  dispatch_queue_t v9 = &stru_1F40BEF98;
LABEL_7:

  return v9;
}

- (PHBrandedCallingController)brandedCallingController
{
  return self->_brandedCallingController;
}

- (void)setBrandedCallingController:(id)a3
{
}

- (PHBusinessConnectCallingController)businessConnectCallingController
{
  return self->_businessConnectCallingController;
}

- (void)setBusinessConnectCallingController:(id)a3
{
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_businessConnectCallingController, 0);
  objc_storeStrong((id *)&self->_brandedCallingController, 0);
}

@end