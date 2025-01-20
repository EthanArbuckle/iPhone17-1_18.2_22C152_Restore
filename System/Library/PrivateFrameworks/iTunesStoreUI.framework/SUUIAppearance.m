@interface SUUIAppearance
+ (id)_defaultBackButtonAppearance;
+ (id)_defaultButtonAppearance;
+ (id)_defaultConfirmationButtonAppearance;
+ (id)_defaultDestructiveButtonAppearance;
+ (id)_defaultDoneButtonAppearance;
+ (id)_defaultForwardButtonAppearance;
+ (id)_defaultShadowWithColor:(id)a3 offset:(CGSize)a4;
+ (id)_defaultTabBarAppearance;
+ (id)defaultAppearance;
- (NSDictionary)navigationBarTitleTextAttributes;
- (SUControlAppearance)backButtonAppearance;
- (SUControlAppearance)confirmationButtonAppearance;
- (SUControlAppearance)destructiveButtonAppearance;
- (SUControlAppearance)exitStoreButtonAppearance;
- (SUControlAppearance)forwardButtonAppearance;
- (SUTabBarAppearance)tabBarAppearance;
- (SUToolbarAppearance)toolbarAppearance;
- (id)_copySegmentedControlKeyWithStyle:(int64_t)a3 tintStyle:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)navigationBarBackgroundImageForBarMetrics:(int64_t)a3;
- (id)navigationButtonAppearanceForStyle:(int64_t)a3;
- (id)segmentedControlAppearanceForStyle:(int64_t)a3 tintStyle:(int64_t)a4;
- (void)_styleBackBarButtonItem:(id)a3;
- (void)dealloc;
- (void)setBackButtonAppearance:(id)a3;
- (void)setConfirmationButtonAppearance:(id)a3;
- (void)setDestructiveButtonAppearance:(id)a3;
- (void)setExitStoreButtonAppearance:(id)a3;
- (void)setForwardButtonAppearance:(id)a3;
- (void)setNavigationBarBackgroundImage:(id)a3 forBarMetrics:(int64_t)a4;
- (void)setNavigationBarTitleTextAttributes:(id)a3;
- (void)setNavigationButtonAppearance:(id)a3 forStyle:(int64_t)a4;
- (void)setSegmentedControlAppearance:(id)a3 forStyle:(int64_t)a4 tintStyle:(int64_t)a5;
- (void)setTabBarAppearance:(id)a3;
- (void)setToolbarAppearance:(id)a3;
- (void)styleBarButtonItem:(id)a3;
- (void)styleConfirmationButtonItem:(id)a3;
- (void)styleDestructiveButton:(id)a3;
- (void)styleExitStoreButtonItem:(id)a3;
- (void)styleForwardButtonItem:(id)a3;
- (void)styleNavigationBar:(id)a3;
- (void)styleSegmentedControl:(id)a3 tintStyle:(int64_t)a4;
- (void)styleTabBar:(id)a3;
- (void)styleTabBarItem:(id)a3;
- (void)styleToolbar:(id)a3;
@end

@implementation SUUIAppearance

+ (id)defaultAppearance
{
  if (!_UIApplicationUsesLegacyUI()) {
    return 0;
  }
  v3 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = (void *)[MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarDefaultBackground" inBundle:v4];
  double v6 = *MEMORY[0x263F1D1C0];
  double v7 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v8 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v9 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  uint64_t v10 = objc_msgSend(v5, "resizableImageWithCapInsets:", *MEMORY[0x263F1D1C0], v7, v8, v9);
  uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UINavigationBarMiniDefaultBackground", v4), "resizableImageWithCapInsets:", v6, v7, v8, v9);
  [v3 setNavigationBarBackgroundImage:v10 forBarMetrics:0];
  [v3 setNavigationBarBackgroundImage:v11 forBarMetrics:1];
  objc_msgSend(v3, "setTabBarAppearance:", objc_msgSend(a1, "_defaultTabBarAppearance"));
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v13 = [MEMORY[0x263F1C550] colorWithWhite:0.784313725 alpha:1.0];
  [v12 setObject:v13 forKey:*MEMORY[0x263F1C240]];
  uint64_t v14 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x263F1C550], "blackColor"), 0.0, -1.0);
  [v12 setObject:v14 forKey:*MEMORY[0x263F1C280]];
  [v3 setNavigationBarTitleTextAttributes:v12];

  v3[48] = 1;

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIAppearance;
  [(SUUIAppearance *)&v3 dealloc];
}

