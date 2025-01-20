@interface NTKMediaComplicationController
- (NTKMediaComplicationControllerDelegate)delegate;
- (id)launchURLWithScheme:(id)a3;
- (void)_updateActiveRoute;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)pause;
- (void)resume;
- (void)setDelegate:(id)a3;
@end

@implementation NTKMediaComplicationController

- (void)resume
{
  requestResponseController = self->_requestResponseController;
  if (!requestResponseController)
  {
    v4 = (MPRequestResponseController *)objc_alloc_init(MEMORY[0x1E4F31A20]);
    v5 = self->_requestResponseController;
    self->_requestResponseController = v4;

    [(MPRequestResponseController *)self->_requestResponseController setDelegate:self];
    requestResponseController = self->_requestResponseController;
  }
  [(MPRequestResponseController *)requestResponseController beginAutomaticResponseLoading];
  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__handleRoutingControllerActiveSystemRouteDidChange_ name:*MEMORY[0x1E4F31250] object:0];

  [(NTKMediaComplicationController *)self _updateActiveRoute];
}

- (void)pause
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F31250] object:0];

  requestResponseController = self->_requestResponseController;
  [(MPRequestResponseController *)requestResponseController endAutomaticResponseLoading];
}

- (id)launchURLWithScheme:(id)a3
{
  v26[3] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F29088];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setScheme:v5];

  v7 = [(MPRequestResponseController *)self->_requestResponseController response];
  v8 = [v7 tracklist];
  v9 = [v8 playingItem];

  if (v9)
  {
    [v6 setHost:@"now-playing"];
    v10 = [(MPRequestResponseController *)self->_requestResponseController response];
    v11 = [v10 request];
    v12 = [v11 playerPath];

    v13 = (void *)MEMORY[0x1E4F290C8];
    v14 = [v12 route];
    v15 = [v14 designatedGroupLeaderRouteUID];
    v16 = [v13 queryItemWithName:@"routeUID" value:v15];
    v17 = (void *)MEMORY[0x1E4F290C8];
    v18 = objc_msgSend(v12, "bundleID", v16);
    v19 = [v17 queryItemWithName:@"bundleID" value:v18];
    v26[1] = v19;
    v20 = (void *)MEMORY[0x1E4F290C8];
    v21 = [v12 playerID];
    v22 = [v20 queryItemWithName:@"playerID" value:v21];
    v26[2] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
    [v6 setQueryItems:v23];
  }
  v24 = [v6 URL];

  return v24;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__NTKMediaComplicationController_controller_defersResponseReplacement___block_invoke;
  v7[3] = &unk_1E62C0AE8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __71__NTKMediaComplicationController_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(v2 + 8) response];
  [WeakRetained controller:v2 didReplaceResponse:v3];
}

- (void)_updateActiveRoute
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__NTKMediaComplicationController__updateActiveRoute__block_invoke;
  v2[3] = &unk_1E62C61F0;
  v2[4] = self;
  [MEMORY[0x1E4F31850] getProactiveRouteWithCompletion:v2];
}

void __52__NTKMediaComplicationController__updateActiveRoute__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__NTKMediaComplicationController__updateActiveRoute__block_invoke_2;
  v5[3] = &unk_1E62C09C0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __52__NTKMediaComplicationController__updateActiveRoute__block_invoke_2(uint64_t a1)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v3 = [WeakRetained controller:*(void *)(a1 + 32) requestPlayerPathWithRoute:*(void *)(a1 + 40)];

  if (v3)
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F76EB0]);
    [v23 setPlayerPath:v3];
    id v24 = objc_alloc(MEMORY[0x1E4F31A00]);
    uint64_t v34 = *MEMORY[0x1E4F316E0];
    id v22 = objc_alloc(MEMORY[0x1E4F31A00]);
    uint64_t v33 = *MEMORY[0x1E4F316C0];
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    v31[0] = *MEMORY[0x1E4F31708];
    id v4 = (void *)MEMORY[0x1E4F31A00];
    uint64_t v30 = *MEMORY[0x1E4F315B0];
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    id v6 = [v4 propertySetWithProperties:v5];
    v32[0] = v6;
    v31[1] = *MEMORY[0x1E4F31700];
    v7 = (void *)MEMORY[0x1E4F31A00];
    uint64_t v29 = *MEMORY[0x1E4F315A8];
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    v9 = [v7 propertySetWithProperties:v8];
    v32[1] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    v11 = (void *)[v22 initWithProperties:v21 relationships:v10];
    v35[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    uint64_t v13 = [v24 initWithProperties:0 relationships:v12];
    v25 = v3;
    v14 = (void *)v13;
    [v23 setPlayingItemProperties:v13];

    id v15 = objc_alloc(MEMORY[0x1E4F31A00]);
    uint64_t v27 = *MEMORY[0x1E4F316D8];
    v16 = (void *)MEMORY[0x1E4F31A00];
    uint64_t v26 = *MEMORY[0x1E4F31690];
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    v18 = [v16 propertySetWithProperties:v17];
    v28 = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v20 = (void *)[v15 initWithProperties:0 relationships:v19];
    [v23 setQueueSectionProperties:v20];

    id v3 = v25;
    [*(id *)(*(void *)(a1 + 32) + 8) setRequest:v23];
  }
}

- (NTKMediaComplicationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKMediaComplicationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestResponseController, 0);
}

@end