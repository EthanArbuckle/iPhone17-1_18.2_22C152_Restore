@interface SXActionAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXActionAssembly

SXPostActionHandlerManager *__35__SXActionAssembly_loadInRegistry___block_invoke_7()
{
  v0 = objc_alloc_init(SXPostActionHandlerManager);
  return v0;
}

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D5B2B70 factory:&__block_literal_global_73];

  v6 = [v3 publicContainer];
  id v7 = (id)[v6 registerProtocol:&unk_26D610D30 factory:&__block_literal_global_86_0];

  v8 = [v3 publicContainer];
  v9 = [v8 registerClass:objc_opt_class() factory:&__block_literal_global_90];
  id v10 = (id)[v9 withConfiguration:&__block_literal_global_93_0];

  v11 = [v3 publicContainer];
  id v12 = (id)[v11 registerProtocol:&unk_26D5EF308 factory:&__block_literal_global_118_1];

  v13 = [v3 publicContainer];
  id v14 = (id)[v13 registerProtocol:&unk_26D5C3410 factory:&__block_literal_global_126_2];

  v15 = [v3 publicContainer];
  v16 = [v15 registerProtocol:&unk_26D62C3D0 factory:&__block_literal_global_130_1];
  id v17 = (id)[v16 inScope:2];

  v18 = [v3 privateContainer];
  v19 = [v18 registerClass:objc_opt_class() factory:&__block_literal_global_134];
  id v20 = (id)[v19 withConfiguration:&__block_literal_global_137];

  v21 = [v3 publicContainer];
  v22 = [v21 registerProtocol:&unk_26D602D50 factory:&__block_literal_global_148];
  id v23 = (id)[v22 withConfiguration:&__block_literal_global_152_1];

  v24 = [v3 privateContainer];
  id v25 = (id)[v24 registerProtocol:&unk_26D5C71E0 factory:&__block_literal_global_163_0];

  v26 = [v3 privateContainer];
  id v27 = (id)[v26 registerClass:objc_opt_class() factory:&__block_literal_global_180];

  v28 = [v3 privateContainer];
  id v29 = (id)[v28 registerClass:objc_opt_class() factory:&__block_literal_global_205];

  v30 = [v3 privateContainer];
  id v31 = (id)[v30 registerClass:objc_opt_class() factory:&__block_literal_global_212];

  v32 = [v3 publicContainer];
  id v33 = (id)[v32 registerClass:objc_opt_class() factory:&__block_literal_global_222_0];

  v34 = [v3 publicContainer];
  id v35 = (id)[v34 registerClass:objc_opt_class() factory:&__block_literal_global_228_0];

  v36 = [v3 publicContainer];
  id v37 = (id)[v36 registerClass:objc_opt_class() factory:&__block_literal_global_231];

  v38 = [v3 publicContainer];
  id v39 = (id)[v38 registerClass:objc_opt_class() factory:&__block_literal_global_237_0];

  v40 = [v3 publicContainer];
  id v41 = (id)[v40 registerClass:objc_opt_class() factory:&__block_literal_global_241];

  v42 = [v3 publicContainer];
  id v43 = (id)[v42 registerProtocol:&unk_26D5ED610 factory:&__block_literal_global_247_0];

  v44 = [v3 privateContainer];
  id v45 = (id)[v44 registerProtocol:&unk_26D5B3B90 factory:&__block_literal_global_251_2];

  v46 = [v3 privateContainer];
  id v47 = (id)[v46 registerClass:objc_opt_class() factory:&__block_literal_global_256];

  v48 = [v3 privateContainer];
  id v49 = (id)[v48 registerClass:objc_opt_class() factory:&__block_literal_global_259];

  v50 = [v3 privateContainer];
  id v51 = (id)[v50 registerClass:objc_opt_class() factory:&__block_literal_global_262];

  v52 = [v3 privateContainer];
  id v53 = (id)[v52 registerClass:objc_opt_class() factory:&__block_literal_global_265];

  v54 = [v3 privateContainer];
  id v55 = (id)[v54 registerClass:objc_opt_class() factory:&__block_literal_global_271];

  v56 = [v3 privateContainer];
  id v57 = (id)[v56 registerClass:objc_opt_class() factory:&__block_literal_global_274];

  v58 = [v3 privateContainer];
  id v59 = (id)[v58 registerClass:objc_opt_class() factory:&__block_literal_global_277_0];

  v60 = [v3 privateContainer];
  id v61 = (id)[v60 registerClass:objc_opt_class() factory:&__block_literal_global_280];

  v62 = [v3 privateContainer];
  id v63 = (id)[v62 registerClass:objc_opt_class() factory:&__block_literal_global_283];

  v64 = [v3 privateContainer];
  id v65 = (id)[v64 registerClass:objc_opt_class() factory:&__block_literal_global_286_0];

  v66 = [v3 privateContainer];
  id v67 = (id)[v66 registerClass:objc_opt_class() factory:&__block_literal_global_289_1];

  v68 = [v3 privateContainer];
  id v69 = (id)[v68 registerClass:objc_opt_class() factory:&__block_literal_global_292_0];

  v70 = [v3 publicContainer];
  id v71 = (id)[v70 registerProtocol:&unk_26D5DF0D0 factory:&__block_literal_global_295];

  id v74 = [v3 privateContainer];

  v72 = [v74 registerClass:objc_opt_class() factory:&__block_literal_global_299];
  id v73 = (id)[v72 inScope:2];
}