- (SUControlAppearance)backButtonAppearance
{
  backButtonAppearance = self->_backButtonAppearance;
  if (!backButtonAppearance)
  {
    if (self->_isDefaultAppearance)
    {
      backButtonAppearance = (SUControlAppearance *)(id)[(id)objc_opt_class() _defaultBackButtonAppearance];
      self->_backButtonAppearance = backButtonAppearance;
    }
    else
    {
      backButtonAppearance = 0;
    }
  }
  uint64_t v4 = (void *)[(SUControlAppearance *)backButtonAppearance copy];

  return (SUControlAppearance *)v4;
}

- (SUControlAppearance)confirmationButtonAppearance
{
  confirmationButtonAppearance = self->_confirmationButtonAppearance;
  if (!confirmationButtonAppearance)
  {
    if (self->_isDefaultAppearance)
    {
      confirmationButtonAppearance = (SUControlAppearance *)(id)[(id)objc_opt_class() _defaultConfirmationButtonAppearance];
      self->_confirmationButtonAppearance = confirmationButtonAppearance;
    }
    else
    {
      confirmationButtonAppearance = 0;
    }
  }
  uint64_t v4 = (void *)[(SUControlAppearance *)confirmationButtonAppearance copy];

  return (SUControlAppearance *)v4;
}

- (SUControlAppearance)destructiveButtonAppearance
{
  destructiveButtonAppearance = self->_destructiveButtonAppearance;
  if (!destructiveButtonAppearance)
  {
    if (self->_isDefaultAppearance)
    {
      destructiveButtonAppearance = (SUControlAppearance *)(id)[(id)objc_opt_class() _defaultDestructiveButtonAppearance];
      self->_destructiveButtonAppearance = destructiveButtonAppearance;
    }
    else
    {
      destructiveButtonAppearance = 0;
    }
  }
  uint64_t v4 = (void *)[(SUControlAppearance *)destructiveButtonAppearance copy];

  return (SUControlAppearance *)v4;
}

- (SUControlAppearance)exitStoreButtonAppearance
{
  exitStoreButtonAppearance = self->_exitStoreButtonAppearance;
  if (!exitStoreButtonAppearance)
  {
    if (self->_isDefaultAppearance)
    {
      uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v5 = objc_alloc_init(SUControlAppearance);
      self->_exitStoreButtonAppearance = v5;
      -[SUControlAppearance setImage:forState:barMetrics:](v5, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarCircularButton" inBundle:v4], 0, 0);
      -[SUControlAppearance setImage:forState:barMetrics:](self->_exitStoreButtonAppearance, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarCircularButtonPressed" inBundle:v4], 1, 0);
      exitStoreButtonAppearance = self->_exitStoreButtonAppearance;
    }
    else
    {
      exitStoreButtonAppearance = 0;
    }
  }
  double v6 = (void *)[(SUControlAppearance *)exitStoreButtonAppearance copy];

  return (SUControlAppearance *)v6;
}

- (SUControlAppearance)forwardButtonAppearance
{
  forwardButtonAppearance = self->_forwardButtonAppearance;
  if (!forwardButtonAppearance)
  {
    if (self->_isDefaultAppearance)
    {
      forwardButtonAppearance = (SUControlAppearance *)(id)[(id)objc_opt_class() _defaultForwardButtonAppearance];
      self->_forwardButtonAppearance = forwardButtonAppearance;
    }
    else
    {
      forwardButtonAppearance = 0;
    }
  }
  uint64_t v4 = (void *)[(SUControlAppearance *)forwardButtonAppearance copy];

  return (SUControlAppearance *)v4;
}

- (id)navigationBarBackgroundImageForBarMetrics:(int64_t)a3
{
  uint64_t v4 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  id v5 = (id)[(NSMutableDictionary *)self->_navigationBarBackgroundImages objectForKey:v4];

  return v5;
}

- (id)navigationButtonAppearanceForStyle:(int64_t)a3
{
  id v5 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  id v6 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_navigationButtonAppearance, "objectForKey:", v5), "copy");
  if (!v6)
  {
    if (self->_isDefaultAppearance)
    {
      if (a3 == 2)
      {
        double v7 = (void *)[(id)objc_opt_class() _defaultDoneButtonAppearance];
      }
      else
      {
        if (a3) {
          goto LABEL_9;
        }
        double v7 = (void *)[(id)objc_opt_class() _defaultButtonAppearance];
      }
      double v8 = v7;
      if (v7)
      {
        id v6 = (id)[v7 copy];
        [(SUUIAppearance *)self setNavigationButtonAppearance:v8 forStyle:a3];
        goto LABEL_10;
      }
    }
LABEL_9:
    id v6 = 0;
  }
LABEL_10:

  return v6;
}

