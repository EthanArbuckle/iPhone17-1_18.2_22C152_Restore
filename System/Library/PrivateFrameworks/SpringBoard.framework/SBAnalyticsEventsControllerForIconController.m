@interface SBAnalyticsEventsControllerForIconController
- (SBAnalyticsEventsControllerForIconController)initWithIconModel:(id)a3;
- (SBHAnalyticsEventsController)analyticsEventsController;
- (SBIconModel)iconModel;
- (id)rootFolder;
- (void)_analyticsLoggingForDisplayZoomMode;
- (void)_analyticsLoggingForFixedIconLocation;
- (void)_analyticsLoggingForOptimizedHomeScreen;
- (void)setAnalyticsEventsController:(id)a3;
- (void)significantTimeChanged;
- (void)updateIconModel:(id)a3;
@end

@implementation SBAnalyticsEventsControllerForIconController

- (SBAnalyticsEventsControllerForIconController)initWithIconModel:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBAnalyticsEventsControllerForIconController;
  v6 = [(SBAnalyticsEventsControllerForIconController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconModel, a3);
    id v8 = objc_alloc(MEMORY[0x1E4FA61F8]);
    uint64_t v9 = [v8 initWithEventsControllerDomain:*MEMORY[0x1E4FA64C8]];
    analyticsEventsController = v7->_analyticsEventsController;
    v7->_analyticsEventsController = (SBHAnalyticsEventsController *)v9;

    [(SBHAnalyticsEventsController *)v7->_analyticsEventsController addProvider:v7];
  }

  return v7;
}

- (void)updateIconModel:(id)a3
{
  id v5 = (SBIconModel *)a3;
  iconModel = self->_iconModel;
  p_iconModel = &self->_iconModel;
  if (iconModel != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_iconModel, a3);
    id v5 = v8;
  }
}

- (id)rootFolder
{
  return [(SBHIconModel *)self->_iconModel rootFolder];
}

- (void)significantTimeChanged
{
  [(SBAnalyticsEventsControllerForIconController *)self _analyticsLoggingForOptimizedHomeScreen];
  [(SBAnalyticsEventsControllerForIconController *)self _analyticsLoggingForDisplayZoomMode];
  [(SBAnalyticsEventsControllerForIconController *)self _analyticsLoggingForFixedIconLocation];
}

- (void)_analyticsLoggingForOptimizedHomeScreen
{
  v3 = +[SBDefaults localDefaults];
  v4 = [v3 homeScreenDefaults];
  [v4 automaticallyAddsNewApplications];

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  id v5 = [(SBAnalyticsEventsControllerForIconController *)self rootFolder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__SBAnalyticsEventsControllerForIconController__analyticsLoggingForOptimizedHomeScreen__block_invoke;
  v9[3] = &unk_1E6AFB888;
  v9[4] = v10;
  [v5 enumerateAllIconsUsingBlock:v9];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v6 = [(SBAnalyticsEventsControllerForIconController *)self rootFolder];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__SBAnalyticsEventsControllerForIconController__analyticsLoggingForOptimizedHomeScreen__block_invoke_2;
  v7[3] = &unk_1E6AFB888;
  v7[4] = v8;
  [v6 enumerateAllIconsWithOptions:3 usingBlock:v7];

  AnalyticsSendEventLazy();
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
}

uint64_t __87__SBAnalyticsEventsControllerForIconController__analyticsLoggingForOptimizedHomeScreen__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isApplicationIcon];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

uint64_t __87__SBAnalyticsEventsControllerForIconController__analyticsLoggingForOptimizedHomeScreen__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isApplicationIcon];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

id __87__SBAnalyticsEventsControllerForIconController__analyticsLoggingForOptimizedHomeScreen__block_invoke_3(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4FA64E0];
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E4FA64D8];
  v3 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)_analyticsLoggingForDisplayZoomMode
{
  if ((SBHScreenTypeIsMoreSpace() & 1) == 0)
  {
    SBHScreenTypeForCurrentDevice();
    SBHScreenTypeIsZoomed();
  }
  AnalyticsSendEventLazy();
}

id __83__SBAnalyticsEventsControllerForIconController__analyticsLoggingForDisplayZoomMode__block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4FA64B8];
  v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E4FA64C0];
  v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)_analyticsLoggingForFixedIconLocation
{
  id v2 = [(SBAnalyticsEventsControllerForIconController *)self rootFolder];
  [v2 enumerateListsWithOptions:4 usingBlock:&__block_literal_global_153];
}

void __85__SBAnalyticsEventsControllerForIconController__analyticsLoggingForFixedIconLocation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AnalyticsSendEventLazy();
}

id __85__SBAnalyticsEventsControllerForIconController__analyticsLoggingForFixedIconLocation__block_invoke_2(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4FA64F0];
  id v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E4FA64F8];
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "hasFixedIconLocations"));
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (SBIconModel)iconModel
{
  return self->_iconModel;
}

- (SBHAnalyticsEventsController)analyticsEventsController
{
  return self->_analyticsEventsController;
}

- (void)setAnalyticsEventsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventsController, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
}

@end