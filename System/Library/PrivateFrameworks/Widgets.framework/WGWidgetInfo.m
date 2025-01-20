@interface WGWidgetInfo
+ (double)maximumContentHeightForCompactDisplayMode;
+ (id)_productVersion;
+ (id)widgetInfoWithExtension:(id)a3;
+ (void)_updateRowHeightForContentSizeCategory;
- (BOOL)isLinkedOnOrAfterSystemVersion:(id)a3;
- (BOOL)wantsVisibleFrame;
- (CGSize)preferredContentSize;
- (NSExtension)extension;
- (NSString)_sdkVersion;
- (NSString)displayName;
- (NSString)widgetIdentifier;
- (UIImage)_icon;
- (UIImage)_outlineIcon;
- (WGWidgetInfo)initWithExtension:(id)a3;
- (WGWidgetInfo)widgetInfoWithExtension:(id)a3;
- (double)initialHeight;
- (id)_queue_iconFromWidgetBundleForWidgetWithIdentifier:(id)a3 extension:(id)a4;
- (id)_queue_iconWithOutlineForWidgetWithIdentifier:(id)a3 extension:(id)a4;
- (id)_queue_iconWithSize:(CGSize)a3 scale:(double)a4 forWidgetWithIdentifier:(id)a5 extension:(id)a6;
- (int64_t)initialDisplayMode;
- (int64_t)largestAllowedDisplayMode;
- (void)_requestIcon:(BOOL)a3 withHandler:(id)a4;
- (void)_resetIcons;
- (void)_resetIconsImpl;
- (void)_setDisplayName:(id)a3;
- (void)_setIcon:(id)a3;
- (void)_setLargestAllowedDisplayMode:(int64_t)a3;
- (void)_setOutlineIcon:(id)a3;
- (void)_setWantsVisibleFrame:(BOOL)a3;
- (void)registerWidgetHost:(id)a3;
- (void)requestIconWithHandler:(id)a3;
- (void)requestSettingsIconWithHandler:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)updatePreferredContentSize:(CGSize)a3 forWidgetHost:(id)a4;
@end

@implementation WGWidgetInfo

+ (id)widgetInfoWithExtension:(id)a3
{
  id v4 = a3;
  if (+[WGCalendarWidgetInfo isCalendarExtension:v4]) {
    v5 = (objc_class *)WGCalendarWidgetInfo;
  }
  else {
    v5 = (objc_class *)a1;
  }
  v6 = (void *)[[v5 alloc] initWithExtension:v4];

  return v6;
}

+ (void)_updateRowHeightForContentSizeCategory
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WGWidgetRowHeightDidChangeNotification" object:0];
}

+ (double)maximumContentHeightForCompactDisplayMode
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 integerForKey:@"WGAzulWidgetsType"];

  if ((unint64_t)(v3 - 1) < 2) {
    return 200.0;
  }
  if (v3 == 3) {
    return 400.0;
  }
  double result = 0.0;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x263F146D0], "widgetRowHeight", 0.0);
    return v5 * 2.5;
  }
  return result;
}

+ (id)_productVersion
{
  if (_productVersion_onceToken != -1) {
    dispatch_once(&_productVersion_onceToken, &__block_literal_global_37);
  }
  id v2 = (void *)_productVersion___productVersion;
  return v2;
}

uint64_t __31__WGWidgetInfo__productVersion__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  uint64_t v1 = _productVersion___productVersion;
  _productVersion___productVersion = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (WGWidgetInfo)initWithExtension:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WGWidgetInfo;
  v6 = [(WGWidgetInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    v7->_largestAllowedDisplayMode = 1;
  }

  return v7;
}

- (WGWidgetInfo)widgetInfoWithExtension:(id)a3
{
  id v5 = a3;
  v6 = [v5 identifier];
  v7 = [(WGWidgetInfo *)self extension];
  v8 = [v7 identifier];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    objc_storeStrong((id *)&self->_extension, a3);
    displayName = self->_displayName;
    self->_displayName = 0;

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)widgetIdentifier
{
  return (NSString *)[(NSExtension *)self->_extension identifier];
}

