@interface SUUIProfileSettingDescription
+ (Class)_viewClassForSettingDescription:(id)a3;
- (NSString)handle;
- (NSString)name;
- (SUUIProfileSettingDescription)initWithViewElement:(id)a3 parent:(id)a4;
- (UIImage)photo;
- (void)_fetchAccountInfo;
- (void)_fetchProfilePhoto;
- (void)dealloc;
- (void)reloadData;
@end

@implementation SUUIProfileSettingDescription

- (SUUIProfileSettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIProfileSettingDescription;
  v4 = [(SUUISettingDescription *)&v8 initWithViewElement:a3 parent:a4];
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v4->_operationQueue;
    v4->_operationQueue = v5;

    [(NSOperationQueue *)v4->_operationQueue setQualityOfService:25];
    [(NSOperationQueue *)v4->_operationQueue setName:@"com.apple.iTunesStoreUI.SUUIProfileSettingDescription"];
    [(SUUIProfileSettingDescription *)v4 reloadData];
  }
  return v4;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)SUUIProfileSettingDescription;
  [(SUUIProfileSettingDescription *)&v3 dealloc];
}

- (void)reloadData
{
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  [(SUUIProfileSettingDescription *)self _fetchAccountInfo];
  [(SUUIProfileSettingDescription *)self _fetchProfilePhoto];
}

+ (Class)_viewClassForSettingDescription:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)_fetchAccountInfo
{
  objc_super v3 = +[SUUIMediaSocialProfileCoordinator sharedCoordinator];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__SUUIProfileSettingDescription__fetchAccountInfo__block_invoke;
  v4[3] = &unk_2654092D0;
  objc_copyWeak(&v5, &location);
  [v3 getProfileWithOptions:0 profileBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__SUUIProfileSettingDescription__fetchAccountInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__SUUIProfileSettingDescription__fetchAccountInfo__block_invoke_2;
  v5[3] = &unk_2654022F8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

uint64_t __50__SUUIProfileSettingDescription__fetchAccountInfo__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    BOOL v4 = WeakRetained == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    v11 = WeakRetained;
    uint64_t v5 = [v3 name];
    id v6 = (void *)v11[5];
    v11[5] = v5;

    uint64_t v7 = [*(id *)(a1 + 32) handle];
    objc_super v8 = (void *)v11[4];
    v11[4] = v7;

    v9 = [v11 parent];
    [v9 reloadSettingDescription:v11];

    WeakRetained = v11;
  }
  return MEMORY[0x270F9A758](v3, WeakRetained);
}

- (void)_fetchProfilePhoto
{
  id v3 = [(SUUISettingDescription *)self parent];
  BOOL v4 = [v3 clientContext];

  uint64_t v5 = [[SUUIMediaSocialLoadProfilePhotoOperation alloc] initWithClientContext:v4];
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  objc_super v8 = __51__SUUIProfileSettingDescription__fetchProfilePhoto__block_invoke;
  v9 = &unk_2654092F8;
  objc_copyWeak(&v10, &location);
  [(SUUIMediaSocialLoadProfilePhotoOperation *)v5 setOutputBlock:&v6];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __51__SUUIProfileSettingDescription__fetchProfilePhoto__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUUIProfileSettingDescription__fetchProfilePhoto__block_invoke_2;
  block[3] = &unk_265403A18;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a3;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __51__SUUIProfileSettingDescription__fetchProfilePhoto__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (*(unsigned char *)(a1 + 48) || !WeakRetained[7]))
  {
    BOOL v4 = WeakRetained;
    objc_storeStrong(WeakRetained + 7, *(id *)(a1 + 32));
    id v3 = [v4 parent];
    [v3 reloadSettingDescription:v4];

    WeakRetained = v4;
  }
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)name
{
  return self->_name;
}

- (UIImage)photo
{
  return self->_photo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end