@interface SearchUIMapsViewController
- (SFFeedbackListener)feedbackListener;
- (SearchUIMapsViewController)initWithMapsData:(id)a3 searchAlongTheRoute:(BOOL)a4 feedbackListener:(id)a5 queryId:(unint64_t)a6;
- (unint64_t)queryId;
- (void)placeViewController:(id)a3 shouldLogFeedbackOfType:(int)a4;
- (void)setFeedbackListener:(id)a3;
@end

@implementation SearchUIMapsViewController

- (SearchUIMapsViewController)initWithMapsData:(id)a3 searchAlongTheRoute:(BOOL)a4 feedbackListener:(id)a5 queryId:(unint64_t)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  [MEMORY[0x1E4F743A0] setInfoCardContainerStyle:1];
  id v12 = objc_alloc_init(MEMORY[0x1E4F743A8]);
  v13 = v12;
  uint64_t v14 = 0x8000000;
  if (v8) {
    uint64_t v14 = 0x308100000;
  }
  [v12 setOptions:v14 | *MEMORY[0x1E4F30DD8] | *MEMORY[0x1E4F30DE0]];
  if (([MEMORY[0x1E4FAE198] isSiri] & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/LocationBundles/CoreParsec.framework"];
    v16 = [MEMORY[0x1E4F30EF8] sharedLocationManager];
    [v16 setEffectiveBundle:v15];
  }
  v24.receiver = self;
  v24.super_class = (Class)SearchUIMapsViewController;
  v17 = [(MUPlaceViewController *)&v24 initWithConfiguration:v13];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_feedbackListener, v11);
    v18->_queryId = a6;
    [(MUPlaceViewController *)v18 setPlaceViewFeedbackDelegate:v18];
    v19 = (void *)MEMORY[0x1E4F30F08];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __92__SearchUIMapsViewController_initWithMapsData_searchAlongTheRoute_feedbackListener_queryId___block_invoke;
    v21[3] = &unk_1E6E72690;
    id v22 = v10;
    v23 = v18;
    [v19 _mapItemFromHandle:v22 completionHandler:v21];
  }
  return v18;
}

void __92__SearchUIMapsViewController_initWithMapsData_searchAlongTheRoute_feedbackListener_queryId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v3 = [MEMORY[0x1E4F30F08] mapItemWithSerializedPlaceData:*(void *)(a1 + 32)];
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__SearchUIMapsViewController_initWithMapsData_searchAlongTheRoute_feedbackListener_queryId___block_invoke_2;
  v5[3] = &unk_1E6E72620;
  id v6 = *(id *)(a1 + 40);
  id v7 = v3;
  id v4 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:v5];
}

uint64_t __92__SearchUIMapsViewController_initWithMapsData_searchAlongTheRoute_feedbackListener_queryId___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMapItem:*(void *)(a1 + 40)];
}

- (void)placeViewController:(id)a3 shouldLogFeedbackOfType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [(SearchUIMapsViewController *)self feedbackListener];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F9A1F8]) initWithFeedbackType:v4];
    objc_msgSend(v9, "setQueryId:", -[SearchUIMapsViewController queryId](self, "queryId"));
    BOOL v8 = [(SearchUIMapsViewController *)self feedbackListener];
    [v8 didEngageCardSection:v9];
  }
}

- (SFFeedbackListener)feedbackListener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackListener);
  return (SFFeedbackListener *)WeakRetained;
}

- (void)setFeedbackListener:(id)a3
{
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void).cxx_destruct
{
}

@end