@interface TVInterfaceFactory
+ (id)_URLForResource:(id)a3 bundle:(id)a4;
+ (id)_tvmlResourceMap;
+ (id)sharedInterfaceFactory;
+ (void)initialize;
- (Class)_collectionViewCellClassForElement:(id)a3;
- (Class)_extendedCollectionViewCellClassForIKElement:(id)a3;
- (Class)collectionViewCellClassForElement:(id)a3;
- (TVInterfaceCreating)extendedInterfaceCreator;
- (TVInterfaceFactory)init;
- (TVStyleSheetRegistry)styleSheetRegistry;
- (id)URLForResource:(id)a3;
- (id)_controllerTransitionFromElement:(id)a3 toElement:(id)a4 forNavigationControllerOperation:(int64_t)a5 relativeToFrom:(BOOL)a6;
- (id)_getImageFromURLorBundle:(id)a3;
- (id)_imageProxyForResourceURL:(id)a3 scaleToSize:(CGSize)a4;
- (id)_imageProxyForSymbolURL:(id)a3 imageSymbolConfiguration:(id)a4 scaleToSize:(CGSize)a5;
- (id)_imageProxyFromElement:(id)a3;
- (id)_imageProxyFromElement:(id)a3 withLayout:(id)a4;
- (id)_navigationControllerForTabIdentifier:(id)a3;
- (id)_resourceImageNamed:(id)a3;
- (id)_styleSheetURLForTemplate:(id)a3;
- (id)_viewControllerFromElement:(id)a3 existingController:(id)a4;
- (id)_viewControllerFromElement:(id)a3 layout:(id)a4 existingController:(id)a5;
- (id)_viewFromElement:(id)a3 existingView:(id)a4;
- (id)_viewFromElement:(id)a3 layout:(id)a4 existingView:(id)a5;
- (id)imageForResource:(id)a3;
- (id)playerViewControllerForPlayer:(id)a3;
- (id)viewControllerForElement:(id)a3 existingViewController:(id)a4;
- (id)viewForElement:(id)a3 existingView:(id)a4;
- (void)_darkerSystemColorStatusChanged:(id)a3;
- (void)_registerControllerTransitioningCreator:(id)a3 withType:(unint64_t)a4;
- (void)_registerProductTemplateURL:(id)a3 forTemplateName:(id)a4 includeParentStyleSheets:(BOOL)a5;
- (void)_registerViewControllerCreator:(id)a3 withType:(unint64_t)a4;
- (void)_registerViewControllerCreatorEx:(id)a3 withType:(unint64_t)a4;
- (void)_registerViewCreator:(id)a3 withType:(unint64_t)a4;
- (void)_registerViewCreatorEx:(id)a3 withType:(unint64_t)a4;
- (void)_willParseAppDocument:(id)a3 forImplicitUpdates:(BOOL)a4;
- (void)dealloc;
- (void)setExtendedInterfaceCreator:(id)a3;
- (void)setup;
@end

@implementation TVInterfaceFactory

uint64_t __44__TVInterfaceFactory_sharedInterfaceFactory__block_invoke()
{
  sharedInterfaceFactory_sSharedInstance = objc_alloc_init(TVInterfaceFactory);
  return MEMORY[0x270F9A758]();
}

- (TVInterfaceFactory)init
{
  v10.receiver = self;
  v10.super_class = (Class)TVInterfaceFactory;
  v2 = [(TVInterfaceFactory *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    viewCreatorsByKey = v2->_viewCreatorsByKey;
    v2->_viewCreatorsByKey = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    viewControllerCreatorsByKey = v2->_viewControllerCreatorsByKey;
    v2->_viewControllerCreatorsByKey = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    controllerTransitionCreatorsByKey = v2->_controllerTransitionCreatorsByKey;
    v2->_controllerTransitionCreatorsByKey = v7;
  }
  return v2;
}

- (void)setExtendedInterfaceCreator:(id)a3
{
  v5 = (TVInterfaceCreating *)a3;
  uint64_t p_extendedInterfaceCreator = (uint64_t)&self->_extendedInterfaceCreator;
  if (self->_extendedInterfaceCreator != v5)
  {
    v23 = v5;
    objc_storeStrong((id *)p_extendedInterfaceCreator, a3);
    *(_WORD *)&self->___int16 extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 2;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->___int16 extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFFFD | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 4;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->___int16 extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFFFB | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 8;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->___int16 extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFFF7 | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 16;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->___int16 extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFFEF | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 32;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->___int16 extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFFDF | v11;
    int v12 = [(TVInterfaceCreating *)v23 conformsToProtocol:&unk_26E6020F8];
    __int16 v13 = 0;
    if (v12)
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v13 = 64;
      }
      else {
        __int16 v13 = 0;
      }
    }
    *(_WORD *)&self->___int16 extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFFBF | v13;
    if ([(TVInterfaceCreating *)v23 conformsToProtocol:&unk_26E6020F8])
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v14 = 128;
      }
      else {
        __int16 v14 = 0;
      }
    }
    else
    {
      __int16 v14 = 0;
    }
    *(_WORD *)&self->___int16 extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFF7F | v14;
    if ([(TVInterfaceCreating *)v23 conformsToProtocol:&unk_26E6020F8])
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v15 = 1024;
      }
      else {
        __int16 v15 = 0;
      }
    }
    else
    {
      __int16 v15 = 0;
    }
    *(_WORD *)&self->___int16 extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFBFF | v15;
    if ([(TVInterfaceCreating *)v23 conformsToProtocol:&unk_26E6020F8])
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v16 = 256;
      }
      else {
        __int16 v16 = 0;
      }
    }
    else
    {
      __int16 v16 = 0;
    }
    *(_WORD *)&self->___int16 extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFEFF | v16;
    if ([(TVInterfaceCreating *)v23 conformsToProtocol:&unk_26E6020F8])
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v17 = 2048;
      }
      else {
        __int16 v17 = 0;
      }
    }
    else
    {
      __int16 v17 = 0;
    }
    *(_WORD *)&self->___int16 extenderFlags = *(_WORD *)&self->_extenderFlags & 0xF7FF | v17;
    if ([(TVInterfaceCreating *)v23 conformsToProtocol:&unk_26E6020F8])
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v18 = 512;
      }
      else {
        __int16 v18 = 0;
      }
    }
    else
    {
      __int16 v18 = 0;
    }
    *(_WORD *)&self->___int16 extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFDFF | v18;
    if ([(TVInterfaceCreating *)v23 conformsToProtocol:&unk_26E6020F8])
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v19 = 4096;
      }
      else {
        __int16 v19 = 0;
      }
    }
    else
    {
      __int16 v19 = 0;
    }
    *(_WORD *)&self->___int16 extenderFlags = *(_WORD *)&self->_extenderFlags & 0xEFFF | v19;
    if ([(TVInterfaceCreating *)v23 conformsToProtocol:&unk_26E6020F8])
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v20 = 0x4000;
      }
      else {
        __int16 v20 = 0;
      }
    }
    else
    {
      __int16 v20 = 0;
    }
    __int16 extenderFlags = (__int16)self->_extenderFlags;
    *(_WORD *)&self->___int16 extenderFlags = extenderFlags & 0xBFFF | v20;
    uint64_t p_extendedInterfaceCreator = [(TVInterfaceCreating *)v23 conformsToProtocol:&unk_26E6020F8];
    if (p_extendedInterfaceCreator)
    {
      uint64_t p_extendedInterfaceCreator = objc_opt_respondsToSelector();
      if (p_extendedInterfaceCreator) {
        int v22 = 0x2000;
      }
      else {
        int v22 = 0;
      }
    }
    else
    {
      int v22 = 0;
    }
    *(_WORD *)&self->___int16 extenderFlags = *(_WORD *)&self->_extenderFlags & 0xDFFF | v22;
    v5 = v23;
    if (v22 | extenderFlags & 0x2000)
    {
      uint64_t p_extendedInterfaceCreator = [(TVStyleSheetRegistry *)self->_styleSheetRegistry commitStyleSheets];
      v5 = v23;
    }
  }
  MEMORY[0x270F9A758](p_extendedInterfaceCreator, v5);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[TVInterfaceFactory sharedInterfaceFactory];
    [v2 setup];
  }
}