- (NSString)displayName
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  displayName = self->_displayName;
  if (!displayName)
  {
    id v4 = self->_extension;
    id v5 = v4;
    if (v4)
    {
      v6 = [(NSExtension *)v4 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
      if (![v6 length])
      {
        v7 = (void *)WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          v8 = v7;
          int v9 = [(NSExtension *)v5 identifier];
          int v18 = 138543618;
          v19 = v9;
          __int16 v20 = 2114;
          v21 = @"CFBundleDisplayName";
          _os_log_impl(&dword_222E49000, v8, OS_LOG_TYPE_DEFAULT, "No display name found for identifier (%{public}@): specify a display name with the '%{public}@' key in the widget's Info.plist", (uint8_t *)&v18, 0x16u);
        }
      }
    }
    else
    {
      v6 = 0;
    }
    if (![v6 length])
    {
      v10 = (void *)MEMORY[0x263F01868];
      v11 = [(NSExtension *)v5 identifier];
      v12 = WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v11);
      v13 = [v10 applicationProxyForIdentifier:v12];

      uint64_t v14 = [v13 localizedName];

      v6 = (void *)v14;
    }
    if (![v6 length])
    {
      uint64_t v15 = [(NSExtension *)v5 identifier];

      v6 = (void *)v15;
    }

    v16 = self->_displayName;
    self->_displayName = (NSString *)v6;

    displayName = self->_displayName;
  }
  return displayName;
}

- (id)_queue_iconFromWidgetBundleForWidgetWithIdentifier:(id)a3 extension:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BSDispatchQueueAssertNotMain();
  if ([(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection] != 1) {
    goto LABEL_8;
  }
  v7 = [v6 objectForInfoDictionaryKey:@"CFBundleIconFilesRightToLeft"];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8) {
    id v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  id v12 = [v11 firstObject];

  if (!v12)
  {
LABEL_8:
    v13 = [v6 objectForInfoDictionaryKey:@"CFBundleIcons"];
    uint64_t v14 = objc_opt_class();
    id v15 = v13;
    if (v14)
    {
      if (objc_opt_isKindOfClass()) {
        v16 = v15;
      }
      else {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
    id v17 = v16;

    int v18 = [v17 objectForKey:@"CFBundlePrimaryIcon"];

    uint64_t v19 = objc_opt_class();
    id v20 = v18;
    if (v19)
    {
      if (objc_opt_isKindOfClass()) {
        v21 = v20;
      }
      else {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
    id v22 = v21;

    v23 = [v22 objectForKey:@"CFBundleIconName"];

    uint64_t v24 = objc_opt_class();
    id v25 = v23;
    if (v24)
    {
      if (objc_opt_isKindOfClass()) {
        v26 = v25;
      }
      else {
        v26 = 0;
      }
    }
    else
    {
      v26 = 0;
    }
    id v12 = v26;

    if (!v12)
    {
      v27 = [v6 objectForInfoDictionaryKey:@"CFBundleIconFiles"];
      uint64_t v28 = objc_opt_class();
      id v29 = v27;
      if (v28)
      {
        if (objc_opt_isKindOfClass()) {
          v30 = v29;
        }
        else {
          v30 = 0;
        }
      }
      else
      {
        v30 = 0;
      }
      id v31 = v30;

      id v12 = [v31 firstObject];
    }
  }
  if ([v12 length])
  {
    v32 = (void *)MEMORY[0x263F1C6B0];
    v33 = (void *)MEMORY[0x263F086E0];
    v34 = [MEMORY[0x263F018C0] pluginKitProxyForIdentifier:v5];
    v35 = [v34 bundleURL];
    v36 = [v33 bundleWithURL:v35];
    v37 = [v32 imageNamed:v12 inBundle:v36];
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (id)_queue_iconWithSize:(CGSize)a3 scale:(double)a4 forWidgetWithIdentifier:(id)a5 extension:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  v28[1] = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a6;
  BSDispatchQueueAssertNotMain();
  if ([v11 hasPrefix:@"com.apple."]
    && ([(WGWidgetInfo *)self _queue_iconFromWidgetBundleForWidgetWithIdentifier:v11 extension:v12], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v14 = (void *)v13;
    id v15 = objc_alloc(MEMORY[0x263F4B528]);
    id v16 = v14;
    uint64_t v17 = [v16 CGImage];
    [v16 scale];
    int v18 = objc_msgSend(v15, "initWithCGImage:scale:", v17);
    id v19 = objc_alloc(MEMORY[0x263F4B540]);
    v28[0] = v18;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
    v21 = (void *)[v19 initWithImages:v20];
  }
  else
  {
    id v16 = [MEMORY[0x263F018C0] pluginKitProxyForIdentifier:v11];
    v21 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithResourceProxy:v16];
  }

  id v22 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", width, height, a4);
  v23 = [v21 imageForImageDescriptor:v22];
  uint64_t v24 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v25 = [v23 CGImage];
  [v23 scale];
  v26 = objc_msgSend(v24, "imageWithCGImage:scale:orientation:", v25, 0);

  return v26;
}

- (id)_queue_iconWithOutlineForWidgetWithIdentifier:(id)a3 extension:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertNotMain();
  if ([v6 hasPrefix:@"com.apple."]
    && ([(WGWidgetInfo *)self _queue_iconFromWidgetBundleForWidgetWithIdentifier:v6 extension:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = (void *)v8;
    id v10 = objc_alloc(MEMORY[0x263F4B528]);
    id v11 = v9;
    uint64_t v12 = [v11 CGImage];
    [v11 scale];
    uint64_t v13 = objc_msgSend(v10, "initWithCGImage:scale:", v12);
    id v14 = objc_alloc(MEMORY[0x263F4B540]);
    v23[0] = v13;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    id v16 = (void *)[v14 initWithImages:v15];
  }
  else
  {
    id v11 = [MEMORY[0x263F018C0] pluginKitProxyForIdentifier:v6];
    id v16 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithResourceProxy:v11];
  }

  uint64_t v17 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B590]];
  [v17 setDrawBorder:1];
  int v18 = [v16 imageForImageDescriptor:v17];
  id v19 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v20 = [v18 CGImage];
  [v18 scale];
  v21 = objc_msgSend(v19, "imageWithCGImage:scale:orientation:", v20, 0);

  return v21;
}

- (void)_requestIcon:(BOOL)a3 withHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [(WGWidgetInfo *)self widgetIdentifier];
    uint64_t v8 = [(WGWidgetInfo *)self extension];
    objc_initWeak(&location, self);
    id v9 = dispatch_get_global_queue(25, 0);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__WGWidgetInfo__requestIcon_withHandler___block_invoke;
    v12[3] = &unk_264676B88;
    objc_copyWeak(&v16, &location);
    BOOL v17 = a3;
    id v13 = v7;
    id v14 = v8;
    id v15 = v6;
    id v10 = v8;
    id v11 = v7;
    dispatch_async(v9, v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __41__WGWidgetInfo__requestIcon_withHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B590]];
  uint64_t v3 = v2;
  if (*(unsigned char *)(a1 + 64))
  {
    [v2 size];
    double v5 = v4;
    double v7 = v6;
    [v3 scale];
    objc_msgSend(WeakRetained, "_queue_iconWithSize:scale:forWidgetWithIdentifier:extension:", *(void *)(a1 + 32), *(void *)(a1 + 40), v5, v7, v8);
  }
  else
  {
    objc_msgSend(WeakRetained, "_queue_iconWithOutlineForWidgetWithIdentifier:extension:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  id v9 = };
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)requestIconWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(WGWidgetInfo *)self _icon];
    if (v5)
    {
      double v6 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __39__WGWidgetInfo_requestIconWithHandler___block_invoke;
      block[3] = &unk_264676BB0;
      id v12 = v4;
      id v11 = v5;
      dispatch_async(v6, block);

      double v7 = v12;
    }
    else
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __39__WGWidgetInfo_requestIconWithHandler___block_invoke_2;
      v8[3] = &unk_264676BD8;
      v8[4] = self;
      id v9 = v4;
      [(WGWidgetInfo *)self _requestIcon:1 withHandler:v8];
      double v7 = v9;
    }
  }
}

