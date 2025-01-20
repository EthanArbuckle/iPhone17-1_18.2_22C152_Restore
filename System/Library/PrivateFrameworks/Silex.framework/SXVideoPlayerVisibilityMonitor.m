@interface SXVideoPlayerVisibilityMonitor
- (BOOL)appeared;
- (NSMutableArray)didAppearBlocks;
- (NSMutableArray)didDisappearBlocks;
- (NSMutableArray)visiblePercentageBlocks;
- (NSMutableArray)willAppearBlocks;
- (NSMutableArray)willDisappearBlocks;
- (SXVideoPlayerVisibilityMonitor)initWithVisibilityMonitor:(id)a3;
- (SXVisibilityMonitor)visibilityMonitor;
- (double)visiblePercentage;
- (id)object;
- (unint64_t)state;
- (void)configureVisibilityMonitor:(id)a3;
- (void)onDidAppear:(id)a3;
- (void)onDidDisappear:(id)a3;
- (void)onVisiblePercentageChange:(id)a3;
- (void)onWillAppear:(id)a3;
- (void)onWillDisappear:(id)a3;
- (void)setVisibilityMonitor:(id)a3;
@end

@implementation SXVideoPlayerVisibilityMonitor

- (SXVideoPlayerVisibilityMonitor)initWithVisibilityMonitor:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SXVideoPlayerVisibilityMonitor;
  v6 = [(SXVideoPlayerVisibilityMonitor *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visibilityMonitor, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    willAppearBlocks = v7->_willAppearBlocks;
    v7->_willAppearBlocks = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x263EFF980] array];
    didAppearBlocks = v7->_didAppearBlocks;
    v7->_didAppearBlocks = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x263EFF980] array];
    visiblePercentageBlocks = v7->_visiblePercentageBlocks;
    v7->_visiblePercentageBlocks = (NSMutableArray *)v12;

    uint64_t v14 = [MEMORY[0x263EFF980] array];
    willDisappearBlocks = v7->_willDisappearBlocks;
    v7->_willDisappearBlocks = (NSMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x263EFF980] array];
    didDisappearBlocks = v7->_didDisappearBlocks;
    v7->_didDisappearBlocks = (NSMutableArray *)v16;

    [(SXVideoPlayerVisibilityMonitor *)v7 configureVisibilityMonitor:v5];
  }

  return v7;
}

- (void)setVisibilityMonitor:(id)a3
{
  id v5 = (SXVisibilityMonitor *)a3;
  if (self->_visibilityMonitor != v5)
  {
    objc_storeStrong((id *)&self->_visibilityMonitor, a3);
    [(SXVideoPlayerVisibilityMonitor *)self configureVisibilityMonitor:v5];
  }
}

- (void)configureVisibilityMonitor:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke;
  v13[3] = &unk_264652038;
  objc_copyWeak(&v14, &location);
  [v4 onWillAppear:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_2;
  v11[3] = &unk_264652038;
  objc_copyWeak(&v12, &location);
  [v4 onDidAppear:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_3;
  v9[3] = &unk_264652038;
  objc_copyWeak(&v10, &location);
  [v4 onWillDisappear:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_4;
  v7[3] = &unk_264652038;
  objc_copyWeak(&v8, &location);
  [v4 onDidDisappear:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_5;
  v5[3] = &unk_264652060;
  objc_copyWeak(&v6, &location);
  [v4 onVisiblePercentageChange:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "willAppearBlocks", 0);
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id v10 = objc_loadWeakRetained(v1);
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

void __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "didAppearBlocks", 0);
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id v10 = objc_loadWeakRetained(v1);
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

void __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "willDisappearBlocks", 0);
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id v10 = objc_loadWeakRetained(v1);
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

void __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "didDisappearBlocks", 0);
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id v10 = objc_loadWeakRetained(v1);
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

void __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_5(uint64_t a1, double a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = objc_msgSend(WeakRetained, "visiblePercentageBlocks", 0);
  uint64_t v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        id v12 = objc_loadWeakRetained(v3);
        (*(void (**)(uint64_t, id, double))(v11 + 16))(v11, v12, a2);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (unint64_t)state
{
  v2 = [(SXVideoPlayerVisibilityMonitor *)self visibilityMonitor];
  unint64_t v3 = [v2 state];

  return v3;
}

- (BOOL)appeared
{
  v2 = [(SXVideoPlayerVisibilityMonitor *)self visibilityMonitor];
  char v3 = [v2 appeared];

  return v3;
}

- (id)object
{
  v2 = [(SXVideoPlayerVisibilityMonitor *)self visibilityMonitor];
  char v3 = [v2 object];

  return v3;
}

- (double)visiblePercentage
{
  v2 = [(SXVideoPlayerVisibilityMonitor *)self visibilityMonitor];
  [v2 visiblePercentage];
  double v4 = v3;

  return v4;
}

- (void)onWillAppear:(id)a3
{
  id v4 = a3;
  id v6 = [(SXVideoPlayerVisibilityMonitor *)self willAppearBlocks];
  uint64_t v5 = (void *)MEMORY[0x223CA5030](v4);

  [v6 addObject:v5];
}

- (void)onDidAppear:(id)a3
{
  id v4 = a3;
  id v6 = [(SXVideoPlayerVisibilityMonitor *)self didAppearBlocks];
  uint64_t v5 = (void *)MEMORY[0x223CA5030](v4);

  [v6 addObject:v5];
}

- (void)onVisiblePercentageChange:(id)a3
{
  id v4 = a3;
  id v6 = [(SXVideoPlayerVisibilityMonitor *)self visiblePercentageBlocks];
  uint64_t v5 = (void *)MEMORY[0x223CA5030](v4);

  [v6 addObject:v5];
}

- (void)onWillDisappear:(id)a3
{
  id v4 = a3;
  id v6 = [(SXVideoPlayerVisibilityMonitor *)self willDisappearBlocks];
  uint64_t v5 = (void *)MEMORY[0x223CA5030](v4);

  [v6 addObject:v5];
}

- (void)onDidDisappear:(id)a3
{
  id v4 = a3;
  id v6 = [(SXVideoPlayerVisibilityMonitor *)self didDisappearBlocks];
  uint64_t v5 = (void *)MEMORY[0x223CA5030](v4);

  [v6 addObject:v5];
}

- (SXVisibilityMonitor)visibilityMonitor
{
  return self->_visibilityMonitor;
}

- (NSMutableArray)willAppearBlocks
{
  return self->_willAppearBlocks;
}

- (NSMutableArray)didAppearBlocks
{
  return self->_didAppearBlocks;
}

- (NSMutableArray)visiblePercentageBlocks
{
  return self->_visiblePercentageBlocks;
}

- (NSMutableArray)willDisappearBlocks
{
  return self->_willDisappearBlocks;
}

- (NSMutableArray)didDisappearBlocks
{
  return self->_didDisappearBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didDisappearBlocks, 0);
  objc_storeStrong((id *)&self->_willDisappearBlocks, 0);
  objc_storeStrong((id *)&self->_visiblePercentageBlocks, 0);
  objc_storeStrong((id *)&self->_didAppearBlocks, 0);
  objc_storeStrong((id *)&self->_willAppearBlocks, 0);
  objc_storeStrong((id *)&self->_visibilityMonitor, 0);
}

@end