- (void)setup
{
  v3 = objc_alloc_init(TVMLViewFactory);
  viewFactory = self->_viewFactory;
  self->_viewFactory = v3;

  v5 = objc_alloc_init(_TVLockupFactory);
  lockupFactory = self->_lockupFactory;
  self->_lockupFactory = v5;

  __int16 v7 = objc_alloc_init(_TVControllerFactory);
  controllerFactory = self->_controllerFactory;
  self->_controllerFactory = v7;

  __int16 v9 = objc_alloc_init(_TVTemplateFactory);
  templateFactory = self->_templateFactory;
  self->_templateFactory = v9;

  __int16 v11 = objc_alloc_init(TVStyleSheetRegistry);
  styleSheetRegistry = self->_styleSheetRegistry;
  self->_styleSheetRegistry = v11;

  v34 = NSDictionary;
  v31 = [MEMORY[0x263F1C550] systemTealColor];
  v30 = [MEMORY[0x263F1C550] systemGrayColor];
  v29 = [MEMORY[0x263F1C550] systemMidGrayColor];
  v28 = objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor");
  v32 = objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor");
  v27 = [v32 colorWithAlphaComponent:0.8];
  v38 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.37254902 blue:0.411764706 alpha:1.0];
  v26 = [MEMORY[0x263F1C550] colorWithRed:0.921568627 green:0.0431372549 blue:0.333333333 alpha:1.0];
  v25 = [MEMORY[0x263F1C550] colorWithRed:0.968627451 green:0.568627451 blue:0.282352941 alpha:1.0];
  v24 = [MEMORY[0x263F1C550] colorWithRed:0.968627451 green:0.709803922 blue:0.11372549 alpha:1.0];
  v37 = [MEMORY[0x263F1C550] colorWithRed:0.905882353 green:0.788235294 blue:0.243137255 alpha:1.0];
  v36 = [MEMORY[0x263F1C550] colorWithRed:0.823529412 green:0.839215686 blue:0.352941176 alpha:1.0];
  v33 = [MEMORY[0x263F1C550] colorWithRed:0.603921569 green:0.819607843 blue:0.356862745 alpha:1.0];
  v23 = [MEMORY[0x263F1C550] colorWithRed:0.419607843 green:0.796078431 blue:0.403921569 alpha:1.0];
  int v22 = [MEMORY[0x263F1C550] colorWithRed:0.368627451 green:0.776470588 blue:0.541176471 alpha:1.0];
  v21 = [MEMORY[0x263F1C550] colorWithRed:0.360784314 green:0.749019608 blue:0.725490196 alpha:1.0];
  __int16 v20 = [MEMORY[0x263F1C550] colorWithRed:0.196078431 green:0.694117647 blue:0.780392157 alpha:1.0];
  __int16 v19 = [MEMORY[0x263F1C550] colorWithRed:0.298039216 green:0.678431373 blue:0.878431373 alpha:1.0];
  __int16 v18 = [MEMORY[0x263F1C550] colorWithRed:0.423529412 green:0.705882353 blue:1.0 alpha:1.0];
  __int16 v17 = [MEMORY[0x263F1C550] colorWithRed:0.552941176 green:0.596078431 blue:1.0 alpha:1.0];
  __int16 v16 = [MEMORY[0x263F1C550] colorWithRed:0.674509804 green:0.541176471 blue:1.0 alpha:1.0];
  __int16 v13 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.384313725 blue:0.698039216 alpha:1.0];
  __int16 v14 = [MEMORY[0x263F1C550] colorWithRed:0.929411765 green:0.4 blue:0.509803922 alpha:1.0];
  objc_msgSend(v34, "dictionaryWithObjectsAndKeys:", v31, @"systemteal", v30, @"systemgray", v29, @"systemmidgray", v28, @"keyblue", v27, @"keyblue-highlighted", v38, @"orange1", v26, @"orange2", v25, @"orange3", v24,
    @"yellow1",
    v37,
    @"yellow2",
    v36,
    @"yellow3",
    v33,
    @"green1",
    v23,
    @"green2",
    v22,
    @"green3",
    v21,
    @"blue1",
    v20,
    @"blue2",
    v19,
    @"blue3",
    v18,
    @"blue4",
    v17,
    @"purple1",
    v16,
    @"purple2",
    v13,
    @"pink",
    v14,
    @"coral",
  v35 = 0);

  [MEMORY[0x263F4B418] registerColorNameMap:v35];
  __int16 v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 addObserver:self selector:sel__darkerSystemColorStatusChanged_ name:*MEMORY[0x263F1CDF0] object:0];
}

