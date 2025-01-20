@interface SFUIActivityImageProvider
+ (SBSHomeScreenService)homeScreenService;
+ (id)tintImage:(id)a3 withDescriptorName:(id)a4 userInterfaceStyle:(int64_t)a5;
+ (id)tintImageDescriptor:(id)a3 withUserInterfaceStyle:(int64_t)a4 forGraphicIcon:(BOOL)a5;
- (id)_fetchActionImageForActivity:(id)a3 contentSizeCategory:(id)a4 imageSymbolConfiguration:(id)a5;
- (int)requestImageForActivity:(id)a3 contentSizeCategory:(id)a4 imageSymbolConfiguration:(id)a5 resultHandler:(id)a6;
- (int)requestImageForActivity:(id)a3 contentSizeCategory:(id)a4 imageSymbolConfiguration:(id)a5 synchronous:(BOOL)a6 resultHandler:(id)a7;
- (int)requestImageForActivity:(id)a3 contentSizeCategory:(id)a4 userInterfaceStyle:(int64_t)a5 imageSymbolConfiguration:(id)a6 synchronous:(BOOL)a7 resultHandler:(id)a8;
- (int)requestImageForBundleIdentifier:(id)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 iconFormat:(int)a6 synchronous:(BOOL)a7 resultHandler:(id)a8;
- (int)requestImageForBundleIdentifier:(id)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 synchronous:(BOOL)a6 resultHandler:(id)a7;
- (int)requestImageForBundleIdentifier:(id)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 userInterfaceStyle:(int64_t)a6 iconFormat:(int)a7 synchronous:(BOOL)a8 resultHandler:(id)a9;
- (int)requestImageForUTI:(id)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 userInterfaceStyle:(int64_t)a6 iconFormat:(int)a7 synchronous:(BOOL)a8 resultHandler:(id)a9;
- (void)_fetchBundleImageForIdentifier:(id)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 userInterfaceStyle:(int64_t)a6 iconFormat:(int)a7 uti:(id)a8;
- (void)_fetchImageForActivity:(id)a3 contentSizeCategory:(id)a4 userInterfaceStyle:(int64_t)a5 imageSymbolConfiguration:(id)a6;
- (void)_handleIconImage:(id)a3 identifier:(id)a4 activityCategory:(int64_t)a5 contentSizeCategory:(id)a6 iconFormat:(int)a7 placeholder:(BOOL)a8 uti:(id)a9;
- (void)performImageRequest:(id)a3;
@end

@implementation SFUIActivityImageProvider

+ (SBSHomeScreenService)homeScreenService
{
  if (homeScreenService_onceToken != -1) {
    dispatch_once(&homeScreenService_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)homeScreenService_homeScreenService;
  return (SBSHomeScreenService *)v2;
}

void __46__SFUIActivityImageProvider_homeScreenService__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)homeScreenService_homeScreenService;
  homeScreenService_homeScreenService = v0;
}

+ (id)tintImageDescriptor:(id)a3 withUserInterfaceStyle:(int64_t)a4 forGraphicIcon:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  v8 = v7;
  if (v5) {
    [v7 setAppearanceVariant:1];
  }
  v9 = [(id)objc_opt_class() homeScreenService];
  v10 = [v9 homeScreenIconStyleConfiguration];

  if (v10)
  {
    uint64_t v11 = [v10 configurationType];
    uint64_t v12 = 1;
    BOOL v13 = a4 == 2;
    if (v11) {
      BOOL v13 = 0;
    }
    if (v11 != 2) {
      uint64_t v12 = v13;
    }
    if (v11 == 3) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = v12;
    }
    [v8 setAppearance:v14];
    v15 = [v10 tintColor];
    uint64_t v16 = [v15 CGColor];

    if (v16)
    {
      v17 = (void *)[objc_alloc(MEMORY[0x263F4B4F0]) initWithCGColor:v16];
      [v8 setTintColor:v17];
    }
  }

  return v8;
}

