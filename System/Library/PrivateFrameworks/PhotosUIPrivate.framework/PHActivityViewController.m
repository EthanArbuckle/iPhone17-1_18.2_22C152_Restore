@interface PHActivityViewController
- (NSArray)_PHActivityItems;
- (PHActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4;
- (void)_setPHActivityItems:(id)a3;
- (void)_updateActivityItems:(id)a3;
@end

@implementation PHActivityViewController

- (void).cxx_destruct
{
}

- (void)_setPHActivityItems:(id)a3
{
}

- (NSArray)_PHActivityItems
{
  return self->__PHActivityItems;
}

- (void)_updateActivityItems:(id)a3
{
  id v4 = a3;
  [(PHActivityViewController *)self _setPHActivityItems:v4];
  v5.receiver = self;
  v5.super_class = (Class)PHActivityViewController;
  [(PHActivityViewController *)&v5 _updateActivityItems:v4];
}

- (PHActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PHActivityViewController;
  v8 = [(PHActivityViewController *)&v21 initWithActivityItems:v6 applicationActivities:v7];
  v9 = v8;
  if (v8)
  {
    [(PHActivityViewController *)v8 _setPHActivityItems:v6];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v15, "setDataSource:", v9, (void)v17);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }
  }
  return v9;
}

@end