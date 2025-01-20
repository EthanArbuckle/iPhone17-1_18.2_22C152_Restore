@interface MTMediaTask
- (AMSMediaTask)mediaTask;
- (BOOL)charts;
- (MTMediaTask)initWithType:(int64_t)a3;
- (NSArray)identifiers;
- (void)perform:(id)a3;
- (void)setCharts:(BOOL)a3;
- (void)setIdentifiers:(id)a3;
- (void)setMediaTask:(id)a3;
@end

@implementation MTMediaTask

- (MTMediaTask)initWithType:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MTMediaTask;
  v4 = [(MTMediaTask *)&v13 init];
  if (v4)
  {
    if (a3) {
      uint64_t v5 = 301;
    }
    else {
      uint64_t v5 = 300;
    }
    id v6 = objc_alloc(MEMORY[0x263F27D18]);
    v7 = [MEMORY[0x263F5EA28] mediaApiClientIdentifier];
    v8 = [MEMORY[0x263F5EA28] mediaApiClientVersion];
    v9 = [MEMORY[0x263F5E9B8] sharedInstance];
    uint64_t v10 = [v6 initWithType:v5 clientIdentifier:v7 clientVersion:v8 bag:v9];
    mediaTask = v4->_mediaTask;
    v4->_mediaTask = (AMSMediaTask *)v10;

    if (a3) {
      [(AMSMediaTask *)v4->_mediaTask setIncludedResultKeys:&unk_26F2D2908];
    }
  }
  return v4;
}

- (void)setIdentifiers:(id)a3
{
}

- (void)setCharts:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    mediaTask = self->_mediaTask;
    [(AMSMediaTask *)mediaTask setCharts:v3];
  }
}

- (NSArray)identifiers
{
  return (NSArray *)[(AMSMediaTask *)self->_mediaTask itemIdentifiers];
}

- (void)perform:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSMediaTask *)self->_mediaTask perform];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __23__MTMediaTask_perform___block_invoke;
  v7[3] = &unk_265055B40;
  id v8 = v4;
  id v6 = v4;
  [v5 addFinishBlock:v7];
}

void __23__MTMediaTask_perform___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  id v6 = [v20 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [v20 object];
    id v9 = [v8 objectForKey:@"data"];
    if (!v9)
    {
      uint64_t v10 = [v8 objectForKey:@"results"];
      objc_opt_class();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [v10 objectForKey:@"podcast-episodes"];
        v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          id v13 = [v10 objectForKey:@"podcast"];
        }
        v15 = v13;
      }
      else
      {
        v15 = 0;
      }
      objc_opt_class();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [v15 firstObject];
      }
      else
      {
        v16 = 0;
      }
      objc_opt_class();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [v16 objectForKey:@"data"];
      }
      else
      {
        v17 = 0;
      }
      objc_opt_class();
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
      id v9 = v18;
    }
    uint64_t v19 = *(void *)(a1 + 32);
    if (v19) {
      (*(void (**)(uint64_t, id, void))(v19 + 16))(v19, v9, 0);
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v5);
    }
  }
}

- (BOOL)charts
{
  return self->_charts;
}

- (AMSMediaTask)mediaTask
{
  return self->_mediaTask;
}

- (void)setMediaTask:(id)a3
{
}

- (void).cxx_destruct
{
}

@end