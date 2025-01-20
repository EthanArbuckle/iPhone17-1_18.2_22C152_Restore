@interface NUNIRenderer
+ (id)sharedInstanceWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5;
+ (void)_deallocInstanceWithPixelFormat:(unint64_t)a3 rendererStyle:(unint64_t)a4;
- (NSString)textureSuffix;
- (NUNIRenderer)initWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5;
- (id)spheroidAtPoint:(id)a3 scene:(NUNIViewport)a4 viewport:;
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
  switch(a5)
  {
    case 1uLL:
      v15 = [NUNIGlobetrotterRenderer alloc];
      a5 = 1;
      break;
    case 2uLL:
      v10 = [[NUNIAegirRenderer alloc] initWithPixelFormat:a3 textureSuffix:v8 rendererStyle:2];
      v11 = +[PreferencePane aegirRenderingPreferencePane];
      v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v17 = [v16 objectForKey:@"AegirRenderingReset"];

      if (!v17)
      {
        [v11 reset];
        v18 = [MEMORY[0x263EFFA40] standardUserDefaults];
        [v18 setObject:MEMORY[0x263EFFA88] forKey:@"AegirRenderingReset"];
      }
      goto LABEL_10;
    case 3uLL:
      v10 = [[NUNICalliopeRenderer alloc] initWithPixelFormat:a3 textureSuffix:v8 rendererStyle:3];
      v11 = +[PreferencePane calliopeRenderingPreferencePane];
      v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v13 = [v12 objectForKey:@"CalliopeRenderingReset"];

      if (!v13)
      {
        [v11 reset];
        v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
        [v14 setObject:MEMORY[0x263EFFA88] forKey:@"CalliopeRenderingReset"];
      }
LABEL_10:
      [(NUNIAegirRenderer *)v10 setRendererOptions:v11];

      goto LABEL_13;
    default:
      v15 = [NUNIClassicRenderer alloc];
      break;
  }
  v10 = [(NUNIClassicRenderer *)v15 initWithPixelFormat:a3 textureSuffix:v8 rendererStyle:a5];
LABEL_13:
  v19 = [NSNumber numberWithUnsignedInteger:a3];
  [0 setObject:v10 forKeyedSubscript:v19];

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
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NUNIRenderer;
  v10 = [(NUNIRenderer *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_rendererStyle = a5;
    v10->_pixelFormat = a3;
    objc_storeStrong((id *)&v10->_textureSuffix, a4);
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v11 selector:sel__asyncDeallocInstance name:*MEMORY[0x263EFCF18] object:0];
  }
  return v11;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EFCF18] object:0];

  v4.receiver = self;
  v4.super_class = (Class)NUNIRenderer;
  [(NUNIRenderer *)&v4 dealloc];
}

- (id)spheroidAtPoint:(id)a3 scene:(NUNIViewport)a4 viewport:
{
  return 0;
}

- (void)_asyncDeallocInstance
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v3 = objc_opt_class();
    unint64_t v4 = [(NUNIRenderer *)self pixelFormat];
    unint64_t v5 = [(NUNIRenderer *)self rendererStyle];
    [v3 _deallocInstanceWithPixelFormat:v4 rendererStyle:v5];
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__NUNIRenderer__asyncDeallocInstance__block_invoke;
    block[3] = &unk_2644CE500;
    objc_copyWeak(&v7, &location);
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
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

- (NSString)textureSuffix
{
  return self->_textureSuffix;
}

- (void).cxx_destruct
{
}

@end