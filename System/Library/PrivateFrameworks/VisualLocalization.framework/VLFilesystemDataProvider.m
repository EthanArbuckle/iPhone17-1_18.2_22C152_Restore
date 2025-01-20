@interface VLFilesystemDataProvider
- (VLFilesystemDataProvider)initWithBaseDirectory:(id)a3;
- (VLLocalizationDataProviderDelegate)delegate;
- (id)fileURLForKey:(id *)a3 error:(id *)a4;
- (void)determineAvailabilityForCoordinate:(id *)a3 horizontalAccuracy:(double)a4 purpose:(int64_t)a5 callbackQueue:(id)a6 callback:(id)a7;
- (void)setDelegate:(id)a3;
@end

@implementation VLFilesystemDataProvider

- (VLFilesystemDataProvider)initWithBaseDirectory:(id)a3
{
  id v5 = a3;
  if (([v5 isFileURL] & 1) == 0)
  {
    id v10 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"directoryURL must be a file URL" userInfo:0];
    objc_exception_throw(v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)VLFilesystemDataProvider;
  v6 = [(VLFilesystemDataProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_baseDirectory, a3);
    v8 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_baseDirectory, 0);
}

- (id)fileURLForKey:(id *)a3 error:(id *)a4
{
  baseDirectory = self->_baseDirectory;
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%i/%i/%i/tracks_%i.vtrk", a3->var0, a3->var1, a3->var2, a3->var3);
  v7 = [(NSURL *)baseDirectory URLByAppendingPathComponent:v6];

  v8 = [MEMORY[0x263F08850] defaultManager];
  v9 = [v7 path];
  char v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    id v11 = v7;
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"VLLocalizationDataProviderErrorDomain" code:2 userInfo:0];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)determineAvailabilityForCoordinate:(id *)a3 horizontalAccuracy:(double)a4 purpose:(int64_t)a5 callbackQueue:(id)a6 callback:(id)a7
{
  id v10 = a7;
  id v11 = v10;
  if (v10)
  {
    $F24F406B2B787EFB06265DBA3D28CBD5 v14 = *a3;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __113__VLFilesystemDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke;
    v12[3] = &unk_2643BA1C0;
    v12[4] = self;
    id v13 = v10;
    dispatch_async((dispatch_queue_t)a6, v12);
  }
}

void __113__VLFilesystemDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = [v2 contentsOfDirectoryAtURL:*(void *)(*(void *)(a1 + 32) + 8) includingPropertiesForKeys:0 options:0 error:0];

  memset(v15, 0, sizeof(v15));
  if ([v3 countByEnumeratingWithState:v15 objects:v16 count:16])
  {
    v4 = [**((id **)&v15[0] + 1) lastPathComponent];
    uint64_t v5 = [v4 integerValue];
    GEOMapPointForCoordinate();
    double v6 = (double)(1 << v5) / *(double *)(MEMORY[0x263F41670] + 16);
    LODWORD(v9) = vcvtmd_u64_f64(v8 * v6);
    id v10 = *(void **)(*(void *)(a1 + 32) + 8);
    id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%llu/%llu/%llu", v5, __PAIR64__(MEMORY[0x263F41674], vcvtmd_u64_f64(v7 * v6)), v9);
    v12 = [v10 URLByAppendingPathComponent:v11];

    id v13 = [MEMORY[0x263F08850] defaultManager];
    $F24F406B2B787EFB06265DBA3D28CBD5 v14 = [v12 path];
    [v13 fileExistsAtPath:v14];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (VLLocalizationDataProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VLLocalizationDataProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

@end