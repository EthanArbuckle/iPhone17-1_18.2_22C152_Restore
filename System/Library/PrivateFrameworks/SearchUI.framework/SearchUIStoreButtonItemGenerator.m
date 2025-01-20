@interface SearchUIStoreButtonItemGenerator
+ (BOOL)mayRequireAsyncGenerationForButtonItem:(id)a3;
- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4;
@end

@implementation SearchUIStoreButtonItemGenerator

+ (BOOL)mayRequireAsyncGenerationForButtonItem:(id)a3
{
  return 0;
}

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  v8 = [(SearchUIButtonItemGenerator *)self delegate];
  if ([v8 deviceIsAuthenticated]) {
    v9 = [[SearchUIButtonItem alloc] initWithSFButtonItem:v6];
  }
  else {
    v9 = 0;
  }

  v10 = objc_opt_new();
  [(SearchUIButtonItem *)v9 setCommand:v10];

  if (v9)
  {
    v12[0] = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    v7[2](v7, v11, 1);
  }
  else
  {
    v7[2](v7, 0, 1);
  }
}

@end