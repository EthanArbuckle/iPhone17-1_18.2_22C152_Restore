@interface UIDragMonitorSession
@end

@implementation UIDragMonitorSession

void __32___UIDragMonitorSession_connect__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setConnectedToDruid:1];
    [v5 setItemProviders:v9];
    v6 = [v5 delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [v5 delegate];
      [v8 dragMonitorSession:v5 didConnectWithItems:v9];
    }
  }
}

void __32___UIDragMonitorSession_connect__block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v13 = a3;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = [WeakRetained druidDestinationConnection];
  [v10 enableKeyboardIfNeeded];

  [WeakRetained setItemProviders:v13];
  [WeakRetained setItemCollection:v8];

  v11 = [WeakRetained delegate];
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    v12 = [WeakRetained delegate];
    [v12 dragMonitorSession:WeakRetained didAcceptDropRequestWithItems:v13];
  }
  if (a5) {
    *a5 = 0;
  }
}

void __32___UIDragMonitorSession_connect__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v6 = [v3 items];
  char v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = objc_msgSend(v3, "items", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [[UIItemProvider alloc] initWithPBItem:*(void *)(*((void *)&v17 + 1) + 8 * v12)];
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  [WeakRetained setItemProviders:v7];
  v14 = [WeakRetained delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    v16 = [WeakRetained delegate];
    [v16 dragMonitorSession:WeakRetained didUpdateRegisteredItems:v7];
  }
}

void __32___UIDragMonitorSession_connect__block_invoke_5(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [WeakRetained delegate];
    [v5 dragMonitorSession:WeakRetained didConcludeDragNormally:a2];
  }
}

void __32___UIDragMonitorSession_connect__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v4 = [[_UIDragMonitorSessionPresentationUpdate alloc] initWithDragPresentationUpdate:v3];

  id v5 = [(_UIDragMonitorSessionPresentationUpdate *)v4 previewUpdates];
  [WeakRetained _updateModelWithPreviewUpdates:v5];

  v6 = [WeakRetained delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [WeakRetained delegate];
    [v8 dragMonitorSession:WeakRetained didUpdateDragPresentation:v4];
  }
}

void __40___UIDragMonitorSession_requestPreviews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40___UIDragMonitorSession_requestPreviews__block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_sync(MEMORY[0x1E4F14428], v6);
}

void __40___UIDragMonitorSession_requestPreviews__block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v17 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v9 = objc_alloc_init(_DUIPreviewAndImageComponentUpdate);
        -[_DUIPreviewAndImageComponent setIndex:](v9, "setIndex:", [v8 itemIndex]);
        uint64_t v10 = [v8 preview];
        [(_DUIPreviewAndImageComponent *)v9 setPreview:v10];

        uint64_t v11 = [v8 imageComponent];
        [(_DUIPreviewAndImageComponent *)v9 setImageComponent:v11];

        uint64_t v12 = [[_UIDragMonitorSessionPreviewUpdate alloc] initWithPreviewAndImageComponentUpdate:v9];
        [v2 addObject:v12];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  [*(id *)(v17 + 40) _updateModelWithPreviewUpdates:v2];
  id v13 = [*(id *)(v17 + 40) delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    char v15 = [[_UIDragMonitorSessionPresentationUpdate alloc] initWithPreviewUpdates:v2 badgeUpdate:0];
    v16 = [*(id *)(v17 + 40) delegate];
    [v16 dragMonitorSession:*(void *)(v17 + 40) didUpdateDragPresentation:v15];
  }
}

@end