+ (id)tintImage:(id)a3 withDescriptorName:(id)a4 userInterfaceStyle:(int64_t)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = objc_alloc(MEMORY[0x263F4B500]);
    id v10 = v7;
    uint64_t v11 = [v10 CGImage];
    [v10 scale];
    uint64_t v12 = objc_msgSend(v9, "initWithCGImage:scale:", v11);
    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x263F4B540]);
      v25[0] = v12;
      char v14 = 1;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
      uint64_t v16 = (void *)[v13 initWithImages:v15];

      v17 = [MEMORY[0x263F4B558] imageDescriptorNamed:v8];
      v18 = +[SFUIActivityImageProvider tintImageDescriptor:v17 withUserInterfaceStyle:a5 forGraphicIcon:0];

      v19 = [v16 imageForDescriptor:v18];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        char v14 = [v19 placeholder] ^ 1;
      }
      if (v19 && (v14 & 1) != 0
        || ([v16 prepareImageForDescriptor:v18],
            uint64_t v20 = objc_claimAutoreleasedReturnValue(),
            v19,
            (v19 = (void *)v20) != 0))
      {
        v21 = (void *)MEMORY[0x263F827E8];
        uint64_t v22 = [v19 CGImage];
        [v19 scale];
        objc_msgSend(v21, "imageWithCGImage:scale:orientation:", v22, 0);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v23 = v10;
      }
    }
    else
    {
      id v23 = v10;
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (int)requestImageForBundleIdentifier:(id)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 synchronous:(BOOL)a6 resultHandler:(id)a7
{
  return [(SFUIActivityImageProvider *)self requestImageForBundleIdentifier:a3 activityCategory:a4 contentSizeCategory:a5 iconFormat:2 synchronous:0 resultHandler:a7];
}

- (int)requestImageForBundleIdentifier:(id)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 iconFormat:(int)a6 synchronous:(BOOL)a7 resultHandler:(id)a8
{
  uint64_t v12 = (void *)MEMORY[0x263F82B60];
  id v13 = a8;
  id v14 = a5;
  id v15 = a3;
  uint64_t v16 = [v12 mainScreen];
  v17 = [v16 traitCollection];
  LODWORD(a4) = -[SFUIActivityImageProvider requestImageForBundleIdentifier:activityCategory:contentSizeCategory:userInterfaceStyle:iconFormat:synchronous:resultHandler:](self, "requestImageForBundleIdentifier:activityCategory:contentSizeCategory:userInterfaceStyle:iconFormat:synchronous:resultHandler:", v15, a4, v14, [v17 userInterfaceStyle], 2, 0, v13);

  return a4;
}

- (int)requestImageForBundleIdentifier:(id)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 userInterfaceStyle:(int64_t)a6 iconFormat:(int)a7 synchronous:(BOOL)a8 resultHandler:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a9;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v18 = sharing_ui_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v15;
    _os_log_impl(&dword_21DB23000, v18, OS_LOG_TYPE_DEFAULT, "request image for bundle identifier:%@", buf, 0xCu);
  }

  if ([v15 length])
  {
    v19 = [(SFUIImageProvider *)self imageCache];
    uint64_t v20 = [v19 objectForKey:v15];

    if (v20)
    {
      v21 = sharing_ui_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v20;
        _os_log_impl(&dword_21DB23000, v21, OS_LOG_TYPE_DEFAULT, "found cached image:%@", buf, 0xCu);
      }

      (*((void (**)(id, void *, void, void))v17 + 2))(v17, v20, 0, 0);
      LODWORD(v22) = 0;
    }
    else
    {
      uint64_t v22 = [(SFUIImageProvider *)self nextRequestID];
      LOBYTE(v26) = a8;
      v24 = [[SFUIActivityImageRequest alloc] initWithRequestID:v22 identifier:v15 activityCategory:a4 contentSizeCategory:v16 userInterfaceStyle:a6 iconFormat:v10 synchronous:v26 resultHandler:v17];
      [(SFUIImageProvider *)self scheduleImageRequest:v24];
    }
  }
  else
  {
    id v23 = sharing_ui_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[SFUIActivityImageProvider requestImageForBundleIdentifier:activityCategory:contentSizeCategory:userInterfaceStyle:iconFormat:synchronous:resultHandler:](v23);
    }

    (*((void (**)(id, void, void, void))v17 + 2))(v17, 0, 0, 0);
    LODWORD(v22) = 0;
  }

  return v22;
}

