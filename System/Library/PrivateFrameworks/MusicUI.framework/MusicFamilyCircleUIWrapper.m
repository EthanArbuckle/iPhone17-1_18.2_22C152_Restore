@interface MusicFamilyCircleUIWrapper
+ (void)presentFamilyCircleSheet:(id)a3 withParameters:(id)a4 completionHandler:(id)a5;
@end

@implementation MusicFamilyCircleUIWrapper

+ (void)presentFamilyCircleSheet:(id)a3 withParameters:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  v10 = (void *)getFACircleStateControllerClass_softClass;
  uint64_t v41 = getFACircleStateControllerClass_softClass;
  if (!getFACircleStateControllerClass_softClass)
  {
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    v35 = __getFACircleStateControllerClass_block_invoke;
    v36 = &unk_26486AD90;
    v37 = &v38;
    __getFACircleStateControllerClass_block_invoke((uint64_t)&v33);
    v10 = (void *)v39[3];
  }
  v11 = v10;
  _Block_object_dispose(&v38, 8);
  id v32 = (id)[[v11 alloc] initWithPresenter:v7];
  [(id)v28[5] setPresentationType:2];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  v12 = (void *)getFACircleContextClass_softClass;
  uint64_t v41 = getFACircleContextClass_softClass;
  if (!getFACircleContextClass_softClass)
  {
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    v35 = __getFACircleContextClass_block_invoke;
    v36 = &unk_26486AD90;
    v37 = &v38;
    __getFACircleContextClass_block_invoke((uint64_t)&v33);
    v12 = (void *)v39[3];
  }
  v13 = v12;
  _Block_object_dispose(&v38, 8);
  id v14 = [v13 alloc];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  v15 = (id *)getFACircleEventTypeInitiateSymbolLoc_ptr;
  uint64_t v41 = getFACircleEventTypeInitiateSymbolLoc_ptr;
  if (!getFACircleEventTypeInitiateSymbolLoc_ptr)
  {
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    v35 = __getFACircleEventTypeInitiateSymbolLoc_block_invoke;
    v36 = &unk_26486AD90;
    v37 = &v38;
    v16 = (void *)FamilyCircleUILibrary();
    v17 = dlsym(v16, "FACircleEventTypeInitiate");
    *(void *)(v37[1] + 24) = v17;
    getFACircleEventTypeInitiateSymbolLoc_ptr = *(void *)(v37[1] + 24);
    v15 = (id *)v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (v15)
  {
    id v18 = *v15;
    v19 = (void *)[v14 initWithEventType:v18];

    [v19 setClientName:@"AppleMusic"];
    v20 = [MEMORY[0x263F086E0] mainBundle];
    v21 = [v20 bundleIdentifier];
    [v19 setClientBundleID:v21];

    [v19 setAdditionalParameters:v8];
    [v19 setActivityIndicatorStyle:0];
    v22 = (void *)v28[5];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __88__MusicFamilyCircleUIWrapper_presentFamilyCircleSheet_withParameters_completionHandler___block_invoke;
    v24[3] = &unk_26486AD68;
    id v23 = v9;
    id v25 = v23;
    v26 = &v27;
    [v22 performWithContext:v19 completion:v24];

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
}

void __88__MusicFamilyCircleUIWrapper_presentFamilyCircleSheet_withParameters_completionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __88__MusicFamilyCircleUIWrapper_presentFamilyCircleSheet_withParameters_completionHandler___block_invoke_2;
  v4[3] = &unk_26486AD40;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __88__MusicFamilyCircleUIWrapper_presentFamilyCircleSheet_withParameters_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

@end