- (id)segmentedControlAppearanceForStyle:(int64_t)a3 tintStyle:(int64_t)a4
{
  id v7 = -[SUUIAppearance _copySegmentedControlKeyWithStyle:tintStyle:](self, "_copySegmentedControlKeyWithStyle:tintStyle:");
  id v8 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_segmentedControlAppearance, "objectForKey:", v7), "copy");
  if (!v8)
  {
    if (self->_isDefaultAppearance)
    {
      if (a3 == 7)
      {
        id v9 = +[SUSegmentedControlAppearance defaultOptionsAppearanceForTintStyle:a4];
      }
      else
      {
        if (a3 != 2) {
          goto LABEL_9;
        }
        id v9 = +[SUSegmentedControlAppearance defaultBarAppearance];
      }
      id v10 = v9;
      if (v9)
      {
        id v8 = (id)[v9 copy];
        [(SUUIAppearance *)self setSegmentedControlAppearance:v10 forStyle:a3 tintStyle:a4];
        goto LABEL_10;
      }
    }
LABEL_9:
    id v8 = 0;
  }
LABEL_10:

  return v8;
}

- (void)setNavigationBarBackgroundImage:(id)a3 forBarMetrics:(int64_t)a4
{
  uint64_t v6 = [objc_alloc(NSNumber) initWithInteger:a4];
  navigationBarBackgroundImages = self->_navigationBarBackgroundImages;
  id v8 = (id)v6;
  if (a3)
  {
    if (!navigationBarBackgroundImages)
    {
      navigationBarBackgroundImages = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_navigationBarBackgroundImages = navigationBarBackgroundImages;
    }
    [(NSMutableDictionary *)navigationBarBackgroundImages setObject:a3 forKey:v8];
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](navigationBarBackgroundImages, "removeObjectForKey:");
  }
}

- (void)setNavigationButtonAppearance:(id)a3 forStyle:(int64_t)a4
{
  uint64_t v6 = [objc_alloc(NSNumber) initWithInteger:a4];
  navigationButtonAppearance = self->_navigationButtonAppearance;
  id v9 = (id)v6;
  if (a3)
  {
    if (!navigationButtonAppearance) {
      self->_navigationButtonAppearance = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v8 = (void *)[a3 copy];
    [(NSMutableDictionary *)self->_navigationButtonAppearance setObject:v8 forKey:v9];
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](navigationButtonAppearance, "removeObjectForKey:");
  }
}

