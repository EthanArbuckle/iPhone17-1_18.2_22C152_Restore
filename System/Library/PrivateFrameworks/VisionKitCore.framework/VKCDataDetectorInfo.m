@interface VKCDataDetectorInfo
+ (id)dataDetectorInfoFromAnalysis:(id)a3 dataDetectorTypes:(unint64_t)a4 unfiltered:(BOOL)a5;
+ (id)quickActionInfosFromQuickActions:(id)a3;
+ (void)preWarmIfNecessaryWithCompletion:(id)a3;
- (NSArray)elements;
- (VKCImageAnalysis)analysis;
- (unint64_t)dataDetectorTypes;
- (void)createQuickActionInfosWithCompletion:(id)a3;
- (void)populateDataDetectorElementsFromAnalysis:(id)a3 dataDetectorTypes:(unint64_t)a4 unfiltered:(BOOL)a5;
- (void)setAnalysis:(id)a3;
- (void)setDataDetectorTypes:(unint64_t)a3;
- (void)setElements:(id)a3;
@end

@implementation VKCDataDetectorInfo

+ (id)dataDetectorInfoFromAnalysis:(id)a3 dataDetectorTypes:(unint64_t)a4 unfiltered:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  v8 = objc_alloc_init(VKCDataDetectorInfo);
  [(VKCDataDetectorInfo *)v8 setAnalysis:v7];
  [(VKCDataDetectorInfo *)v8 populateDataDetectorElementsFromAnalysis:v7 dataDetectorTypes:a4 unfiltered:v5];

  [(VKCDataDetectorInfo *)v8 setDataDetectorTypes:a4];
  return v8;
}

+ (void)preWarmIfNecessaryWithCompletion:(id)a3
{
  v3 = (void (**)(void))a3;
  v4 = v3;
  if (preWarmIfNecessaryWithCompletion__didPrewarm)
  {
    if (v3) {
      v3[2](v3);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__VKCDataDetectorInfo_preWarmIfNecessaryWithCompletion___block_invoke;
    block[3] = &unk_1E6BF0B10;
    v6 = v3;
    if (preWarmIfNecessaryWithCompletion__onceToken != -1) {
      dispatch_once(&preWarmIfNecessaryWithCompletion__onceToken, block);
    }
  }
}

void __56__VKCDataDetectorInfo_preWarmIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  preWarmIfNecessaryWithCompletion__didPrewarm = 1;
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __56__VKCDataDetectorInfo_preWarmIfNecessaryWithCompletion___block_invoke_2;
  v1[3] = &unk_1E6BF0B10;
  id v2 = *(id *)(a1 + 32);
  vk_performBlockOnMainThread(v1);
}

void __56__VKCDataDetectorInfo_preWarmIfNecessaryWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  v3 = dispatch_get_global_queue(2, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__VKCDataDetectorInfo_preWarmIfNecessaryWithCompletion___block_invoke_3;
  v5[3] = &unk_1E6BF1308;
  id v6 = v2;
  id v7 = *(id *)(a1 + 32);
  id v4 = v2;
  dispatch_async(v3, v5);
}

uint64_t __56__VKCDataDetectorInfo_preWarmIfNecessaryWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v2 = (void *)getDDUIActionClass_softClass;
  uint64_t v18 = getDDUIActionClass_softClass;
  if (!getDDUIActionClass_softClass)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __getDDUIActionClass_block_invoke;
    v13 = &unk_1E6BF0A90;
    v14 = &v15;
    __getDDUIActionClass_block_invoke((uint64_t)&v10);
    id v2 = (void *)v16[3];
  }
  v3 = v2;
  _Block_object_dispose(&v15, 8);
  id v4 = objc_alloc_init(v3);
  id v5 = (id)[v4 description];

  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v6 = (void *)getDDContextMenuActionClass_softClass;
  uint64_t v18 = getDDContextMenuActionClass_softClass;
  if (!getDDContextMenuActionClass_softClass)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __getDDContextMenuActionClass_block_invoke;
    v13 = &unk_1E6BF0A90;
    v14 = &v15;
    __getDDContextMenuActionClass_block_invoke((uint64_t)&v10);
    id v6 = (void *)v16[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v15, 8);
  id v8 = (id)[v7 buttonActionsForURL:0 result:0 contact:0 icsString:0 context:MEMORY[0x1E4F1CC08] view:*(void *)(a1 + 32) identifier:0 suggestedActions:0 defaultAction:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)populateDataDetectorElementsFromAnalysis:(id)a3 dataDetectorTypes:(unint64_t)a4 unfiltered:(BOOL)a5
{
  id v8 = a3;
  v9 = [v8 imageAnalysisResult];
  uint64_t v10 = v9;
  if (a5) {
    [v9 unfilteredDataDetectors];
  }
  else {
  uint64_t v11 = [v9 dataDetectors];
  }
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __93__VKCDataDetectorInfo_populateDataDetectorElementsFromAnalysis_dataDetectorTypes_unfiltered___block_invoke;
  uint64_t v17 = &unk_1E6BF29A8;
  id v18 = v8;
  unint64_t v19 = a4;
  id v12 = v8;
  v13 = objc_msgSend(v11, "vk_compactMap:", &v14);
  -[VKCDataDetectorInfo setElements:](self, "setElements:", v13, v14, v15, v16, v17);
}

id __93__VKCDataDetectorInfo_populateDataDetectorElementsFromAnalysis_dataDetectorTypes_unfiltered___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(void *)(a1 + 40) & [v3 dataDetectorTypes]) != 0)
  {
    id v4 = +[VKCDataDetectorElementInfo infoFromDataDetectorElement:v3 analysis:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)createQuickActionInfosWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCDataDetectorInfo *)self elements];

  if (!v5)
  {
    id v6 = [(VKCDataDetectorInfo *)self analysis];
    [(VKCDataDetectorInfo *)self populateDataDetectorElementsFromAnalysis:v6 dataDetectorTypes:[(VKCDataDetectorInfo *)self dataDetectorTypes] unfiltered:0];
  }
  id v7 = [(VKCDataDetectorInfo *)self analysis];
  id v8 = [v7 imageAnalysisResult];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__VKCDataDetectorInfo_createQuickActionInfosWithCompletion___block_invoke;
  v11[3] = &unk_1E6BF0EF8;
  id v12 = v8;
  v13 = self;
  id v14 = v4;
  id v9 = v4;
  id v10 = v8;
  vk_dispatchMainAfterDelay(v11, 0.0);
}

void __60__VKCDataDetectorInfo_createQuickActionInfosWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataDetectors];
  id v3 = [*(id *)(a1 + 32) unfilteredDataDetectors];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__VKCDataDetectorInfo_createQuickActionInfosWithCompletion___block_invoke_2;
  v6[3] = &unk_1E6BF29D0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  +[VKCQuickActionsProcessor quickActionsFromElements:v2 unfilteredElements:v3 analysis:v4 queue:MEMORY[0x1E4F14428] completionHandler:v6];
}

void __60__VKCDataDetectorInfo_createQuickActionInfosWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() quickActionInfosFromQuickActions:v3];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)quickActionInfosFromQuickActions:(id)a3
{
  return (id)objc_msgSend(a3, "vk_compactMap:", &__block_literal_global_20);
}

id __56__VKCDataDetectorInfo_quickActionInfosFromQuickActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[VKCQuickActionInfo quickActionInfoFromActionInfoButton:a2];
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
}

- (VKCImageAnalysis)analysis
{
  return self->_analysis;
}

- (void)setAnalysis:(id)a3
{
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

@end