- (void)_registerViewControllerCreator:(id)a3 withType:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__TVInterfaceFactory__registerViewControllerCreator_withType___block_invoke;
  v8[3] = &unk_264BA7DF0;
  id v9 = v6;
  id v7 = v6;
  [(TVInterfaceFactory *)self _registerViewControllerCreatorEx:v8 withType:a4];
}

+ (id)sharedInterfaceFactory
{
  if (sharedInterfaceFactory_onceToken != -1) {
    dispatch_once(&sharedInterfaceFactory_onceToken, &__block_literal_global_30);
  }
  id v2 = (void *)sharedInterfaceFactory_sSharedInstance;
  return v2;
}

- (void)_registerViewCreator:(id)a3 withType:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__TVInterfaceFactory__registerViewCreator_withType___block_invoke;
  v8[3] = &unk_264BA7DC8;
  id v9 = v6;
  id v7 = v6;
  [(TVInterfaceFactory *)self _registerViewCreatorEx:v8 withType:a4];
}

- (void)_registerViewControllerCreatorEx:(id)a3 withType:(unint64_t)a4
{
  if (a3)
  {
    id v8 = (id)[a3 copy];
    viewControllerCreatorsByKey = self->_viewControllerCreatorsByKey;
    id v7 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)viewControllerCreatorsByKey setObject:v8 forKeyedSubscript:v7];
  }
}

- (void)_registerViewCreatorEx:(id)a3 withType:(unint64_t)a4
{
  if (a3)
  {
    id v8 = (id)[a3 copy];
    viewCreatorsByKey = self->_viewCreatorsByKey;
    id v7 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)viewCreatorsByKey setObject:v8 forKeyedSubscript:v7];
  }
}

- (id)_styleSheetURLForTemplate:(id)a3
{
  if ((*(_WORD *)&self->_extenderFlags & 0x2000) != 0)
  {
    id v5 = a3;
    id v6 = [(TVInterfaceFactory *)self extendedInterfaceCreator];
    v3 = [v6 _styleSheetURLForTemplate:v5];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVInterfaceFactory;
  [(TVInterfaceFactory *)&v4 dealloc];
}

- (void)_darkerSystemColorStatusChanged:(id)a3
{
  v3 = NSDictionary;
  objc_super v4 = objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor", a3);
  id v5 = objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor");
  id v6 = [v5 colorWithAlphaComponent:0.8];
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, @"keyblue", v6, @"keyblue-highlighted", 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x263F4B418] registerColorNameMap:v7];
}

- (id)viewForElement:(id)a3 existingView:(id)a4
{
  id v6 = a4;
  id v7 = [a3 element];
  id v8 = [(TVInterfaceFactory *)self _viewFromElement:v7 existingView:v6];

  return v8;
}

- (id)viewControllerForElement:(id)a3 existingViewController:(id)a4
{
  id v6 = a4;
  id v7 = [a3 element];
  id v8 = [(TVInterfaceFactory *)self _viewControllerFromElement:v7 existingController:v6];

  return v8;
}

- (id)URLForResource:(id)a3
{
  id v4 = a3;
  if ((*(_WORD *)&self->_extenderFlags & 4) == 0
    || ([(TVInterfaceFactory *)self extendedInterfaceCreator],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 URLForResource:v4],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        _TVMLMetricsLogPublicAPIUsage(sel_URLForResource_),
        !v6))
  {
    id v7 = +[TVInterfaceFactory _tvmlResourceMap];
    uint64_t v8 = [v7 objectForKeyedSubscript:v4];
    id v9 = (void *)v8;
    if (v8) {
      __int16 v10 = (void *)v8;
    }
    else {
      __int16 v10 = v4;
    }
    id v11 = v10;

    int v12 = +[TVMLUtilities TVMLKitBundle];
    id v6 = +[TVInterfaceFactory _URLForResource:v11 bundle:v12];

    if (!v6)
    {
      __int16 v13 = +[TVMLUtilities TVUIKitBundle];
      id v6 = +[TVInterfaceFactory _URLForResource:v4 bundle:v13];

      if (!v6)
      {
        __int16 v14 = [MEMORY[0x263F086E0] mainBundle];
        id v6 = +[TVInterfaceFactory _URLForResource:v4 bundle:v14];
      }
    }
  }
  return v6;
}

- (id)imageForResource:(id)a3
{
  id v4 = a3;
  if ((*(_WORD *)&self->_extenderFlags & 8) == 0
    || ([(TVInterfaceFactory *)self extendedInterfaceCreator],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 imageForResource:v4],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        _TVMLMetricsLogPublicAPIUsage(sel_imageForResource_),
        !v6))
  {
    id v6 = [(TVInterfaceFactory *)self _getImageFromURLorBundle:v4];
    if (!v6)
    {
      id v6 = [MEMORY[0x263F1C6B0] systemImageNamed:v4];
    }
  }

  return v6;
}

- (Class)collectionViewCellClassForElement:(id)a3
{
  id v4 = [a3 element];
  id v5 = [(TVInterfaceFactory *)self _collectionViewCellClassForElement:v4];

  return (Class)v5;
}

- (id)playerViewControllerForPlayer:(id)a3
{
  if ((*(_WORD *)&self->_extenderFlags & 0x20) != 0)
  {
    id v5 = a3;
    _TVMLMetricsLogPublicAPIUsage(sel_playerViewControllerForPlayer_);
    id v6 = [(TVInterfaceFactory *)self extendedInterfaceCreator];
    v3 = [v6 playerViewControllerForPlayer:v5];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __52__TVInterfaceFactory__registerViewCreator_withType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (objc_msgSend(v5, "tv_elementType") == 33)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    if (v6)
    {
      objc_msgSend(v7, "tv_setLayout:", v6);
      goto LABEL_7;
    }
    uint64_t v8 = objc_opt_new();
  }
  else
  {
    uint64_t v8 = [(objc_class *)+[TVViewLayout layoutClassForElement:v5] layoutWithLayout:v6 element:v5];
  }
  id v9 = (void *)v8;
  objc_msgSend(v7, "tv_setLayout:", v8);

LABEL_7:
  return v7;
}