- (void)setSegmentedControlAppearance:(id)a3 forStyle:(int64_t)a4 tintStyle:(int64_t)a5
{
  id v7 = [(SUUIAppearance *)self _copySegmentedControlKeyWithStyle:a4 tintStyle:a5];
  segmentedControlAppearance = self->_segmentedControlAppearance;
  id v10 = v7;
  if (a3)
  {
    if (!segmentedControlAppearance) {
      self->_segmentedControlAppearance = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v9 = (void *)[a3 copy];
    [(NSMutableDictionary *)self->_segmentedControlAppearance setObject:v9 forKey:v10];
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](segmentedControlAppearance, "removeObjectForKey:");
  }
}

- (void)styleBarButtonItem:(id)a3
{
  id v4 = -[SUUIAppearance navigationButtonAppearanceForStyle:](self, "navigationButtonAppearanceForStyle:", [a3 style]);

  [v4 styleBarButtonItem:a3];
}

- (void)styleConfirmationButtonItem:(id)a3
{
  id v5 = [(SUUIAppearance *)self confirmationButtonAppearance];
  if ([(SUControlAppearance *)v5 numberOfImages]) {
    uint64_t v6 = (SUUIAppearance *)v5;
  }
  else {
    uint64_t v6 = self;
  }

  [(SUUIAppearance *)v6 styleBarButtonItem:a3];
}

- (void)styleDestructiveButton:(id)a3
{
  id v4 = [(SUUIAppearance *)self destructiveButtonAppearance];

  [(SUControlAppearance *)v4 styleBarButtonItem:a3];
}

- (void)styleExitStoreButtonItem:(id)a3
{
  if ([(SUControlAppearance *)self->_exitStoreButtonAppearance numberOfImages]) {
    exitStoreButtonAppearance = self->_exitStoreButtonAppearance;
  }
  else {
    exitStoreButtonAppearance = self;
  }

  [exitStoreButtonAppearance styleBarButtonItem:a3];
}

- (void)styleForwardButtonItem:(id)a3
{
  if ([(SUControlAppearance *)self->_forwardButtonAppearance numberOfImages]) {
    forwardButtonAppearance = self->_forwardButtonAppearance;
  }
  else {
    forwardButtonAppearance = self;
  }

  [forwardButtonAppearance styleBarButtonItem:a3];
}

- (void)styleNavigationBar:(id)a3
{
  navigationBarBackgroundImages = self->_navigationBarBackgroundImages;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__SUUIAppearance_styleNavigationBar___block_invoke;
  v10[3] = &unk_264814F70;
  v10[4] = a3;
  [(NSMutableDictionary *)navigationBarBackgroundImages enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v6 = [(SUUIAppearance *)self backButtonAppearance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__SUUIAppearance_styleNavigationBar___block_invoke_2;
  v9[3] = &unk_264814F98;
  v9[4] = a3;
  [(SUControlAppearance *)v6 enumerateImagesUsingBlock:v9];
  id v7 = [(SUUIAppearance *)self navigationButtonAppearanceForStyle:0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__SUUIAppearance_styleNavigationBar___block_invoke_3;
  v8[3] = &unk_264814FC0;
  v8[4] = a3;
  [v7 enumerateTextAttributesUsingBlock:v8];
  objc_msgSend(a3, "setTitleTextAttributes:", -[SUUIAppearance navigationBarTitleTextAttributes](self, "navigationBarTitleTextAttributes"));
}

uint64_t __37__SUUIAppearance_styleNavigationBar___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [a2 integerValue];

  return [v4 setBackgroundImage:a3 forBarMetrics:v5];
}

uint64_t __37__SUUIAppearance_styleNavigationBar___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _setBackButtonBackgroundImage:a3 mini:a4 forStates:a2];
}

uint64_t __37__SUUIAppearance_styleNavigationBar___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)[a3 objectForKey:*MEMORY[0x263F1C280]];
  uint64_t result = [a3 objectForKey:*MEMORY[0x263F1C240]];
  if (a2 == 1)
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_setPressedButtonItemTextColor:shadowColor:", result, objc_msgSend(v6, "shadowColor"));
    if (!v6) {
      return result;
    }
    goto LABEL_5;
  }
  if (!a2) {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_setButtonItemTextColor:shadowColor:", result, objc_msgSend(v6, "shadowColor"));
  }
  if (v6)
  {
LABEL_5:
    id v8 = *(void **)(a1 + 32);
    [v6 shadowOffset];
    return objc_msgSend(v8, "_setButtonTextShadowOffset:");
  }
  return result;
}

