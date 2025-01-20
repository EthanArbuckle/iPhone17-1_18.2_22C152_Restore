@interface SXMapSnapShotter
+ (id)serialQueue;
- (NSMutableArray)snapshotters;
- (SXMapSnapShotter)init;
- (id)snapShotWithOptions:(id)a3 annotations:(id)a4 completionBlock:(id)a5;
- (void)setSnapshotters:(id)a3;
@end

@implementation SXMapSnapShotter

- (SXMapSnapShotter)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXMapSnapShotter;
  v2 = [(SXMapSnapShotter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    snapshotters = v2->_snapshotters;
    v2->_snapshotters = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)snapShotWithOptions:(id)a3 annotations:(id)a4 completionBlock:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v32 = a5;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  char v49 = 0;
  v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v16 = objc_alloc(MEMORY[0x263F10990]);
        [v15 coordinate];
        double v18 = v17;
        double v20 = v19;
        v21 = [v15 title];
        v22 = objc_msgSend(v16, "initWithCoordinate:title:representation:", v21, 1, v18, v20);

        [v10 addObject:v22];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v12);
  }

  [v8 _setCustomFeatureAnnotations:v10];
  objc_initWeak(&location, self);
  v23 = (void *)[objc_alloc(MEMORY[0x263F109A0]) initWithOptions:v8];
  v24 = [(id)objc_opt_class() serialQueue];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __68__SXMapSnapShotter_snapShotWithOptions_annotations_completionBlock___block_invoke;
  v37[3] = &unk_264651DB8;
  objc_copyWeak(&v42, &location);
  id v25 = v32;
  id v40 = v25;
  v41 = v48;
  id v26 = v8;
  id v38 = v26;
  id v27 = v23;
  id v39 = v27;
  [v27 startWithQueue:v24 completionHandler:v37];

  v28 = [(SXMapSnapShotter *)self snapshotters];
  [v28 addObject:v27];

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __68__SXMapSnapShotter_snapShotWithOptions_annotations_completionBlock___block_invoke_3;
  v33[3] = &unk_264651DE0;
  objc_copyWeak(&v36, &location);
  id v34 = v27;
  v35 = v48;
  id v29 = v27;
  v30 = (void *)MEMORY[0x223CA5030](v33);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);

  _Block_object_dispose(v48, 8);
  return v30;
}

void __68__SXMapSnapShotter_snapShotWithOptions_annotations_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__SXMapSnapShotter_snapShotWithOptions_annotations_completionBlock___block_invoke_2;
  v7[3] = &unk_264651D90;
  objc_copyWeak(&v13, (id *)(a1 + 64));
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v11 = v4;
  uint64_t v12 = v5;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);

  objc_destroyWeak(&v13);
}

void __68__SXMapSnapShotter_snapShotWithOptions_annotations_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (*(void *)(a1 + 56))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      v2 = 0;
    }
    else
    {
      v2 = [*(id *)(a1 + 32) image];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  id v3 = [WeakRetained snapshotters];
  [v3 removeObject:*(void *)(a1 + 48)];
}

void __68__SXMapSnapShotter_snapShotWithOptions_annotations_completionBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  [*(id *)(a1 + 32) cancel];
  v2 = [WeakRetained snapshotters];
  [v2 removeObject:*(void *)(a1 + 32)];
}

+ (id)serialQueue
{
  if (serialQueue_onceToken != -1) {
    dispatch_once(&serialQueue_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)serialQueue___serialQueue;
  return v2;
}

void __31__SXMapSnapShotter_serialQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.news.maps", v2);
  v1 = (void *)serialQueue___serialQueue;
  serialQueue___serialQueue = (uint64_t)v0;
}

- (NSMutableArray)snapshotters
{
  return self->_snapshotters;
}

- (void)setSnapshotters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end