uint64_t __62__TVInterfaceFactory__registerViewControllerCreator_withType___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_registerProductTemplateURL:(id)a3 forTemplateName:(id)a4 includeParentStyleSheets:(BOOL)a5
{
}

- (id)_viewFromElement:(id)a3 existingView:(id)a4
{
  return [(TVInterfaceFactory *)self _viewFromElement:a3 layout:0 existingView:a4];
}

- (id)_viewFromElement:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    __int16 v14 = 0;
    goto LABEL_28;
  }
  __int16 extenderFlags = (__int16)self->_extenderFlags;
  if ((extenderFlags & 0x40) == 0)
  {
    if (extenderFlags)
    {
      int v12 = [(TVInterfaceFactory *)self extendedInterfaceCreator];
      __int16 v13 = objc_msgSend(v8, "tv_associatedViewElement");
      __int16 v14 = [v12 viewForElement:v13 existingView:v10];

      __int16 v15 = [(objc_class *)+[TVViewLayout layoutClassForElement:v8] layoutWithLayout:v9 element:v8];
      objc_msgSend(v14, "tv_setLayout:", v15);

      _TVMLMetricsLogPublicAPIUsage(sel_viewForElement_existingView_);
      if (v14) {
        goto LABEL_20;
      }
    }
LABEL_8:
    viewCreatorsByKey = self->_viewCreatorsByKey;
    __int16 v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "tv_elementType"));
    __int16 v20 = [(NSMutableDictionary *)viewCreatorsByKey objectForKeyedSubscript:v19];

    if (v20) {
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = &unk_26E59E380;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_31:
        __int16 v14 = 0;
        goto LABEL_20;
      }
      v21 = &unk_26E59E398;
    }
    __int16 v20 = [(NSMutableDictionary *)self->_viewCreatorsByKey objectForKeyedSubscript:v21];
    if (v20)
    {
LABEL_14:
      uint64_t v22 = objc_msgSend(v10, "tv_associatedIKViewElement");
      v23 = (void *)v22;
      if (v10
        && (id)v22 == v8
        && ![v8 updateType]
        && ([v8 objectForKeyedSubscript:@"TVForceUpdate"],
            v24 = objc_claimAutoreleasedReturnValue(),
            char v25 = [v24 BOOLValue],
            v24,
            (v25 & 1) == 0))
      {
        id v26 = v10;
      }
      else
      {
        ((void (**)(void, id, id, id))v20)[2](v20, v8, v9, v10);
        id v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      __int16 v14 = v26;

      goto LABEL_20;
    }
    goto LABEL_31;
  }
  __int16 v16 = [(TVInterfaceFactory *)self extendedInterfaceCreator];
  __int16 v14 = [v16 _viewForIKElement:v8 existingView:v10];

  __int16 v17 = [(objc_class *)+[TVViewLayout layoutClassForElement:v8] layoutWithLayout:v9 element:v8];
  objc_msgSend(v14, "tv_setLayout:", v17);

  if (!v14) {
    goto LABEL_8;
  }
LABEL_20:
  [v14 _transferAttributesFromElement:v8];
  v27 = [v8 attributes];
  v28 = [v27 objectForKeyedSubscript:@"accessibilityText"];

  if ([v28 length]) {
    objc_msgSend(v14, "tv_setAccessibilityText:", v28);
  }
  v29 = [v8 attributes];
  v30 = [v29 objectForKeyedSubscript:@"data-siri"];
  objc_msgSend(v14, "tv_setSiriData:", v30);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = [v8 appDocument];
    v32 = [v31 templateElement];
    uint64_t v33 = objc_msgSend(v32, "tv_elementType");

    if (v33 == 71) {
      objc_msgSend(v14, "tv_disableAnimation:forProperty:", 1, @"position");
    }
  }
  objc_msgSend(v14, "tv_setAssociatedIKViewElement:", v8);
  v34 = [v8 style];
  v35 = objc_msgSend(v34, "tv_layerFlipMode");

  uint64_t v36 = [v35 isEqualToString:@"horizontal"];
  if (v35)
  {
    uint64_t v37 = v36;
    v38 = [v14 layer];
    [v38 setFlipsHorizontalAxis:v37];
  }
  objc_msgSend(v8, "tv_setProxyView:", v14);
  [v8 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"TVForceUpdate"];
  v39 = [v8 elementName];
  _TVMLMetricsLogElementUsage();

LABEL_28:
  return v14;
}

- (id)_viewControllerFromElement:(id)a3 existingController:(id)a4
{
  return [(TVInterfaceFactory *)self _viewControllerFromElement:a3 layout:0 existingController:a4];
}

- (id)_viewControllerFromElement:(id)a3 layout:(id)a4 existingController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    __int16 v14 = 0;
    goto LABEL_18;
  }
  __int16 extenderFlags = (__int16)self->_extenderFlags;
  if ((extenderFlags & 0x80) != 0)
  {
    __int16 v15 = [(TVInterfaceFactory *)self extendedInterfaceCreator];
    __int16 v14 = [v15 _viewControllerForIKElement:v8 existingViewController:v10];

    if (!v14)
    {
LABEL_8:
      viewControllerCreatorsByKey = self->_viewControllerCreatorsByKey;
      __int16 v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "tv_elementType"));
      __int16 v18 = [(NSMutableDictionary *)viewControllerCreatorsByKey objectForKeyedSubscript:v17];

      if (v18)
      {
        uint64_t v19 = objc_msgSend(v10, "tv_associatedIKViewElement");
        __int16 v20 = (void *)v19;
        if (v10
          && (id)v19 == v8
          && ![v8 updateType]
          && ([v8 objectForKeyedSubscript:@"TVForceUpdate"],
              v21 = objc_claimAutoreleasedReturnValue(),
              char v22 = [v21 BOOLValue],
              v21,
              (v22 & 1) == 0))
        {
          id v23 = v10;
        }
        else
        {
          ((void (**)(void, id, id, id))v18)[2](v18, v8, v9, v10);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        __int16 v14 = v23;
      }
      else
      {
        __int16 v14 = 0;
      }
    }
  }
  else
  {
    if ((extenderFlags & 2) == 0) {
      goto LABEL_8;
    }
    int v12 = [(TVInterfaceFactory *)self extendedInterfaceCreator];
    __int16 v13 = objc_msgSend(v8, "tv_associatedViewElement");
    __int16 v14 = [v12 viewControllerForElement:v13 existingViewController:v10];

    _TVMLMetricsLogPublicAPIUsage(sel_viewControllerForElement_existingViewController_);
    if (!v14) {
      goto LABEL_8;
    }
  }
  objc_msgSend(v14, "tv_setAssociatedIKViewElement:", v8);
  objc_msgSend(v8, "tv_setProxyView:", v14);
  [v8 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"TVForceUpdate"];
  v24 = [v8 elementName];
  _TVMLMetricsLogElementUsage();

