@interface TapToRadarKitHelper
+ (BOOL)createProblem:(id)a3 componentVersion:(id)a4 componentID:(id)a5 title:(id)a6 description:(id)a7 attachmentURLs:(id)a8 extensionIDs:(id)a9 deviceIDs:(id)a10 displayReason:(id)a11;
+ (id)createDraft:(id)a3 description:(id)a4 attachmentURLs:(id)a5 extensionIDs:(id)a6 deviceIDs:(id)a7 component:(id)a8;
+ (id)getLogger;
@end

@implementation TapToRadarKitHelper

+ (id)getLogger
{
  if (getLogger_onceToken != -1) {
    dispatch_once(&getLogger_onceToken, &__block_literal_global);
  }
  v2 = (void *)getLogger__logger;
  return v2;
}

uint64_t __32__TapToRadarKitHelper_getLogger__block_invoke()
{
  getLogger__logger = (uint64_t)os_log_create("com.apple.siri.sirikit", "TapToRadarKitHelper");
  return MEMORY[0x270F9A758]();
}

+ (BOOL)createProblem:(id)a3 componentVersion:(id)a4 componentID:(id)a5 title:(id)a6 description:(id)a7 attachmentURLs:(id)a8 extensionIDs:(id)a9 deviceIDs:(id)a10 displayReason:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v39 = a6;
  id v38 = a7;
  id v37 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
  v23 = +[TapToRadarKitHelper getLogger];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    +[TapToRadarKitHelper createProblem:componentVersion:componentID:title:description:attachmentURLs:extensionIDs:deviceIDs:displayReason:](v23);
  }

  v24 = 0;
  if (v16 && v17 && v18) {
    v24 = objc_msgSend(objc_alloc(getRadarComponentClass()), "initWithName:version:identifier:", v16, v17, objc_msgSend(v18, "integerValue"));
  }
  id v35 = v16;
  v25 = v17;
  v26 = v18;
  v27 = +[TapToRadarKitHelper createDraft:description:attachmentURLs:extensionIDs:deviceIDs:component:](TapToRadarKitHelper, "createDraft:description:attachmentURLs:extensionIDs:deviceIDs:component:", v39, v38, v37, v19, v20, v24, v35);
  [v27 setRemoteDeviceSelections:6];
  v28 = [(objc_class *)getTapToRadarServiceClass() shared];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __136__TapToRadarKitHelper_createProblem_componentVersion_componentID_title_description_attachmentURLs_extensionIDs_deviceIDs_displayReason___block_invoke;
  v40[3] = &unk_2644BA008;
  v42 = &v43;
  v29 = v22;
  v41 = v29;
  [v28 createDraft:v27 forProcessNamed:@"Siri" withDisplayReason:v21 completionHandler:v40];

  dispatch_time_t v30 = dispatch_time(0, 1000000000 * TapToRadarCreateDraftTimeoutSeconds);
  intptr_t v31 = dispatch_semaphore_wait(v29, v30);
  if (*((unsigned char *)v44 + 24)) {
    BOOL v32 = v31 == 0;
  }
  else {
    BOOL v32 = 0;
  }
  BOOL v33 = v32;

  _Block_object_dispose(&v43, 8);
  return v33;
}

void __136__TapToRadarKitHelper_createProblem_componentVersion_componentID_title_description_attachmentURLs_extensionIDs_deviceIDs_displayReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = +[TapToRadarKitHelper getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __136__TapToRadarKitHelper_createProblem_componentVersion_componentID_title_description_attachmentURLs_extensionIDs_deviceIDs_displayReason___block_invoke_cold_1(v3, v4);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)createDraft:(id)a3 description:(id)a4 attachmentURLs:(id)a5 extensionIDs:(id)a6 deviceIDs:(id)a7 component:(id)a8
{
  v13 = (Class (__cdecl *)())getRadarDraftClass;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_alloc_init(v13());
  [v20 setTitle:v19];

  [v20 setProblemDescription:v18];
  [v20 setClassification:7];
  [v20 setReproducibility:5];
  [v20 setDiagnosticExtensionIDs:v16];

  [v20 setAttachments:v17];
  [v20 setDeviceIDs:v15];

  [v20 setComponent:v14];
  [v20 setDeleteOnAttach:1];
  id v21 = +[TapToRadarKitHelper getLogger];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    +[TapToRadarKitHelper createDraft:description:attachmentURLs:extensionIDs:deviceIDs:component:](v21);
  }

  return v20;
}

+ (void)createProblem:(os_log_t)log componentVersion:componentID:title:description:attachmentURLs:extensionIDs:deviceIDs:displayReason:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E680000, log, OS_LOG_TYPE_DEBUG, "TapToRadarKitHelper#createProblem...", v1, 2u);
}

void __136__TapToRadarKitHelper_createProblem_componentVersion_componentID_title_description_attachmentURLs_extensionIDs_deviceIDs_displayReason___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_21E680000, a2, OS_LOG_TYPE_ERROR, "TapToRadarKitHelper#createProblem error: %@", (uint8_t *)&v4, 0xCu);
}

+ (void)createDraft:(os_log_t)log description:attachmentURLs:extensionIDs:deviceIDs:component:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21E680000, log, OS_LOG_TYPE_DEBUG, "TapToRadarKitHelper#createDraft", v1, 2u);
}

@end