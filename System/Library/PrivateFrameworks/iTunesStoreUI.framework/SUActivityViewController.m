@interface SUActivityViewController
- (SUActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4;
- (id)_titleForActivity:(id)a3;
- (void)_performActivity:(id)a3;
- (void)_prepareActivity:(id)a3;
- (void)dealloc;
- (void)setTitle:(id)a3 forActivityType:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUActivityViewController

- (SUActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUActivityViewController;
  v5 = [(SUActivityViewController *)&v7 initWithActivityItems:a3 applicationActivities:a4];
  if (v5) {
    v5->_suActivityItems = (NSArray *)[a3 copy];
  }
  return v5;
}

- (void)dealloc
{
  int64_t transitionSafetyCount = self->_transitionSafetyCount;
  if (transitionSafetyCount >= 1)
  {
    do
    {
      self->_int64_t transitionSafetyCount = transitionSafetyCount - 1;
      [(id)objc_opt_class() endTransitionSafety];
      int64_t transitionSafetyCount = self->_transitionSafetyCount;
    }
    while (transitionSafetyCount > 0);
  }

  v4.receiver = self;
  v4.super_class = (Class)SUActivityViewController;
  [(SUActivityViewController *)&v4 dealloc];
}

- (void)setTitle:(id)a3 forActivityType:(id)a4
{
  customTitles = self->_customTitles;
  if (a3)
  {
    if (!customTitles)
    {
      customTitles = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_customTitles = customTitles;
    }
    [(NSMutableDictionary *)customTitles setObject:a3 forKey:a4];
  }
  else
  {
    [(NSMutableDictionary *)customTitles removeObjectForKey:a4];
  }
}

- (void)_performActivity:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  suActivityItems = self->_suActivityItems;
  uint64_t v6 = [(NSArray *)suActivityItems countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(suActivityItems);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) setSUActivity:a3];
      }
      uint64_t v7 = [(NSArray *)suActivityItems countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SUActivityViewController;
  [(SUActivityViewController *)&v10 _performActivity:a3];
}

- (void)_prepareActivity:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)[a3 socialComposeViewController];
    [v5 removeAllURLs];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    suActivityItems = self->_suActivityItems;
    uint64_t v7 = [(NSArray *)suActivityItems countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(suActivityItems);
          }
          long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v12 = [v11 suLastProvidedItem];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v5, "addURL:withPreviewImage:", v12, objc_msgSend(v11, "suPreviewImage"));
          }
        }
        uint64_t v8 = [(NSArray *)suActivityItems countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SUActivityViewController;
  [(SUActivityViewController *)&v13 _prepareActivity:a3];
}

- (id)_titleForActivity:(id)a3
{
  id result = (id)-[NSMutableDictionary objectForKey:](self->_customTitles, "objectForKey:");
  if (!result)
  {
    v6.receiver = self;
    v6.super_class = (Class)SUActivityViewController;
    return [(SUActivityViewController *)&v6 _titleForActivity:a3];
  }
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUActivityViewController;
  [(SUActivityViewController *)&v7 viewDidAppear:a3];
  int64_t transitionSafetyCount = self->_transitionSafetyCount;
  BOOL v5 = transitionSafetyCount < 1;
  int64_t v6 = transitionSafetyCount - 1;
  if (!v5)
  {
    self->_int64_t transitionSafetyCount = v6;
    [(id)objc_opt_class() endTransitionSafety];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUActivityViewController;
  [(SUActivityViewController *)&v7 viewDidDisappear:a3];
  int64_t transitionSafetyCount = self->_transitionSafetyCount;
  BOOL v5 = transitionSafetyCount < 1;
  int64_t v6 = transitionSafetyCount - 1;
  if (!v5)
  {
    self->_int64_t transitionSafetyCount = v6;
    [(id)objc_opt_class() endTransitionSafety];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    ++self->_transitionSafetyCount;
    [(id)objc_opt_class() beginTransitionSafety];
  }
  v5.receiver = self;
  v5.super_class = (Class)SUActivityViewController;
  [(SUActivityViewController *)&v5 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t transitionSafetyCount = self->_transitionSafetyCount;
  if (transitionSafetyCount >= 1)
  {
    do
    {
      self->_int64_t transitionSafetyCount = transitionSafetyCount - 1;
      [(id)objc_opt_class() endTransitionSafety];
      int64_t transitionSafetyCount = self->_transitionSafetyCount;
    }
    while (transitionSafetyCount > 0);
  }
  if (v3)
  {
    self->_int64_t transitionSafetyCount = transitionSafetyCount + 1;
    [(id)objc_opt_class() beginTransitionSafety];
  }
  v6.receiver = self;
  v6.super_class = (Class)SUActivityViewController;
  [(SUActivityViewController *)&v6 viewWillDisappear:v3];
}

@end