- (int)requestImageForUTI:(id)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 userInterfaceStyle:(int64_t)a6 iconFormat:(int)a7 synchronous:(BOOL)a8 resultHandler:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a9;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v18 = sharing_ui_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v15;
    _os_log_impl(&dword_21DB23000, v18, OS_LOG_TYPE_DEFAULT, "request image for UTI:%@", buf, 0xCu);
  }

  if ([v15 length])
  {
    v19 = [(SFUIImageProvider *)self imageCache];
    uint64_t v20 = [v19 objectForKey:v15];

    if (v20)
    {
      v21 = sharing_ui_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v20;
        _os_log_impl(&dword_21DB23000, v21, OS_LOG_TYPE_DEFAULT, "found cached image:%@", buf, 0xCu);
      }

      (*((void (**)(id, void *, void, void))v17 + 2))(v17, v20, 0, 0);
      LODWORD(v22) = 0;
    }
    else
    {
      uint64_t v22 = [(SFUIImageProvider *)self nextRequestID];
      LOBYTE(v26) = a8;
      v24 = [[SFUIActivityImageRequest alloc] initWithRequestID:v22 uti:v15 activityCategory:a4 contentSizeCategory:v16 userInterfaceStyle:a6 iconFormat:v10 synchronous:v26 resultHandler:v17];
      [(SFUIImageProvider *)self scheduleImageRequest:v24];
    }
  }
  else
  {
    id v23 = sharing_ui_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[SFUIActivityImageProvider requestImageForUTI:activityCategory:contentSizeCategory:userInterfaceStyle:iconFormat:synchronous:resultHandler:](v23);
    }

    (*((void (**)(id, void, void, void))v17 + 2))(v17, 0, 0, 0);
    LODWORD(v22) = 0;
  }

  return v22;
}

- (int)requestImageForActivity:(id)a3 contentSizeCategory:(id)a4 imageSymbolConfiguration:(id)a5 resultHandler:(id)a6
{
  return [(SFUIActivityImageProvider *)self requestImageForActivity:a3 contentSizeCategory:a4 imageSymbolConfiguration:a5 synchronous:0 resultHandler:a6];
}

- (int)requestImageForActivity:(id)a3 contentSizeCategory:(id)a4 imageSymbolConfiguration:(id)a5 synchronous:(BOOL)a6 resultHandler:(id)a7
{
  uint64_t v11 = (void *)MEMORY[0x263F82B60];
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v11 mainScreen];
  id v17 = [v16 traitCollection];
  LODWORD(self) = -[SFUIActivityImageProvider requestImageForActivity:contentSizeCategory:userInterfaceStyle:imageSymbolConfiguration:synchronous:resultHandler:](self, "requestImageForActivity:contentSizeCategory:userInterfaceStyle:imageSymbolConfiguration:synchronous:resultHandler:", v15, v14, [v17 userInterfaceStyle], v13, 0, v12);

  return (int)self;
}