uint64_t __39__WGWidgetInfo_requestIconWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __39__WGWidgetInfo_requestIconWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__WGWidgetInfo_requestIconWithHandler___block_invoke_3;
  block[3] = &unk_264676630;
  objc_copyWeak(&v7, &location);
  id v4 = v3;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __39__WGWidgetInfo_requestIconWithHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setIcon:*(void *)(a1 + 32)];
}

- (void)requestSettingsIconWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(WGWidgetInfo *)self _outlineIcon];
    if (v5)
    {
      id v6 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __47__WGWidgetInfo_requestSettingsIconWithHandler___block_invoke;
      block[3] = &unk_264676BB0;
      id v12 = v4;
      id v11 = v5;
      dispatch_async(v6, block);

      id v7 = v12;
    }
    else
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __47__WGWidgetInfo_requestSettingsIconWithHandler___block_invoke_2;
      v8[3] = &unk_264676BD8;
      v8[4] = self;
      id v9 = v4;
      [(WGWidgetInfo *)self _requestIcon:0 withHandler:v8];
      id v7 = v9;
    }
  }
}

uint64_t __47__WGWidgetInfo_requestSettingsIconWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __47__WGWidgetInfo_requestSettingsIconWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__WGWidgetInfo_requestSettingsIconWithHandler___block_invoke_3;
  block[3] = &unk_264676630;
  objc_copyWeak(&v7, &location);
  id v4 = v3;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __47__WGWidgetInfo_requestSettingsIconWithHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setOutlineIcon:*(void *)(a1 + 32)];
}

- (void)_resetIconsImpl
{
  BSDispatchQueueAssertMain();
  [(WGWidgetInfo *)self _setIcon:0];
  [(WGWidgetInfo *)self _setOutlineIcon:0];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"WGWidgetInfoIconDidInvalidateNotification" object:0];
}

