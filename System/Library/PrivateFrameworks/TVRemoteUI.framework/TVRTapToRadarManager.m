@interface TVRTapToRadarManager
+ (id)_captureScreenshotForWindow:(id)a3;
+ (id)bugImage;
+ (void)fileRadarWithTitle:(id)a3 description:(id)a4 window:(id)a5;
- (NSURLComponents)urlComponents;
- (void)fileRadar;
- (void)setUrlComponents:(id)a3;
@end

@implementation TVRTapToRadarManager

+ (id)bugImage
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [MEMORY[0x263F827E8] imageNamed:@"radarBug" inBundle:v2 compatibleWithTraitCollection:0];
  v4 = [v3 imageWithRenderingMode:2];

  return v4;
}

+ (void)fileRadarWithTitle:(id)a3 description:(id)a4 window:(id)a5
{
  id v30 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = objc_alloc_init(TVRTapToRadarManager);
  id v10 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v10 setScheme:@"tap-to-radar"];
  [v10 setHost:@"new"];
  v11 = [MEMORY[0x263EFF980] array];
  v12 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"ComponentName" value:@"Apple TV"];
  [v11 addObject:v12];

  v13 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"ComponentVersion" value:@"New Bugs"];
  [v11 addObject:v13];

  v14 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"ComponentID" value:@"250465"];
  [v11 addObject:v14];

  v15 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"AutoDiagnostics" value:@"phone"];
  [v11 addObject:v15];

  v16 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"Classification" value:@"Serious Bug"];
  [v11 addObject:v16];

  v17 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"Reproducibility" value:@"Not Applicable"];
  [v11 addObject:v17];

  v18 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"DeviceClasses" value:@"AppleTV"];
  [v11 addObject:v18];

  v19 = [(id)objc_opt_class() _captureScreenshotForWindow:v8];

  v20 = [v19 relativePath];

  if ([v20 length])
  {
    v21 = (objc_class *)MEMORY[0x263F08BD0];
    id v22 = v20;
    v23 = (void *)[[v21 alloc] initWithName:@"Screenshot" value:v22];

    [v11 addObject:v23];
  }
  if ([v30 length])
  {
    v24 = (objc_class *)MEMORY[0x263F08BD0];
    id v25 = v30;
    v26 = (void *)[[v24 alloc] initWithName:@"Title" value:v25];

    [v11 addObject:v26];
  }
  if ([v7 length])
  {
    v27 = (objc_class *)MEMORY[0x263F08BD0];
    id v28 = v7;
    v29 = (void *)[[v27 alloc] initWithName:@"Description" value:v28];

    [v11 addObject:v29];
  }
  [v10 setQueryItems:v11];
  [(TVRTapToRadarManager *)v9 setUrlComponents:v10];
  [(TVRTapToRadarManager *)v9 fileRadar];
}

- (void)fileRadar
{
  v9[1] = *MEMORY[0x263EF8340];
  if (+[TVRUIFeatures isTapToRadarEnabled])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F018D8]);
    uint64_t v8 = *MEMORY[0x263F3F5E8];
    v9[0] = MEMORY[0x263EFFA88];
    v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v3 setFrontBoardOptions:v4];

    v5 = [MEMORY[0x263F01880] defaultWorkspace];
    v6 = [(TVRTapToRadarManager *)self urlComponents];
    id v7 = [v6 URL];
    [v5 openURL:v7 configuration:v3 completionHandler:&__block_literal_global_3];
  }
}

+ (id)_captureScreenshotForWindow:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F827A0]);
  [v3 bounds];
  id v7 = objc_msgSend(v4, "initWithSize:", v5, v6);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __52__TVRTapToRadarManager__captureScreenshotForWindow___block_invoke;
  v20[3] = &unk_264800528;
  id v8 = v3;
  id v21 = v8;
  id v9 = v7;
  id v22 = v9;
  id v10 = [v9 PNGDataWithActions:v20];
  id v11 = objc_alloc_init(MEMORY[0x263F08790]);
  [v11 setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
  v12 = [MEMORY[0x263EFF910] date];
  v13 = [v11 stringFromDate:v12];
  v14 = [NSString stringWithFormat:@"TVRemote-TTR-Screenshot-%@.png", v13];
  v15 = NSTemporaryDirectory();
  v16 = [v15 stringByAppendingPathComponent:v14];

  v17 = [NSURL fileURLWithPath:v16];
  if (([v10 writeToURL:v17 atomically:1] & 1) == 0)
  {
    v18 = [v17 path];
    NSLog(&cfstr_FailedToWriteS.isa, v18);

    v17 = 0;
  }

  return v17;
}

void __52__TVRTapToRadarManager__captureScreenshotForWindow___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) format];
  [v2 bounds];
  objc_msgSend(v1, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
}

- (NSURLComponents)urlComponents
{
  return self->_urlComponents;
}

- (void)setUrlComponents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end