@interface WBSPrivacyTransparencyController
+ (BOOL)removeHostnames:(id)a3;
@end

@implementation WBSPrivacyTransparencyController

+ (BOOL)removeHostnames:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (SymptomAnalyticsLibraryCore_once != -1) {
    dispatch_once(&SymptomAnalyticsLibraryCore_once, &__block_literal_global_6);
  }
  if (!SymptomAnalyticsLibraryCore_library) {
    goto LABEL_24;
  }
  if (SymptomPresentationFeedLibraryCore_once != -1) {
    dispatch_once(&SymptomPresentationFeedLibraryCore_once, &__block_literal_global_9_0);
  }
  if (!SymptomPresentationFeedLibraryCore_library) {
    goto LABEL_24;
  }
  if (SymptomPresentationLiteLibraryCore_once != -1) {
    dispatch_once(&SymptomPresentationLiteLibraryCore_once, &__block_literal_global_12);
  }
  if (!SymptomPresentationLiteLibraryCore_library) {
    goto LABEL_24;
  }
  if (!getAnalyticsWorkspaceClass()) {
    goto LABEL_24;
  }
  if (!getUsageFeedClass()) {
    goto LABEL_24;
  }
  uint64_t v4 = getkSymptomAnalyticsServiceEndpoint();
  if (!v4) {
    goto LABEL_24;
  }
  v5 = (void *)v4;
  uint64_t v6 = getkSymptomAnalyticsServiceDomainTrackingClearHistoryKey();
  if (!v6) {
    goto LABEL_23;
  }
  v7 = (void *)v6;
  uint64_t v8 = getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDs();
  if (!v8)
  {
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  v9 = (void *)v8;
  uint64_t v10 = getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDate();
  if (!v10)
  {

    goto LABEL_22;
  }
  v11 = (void *)v10;
  v12 = getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDate();

  if (v12)
  {
    id v13 = objc_alloc((Class)getAnalyticsWorkspaceClass());
    v14 = getkSymptomAnalyticsServiceEndpoint();
    uint64_t v15 = [v13 initWorkspaceWithService:v14];

    v31 = (void *)v15;
    v29 = (void *)[objc_alloc((Class)getUsageFeedClass()) initWithWorkspace:v15];
    v30 = getkSymptomAnalyticsServiceDomainTrackingClearHistoryKey();
    v36 = v30;
    v16 = getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDs();
    v34[0] = v16;
    v17 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariApplicationPlatformBundleIdentifier");
    v32 = v17;
    id v33 = v3;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    v35[0] = v18;
    v19 = getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDate();
    v34[1] = v19;
    v20 = [MEMORY[0x1E4F1C9C8] distantPast];
    v35[1] = v20;
    v21 = getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDate();
    v34[2] = v21;
    v22 = [MEMORY[0x1E4F1C9C8] distantFuture];
    v35[2] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];
    v37[0] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];

    char v25 = [v29 performNetworkDomainsActionWithOptions:v24 reply:&__block_literal_global_33];
    if ((v25 & 1) == 0)
    {
      v26 = WBS_LOG_CHANNEL_PREFIXPrivacyTransparency();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        +[WBSPrivacyTransparencyController removeHostnames:](v26);
      }
    }

    goto LABEL_27;
  }
LABEL_24:
  v27 = WBS_LOG_CHANNEL_PREFIXPrivacyTransparency();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
    +[WBSPrivacyTransparencyController removeHostnames:](v27);
  }
  char v25 = 0;
LABEL_27:

  return v25;
}

void __52__WBSPrivacyTransparencyController_removeHostnames___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXPrivacyTransparency();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__WBSPrivacyTransparencyController_removeHostnames___block_invoke_cold_1(v4, v3);
    }
  }
}

+ (void)removeHostnames:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1ABB70000, log, OS_LOG_TYPE_FAULT, "Failed to load Symptom frameworks", v1, 2u);
}

+ (void)removeHostnames:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Unable to perform network domains actions", v1, 2u);
}

void __52__WBSPrivacyTransparencyController_removeHostnames___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Error deleting network domain data %{public}@", (uint8_t *)&v5, 0xCu);
}

@end