LABEL_18:
  return v14;
}

- (Class)_extendedCollectionViewCellClassForIKElement:(id)a3
{
  id v4 = a3;
  __int16 extenderFlags = (__int16)self->_extenderFlags;
  if ((extenderFlags & 0x100) != 0)
  {
    id v7 = [(TVInterfaceFactory *)self extendedInterfaceCreator];
    id v6 = [v7 _collectionViewCellClassForIKElement:v4];
  }
  else
  {
    if ((extenderFlags & 0x10) == 0)
    {
      id v6 = 0;
      goto LABEL_7;
    }
    _TVMLMetricsLogPublicAPIUsage(sel_collectionViewCellClassForElement_);
    id v7 = [(TVInterfaceFactory *)self extendedInterfaceCreator];
    id v8 = objc_msgSend(v4, "tv_associatedViewElement");
    id v6 = [v7 collectionViewCellClassForElement:v8];
  }
LABEL_7:

  return (Class)v6;
}

- (Class)_collectionViewCellClassForElement:(id)a3
{
  id v4 = a3;
  id v5 = [(TVInterfaceFactory *)self _extendedCollectionViewCellClassForIKElement:v4];
  if (!v5)
  {
    id v6 = [v4 parent];
    id v7 = [v6 parent];
    uint64_t v8 = objc_msgSend(v7, "tv_elementType");

    if (v8 != 9 || (id v5 = (objc_class *)objc_opt_class()) == 0)
    {
      uint64_t v9 = objc_msgSend(v4, "tv_elementType");
      if (v9 == 8 || v9 == 24 || v9 == 23) {
        id v5 = (objc_class *)objc_opt_class();
      }
      else {
        id v5 = 0;
      }
    }
  }
  id v10 = v5;

  return v10;
}

- (id)_imageProxyFromElement:(id)a3
{
  return [(TVInterfaceFactory *)self _imageProxyFromElement:a3 withLayout:0];
}

- (id)_imageProxyFromElement:(id)a3 withLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*(_WORD *)&self->_extenderFlags & 0x800) != 0)
  {
    uint64_t v9 = [(TVInterfaceFactory *)self extendedInterfaceCreator];
    uint64_t v8 = [v9 _imageProxyForIKElement:v6 withLayout:v7];
  }
  else
  {
    if ((*(_WORD *)&self->_extenderFlags & 0x1000) == 0)
    {
      uint64_t v8 = 0;
      goto LABEL_7;
    }
    uint64_t v9 = [(TVInterfaceFactory *)self extendedInterfaceCreator];
    id v10 = objc_msgSend(v6, "tv_associatedViewElement");
    uint64_t v8 = [v9 _imageProxyForElement:v10];
  }
  id v11 = [v6 appDocument];
  int v12 = [v11 requestLoader];
  [v8 setRequestLoader:v12];

LABEL_7:
  return v8;
}

- (id)_imageProxyForResourceURL:(id)a3 scaleToSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = objc_msgSend(a3, "tv_resourceName");
  uint64_t v8 = [TVImageProxy alloc];
  uint64_t v9 = +[_TVResourceImageLoader sharedInstance];
  id v10 = [(TVImageProxy *)v8 initWithObject:v7 imageLoader:v9 groupType:0];

  [(TVImageProxy *)v10 setCacheOnLoad:+[TVMLUtilities canHandleDecodingOnRenderThread] ^ 1];
  if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    int v12 = [(TVInterfaceFactory *)self imageForResource:v7];
    if (!v12)
    {

      id v10 = 0;
    }
  }
  return v10;
}

- (id)_imageProxyForSymbolURL:(id)a3 imageSymbolConfiguration:(id)a4 scaleToSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a4;
  uint64_t v9 = objc_msgSend(a3, "tv_symbolName");
  id v10 = [[_TVImageSymbolDescription alloc] initWithSymbolName:v9 imageSymbolConfiguration:v8];
  id v11 = [TVImageProxy alloc];
  int v12 = +[_TVSymbolImageLoader sharedInstance];
  __int16 v13 = [(TVImageProxy *)v11 initWithObject:v10 imageLoader:v12 groupType:0];

  [(TVImageProxy *)v13 setCacheOnLoad:+[TVMLUtilities canHandleDecodingOnRenderThread] ^ 1];
  if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    __int16 v15 = [MEMORY[0x263F1C6B0] systemImageNamed:v9 withConfiguration:v8];
    if (!v15)
    {

      __int16 v13 = 0;
    }
  }
  return v13;
}

- (id)_navigationControllerForTabIdentifier:(id)a3
{
  if ((*(_WORD *)&self->_extenderFlags & 0x4000) != 0)
  {
    id v5 = a3;
    id v6 = [(TVInterfaceFactory *)self extendedInterfaceCreator];
    v3 = [v6 _navigationControllerForTabIdentifier:v5];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_registerControllerTransitioningCreator:(id)a3 withType:(unint64_t)a4
{
  if (a3)
  {
    id v8 = (id)[a3 copy];
    controllerTransitionCreatorsByKey = self->_controllerTransitionCreatorsByKey;
    id v7 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)controllerTransitionCreatorsByKey setObject:v8 forKeyedSubscript:v7];
  }
}