- (void)styleSegmentedControl:(id)a3 tintStyle:(int64_t)a4
{
  id v5 = -[SUUIAppearance segmentedControlAppearanceForStyle:tintStyle:](self, "segmentedControlAppearanceForStyle:tintStyle:", [a3 segmentControlStyle], a4);

  [v5 styleSegmentedControl:a3];
}

- (void)styleTabBar:(id)a3
{
  id v4 = [(SUUIAppearance *)self tabBarAppearance];
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(a3, "setBackgroundImage:", -[SUTabBarAppearance backgroundImage](v4, "backgroundImage"));
    objc_msgSend(a3, "_setSelectionIndicatorImage:", -[SUTabBarAppearance selectionIndicatorImage](v5, "selectionIndicatorImage"));
    [(SUTabBarAppearance *)v5 tabBarButtonWidth];
    double v7 = v6;
    if (v6 > 0.00000011920929)
    {
      [a3 setItemPositioning:2];
      [(SUTabBarAppearance *)v5 tabBarButtonSpacing];
      objc_msgSend(a3, "setItemSpacing:");
      [a3 setItemWidth:v7];
    }
    uint64_t v8 = [(SUTabBarAppearance *)v5 dividerImage];
    uint64_t v9 = [(SUTabBarAppearance *)v5 selectedDividerImage];
    [a3 _setDividerImage:v8 forLeftButtonState:0 rightButtonState:0];
    [a3 _setDividerImage:v9 forLeftButtonState:1 rightButtonState:0];
  }
}

- (void)styleTabBarItem:(id)a3
{
  id v4 = [(SUUIAppearance *)self tabBarAppearance];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__SUUIAppearance_styleTabBarItem___block_invoke;
  v5[3] = &unk_264814FC0;
  v5[4] = a3;
  [(SUTabBarAppearance *)v4 enumerateTitleTextAttributesUsingBlock:v5];
}

uint64_t __34__SUUIAppearance_styleTabBarItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setTitleTextAttributes:a3 forState:a2];
}

- (void)styleToolbar:(id)a3
{
  id v4 = [(SUUIAppearance *)self toolbarAppearance];

  [(SUToolbarAppearance *)v4 styleToolbar:a3];
}

- (SUToolbarAppearance)toolbarAppearance
{
  toolbarAppearance = self->_toolbarAppearance;
  if (!toolbarAppearance)
  {
    if (self->_isDefaultAppearance)
    {
      toolbarAppearance = (SUToolbarAppearance *)+[SUToolbarAppearance defaultToolbarAppearance];
      self->_toolbarAppearance = toolbarAppearance;
    }
    else
    {
      toolbarAppearance = 0;
    }
  }
  id v4 = (void *)[(SUToolbarAppearance *)toolbarAppearance copy];

  return (SUToolbarAppearance *)v4;
}

+ (id)_defaultShadowWithColor:(id)a3 offset:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = objc_alloc_init(MEMORY[0x263F1C360]);
  [v7 setShadowBlurRadius:0.0];
  [v7 setShadowColor:a3];
  objc_msgSend(v7, "setShadowOffset:", width, height);

  return v7;
}

- (void)_styleBackBarButtonItem:(id)a3
{
  id v4 = self;
  if ([(SUControlAppearance *)[(SUUIAppearance *)self backButtonAppearance] numberOfImages])
  {
    id v4 = [(SUUIAppearance *)v4 backButtonAppearance];
  }

  [(SUUIAppearance *)v4 styleBarButtonItem:a3];
}

