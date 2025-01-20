@interface NTKUpNextNewsDataSource
+ (BOOL)wantsReloadForSignificantTimeChange;
+ (Class)nanoNewsDataSourceClass;
+ (id)bundleIdentifier;
+ (unint64_t)elementContentMode;
- (NTKUpNextElementDataSource)newsDataSourceProxy;
- (NTKUpNextNewsDataSource)init;
- (id)supportedSections;
- (void)getElementsDuringDateInterval:(id)a3 inSection:(unint64_t)a4 withHandler:(id)a5;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
- (void)pause;
- (void)resume;
- (void)setAllowsLocationUse:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setNewsDataSourceProxy:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation NTKUpNextNewsDataSource

+ (unint64_t)elementContentMode
{
  return 0;
}

+ (Class)nanoNewsDataSourceClass
{
  if (nanoNewsDataSourceClass_onceToken != -1) {
    dispatch_once(&nanoNewsDataSourceClass_onceToken, &__block_literal_global_164);
  }
  return 0;
}

- (NTKUpNextNewsDataSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextNewsDataSource;
  v2 = [(REElementDataSource *)&v7 init];
  if (v2)
  {
    v3 = (objc_class *)[(id)objc_opt_class() nanoNewsDataSourceClass];
    if ([(objc_class *)v3 isSubclassOfClass:objc_opt_class()])
    {
      v4 = (NTKUpNextElementDataSource *)objc_alloc_init(v3);
      newsDataSourceProxy = v2->_newsDataSourceProxy;
      v2->_newsDataSourceProxy = v4;
    }
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(REElementDataSource *)self delegate];
  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextNewsDataSource;
  [(REElementDataSource *)&v7 setDelegate:v4];
  if (v5 != v4)
  {
    v6 = [(NTKUpNextNewsDataSource *)self newsDataSourceProxy];
    [v6 setDelegate:v4];
  }
}

- (void)setRunning:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NTKUpNextNewsDataSource;
  -[REElementDataSource setRunning:](&v6, sel_setRunning_);
  id v5 = [(NTKUpNextNewsDataSource *)self newsDataSourceProxy];
  [v5 setRunning:v3];
}

- (void)setState:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKUpNextNewsDataSource;
  -[REElementDataSource setState:](&v6, sel_setState_);
  id v5 = [(NTKUpNextNewsDataSource *)self newsDataSourceProxy];
  [v5 setState:a3];
}

+ (id)bundleIdentifier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__NTKUpNextNewsDataSource_bundleIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (bundleIdentifier_onceToken != -1) {
    dispatch_once(&bundleIdentifier_onceToken, block);
  }
  v2 = (void *)bundleIdentifier_bundleIdentifier;
  return v2;
}

void __43__NTKUpNextNewsDataSource_bundleIdentifier__block_invoke()
{
  v0 = (void *)[(id)objc_opt_class() nanoNewsDataSourceClass];
  if (objc_opt_respondsToSelector())
  {
    v1 = [v0 bundleIdentifier];
  }
  else
  {
    v1 = @"com.apple.nanonews";
  }
  v2 = (void *)bundleIdentifier_bundleIdentifier;
  bundleIdentifier_bundleIdentifier = (uint64_t)v1;
}

- (id)supportedSections
{
  v7[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NTKUpNextElementDataSource *)self->_newsDataSourceProxy supportedSections];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(NTKUpNextElementDataSource *)self->_newsDataSourceProxy supportedSections];
  }
  else
  {
    v7[0] = *MEMORY[0x1E4F94A10];
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  return v5;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__NTKUpNextNewsDataSource_getElementsInSection_withHandler___block_invoke;
  aBlock[3] = &unk_1E62C95E0;
  id v8 = v7;
  id v13 = v8;
  v9 = _Block_copy(aBlock);
  v10 = [(NTKUpNextNewsDataSource *)self newsDataSourceProxy];

  if (v10)
  {
    v11 = [(NTKUpNextNewsDataSource *)self newsDataSourceProxy];
    [v11 getElementsInSection:v6 withHandler:v9];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0]);
  }
}

void __60__NTKUpNextNewsDataSource_getElementsInSection_withHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) content];
        [v8 objectForKey:@"REUICircularTemplateKey"];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getElementsDuringDateInterval:(id)a3 inSection:(unint64_t)a4 withHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v10 = [(NTKUpNextNewsDataSource *)self newsDataSourceProxy];

  if (v10)
  {
    long long v11 = [(NTKUpNextNewsDataSource *)self newsDataSourceProxy];
    [v11 getElementsDuringDateInterval:v8 inSection:a4 withHandler:v9];
  }
  else
  {
    long long v12 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(REElementDataSource *)self logHeader];
      int v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "%@ no elements with reason not loaded", (uint8_t *)&v14, 0xCu);
    }
    (*((void (**)(id, void))v9 + 2))(v9, MEMORY[0x1E4F1CBF0]);
  }
}

- (void)pause
{
  id v2 = [(NTKUpNextNewsDataSource *)self newsDataSourceProxy];
  [v2 pause];
}

- (void)resume
{
  id v2 = [(NTKUpNextNewsDataSource *)self newsDataSourceProxy];
  [v2 resume];
}

- (void)setAllowsLocationUse:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NTKUpNextNewsDataSource;
  -[REElementDataSource setAllowsLocationUse:](&v6, sel_setAllowsLocationUse_);
  uint64_t v5 = [(NTKUpNextNewsDataSource *)self newsDataSourceProxy];
  [v5 setAllowsLocationUse:v3];
}

+ (BOOL)wantsReloadForSignificantTimeChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__NTKUpNextNewsDataSource_wantsReloadForSignificantTimeChange__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (wantsReloadForSignificantTimeChange_onceToken != -1) {
    dispatch_once(&wantsReloadForSignificantTimeChange_onceToken, block);
  }
  return wantsReloadForSignificantTimeChange_wantsReloadForSignificantTimeChange;
}

uint64_t __62__NTKUpNextNewsDataSource_wantsReloadForSignificantTimeChange__block_invoke()
{
  v0 = (void *)[(id)objc_opt_class() nanoNewsDataSourceClass];
  if (objc_opt_respondsToSelector()) {
    uint64_t result = [v0 wantsReloadForSignificantTimeChange];
  }
  else {
    uint64_t result = 0;
  }
  wantsReloadForSignificantTimeChange_wantsReloadForSignificantTimeChange = result;
  return result;
}

- (NTKUpNextElementDataSource)newsDataSourceProxy
{
  return self->_newsDataSourceProxy;
}

- (void)setNewsDataSourceProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end