- (id)_controllerTransitionFromElement:(id)a3 toElement:(id)a4 forNavigationControllerOperation:(int64_t)a5 relativeToFrom:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  controllerTransitionCreatorsByKey = self->_controllerTransitionCreatorsByKey;
  __int16 v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "tv_elementType"));
  __int16 v14 = [(NSMutableDictionary *)controllerTransitionCreatorsByKey objectForKeyedSubscript:v13];

  if (v14)
  {
    __int16 v15 = ((void (**)(void, id, id, int64_t, BOOL))v14)[2](v14, v10, v11, a5, v6);
  }
  else
  {
    __int16 v15 = 0;
  }

  return v15;
}

- (id)_resourceImageNamed:(id)a3
{
  id v3 = a3;
  id v4 = +[TVInterfaceFactory _tvmlResourceMap];
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  BOOL v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v3;
  }
  id v8 = v7;

  uint64_t v9 = (void *)MEMORY[0x263F1C6B0];
  id v10 = +[TVMLUtilities TVMLKitBundle];
  id v11 = [v9 imageNamed:v8 inBundle:v10];

  return v11;
}

+ (id)_tvmlResourceMap
{
  if (_tvmlResourceMap_onceToken != -1) {
    dispatch_once(&_tvmlResourceMap_onceToken, &__block_literal_global_202);
  }
  id v2 = (void *)_tvmlResourceMap_sDict;
  return v2;
}