+ (id)_defaultBackButtonAppearance
{
  objc_super v3 = objc_alloc_init(SUControlAppearance);
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  -[SUControlAppearance setTitlePositionAdjustment:forBarMetrics:](v3, "setTitlePositionAdjustment:forBarMetrics:", 0, 4.0, 0.0);
  -[SUControlAppearance setTitlePositionAdjustment:forBarMetrics:](v3, "setTitlePositionAdjustment:forBarMetrics:", 1, 2.0, 0.0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UINavigationBarDefaultBack", v4), "resizableImageWithCapInsets:", 0.0, 14.0, 0.0, 6.0), 0, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UINavigationBarMiniDefaultBack", v4), "resizableImageWithCapInsets:", 0.0, 10.0, 0.0, 4.0), 0, 1);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UINavigationBarDefaultBackPressed", v4), "resizableImageWithCapInsets:", 0.0, 14.0, 0.0, 6.0), 1, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UINavigationBarMiniDefaultBackPressed", v4), "resizableImageWithCapInsets:", 0.0, 10.0, 0.0, 4.0), 1, 1);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v6 = [MEMORY[0x263F1C550] colorWithWhite:0.784313725 alpha:1.0];
  [v5 setObject:v6 forKey:*MEMORY[0x263F1C240]];
  uint64_t v7 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x263F1C550], "blackColor"), 0.0, -1.0);
  [v5 setObject:v7 forKey:*MEMORY[0x263F1C280]];
  [(SUControlAppearance *)v3 setTextAttributes:v5 forState:0];
  [(SUControlAppearance *)v3 setTextAttributes:v5 forState:1];

  return v3;
}

+ (id)_defaultButtonAppearance
{
  objc_super v3 = objc_alloc_init(SUControlAppearance);
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarDefaultButton" inBundle:v4], 0, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarMiniDefaultButton" inBundle:v4], 0, 1);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarDefaultButtonPressed" inBundle:v4], 1, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarMiniDefaultButtonPressed" inBundle:v4], 1, 1);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v6 = [MEMORY[0x263F1C550] colorWithWhite:0.784313725 alpha:1.0];
  uint64_t v7 = *MEMORY[0x263F1C240];
  [v5 setObject:v6 forKey:*MEMORY[0x263F1C240]];
  uint64_t v8 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x263F1C550], "blackColor"), 0.0, -1.0);
  uint64_t v9 = *MEMORY[0x263F1C280];
  [v5 setObject:v8 forKey:*MEMORY[0x263F1C280]];
  [(SUControlAppearance *)v3 setTextAttributes:v5 forState:0];
  [(SUControlAppearance *)v3 setTextAttributes:v5 forState:1];

  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.490196078, 1.0), v7);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x263F1C550], "blackColor"), 0.0, -1.0), v9);
  [(SUControlAppearance *)v3 setTextAttributes:v10 forState:2];

  return v3;
}

+ (id)_defaultConfirmationButtonAppearance
{
  objc_super v3 = objc_alloc_init(SUControlAppearance);
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarGreenBuyButton" inBundle:v4], 0, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarGreenBuyButtonPressed" inBundle:v4], 1, 0);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v6 = [MEMORY[0x263F1C550] whiteColor];
  [v5 setObject:v6 forKey:*MEMORY[0x263F1C240]];
  uint64_t v7 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.0, 0.5), 0.0, -1.0);
  [v5 setObject:v7 forKey:*MEMORY[0x263F1C280]];
  [(SUControlAppearance *)v3 setTextAttributes:v5 forState:0];
  [(SUControlAppearance *)v3 setTextAttributes:v5 forState:1];

  return v3;
}