- (void)_resetIcons
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __27__WGWidgetInfo__resetIcons__block_invoke;
  v2[3] = &unk_2646766F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __27__WGWidgetInfo__resetIcons__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetIconsImpl];
}

- (NSString)_sdkVersion
{
  sdkVersion = self->_sdkVersion;
  if (!sdkVersion)
  {
    id v4 = (void *)MEMORY[0x263F01868];
    double v5 = [(WGWidgetInfo *)self widgetIdentifier];
    id v6 = WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v5);
    id v7 = [v4 applicationProxyForIdentifier:v6];

    double v8 = [v7 sdkVersion];
    id v9 = (NSString *)[v8 copy];
    id v10 = self->_sdkVersion;
    self->_sdkVersion = v9;

    if (!self->_sdkVersion)
    {
      id v11 = [(WGWidgetInfo *)self widgetIdentifier];
      int v12 = [v11 hasPrefix:@"com.apple."];

      if (v12)
      {
        id v13 = [(id)objc_opt_class() _productVersion];
        id v14 = self->_sdkVersion;
        self->_sdkVersion = v13;
      }
    }

    sdkVersion = self->_sdkVersion;
  }
  return sdkVersion;
}

- (BOOL)isLinkedOnOrAfterSystemVersion:(id)a3
{
  id v4 = a3;
  double v5 = [(WGWidgetInfo *)self _sdkVersion];
  BOOL v6 = _WGIsSystemVersionSameOrAfterSystemVersion(v5, v4);

  return v6;
}

- (double)initialHeight
{
  id v2 = objc_opt_class();
  [v2 maximumContentHeightForCompactDisplayMode];
  return result;
}

- (BOOL)wantsVisibleFrame
{
  if ((*(unsigned char *)&self->_widgetInfoFlags & 1) == 0)
  {
    *(unsigned char *)&self->_widgetInfoFlags |= 1u;
    id v3 = [(WGWidgetInfo *)self widgetIdentifier];
    int v4 = [v3 hasPrefix:@"com.apple."];
    if (v4) {
      LOBYTE(v4) = _WGBoolValueForInfoDictionaryKey((uint64_t)v3, @"NCWidgetWantsVisibleFrame");
    }
    self->_wantsVisibleFrame = v4;
  }
  return self->_wantsVisibleFrame;
}

- (void)_setWantsVisibleFrame:(BOOL)a3
{
  char widgetInfoFlags = (char)self->_widgetInfoFlags;
  if (self->_wantsVisibleFrame != a3 || (widgetInfoFlags & 1) == 0)
  {
    *(unsigned char *)&self->_char widgetInfoFlags = widgetInfoFlags | 1;
    self->_wantsVisibleFrame = a3;
  }
}

- (void)registerWidgetHost:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    registeredWidgetHosts = self->_registeredWidgetHosts;
    id v9 = v5;
    if (!registeredWidgetHosts)
    {
      id v7 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
      double v8 = self->_registeredWidgetHosts;
      self->_registeredWidgetHosts = v7;

      registeredWidgetHosts = self->_registeredWidgetHosts;
    }
    [(NSPointerArray *)registeredWidgetHosts addPointer:v9];
    [(WGWidgetInfo *)self preferredContentSize];
    id v4 = (id)objc_msgSend(v9, "setPreferredContentSize:");
    id v5 = v9;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)updatePreferredContentSize:(CGSize)a3 forWidgetHost:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  double v8 = [v7 widgetInfo];

  if (v8 == self)
  {
    [(WGWidgetInfo *)self preferredContentSize];
    double v10 = v9;
    double v12 = v11;
    -[WGWidgetInfo setPreferredContentSize:](self, "setPreferredContentSize:", width, height);
    if (v10 != width || v12 != height)
    {
      [(NSPointerArray *)self->_registeredWidgetHosts compact];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v13 = self->_registeredWidgetHosts;
      uint64_t v14 = [(NSPointerArray *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v20;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(id *)(*((void *)&v19 + 1) + 8 * v17);
            if (v18 != v7) {
              objc_msgSend(v18, "setPreferredContentSize:", width, height, (void)v19);
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [(NSPointerArray *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v15);
      }
    }
  }
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)_setDisplayName:(id)a3
{
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (int64_t)initialDisplayMode
{
  return self->_initialDisplayMode;
}

- (int64_t)largestAllowedDisplayMode
{
  return self->_largestAllowedDisplayMode;
}

- (void)_setLargestAllowedDisplayMode:(int64_t)a3
{
  self->_largestAllowedDisplayMode = a3;
}

- (UIImage)_icon
{
  return self->_icon;
}

- (void)_setIcon:(id)a3
{
}

- (UIImage)_outlineIcon
{
  return self->_outlineIcon;
}

- (void)_setOutlineIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlineIcon, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_registeredWidgetHosts, 0);
}

@end