uint64_t __38__TVInterfaceFactory__tvmlResourceMap__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)_tvmlResourceMap_sDict;
  _tvmlResourceMap_sDict = (uint64_t)v0;

  [(id)_tvmlResourceMap_sDict setObject:@"button-cloud" forKeyedSubscript:@"button-cloud"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-play" forKeyedSubscript:@"button-play"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-preview" forKeyedSubscript:@"button-preview"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-add" forKeyedSubscript:@"button-add"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-remove" forKeyedSubscript:@"button-remove"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-add-alt" forKeyedSubscript:@"button-add-alt"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-artist" forKeyedSubscript:@"button-artist"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-curator" forKeyedSubscript:@"button-curator"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-follow" forKeyedSubscript:@"button-follow"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-checkmark" forKeyedSubscript:@"button-checkmark"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-more" forKeyedSubscript:@"button-more"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-rate" forKeyedSubscript:@"button-rate"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-rated" forKeyedSubscript:@"button-rated"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-radio" forKeyedSubscript:@"button-radio"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-shuffle" forKeyedSubscript:@"button-shuffle"];
  [(id)_tvmlResourceMap_sDict setObject:@"icon_dropdown" forKeyedSubscript:@"button-dropdown"];
  [(id)_tvmlResourceMap_sDict setObject:@"button-open" forKeyedSubscript:@"button-open"];
  [(id)_tvmlResourceMap_sDict setObject:@"cs_logo_white" forKeyedSubscript:@"common-sense-logo-white"];
  [(id)_tvmlResourceMap_sDict setObject:@"cs_logo_black" forKeyedSubscript:@"common-sense-logo-black"];
  [(id)_tvmlResourceMap_sDict setObject:@"cs_badge_white_l" forKeyedSubscript:@"common-sense-badge-white-l"];
  [(id)_tvmlResourceMap_sDict setObject:@"cs_badge_white_m" forKeyedSubscript:@"common-sense-badge-white-m"];
  [(id)_tvmlResourceMap_sDict setObject:@"cs_badge_white_s" forKeyedSubscript:@"common-sense-badge-white-s"];
  [(id)_tvmlResourceMap_sDict setObject:@"cs_badge_black_s" forKeyedSubscript:@"common-sense-badge-black-s"];
  [(id)_tvmlResourceMap_sDict setObject:@"cs_badge_black_m" forKeyedSubscript:@"common-sense-badge-black-m"];
  [(id)_tvmlResourceMap_sDict setObject:@"cs_badge_black_l" forKeyedSubscript:@"common-sense-badge-black-l"];
  [(id)_tvmlResourceMap_sDict setObject:@"icon_chevron" forKeyedSubscript:@"chevron"];
  [(id)_tvmlResourceMap_sDict setObject:@"list-chevron" forKeyedSubscript:@"list-chevron"];
  [(id)_tvmlResourceMap_sDict setObject:@"game_center" forKeyedSubscript:@"game_center"];
  [(id)_tvmlResourceMap_sDict setObject:@"game_controller" forKeyedSubscript:@"game_controller"];
  [(id)_tvmlResourceMap_sDict setObject:@"bluetooth_accessory_mask" forKeyedSubscript:@"bluetooth_accessory"];
  [(id)_tvmlResourceMap_sDict setObject:@"watched-checkmark" forKeyedSubscript:@"overlay-checkmark"];
  [(id)_tvmlResourceMap_sDict setObject:@"icon_radio_small_mask" forKeyedSubscript:@"radio-s"];
  [(id)_tvmlResourceMap_sDict setObject:@"icon_cloud_mask" forKeyedSubscript:@"cloud-s"];
  [(id)_tvmlResourceMap_sDict setObject:@"extras_lockup_badge" forKeyedSubscript:@"extras-lockup-badge"];
  [(id)_tvmlResourceMap_sDict setObject:@"extras_preview_stamp" forKeyedSubscript:@"extras-preview-stamp"];
  [(id)_tvmlResourceMap_sDict setObject:@"extras_lockup_badge_zh" forKeyedSubscript:@"extras-lockup-badge_zh"];
  [(id)_tvmlResourceMap_sDict setObject:@"extras_preview_stamp_zh" forKeyedSubscript:@"extras-preview-stamp_zh"];
  [(id)_tvmlResourceMap_sDict setObject:@"ghost_episode_light" forKeyedSubscript:@"episode-placeholder-light"];
  [(id)_tvmlResourceMap_sDict setObject:@"ghost_episode_dark" forKeyedSubscript:@"episode-placeholder-dark"];
  [(id)_tvmlResourceMap_sDict setObject:@"content-gradient-brick" forKeyedSubscript:@"content-gradient-brick"];
  [(id)_tvmlResourceMap_sDict setObject:@"content-gradient-flowcase" forKeyedSubscript:@"content-gradient-flowcase"];
  [(id)_tvmlResourceMap_sDict setObject:@"content-gradient-genre-brick" forKeyedSubscript:@"content-gradient-genre-brick"];
  [(id)_tvmlResourceMap_sDict setObject:@"content-gradient-genre-brick-4" forKeyedSubscript:@"content-gradient-genre-brick-4"];
  [(id)_tvmlResourceMap_sDict setObject:@"content-gradient-list-keyframe" forKeyedSubscript:@"content-gradient-list-keyframe"];
  [(id)_tvmlResourceMap_sDict setObject:@"cc_mask" forKeyedSubscript:@"cc"];
  [(id)_tvmlResourceMap_sDict setObject:@"hd_mask" forKeyedSubscript:@"hd"];
  [(id)_tvmlResourceMap_sDict setObject:@"RTRotten" forKeyedSubscript:@"tomato-splat"];
  [(id)_tvmlResourceMap_sDict setObject:@"RTFresh" forKeyedSubscript:@"tomato-fresh"];
  [(id)_tvmlResourceMap_sDict setObject:@"RTCertified" forKeyedSubscript:@"tomato-certified"];
  [(id)_tvmlResourceMap_sDict setObject:@"RTLargeRotten" forKeyedSubscript:@"tomato-splat-m"];
  [(id)_tvmlResourceMap_sDict setObject:@"RTLargeFresh" forKeyedSubscript:@"tomato-fresh-m"];
  [(id)_tvmlResourceMap_sDict setObject:@"RTLargeCertified" forKeyedSubscript:@"tomato-certified-m"];
  [(id)_tvmlResourceMap_sDict setObject:@"confirmation-checkmark" forKeyedSubscript:@"confirmation-checkmark"];
  [(id)_tvmlResourceMap_sDict setObject:@"cloud-download-icon" forKeyedSubscript:@"cloud-download-icon"];
  [(id)_tvmlResourceMap_sDict setObject:@"download-checkmark" forKeyedSubscript:@"download-checkmark"];
  [(id)_tvmlResourceMap_sDict setObject:@"popover-add" forKeyedSubscript:@"popover-add"];
  [(id)_tvmlResourceMap_sDict setObject:@"popover-chevron-up" forKeyedSubscript:@"popover-chevron-up"];
  [(id)_tvmlResourceMap_sDict setObject:@"popover-chevron-down" forKeyedSubscript:@"popover-chevron-down"];
  [(id)_tvmlResourceMap_sDict setObject:@"popover-share" forKeyedSubscript:@"popover-share"];
  [(id)_tvmlResourceMap_sDict setObject:@"popover-more" forKeyedSubscript:@"popover-more"];
  [(id)_tvmlResourceMap_sDict setObject:@"ActionMenu-Add" forKeyedSubscript:@"ActionMenu-Add"];
  [(id)_tvmlResourceMap_sDict setObject:@"ActionMenu-circleMask" forKeyedSubscript:@"ActionMenu-circleMask"];
  [(id)_tvmlResourceMap_sDict setObject:@"ActionMenu-ClearHistory" forKeyedSubscript:@"ActionMenu-ClearHistory"];
  [(id)_tvmlResourceMap_sDict setObject:@"ActionMenu-ClearPlayHistory" forKeyedSubscript:@"ActionMenu-ClearPlayHistory"];
  [(id)_tvmlResourceMap_sDict setObject:@"ActionMenu-Mark" forKeyedSubscript:@"ActionMenu-Mark"];
  [(id)_tvmlResourceMap_sDict setObject:@"ActionMenu-MarkAll" forKeyedSubscript:@"ActionMenu-MarkAll"];
  [(id)_tvmlResourceMap_sDict setObject:@"ActionMenu-Play" forKeyedSubscript:@"ActionMenu-Play"];
  [(id)_tvmlResourceMap_sDict setObject:@"ActionMenu-Remove" forKeyedSubscript:@"ActionMenu-Remove"];
  [(id)_tvmlResourceMap_sDict setObject:@"ActionMenu-RemoveFromUpNext" forKeyedSubscript:@"ActionMenu-RemoveFromUpNext"];
  [(id)_tvmlResourceMap_sDict setObject:@"ActionMenu-Share" forKeyedSubscript:@"ActionMenu-Share"];
  [(id)_tvmlResourceMap_sDict setObject:@"Actions_CheckGlyph" forKeyedSubscript:@"Actions-Check"];
  [(id)_tvmlResourceMap_sDict setObject:@"Actions_AddGlyph" forKeyedSubscript:@"Actions-Add"];
  [(id)_tvmlResourceMap_sDict setObject:@"itunes-extras-badge" forKeyedSubscript:@"extras-badge"];
  [(id)_tvmlResourceMap_sDict setObject:@"guided-tour-play" forKeyedSubscript:@"guided-tour-play"];
  [(id)_tvmlResourceMap_sDict setObject:@"OnboardingPlayLarge" forKeyedSubscript:@"onboarding-play-large"];
  [(id)_tvmlResourceMap_sDict setObject:@"OnboardingPlaySmall" forKeyedSubscript:@"onboarding-play-small"];
  [(id)_tvmlResourceMap_sDict setObject:@"onboarding-hero" forKeyedSubscript:@"onboarding-hero"];
  [(id)_tvmlResourceMap_sDict setObject:@"onboarding-appicon" forKeyedSubscript:@"onboarding-appicon"];
  [(id)_tvmlResourceMap_sDict setObject:@"library-dropdown" forKeyedSubscript:@"library-dropdown"];
  [(id)_tvmlResourceMap_sDict setObject:@"metadata-ad" forKeyedSubscript:@"metadata-ad"];
  [(id)_tvmlResourceMap_sDict setObject:@"metadata-sdh" forKeyedSubscript:@"metadata-sdh"];
  [(id)_tvmlResourceMap_sDict setObject:@"hdr_mask" forKeyedSubscript:@"hdr"];
  [(id)_tvmlResourceMap_sDict setObject:@"4k_mask" forKeyedSubscript:@"4k"];
  [(id)_tvmlResourceMap_sDict setObject:@"dolbyvision_mask" forKeyedSubscript:@"dolby-vision"];
  id v2 = (void *)_tvmlResourceMap_sDict;
  return [v2 setObject:@"dolbyatmos_mask" forKeyedSubscript:@"dolby-atmos"];
}