+ (id)_defaultDestructiveButtonAppearance
{
  objc_super v3 = objc_alloc_init(SUControlAppearance);
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarDestroyButton" inBundle:v4], 0, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarMiniDestroyButton" inBundle:v4], 0, 1);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarDestroyButtonPressed" inBundle:v4], 1, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarMiniDestroyButtonPressed" inBundle:v4], 1, 1);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v6 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v7 = *MEMORY[0x263F1C240];
  [v5 setObject:v6 forKey:*MEMORY[0x263F1C240]];
  uint64_t v8 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.0, 0.5), 0.0, 1.0);
  uint64_t v9 = *MEMORY[0x263F1C280];
  [v5 setObject:v8 forKey:*MEMORY[0x263F1C280]];
  [(SUControlAppearance *)v3 setTextAttributes:v5 forState:0];
  [(SUControlAppearance *)v3 setTextAttributes:v5 forState:1];

  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.784313725, 1.0), v7);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.0, 0.5), 0.0, 1.0), v9);
  [(SUControlAppearance *)v3 setTextAttributes:v10 forState:2];

  return v3;
}

+ (id)_defaultDoneButtonAppearance
{
  objc_super v3 = objc_alloc_init(SUControlAppearance);
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarDoneButton" inBundle:v4], 0, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarMiniDoneButton" inBundle:v4], 0, 1);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarDoneButtonPressed" inBundle:v4], 1, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UINavigationBarMiniDoneButtonPressed" inBundle:v4], 1, 1);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v6 = [MEMORY[0x263F1C550] colorWithWhite:0.278431373 alpha:1.0];
  uint64_t v7 = *MEMORY[0x263F1C240];
  [v5 setObject:v6 forKey:*MEMORY[0x263F1C240]];
  uint64_t v8 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 1.0, 0.5), 0.0, 1.0);
  uint64_t v9 = *MEMORY[0x263F1C280];
  [v5 setObject:v8 forKey:*MEMORY[0x263F1C280]];
  [(SUControlAppearance *)v3 setTextAttributes:v5 forState:0];
  [(SUControlAppearance *)v3 setTextAttributes:v5 forState:1];

  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.447058824, 1.0), v7);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 1.0, 0.5), 0.0, 1.0), v9);
  [(SUControlAppearance *)v3 setTextAttributes:v10 forState:2];

  return v3;
}

+ (id)_defaultForwardButtonAppearance
{
  objc_super v3 = objc_alloc_init(SUControlAppearance);
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  -[SUControlAppearance setTitlePositionAdjustment:forBarMetrics:](v3, "setTitlePositionAdjustment:forBarMetrics:", 0, -4.0, 0.0);
  -[SUControlAppearance setTitlePositionAdjustment:forBarMetrics:](v3, "setTitlePositionAdjustment:forBarMetrics:", 1, -2.0, 0.0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UINavigationBarDefaultForward", v4), "resizableImageWithCapInsets:", 0.0, 6.0, 0.0, 14.0), 0, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UINavigationBarMiniDefaultForward", v4), "resizableImageWithCapInsets:", 0.0, 4.0, 0.0, 10.0), 0, 1);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UINavigationBarDefaultForwardPressed", v4), "resizableImageWithCapInsets:", 0.0, 6.0, 0.0, 14.0), 1, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UINavigationBarMiniDefaultForwardPressed", v4), "resizableImageWithCapInsets:", 0.0, 4.0, 0.0, 10.0), 1, 1);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v6 = [MEMORY[0x263F1C550] colorWithWhite:0.784313725 alpha:1.0];
  [v5 setObject:v6 forKey:*MEMORY[0x263F1C240]];
  uint64_t v7 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x263F1C550], "blackColor"), 0.0, -1.0);
  [v5 setObject:v7 forKey:*MEMORY[0x263F1C280]];
  [(SUControlAppearance *)v3 setTextAttributes:v5 forState:0];
  [(SUControlAppearance *)v3 setTextAttributes:v5 forState:1];

  return v3;
}

