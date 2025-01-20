@interface WFImageCache
+ (id)sharedImageCache;
- (BOOL)_isUIKitImageName:(id)a3;
- (NSMutableDictionary)imageCache;
- (WFImageCache)init;
- (id)imageNamed:(id)a3;
- (id)imageNamed:(id)a3 variableValue:(double)a4;
- (void)clearCache;
- (void)setImageCache:(id)a3;
@end

@implementation WFImageCache

+ (id)sharedImageCache
{
  if (sharedImageCache_onceToken != -1) {
    dispatch_once(&sharedImageCache_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_sharedImageCache;
  return v2;
}

uint64_t __32__WFImageCache_sharedImageCache__block_invoke()
{
  v0 = objc_alloc_init(WFImageCache);
  uint64_t v1 = _sharedImageCache;
  _sharedImageCache = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (WFImageCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFImageCache;
  v2 = [(WFImageCache *)&v6 init];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  imageCache = v2->_imageCache;
  v2->_imageCache = v3;

  return v2;
}

- (void)clearCache
{
}

- (id)imageNamed:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v4 = (__CFString *)a3;
  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_imageCache objectForKey:v4];
    if (v5) {
      goto LABEL_9;
    }
    objc_super v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.framework.WiFiKitUI"];
    if (!v6)
    {
      v18 = WFLogForCategory(0);
      os_log_type_t v23 = OSLogForWFLogLevel(1uLL);
      if (!WFCurrentLogLevel() || !v18 || !os_log_type_enabled(v18, v23)) {
        goto LABEL_32;
      }
      int v24 = 138412290;
      v25 = @"com.apple.framework.WiFiKitUI";
      v20 = "Unable to get bundle for %@";
      v21 = v18;
      os_log_type_t v22 = v23;
      goto LABEL_31;
    }
    if ([(WFImageCache *)self _isUIKitImageName:v4])
    {
      uint64_t v7 = [MEMORY[0x263F827E8] kitImageNamed:v4];
      goto LABEL_6;
    }
    if ([(__CFString *)v4 isEqualToString:@"checkmark"])
    {
      v9 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
      v10 = [v9 fontDescriptorWithSymbolicTraits:2];

      v11 = [MEMORY[0x263F81708] fontWithDescriptor:v10 size:0.0];
      v12 = [MEMORY[0x263F82818] configurationWithFont:v11 scale:2];
      v13 = (void *)MEMORY[0x263F827E8];
      v14 = @"checkmark";
    }
    else if ([(__CFString *)v4 isEqualToString:@"Lock"])
    {
      v15 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
      v10 = [v15 fontDescriptorWithSymbolicTraits:2];

      v11 = [MEMORY[0x263F81708] fontWithDescriptor:v10 size:0.0];
      v12 = [MEMORY[0x263F82818] configurationWithFont:v11 scale:1];
      v13 = (void *)MEMORY[0x263F827E8];
      v14 = @"lock.fill";
    }
    else if ([(__CFString *)v4 isEqualToString:@"Personal_Hotspot"])
    {
      v16 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
      v10 = [v16 fontDescriptorWithSymbolicTraits:2];

      v11 = [MEMORY[0x263F81708] fontWithDescriptor:v10 size:0.0];
      v12 = [MEMORY[0x263F82818] configurationWithFont:v11 scale:1];
      v13 = (void *)MEMORY[0x263F827E8];
      v14 = @"personalhotspot";
    }
    else
    {
      if (![(__CFString *)v4 isEqualToString:@"WiFiBarsError"])
      {
        uint64_t v7 = [MEMORY[0x263F827E8] imageNamed:v4 inBundle:v6 compatibleWithTraitCollection:0];
LABEL_6:
        v5 = (void *)v7;
        if (v7)
        {
LABEL_7:
          [(NSMutableDictionary *)self->_imageCache setObject:v5 forKey:v4];
LABEL_8:

          goto LABEL_9;
        }
        goto LABEL_21;
      }
      v17 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
      v10 = [v17 fontDescriptorWithSymbolicTraits:2];

      v11 = [MEMORY[0x263F81708] fontWithDescriptor:v10 size:0.0];
      v12 = [MEMORY[0x263F82818] configurationWithFont:v11 scale:1];
      v13 = (void *)MEMORY[0x263F827E8];
      v14 = @"wifi.exclamationmark";
    }
    v5 = [v13 systemImageNamed:v14 withConfiguration:v12];

    if (v5) {
      goto LABEL_7;
    }
LABEL_21:
    v18 = WFLogForCategory(0);
    os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v18 || !os_log_type_enabled(v18, v19)) {
      goto LABEL_32;
    }
    int v24 = 138412290;
    v25 = v4;
    v20 = "Unable to get image named %@";
    v21 = v18;
    os_log_type_t v22 = v19;
LABEL_31:
    _os_log_impl(&dword_2257EC000, v21, v22, v20, (uint8_t *)&v24, 0xCu);
LABEL_32:

    v5 = 0;
    goto LABEL_8;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

- (id)imageNamed:(id)a3 variableValue:(double)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@-%f", v6, *(void *)&a4];
    uint64_t v8 = [(WFImageCache *)self imageNamed:v7];
    if (v8)
    {
      v9 = (void *)v8;
      goto LABEL_14;
    }
    if (([v6 isEqualToString:@"wifi"] & 1) != 0
      || [v6 isEqualToString:@"cellularbars"])
    {
      v10 = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_60];
      v11 = [MEMORY[0x263F82818] configurationWithHierarchicalColor:v10];
      v12 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
      v13 = [v12 fontDescriptorWithSymbolicTraits:2];

      v14 = [MEMORY[0x263F81708] fontWithDescriptor:v13 size:0.0];
      v15 = [MEMORY[0x263F82818] configurationWithFont:v14 scale:1];
      v16 = [v11 configurationByApplyingConfiguration:v15];
      v9 = [MEMORY[0x263F827E8] systemImageNamed:v6 variableValue:v16 withConfiguration:a4];

      if (v9)
      {
        [(NSMutableDictionary *)self->_imageCache setObject:v9 forKey:v7];
        goto LABEL_14;
      }
    }
    v17 = WFLogForCategory(0);
    os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_2257EC000, v17, v18, "Unable to get image named %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  v9 = 0;
LABEL_14:

  return v9;
}

id __41__WFImageCache_imageNamed_variableValue___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] systemWhiteColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] systemBlackColor];
  }
  return v2;
}

- (BOOL)_isUIKitImageName:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = a3;
  v5 = objc_msgSend(v3, "setWithObjects:", @"LockScreen_0_Bars", @"LockScreen_1_Bars", @"LockScreen_2_Bars", @"LockScreen_3_Bars", @"LockScreen_4_Bars", 0);
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSMutableDictionary)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end