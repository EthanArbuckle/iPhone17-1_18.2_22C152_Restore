@interface NUNIRenderer
+ (id)sharedInstanceWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5;
+ (void)_deallocInstanceWithPixelFormat:(unint64_t)a3 rendererStyle:(unint64_t)a4;
- (NUNIRenderer)initWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5;
- (unint64_t)pixelFormat;
- (unint64_t)rendererStyle;
- (void)_asyncDeallocInstance;
- (void)dealloc;
@end

@implementation NUNIRenderer

+ (id)sharedInstanceWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a1;
  objc_sync_enter(v9);
  if (a5 == 2)
  {
    v10 = [[NUNIAegirRenderer alloc] initWithPixelFormat:a3 textureSuffix:v8 rendererStyle:2];
    v11 = +[PreferencePane aegirRenderingPreferencePane];
    v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v13 = [v12 objectForKey:@"AegirRenderingReset"];

    if (!v13)
    {
      [v11 reset];
      v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v14 setObject:MEMORY[0x1E4F1CC38] forKey:@"AegirRenderingReset"];
    }
    [(NUNIAegirRenderer *)v10 setRendererOptions:v11];
  }
  else
  {
    v10 = 0;
  }
  v15 = [NSNumber numberWithUnsignedInteger:a3];
  [0 setObject:v10 forKeyedSubscript:v15];

  objc_sync_exit(v9);
  return v10;
}

+ (void)_deallocInstanceWithPixelFormat:(unint64_t)a3 rendererStyle:(unint64_t)a4
{
  id obj = a1;
  objc_sync_enter(obj);
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [0 objectForKeyedSubscript:v5];

  [v6 discard];
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  [0 setObject:0 forKeyedSubscript:v7];

  objc_sync_exit(obj);
}

- (NUNIRenderer)initWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NUNIRenderer;
  v7 = [(NUNIRenderer *)&v11 init];
  id v8 = v7;
  if (v7)
  {
    v7->_rendererStyle = a5;
    v7->_pixelFormat = a3;
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v8 selector:sel__asyncDeallocInstance name:*MEMORY[0x1E4F19628] object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F19628] object:0];

  v4.receiver = self;
  v4.super_class = (Class)NUNIRenderer;
  [(NUNIRenderer *)&v4 dealloc];
}

- (void)_asyncDeallocInstance
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v3 = objc_opt_class();
    unint64_t v4 = [(NUNIRenderer *)self pixelFormat];
    unint64_t v5 = [(NUNIRenderer *)self rendererStyle];
    [v3 _deallocInstanceWithPixelFormat:v4 rendererStyle:v5];
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__NUNIRenderer__asyncDeallocInstance__block_invoke;
    block[3] = &unk_1E609E358;
    objc_copyWeak(&v7, &location);
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __37__NUNIRenderer__asyncDeallocInstance__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    objc_msgSend((id)objc_opt_class(), "_deallocInstanceWithPixelFormat:rendererStyle:", objc_msgSend(WeakRetained, "pixelFormat"), objc_msgSend(WeakRetained, "rendererStyle"));
  }
}

- (unint64_t)rendererStyle
{
  return self->_rendererStyle;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

@end