+ (id)_defaultTabBarAppearance
{
  objc_super v3 = objc_alloc_init(SUTabBarAppearance);
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  -[SUTabBarAppearance setBackgroundImage:](v3, "setBackgroundImage:", [MEMORY[0x263F1C6B0] imageNamed:@"UITabBarBG" inBundle:v4]);
  -[SUTabBarAppearance setDividerImage:](v3, "setDividerImage:", [MEMORY[0x263F1C6B0] imageNamed:@"UITabBarSeparator" inBundle:v4]);
  -[SUTabBarAppearance setSelectedDividerImage:](v3, "setSelectedDividerImage:", [MEMORY[0x263F1C6B0] imageNamed:@"UITabBarSeparatorActive" inBundle:v4]);
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1)
  {
    [(SUTabBarAppearance *)v3 setTabBarButtonSpacing:0.0];
    [(SUTabBarAppearance *)v3 setTabBarButtonWidth:100.0];
  }
  -[SUTabBarAppearance setSelectionIndicatorImage:](v3, "setSelectionIndicatorImage:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UITabBarActiveSegment", v4), "resizableImageWithCapInsets:", 0.0, 4.0, 0.0, 4.0));
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v6 = [MEMORY[0x263F1C550] colorWithWhite:0.784313725 alpha:1.0];
  uint64_t v7 = *MEMORY[0x263F1C240];
  [v5 setObject:v6 forKey:*MEMORY[0x263F1C240]];
  uint64_t v8 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x263F1C550], "blackColor"), 0.0, -1.0);
  uint64_t v9 = *MEMORY[0x263F1C280];
  [v5 setObject:v8 forKey:*MEMORY[0x263F1C280]];
  [(SUTabBarAppearance *)v3 setTitleTextAttributes:v5 forState:0];

  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x263F1C550], "whiteColor"), v7);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.0, 0.9), 0.0, 1.0), v9);
  [(SUTabBarAppearance *)v3 setTitleTextAttributes:v10 forState:4];

  return v3;
}

- (id)_copySegmentedControlKeyWithStyle:(int64_t)a3 tintStyle:(int64_t)a4
{
  return (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%ld:%ld", a3, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = [(SUControlAppearance *)self->_backButtonAppearance copyWithZone:a3];
  *(void *)(v5 + 16) = [(SUControlAppearance *)self->_confirmationButtonAppearance copyWithZone:a3];
  *(void *)(v5 + 32) = [(SUControlAppearance *)self->_exitStoreButtonAppearance copyWithZone:a3];
  *(void *)(v5 + 40) = [(SUControlAppearance *)self->_forwardButtonAppearance copyWithZone:a3];
  *(unsigned char *)(v5 + 48) = self->_isDefaultAppearance;
  *(void *)(v5 + 56) = [(NSMutableDictionary *)self->_navigationBarBackgroundImages mutableCopyWithZone:a3];
  *(void *)(v5 + 64) = [(NSDictionary *)self->_navigationBarTitleTextAttributes copyWithZone:a3];
  *(void *)(v5 + 72) = [(NSMutableDictionary *)self->_navigationButtonAppearance copyWithZone:a3];
  *(void *)(v5 + 80) = [(NSMutableDictionary *)self->_segmentedControlAppearance mutableCopyWithZone:a3];
  *(void *)(v5 + 88) = [(SUTabBarAppearance *)self->_tabBarAppearance copyWithZone:a3];
  *(void *)(v5 + 96) = [(SUToolbarAppearance *)self->_toolbarAppearance copyWithZone:a3];
  return (id)v5;
}

- (void)setBackButtonAppearance:(id)a3
{
}

- (void)setConfirmationButtonAppearance:(id)a3
{
}

- (void)setDestructiveButtonAppearance:(id)a3
{
}

- (void)setExitStoreButtonAppearance:(id)a3
{
}

- (void)setForwardButtonAppearance:(id)a3
{
}

- (NSDictionary)navigationBarTitleTextAttributes
{
  return self->_navigationBarTitleTextAttributes;
}

- (void)setNavigationBarTitleTextAttributes:(id)a3
{
}

- (SUTabBarAppearance)tabBarAppearance
{
  return self->_tabBarAppearance;
}

- (void)setTabBarAppearance:(id)a3
{
}

- (void)setToolbarAppearance:(id)a3
{
}

@end