SXActionManager *__35__SXActionAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXActionManager alloc];
  v4 = [v2 resolveProtocol:&unk_26D602D50];
  id v5 = [v2 resolveProtocol:&unk_26D5C71E0];
  v6 = [v2 resolveProtocol:&unk_26D62C3D0];

  id v7 = [(SXActionManager *)v3 initWithActionActivityManager:v4 viewManager:v5 postActionHandlerManager:v6];
  return v7;
}

id __35__SXActionAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

SXActionEngine *__35__SXActionAssembly_loadInRegistry___block_invoke_3()
{
  v0 = objc_alloc_init(SXActionEngine);
  return v0;
}

void __35__SXActionAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v9 = [v5 resolveClass:objc_opt_class()];
  [v4 registerFactory:v9 URLHost:@"link"];
  [v4 registerFactory:v9 additionType:objc_opt_class()];
  v6 = [v5 resolveClass:objc_opt_class()];
  [v4 registerFactory:v6 URLHost:@"email"];
  [v4 registerFactory:v6 additionType:objc_opt_class()];
  id v7 = [v5 resolveClass:objc_opt_class()];
  [v4 registerFactory:v7 URLHost:@"phone-number"];
  [v4 registerFactory:v7 additionType:objc_opt_class()];
  v8 = [v5 resolveClass:objc_opt_class()];

  [v4 registerFactory:v8 URLHost:@"calendar-event"];
  [v4 registerFactory:v8 additionType:objc_opt_class()];
}

SXURLActionFactory *__35__SXActionAssembly_loadInRegistry___block_invoke_5()
{
  v0 = objc_alloc_init(SXURLActionFactory);
  return v0;
}

id __35__SXActionAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

SXActionSerializationManager *__35__SXActionAssembly_loadInRegistry___block_invoke_8()
{
  v0 = objc_alloc_init(SXActionSerializationManager);
  return v0;
}

void __35__SXActionAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [v5 resolveClass:objc_opt_class()];
  [v4 registerSerializer:v6 actionType:@"link"];

  id v7 = [v5 resolveClass:objc_opt_class()];
  [v4 registerSerializer:v7 actionType:@"email"];

  v8 = [v5 resolveClass:objc_opt_class()];
  [v4 registerSerializer:v8 actionType:@"phone_number"];

  id v9 = [v5 resolveClass:objc_opt_class()];
  [v4 registerSerializer:v9 actionType:@"calendar"];

  id v10 = [v5 resolveClass:objc_opt_class()];
  [v4 registerSerializer:v10 actionType:@"webcal"];

  v11 = [v5 resolveClass:objc_opt_class()];
  [v4 registerSerializer:v11 actionType:@"bookmark"];

  id v12 = [v5 resolveClass:objc_opt_class()];
  [v4 registerSerializer:v12 actionType:@"subscribe"];

  id v13 = [v5 resolveClass:objc_opt_class()];

  [v4 registerSerializer:v13 actionType:@"close"];
}