- (int)requestImageForActivity:(id)a3 contentSizeCategory:(id)a4 userInterfaceStyle:(int64_t)a5 imageSymbolConfiguration:(id)a6 synchronous:(BOOL)a7 resultHandler:(id)a8
{
  BOOL v9 = a7;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [v14 activityUUID];
    v19 = [v18 UUIDString];

    uint64_t v20 = sharing_ui_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v14;
      __int16 v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_21DB23000, v20, OS_LOG_TYPE_DEFAULT, "requestImageForActivity:%@ identifier:%@", buf, 0x16u);
    }

    v21 = [(SFUIImageProvider *)self imageCache];
    uint64_t v22 = [v21 objectForKey:v19];

    if (v22)
    {
      id v23 = sharing_ui_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v22;
        _os_log_impl(&dword_21DB23000, v23, OS_LOG_TYPE_DEFAULT, "found cached image:%@", buf, 0xCu);
      }

      (*((void (**)(id, void *, void, void))v17 + 2))(v17, v22, 0, 0);
      LODWORD(v24) = 0;
    }
    else
    {
      uint64_t v24 = [(SFUIImageProvider *)self nextRequestID];
      v25 = [[SFUIActivityImageRequest alloc] initWithRequestID:v24 activity:v14 contentSizeCategory:v15 userInterfaceStyle:a5 imageSymbolConfiguration:v16 synchronous:v9 resultHandler:v17];
      [(SFUIImageProvider *)self scheduleImageRequest:v25];
    }
  }
  else
  {
    v19 = sharing_ui_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SFUIActivityImageProvider requestImageForActivity:contentSizeCategory:userInterfaceStyle:imageSymbolConfiguration:synchronous:resultHandler:]((uint64_t)v14, v19);
    }
    LODWORD(v24) = 0;
  }

  return v24;
}

- (void)performImageRequest:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SFUIActivityImageProvider.m" lineNumber:253 description:@"request is not a SFUIActivityImageRequest type."];
  }
  id v15 = v5;
  v6 = [v15 activity];

  if (v6)
  {
    id v7 = [v15 activity];
    id v8 = [v15 contentSizeCategory];
    uint64_t v9 = [v15 userInterfaceStyle];
    uint64_t v10 = [v15 imageSymbolConfiguration];
    [(SFUIActivityImageProvider *)self _fetchImageForActivity:v7 contentSizeCategory:v8 userInterfaceStyle:v9 imageSymbolConfiguration:v10];
  }
  else
  {
    id v7 = [v15 identifier];
    uint64_t v11 = [v15 activityCategory];
    id v8 = [v15 contentSizeCategory];
    uint64_t v12 = [v15 userInterfaceStyle];
    uint64_t v13 = [v15 iconFormat];
    uint64_t v10 = [v15 uti];
    [(SFUIActivityImageProvider *)self _fetchBundleImageForIdentifier:v7 activityCategory:v11 contentSizeCategory:v8 userInterfaceStyle:v12 iconFormat:v13 uti:v10];
  }
}

