@interface TVModalPresentationConfiguration
+ (id)presentationTypeKeyMap;
- (BOOL)allowsModalOverModal;
- (BOOL)isAnimated;
- (BOOL)isMenuDismissable;
- (BOOL)isNavigationBarHidden;
- (CGRect)popOverSourceRect;
- (NSArray)alertActions;
- (TVModalPresentationConfiguration)init;
- (TVModalPresentationConfiguration)initWithOptions:(id)a3;
- (UIBarButtonItem)popOverSourceBarButtonItem;
- (UIView)popOverSourceView;
- (int64_t)type;
- (unint64_t)popOverArrowDirection;
- (void)_applyAlertActionsForController:(id)a3;
- (void)setAlertActions:(id)a3;
- (void)setAllowsModalOverModal:(BOOL)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setMenuDismissable:(BOOL)a3;
- (void)setNavigationBarHidden:(BOOL)a3;
- (void)setPopOverArrowDirection:(unint64_t)a3;
- (void)setPopOverSourceBarButtonItem:(id)a3;
- (void)setPopOverSourceRect:(CGRect)a3;
- (void)setPopOverSourceView:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation TVModalPresentationConfiguration

+ (id)presentationTypeKeyMap
{
  if (presentationTypeKeyMap_onceToken != -1) {
    dispatch_once(&presentationTypeKeyMap_onceToken, &__block_literal_global_199);
  }
  v2 = (void *)presentationTypeKeyMap__typeKeyMap;
  return v2;
}

void __58__TVModalPresentationConfiguration_presentationTypeKeyMap__block_invoke()
{
  v3[13] = *MEMORY[0x263EF8340];
  v2[0] = @"fullScreen";
  v2[1] = @"pageSheet";
  v3[0] = &unk_26E59E7A0;
  v3[1] = &unk_26E59E7B8;
  v2[2] = @"formSheet";
  v2[3] = @"currentContext";
  v3[2] = &unk_26E59E7D0;
  v3[3] = &unk_26E59E7E8;
  v2[4] = @"custom";
  v2[5] = @"fullScreen";
  v3[4] = &unk_26E59E800;
  v3[5] = &unk_26E59E818;
  v2[6] = @"overCurrentContext";
  v2[7] = @"popover";
  v3[6] = &unk_26E59E7E8;
  v3[7] = &unk_26E59E830;
  v2[8] = @"blurOverFullScreen";
  v2[9] = @"none";
  v3[8] = &unk_26E59E848;
  v3[9] = &unk_26E59E860;
  v2[10] = @"playback";
  v2[11] = @"alert";
  v3[10] = &unk_26E59E878;
  v3[11] = &unk_26E59E890;
  v2[12] = @"actionSheet";
  v3[12] = &unk_26E59E8A8;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:13];
  v1 = (void *)presentationTypeKeyMap__typeKeyMap;
  presentationTypeKeyMap__typeKeyMap = v0;
}

- (TVModalPresentationConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)TVModalPresentationConfiguration;
  v2 = [(TVModalPresentationConfiguration *)&v8 init];
  v3 = v2;
  if (v2)
  {
    popOverSourceBarButtonItem = v2->_popOverSourceBarButtonItem;
    v2->_type = 0;
    v2->_popOverSourceBarButtonItem = 0;
    v2->_navigationBarHidden = 1;
    *(_WORD *)&v2->_allowsModalOverModal = 256;

    CGSize v5 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    v3->_popOverSourceRect.origin = (CGPoint)*MEMORY[0x263F001A8];
    v3->_popOverSourceRect.size = v5;
    popOverSourceView = v3->_popOverSourceView;
    v3->_popOverSourceView = 0;

    v3->_popOverArrowDirection = 15;
  }
  return v3;
}

- (TVModalPresentationConfiguration)initWithOptions:(id)a3
{
  id v4 = a3;
  CGSize v5 = [(TVModalPresentationConfiguration *)self init];
  if (v5)
  {
    v6 = [(id)objc_opt_class() presentationTypeKeyMap];
    v7 = [v4 objectForKey:@"presentationType"];
    objc_super v8 = [v6 objectForKey:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t type = [v8 integerValue];
    }
    else {
      uint64_t type = v5->_type;
    }
    v5->_uint64_t type = type;
  }
  return v5;
}

- (void)_applyAlertActionsForController:(id)a3
{
  id v4 = a3;
  id v5 = [(TVModalPresentationConfiguration *)self alertActions];
  [v4 _setActions:v5];
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_uint64_t type = a3;
}

- (BOOL)allowsModalOverModal
{
  return self->_allowsModalOverModal;
}

- (void)setAllowsModalOverModal:(BOOL)a3
{
  self->_allowsModalOverModal = a3;
}

- (BOOL)isMenuDismissable
{
  return self->_menuDismissable;
}

- (void)setMenuDismissable:(BOOL)a3
{
  self->_menuDismissable = a3;
}

- (BOOL)isNavigationBarHidden
{
  return self->_navigationBarHidden;
}

- (void)setNavigationBarHidden:(BOOL)a3
{
  self->_navigationBarHidden = a3;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (UIBarButtonItem)popOverSourceBarButtonItem
{
  return self->_popOverSourceBarButtonItem;
}

- (void)setPopOverSourceBarButtonItem:(id)a3
{
}

- (UIView)popOverSourceView
{
  return self->_popOverSourceView;
}

- (void)setPopOverSourceView:(id)a3
{
}

- (CGRect)popOverSourceRect
{
  double x = self->_popOverSourceRect.origin.x;
  double y = self->_popOverSourceRect.origin.y;
  double width = self->_popOverSourceRect.size.width;
  double height = self->_popOverSourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPopOverSourceRect:(CGRect)a3
{
  self->_popOverSourceRect = a3;
}

- (unint64_t)popOverArrowDirection
{
  return self->_popOverArrowDirection;
}

- (void)setPopOverArrowDirection:(unint64_t)a3
{
  self->_popOverArrowDirection = a3;
}

- (NSArray)alertActions
{
  return self->_alertActions;
}

- (void)setAlertActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertActions, 0);
  objc_storeStrong((id *)&self->_popOverSourceView, 0);
  objc_storeStrong((id *)&self->_popOverSourceBarButtonItem, 0);
}

@end