SXActionActivityManager *__35__SXActionAssembly_loadInRegistry___block_invoke_10()
{
  v0 = objc_alloc_init(SXActionActivityManager);
  return v0;
}

void __35__SXActionAssembly_loadInRegistry___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [v5 resolveClass:objc_opt_class()];
  [v4 registerActionActivityProvider:v6 actionType:@"link"];

  id v7 = [v5 resolveClass:objc_opt_class()];
  [v4 registerActionActivityProvider:v7 actionType:@"email"];

  v8 = [v5 resolveClass:objc_opt_class()];
  [v4 registerActionActivityProvider:v8 actionType:@"phone_number"];

  id v9 = [v5 resolveClass:objc_opt_class()];
  [v4 registerActionActivityProvider:v9 actionType:@"calendar"];

  id v10 = [v5 resolveClass:objc_opt_class()];
  [v4 registerActionActivityProvider:v10 actionType:@"webcal"];

  v11 = [v5 resolveClass:objc_opt_class()];
  [v4 registerActionActivityProvider:v11 actionType:@"bookmark"];

  id v12 = [v5 resolveClass:objc_opt_class()];
  [v4 registerActionActivityProvider:v12 actionType:@"subscribe"];

  id v13 = [v5 resolveClass:objc_opt_class()];

  [v4 registerActionActivityProvider:v13 actionType:@"close"];
}

SXActionViewManager *__35__SXActionAssembly_loadInRegistry___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXActionViewManager alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5EFEA8];

  id v5 = [(SXActionViewManager *)v3 initWithViewControllerPresenting:v4];
  return v5;
}

SXLinkActionActivityProvider *__35__SXActionAssembly_loadInRegistry___block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXLinkActionActivityProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D6418F0];
  id v5 = [v2 resolveProtocol:&unk_26D6419B8];
  v6 = [v2 resolveProtocol:&unk_26D5C9B00];
  id v7 = [v2 resolveProtocol:&unk_26D5DF0D0];

  v8 = [(SXLinkActionActivityProvider *)v3 initWithURLHandler:v4 URLPreviewing:v5 host:v6 URLQualifier:v7];
  return v8;
}

SXEmailActionActivityProvider *__35__SXActionAssembly_loadInRegistry___block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXEmailActionActivityProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D641A70];

  id v5 = [(SXEmailActionActivityProvider *)v3 initWithMailPresenter:v4];
  return v5;
}

SXPhoneNumberActionActivityProvider *__35__SXActionAssembly_loadInRegistry___block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXPhoneNumberActionActivityProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5C9B00];
  id v5 = [v2 resolveProtocol:&unk_26D641B30];
  v6 = [v2 resolveProtocol:&unk_26D617790];

  id v7 = [(SXPhoneNumberActionActivityProvider *)v3 initWithHost:v4 messagePresenter:v5 deviceCapabilities:v6];
  return v7;
}

SXCalendarEventActionActivityProvider *__35__SXActionAssembly_loadInRegistry___block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXCalendarEventActionActivityProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5B3B90];
  id v5 = [v2 resolveProtocol:&unk_26D5C9B00];

  v6 = [(SXCalendarEventActionActivityProvider *)v3 initWithCalendarPresenter:v4 host:v5];
  return v6;
}

SXWebCalActionActivityProvider *__35__SXActionAssembly_loadInRegistry___block_invoke_17()
{
  v0 = objc_alloc_init(SXWebCalActionActivityProvider);
  return v0;
}