- (void)_fetchBundleImageForIdentifier:(id)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 userInterfaceStyle:(int64_t)a6 iconFormat:(int)a7 uti:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v39 = a5;
  id v14 = a8;
  id v15 = sharing_ui_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = @"UTI";
    *(_DWORD *)buf = 138413058;
    if (!v14) {
      id v16 = @"bundle identifier";
    }
    v42 = v16;
    if (v14) {
      id v17 = v14;
    }
    else {
      id v17 = v13;
    }
    __int16 v43 = 2112;
    id v44 = v17;
    __int16 v45 = 2048;
    int64_t v46 = a4;
    __int16 v47 = 2048;
    uint64_t v48 = v9;
    _os_log_impl(&dword_21DB23000, v15, OS_LOG_TYPE_DEFAULT, "fetch bundle image for %@:%@ activityCategory:%ld iconFormat:%ld", buf, 0x2Au);
  }

  v18 = (__CFString *)objc_alloc_init(MEMORY[0x263F4B568]);
  [(__CFString *)v18 setSymbolSize:3];
  v19 = [MEMORY[0x263F82B60] mainScreen];
  [v19 scale];
  -[__CFString setScale:](v18, "setScale:");

  uint64_t v20 = (id *)MEMORY[0x263F4B5A0];
  if (v9) {
    uint64_t v20 = (id *)MEMORY[0x263F4B578];
  }
  id v21 = *v20;
  uint64_t v22 = [MEMORY[0x263F4B558] imageDescriptorNamed:v21];
  [v22 setTemplateVariant:a4 == 0];
  [v22 setDrawBorder:v9 == 0];
  [(id)objc_opt_class() tintImageDescriptor:v22 withUserInterfaceStyle:a6 forGraphicIcon:v14 != 0];
  id v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

  id v24 = objc_alloc(MEMORY[0x263F4B540]);
  if (v14) {
    uint64_t v25 = [v24 initWithType:v14];
  }
  else {
    uint64_t v25 = [v24 initWithBundleIdentifier:v13];
  }
  uint64_t v26 = (void *)v25;
  v27 = sharing_ui_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    if (a4) {
      id v28 = v23;
    }
    else {
      id v28 = v18;
    }
    *(_DWORD *)buf = 138412290;
    v42 = v28;
    _os_log_impl(&dword_21DB23000, v27, OS_LOG_TYPE_DEFAULT, "fetching fast image with descriptor:%@", buf, 0xCu);
  }
  else if (a4)
  {
    id v28 = v23;
  }
  else
  {
    id v28 = v18;
  }

  uint64_t v29 = [v26 imageForDescriptor:v28];
  v30 = (void *)v29;
  if (!a4 && !v29)
  {
    uint64_t v31 = sharing_ui_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v23;
      _os_log_impl(&dword_21DB23000, v31, OS_LOG_TYPE_DEFAULT, "fetching fast action image with image descriptor:%@", buf, 0xCu);
    }

    v30 = [v26 imageForDescriptor:v23];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v32 = 0;
  }
  else {
    uint64_t v32 = [v30 placeholder];
  }
  if (a4) {
    char v33 = 0;
  }
  else {
    char v33 = v32;
  }
  if (v30 && (v33 & 1) == 0) {
    [(SFUIActivityImageProvider *)self _handleIconImage:v30 identifier:v13 activityCategory:a4 contentSizeCategory:v39 iconFormat:v9 placeholder:v32 uti:v14];
  }
  if (v30) {
    int v34 = v32;
  }
  else {
    int v34 = 1;
  }
  if (v34 == 1)
  {
    v35 = sharing_ui_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v23;
      _os_log_impl(&dword_21DB23000, v35, OS_LOG_TYPE_DEFAULT, "fetching final image with descriptor:%@", buf, 0xCu);
    }

    uint64_t v36 = [v26 prepareImageForDescriptor:v23];

    int64_t v37 = a4;
    v38 = v39;
    [(SFUIActivityImageProvider *)self _handleIconImage:v36 identifier:v13 activityCategory:v37 contentSizeCategory:v39 iconFormat:v9 placeholder:0 uti:v14];
    v30 = (void *)v36;
  }
  else
  {
    v38 = v39;
  }
}

- (void)_fetchImageForActivity:(id)a3 contentSizeCategory:(id)a4 userInterfaceStyle:(int64_t)a5 imageSymbolConfiguration:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 activityUUID];
  id v14 = [v13 UUIDString];

  id v15 = sharing_ui_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[SFUIActivityImageProvider _fetchImageForActivity:contentSizeCategory:userInterfaceStyle:imageSymbolConfiguration:]((uint64_t)v10, (uint64_t)v14, v15);
  }

  [v10 setUserInterfaceStyle:a5];
  if ([(id)objc_opt_class() activityCategory]) {
    [v10 _activityImage];
  }
  else {
  id v16 = [(SFUIActivityImageProvider *)self _fetchActionImageForActivity:v10 contentSizeCategory:v11 imageSymbolConfiguration:v12];
  }
  id location = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(&v19, &location);
  id v17 = v16;
  id v18 = v14;
  sf_dispatch_on_main_queue();

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __116__SFUIActivityImageProvider__fetchImageForActivity_contentSizeCategory_userInterfaceStyle_imageSymbolConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained deliverImage:*(void *)(a1 + 32) identifier:*(void *)(a1 + 40) placeholder:0 error:0];
}

- (id)_fetchActionImageForActivity:(id)a3 contentSizeCategory:(id)a4 imageSymbolConfiguration:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 _systemImageName];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x263F827E8];
    id v12 = [v7 _systemImageName];
    id v13 = [v11 _systemImageNamed:v12];
    id v14 = [v13 imageByApplyingSymbolConfiguration:v9];