- (id)_getImageFromURLorBundle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[TVInterfaceFactory _tvmlResourceMap];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (void *)v6;
  }
  else {
    id v8 = v4;
  }
  id v9 = v8;

  id v10 = (void *)MEMORY[0x263F1C6B0];
  id v11 = +[TVMLUtilities TVMLKitBundle];
  int v12 = [v10 imageNamed:v9 inBundle:v11];

  if (!v12)
  {
    __int16 v13 = (void *)MEMORY[0x263F1C6B0];
    __int16 v14 = +[TVMLUtilities TVUIKitBundle];
    int v12 = [v13 imageNamed:v4 inBundle:v14];

    if (!v12)
    {
      __int16 v15 = (void *)MEMORY[0x263F1C6B0];
      __int16 v16 = [MEMORY[0x263F086E0] mainBundle];
      int v12 = [v15 imageNamed:v4 inBundle:v16];
    }
  }

  __int16 v17 = [(TVInterfaceFactory *)self URLForResource:v4];
  __int16 v18 = v17;
  if (v17 && [v17 isFileURL])
  {
    uint64_t v19 = (void *)MEMORY[0x263F1C6B0];
    __int16 v20 = [v18 path];
    uint64_t v21 = [v19 imageWithContentsOfFile:v20];

    int v12 = (void *)v21;
  }
  if (!v12)
  {
    char v22 = TVMLKitImageLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_ERROR)) {
      -[TVInterfaceFactory _getImageFromURLorBundle:]((uint64_t)v4, v22);
    }
  }

  return v12;
}

+ (id)_URLForResource:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v7 = [v6 pathForResource:v5 ofType:@"png"];
    if (!v7)
    {
      id v7 = [v6 pathForResource:v5 ofType:@"jpg"];
      if (!v7)
      {
        id v7 = [v6 pathForResource:v5 ofType:@"lsr"];
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  if ([v7 length])
  {
    id v8 = [NSURL fileURLWithPath:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_willParseAppDocument:(id)a3 forImplicitUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  id v32 = a3;
  id v6 = [v32 templateElement];

  if (v6 && (*(_WORD *)&self->_extenderFlags & 0x600) != 0)
  {
    id v7 = (void *)MEMORY[0x263EFF980];
    id v8 = [v32 templateElement];
    id v9 = [v7 arrayWithObject:v8];
    while (1)
    {

      if (![v9 count])
      {

        goto LABEL_36;
      }
      id v8 = [v9 firstObject];
      [v9 removeObjectAtIndex:0];
      unint64_t v10 = v4 ? [v8 implicitUpdateType] : objc_msgSend(v8, "updateType");
      unint64_t v11 = v10;
      if (v10 >= 2) {
        break;
      }
      char v12 = objc_msgSend(v8, "tv_isParsedOnce");
      if (v11 || (v12 & 1) == 0)
      {
LABEL_12:
        if ((objc_msgSend(v8, "tv_isParsedOnce") & 1) == 0)
        {
          __int16 extenderFlags = (__int16)self->_extenderFlags;
          __int16 v14 = [(TVInterfaceFactory *)self extendedInterfaceCreator];
          __int16 v15 = v14;
          if ((extenderFlags & 0x200) != 0)
          {
            __int16 v16 = objc_msgSend(v8, "tv_associatedViewElement");
            [v15 _parseAppConfigurationForElement:v16];
          }
          else
          {
            [v14 _parseAppConfigurationForIKElement:v8];
          }

          objc_msgSend(v8, "tv_setParsedOnce:", 1);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v17 = [v8 masterPrototypes];
          if ([v17 count])
          {
            unint64_t v18 = 0;
            do
            {
              uint64_t v19 = [v17 objectAtIndexedSubscript:v18];
              [v9 insertObject:v19 atIndex:v18];

              ++v18;
            }
            while (v18 < [v17 count]);
          }
          __int16 v20 = [v8 proxiedItemElements];
          if ([v20 count])
          {
            unint64_t v21 = 0;
            do
            {
              char v22 = [v20 objectAtIndexedSubscript:v21];
              [v9 insertObject:v22 atIndex:v21];

              ++v21;
            }
            while (v21 < [v20 count]);
          }
        }
        id v23 = [MEMORY[0x263EFF980] arrayWithObject:v8];
        v24 = v23;
        while ([v23 count])
        {
          char v25 = [v24 firstObject];
          [v24 removeObjectAtIndex:0];
          id v26 = [v25 aliases];
          [v24 addObjectsFromArray:v26];
          if ([v26 count])
          {
            unint64_t v27 = 0;
            do
            {
              v28 = [v26 objectAtIndexedSubscript:v27];
              [v9 insertObject:v28 atIndex:v27];

              ++v27;
            }
            while (v27 < [v26 count]);
          }

          id v23 = v24;
        }
        v29 = [v8 children];
        if ([v29 count])
        {
          unint64_t v30 = 0;
          do
          {
            v31 = [v29 objectAtIndexedSubscript:v30];
            [v9 insertObject:v31 atIndex:v30];

            ++v30;
          }
          while (v30 < [v29 count]);
        }
      }
    }
    objc_msgSend(v8, "tv_setParsedOnce:", 0);
    objc_msgSend(v8, "tv_isParsedOnce");
    goto LABEL_12;
  }
LABEL_36:
}

- (TVInterfaceCreating)extendedInterfaceCreator
{
  return self->_extendedInterfaceCreator;
}

- (TVStyleSheetRegistry)styleSheetRegistry
{
  return self->_styleSheetRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedInterfaceCreator, 0);
  objc_storeStrong((id *)&self->_styleSheetRegistry, 0);
  objc_storeStrong((id *)&self->_templateFactory, 0);
  objc_storeStrong((id *)&self->_controllerFactory, 0);
  objc_storeStrong((id *)&self->_lockupFactory, 0);
  objc_storeStrong((id *)&self->_viewFactory, 0);
  objc_storeStrong((id *)&self->_controllerTransitionCreatorsByKey, 0);
  objc_storeStrong((id *)&self->_viewControllerCreatorsByKey, 0);
  objc_storeStrong((id *)&self->_viewCreatorsByKey, 0);
}

- (void)_getImageFromURLorBundle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_230B4C000, a2, OS_LOG_TYPE_ERROR, "resource not found: %@", (uint8_t *)&v2, 0xCu);
}

@end