id *__35__SXActionAssembly_loadInRegistry___block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXBookmarkActionActivityProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5DEC78];

  id v5 = -[SXBookmarkActionActivityProvider initWithBookmarkManager:]((id *)&v3->super.isa, v4);
  return v5;
}

SXSubscribeActionActivityProvider *__35__SXActionAssembly_loadInRegistry___block_invoke_19(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXSubscribeActionActivityProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D62BAB8];
  id v5 = [v2 resolveProtocol:&unk_26D5EFEA8];
  v6 = [v2 resolveProtocol:&unk_26D5B2B70];

  id v7 = [(SXSubscribeActionActivityProvider *)v3 initWithHandler:v4 viewControllerPresenting:v5 actionManager:v6];
  return v7;
}

id *__35__SXActionAssembly_loadInRegistry___block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXCloseActionActivityProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5EFEA8];
  id v5 = [v2 resolveProtocol:&unk_26D5ED610];

  v6 = -[SXCloseActionActivityProvider initWithViewControllerPresenting:handler:]((id *)&v3->super.isa, v4, v5);
  return v6;
}

SXCloseActionHandler *__35__SXActionAssembly_loadInRegistry___block_invoke_21()
{
  v0 = objc_alloc_init(SXCloseActionHandler);
  return v0;
}

SXCalendarPresenter *__35__SXActionAssembly_loadInRegistry___block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXCalendarPresenter alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5EFEA8];
  id v5 = [v2 resolveClass:objc_opt_class()];

  v6 = [(SXCalendarPresenter *)v3 initWithViewControllerPresenting:v4 eventStoreProvider:v5];
  return v6;
}

SXLinkActionFactory *__35__SXActionAssembly_loadInRegistry___block_invoke_23(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXLinkActionFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5EF308];

  id v5 = [(SXLinkActionFactory *)v3 initWithURLActionFactory:v4];
  return v5;
}

SXEmailActionFactory *__35__SXActionAssembly_loadInRegistry___block_invoke_24()
{
  v0 = objc_alloc_init(SXEmailActionFactory);
  return v0;
}

SXPhoneNumberActionFactory *__35__SXActionAssembly_loadInRegistry___block_invoke_25()
{
  v0 = objc_alloc_init(SXPhoneNumberActionFactory);
  return v0;
}

SXCalendarEventActionFactory *__35__SXActionAssembly_loadInRegistry___block_invoke_26(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXCalendarEventActionFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D618C20];

  id v5 = [(SXCalendarEventActionFactory *)v3 initWithDateParser:v4];
  return v5;
}

SXLinkActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_27()
{
  v0 = objc_alloc_init(SXLinkActionSerializer);
  return v0;
}

SXEmailActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_28()
{
  v0 = objc_alloc_init(SXEmailActionSerializer);
  return v0;
}

SXPhoneNumberActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_29()
{
  v0 = objc_alloc_init(SXPhoneNumberActionSerializer);
  return v0;
}

SXCalendarEventActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_30()
{
  v0 = objc_alloc_init(SXCalendarEventActionSerializer);
  return v0;
}

SXWebCalActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_31()
{
  v0 = objc_alloc_init(SXWebCalActionSerializer);
  return v0;
}

SXBookmarkActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_32()
{
  v0 = objc_alloc_init(SXBookmarkActionSerializer);
  return v0;
}

SXSubscribeActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_33()
{
  v0 = objc_alloc_init(SXSubscribeActionSerializer);
  return v0;
}

SXCloseActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_34()
{
  v0 = objc_alloc_init(SXCloseActionSerializer);
  return v0;
}

SXLinkActionURLQualifier *__35__SXActionAssembly_loadInRegistry___block_invoke_35()
{
  v0 = objc_alloc_init(SXLinkActionURLQualifier);
  return v0;
}

SXEventStoreProvider *__35__SXActionAssembly_loadInRegistry___block_invoke_36()
{
  v0 = objc_alloc_init(SXEventStoreProvider);
  return v0;
}

@end