LABEL_3:
    goto LABEL_6;
  }
  id v15 = [v7 activityImage];
  id v16 = [v15 symbolConfiguration];

  if (!v16)
  {
    if ([v7 _wantsOriginalImageColor])
    {
      id v18 = (void *)MEMORY[0x263F6BC80];
      id v12 = [v7 _activityImage];
      [v18 _actionImageForActionRepresentationImage:v12 contentSizeCategory:v8 monochrome:0];
    }
    else
    {
      [v7 setContentSizeCategory:v8];
      id v12 = [v7 _actionImage];
      [v12 imageWithRenderingMode:2];
    id v14 = };
    goto LABEL_3;
  }
  id v14 = [v7 activityImage];
LABEL_6:

  return v14;
}

- (void)_handleIconImage:(id)a3 identifier:(id)a4 activityCategory:(int64_t)a5 contentSizeCategory:(id)a6 iconFormat:(int)a7 placeholder:(BOOL)a8 uti:(id)a9
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a9;
  id v18 = sharing_ui_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v14 CGImage];
    *(_DWORD *)buf = 138413314;
    uint64_t v20 = @"UTI";
    *(void *)&uint8_t buf[4] = v14;
    __int16 v32 = 2048;
    if (!v17) {
      uint64_t v20 = @"bundleIdentifier";
    }
    uint64_t v33 = v19;
    if (v17) {
      id v21 = v17;
    }
    else {
      id v21 = v15;
    }
    __int16 v34 = 2112;
    v35 = v20;
    __int16 v36 = 2112;
    id v37 = v21;
    __int16 v38 = 2048;
    int64_t v39 = a5;
    _os_log_impl(&dword_21DB23000, v18, OS_LOG_TYPE_DEFAULT, "handle icon image:%@ CGImage:%p %@:%@ activityCategory:%ld", buf, 0x34u);
  }

  uint64_t v22 = (void *)MEMORY[0x263F827E8];
  uint64_t v23 = [v14 CGImage];
  [v14 scale];
  id v24 = objc_msgSend(v22, "imageWithCGImage:scale:orientation:", v23, 0);
  if (!a5)
  {
    uint64_t v25 = sharing_ui_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_21DB23000, v25, OS_LOG_TYPE_DEFAULT, "render action image for image:%@", buf, 0xCu);
    }

    uint64_t v26 = [MEMORY[0x263F6BC80] _actionImageForActionRepresentationImage:v24 contentSizeCategory:v16];

    id v24 = [v26 imageWithRenderingMode:2];
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v29, (id *)buf);
  id v27 = v24;
  id v28 = v15;
  BOOL v30 = a8;
  sf_dispatch_on_main_queue();

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
}

void __121__SFUIActivityImageProvider__handleIconImage_identifier_activityCategory_contentSizeCategory_iconFormat_placeholder_uti___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained deliverImage:*(void *)(a1 + 32) identifier:*(void *)(a1 + 40) placeholder:*(unsigned __int8 *)(a1 + 56) error:0];
}

- (void)requestImageForBundleIdentifier:(os_log_t)log activityCategory:contentSizeCategory:userInterfaceStyle:iconFormat:synchronous:resultHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21DB23000, log, OS_LOG_TYPE_ERROR, "bundle identifier is nil.", v1, 2u);
}

- (void)requestImageForUTI:(os_log_t)log activityCategory:contentSizeCategory:userInterfaceStyle:iconFormat:synchronous:resultHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21DB23000, log, OS_LOG_TYPE_ERROR, "UTI is nil.", v1, 2u);
}

- (void)requestImageForActivity:(uint64_t)a1 contentSizeCategory:(NSObject *)a2 userInterfaceStyle:imageSymbolConfiguration:synchronous:resultHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21DB23000, a2, OS_LOG_TYPE_ERROR, "request activity image for non-activity object:%@", (uint8_t *)&v2, 0xCu);
}

- (void)_fetchImageForActivity:(os_log_t)log contentSizeCategory:userInterfaceStyle:imageSymbolConfiguration:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_21DB23000, log, OS_LOG_TYPE_DEBUG, "_fetchImageForActivity:%@ identifier:%@", (uint8_t *)&v3, 0x16u);
}

@end