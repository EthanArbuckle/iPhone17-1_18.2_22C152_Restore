@interface UIInputSetContainerView
+ (BOOL)_notifyOnExplicitLayout;
+ (BOOL)_shouldHitTestInputViewFirst;
- (BOOL)_disableGeometryObserverNotification;
- (BOOL)_isTransparentFocusRegion;
- (BOOL)hasHostedViews;
- (CGPoint)offsetOrigin;
- (CGRect)_accessoryViewFrame;
- (UIInputSetContainerView)initWithFrame:(CGRect)a3;
- (UIScreen)hostingScreen;
- (id)_inheritedRenderConfig;
- (id)_inputWindowController;
- (void)_didRemoveSubview:(id)a3;
- (void)_setAccessoryViewFrame:(CGRect)a3;
- (void)_setRenderConfig:(id)a3;
- (void)addHostedView:(id)a3 withViewRemovalHandler:(id)a4;
- (void)addSubview:(id)a3;
- (void)dealloc;
- (void)didAddSubview:(id)a3;
- (void)performWithoutGeometryObserverNotifications:(id)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setOffsetOrigin:(CGPoint)a3;
@end

@implementation UIInputSetContainerView

- (void)didAddSubview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIInputSetContainerView;
  [(UIView *)&v6 didAddSubview:a3];
  v4 = [(UIView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(UIView *)self superview];
  }
  else
  {
    v5 = 0;
  }

  [v5 _sortSubviewsOfView:self];
}

- (id)_inheritedRenderConfig
{
  return self->_renderConfig;
}

- (UIInputSetContainerView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIInputSetContainerView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v10.receiver = v3;
    v10.super_class = (Class)UIInputSetContainerView;
    v5 = [(UIView *)&v10 _inheritedRenderConfig];
    objc_super v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = +[UIKBRenderConfig defaultConfig];
    }
    v8 = v7;

    [(UIInputSetContainerView *)v4 _setRenderConfig:v8];
  }
  return v4;
}

- (void)_setRenderConfig:(id)a3
{
  id v5 = a3;
  if ([v5 lightKeyboard]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  if (+[UIKeyboard usesInputSystemUI])
  {
    id v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v8 = [v7 remoteInputViewHost];

    v9 = [v8 inputViewWindow];
    objc_super v10 = [v9 rootViewController];
    [v10 setOverrideUserInterfaceStyle:v6];
  }
  else
  {
    [(UIView *)self setOverrideUserInterfaceStyle:v6];
  }
  objc_storeStrong((id *)&self->_renderConfig, a3);
  objc_super v11 = [(UIView *)self _rootInputWindowController];
  char v12 = [v11 updateGuideBackdropRenderConfig:v5 animated:0];

  if ([v5 animatedBackground] && (v12 & 1) == 0)
  {
    v13 = [(UIView *)self _rootInputWindowController];
    [v13 updateBackdropRenderConfig:v5];
  }
  v14.receiver = self;
  v14.super_class = (Class)UIInputSetContainerView;
  [(UIView *)&v14 _setRenderConfig:v5];
}

+ (BOOL)_shouldHitTestInputViewFirst
{
  return 0;
}

- (void)addSubview:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIInputSetContainerView;
  [(UIView *)&v3 addSubview:a3];
}

- (void)setFrame:(CGRect)a3
{
  CGFloat v3 = a3.origin.x + self->_offsetOrigin.x;
  CGFloat v4 = a3.origin.y + self->_offsetOrigin.y;
  v5.receiver = self;
  v5.super_class = (Class)UIInputSetContainerView;
  -[UIView setFrame:](&v5, sel_setFrame_, v3, v4, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  hostedViews = self->_hostedViews;
  self->_hostedViews = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIInputSetContainerView;
  [(UIView *)&v4 dealloc];
}

- (id)_inputWindowController
{
  v2 = [(UIView *)self nextResponder];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    CGFloat v3 = v2;
  }
  else {
    CGFloat v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (CGRect)_accessoryViewFrame
{
  v2 = [(UIInputSetContainerView *)self _inputWindowController];
  CGFloat v3 = [v2 inputAccessoryView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_setAccessoryViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(UIInputSetContainerView *)self _inputWindowController];
  double v9 = [v8 inputAccessoryView];
  objc_msgSend(v9, "setFrame:", x, y, width, height);

  id v10 = [(UIInputSetContainerView *)self _inputWindowController];
  [v10 setHostingNeedsLayout];
}

+ (BOOL)_notifyOnExplicitLayout
{
  return 0;
}

- (UIScreen)hostingScreen
{
  v2 = [(UIView *)self window];
  CGFloat v3 = [v2 screen];

  return (UIScreen *)v3;
}

- (void)addHostedView:(id)a3 withViewRemovalHandler:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v14)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"subview must not be nil"];
    if (v6) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"removalHandler must not be nil"];
LABEL_3:
  double v7 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v14];
  uint64_t v8 = [(NSMutableDictionary *)self->_hostedViews objectForKey:v7];
  double v9 = (void *)v8;
  if (v8) {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
  hostedViews = self->_hostedViews;
  if (!hostedViews)
  {
    double v11 = [MEMORY[0x1E4F1CA60] dictionary];
    double v12 = self->_hostedViews;
    self->_hostedViews = v11;

    hostedViews = self->_hostedViews;
  }
  double v13 = (void *)[v6 copy];
  [(NSMutableDictionary *)hostedViews setObject:v13 forKey:v7];

  [(UIInputSetContainerView *)self addSubview:v14];
}

- (BOOL)hasHostedViews
{
  return [(NSMutableDictionary *)self->_hostedViews count] != 0;
}

- (void)_didRemoveSubview:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIInputSetContainerView;
  id v4 = a3;
  [(UIView *)&v8 _didRemoveSubview:v4];
  double v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithNonretainedObject:", v4, v8.receiver, v8.super_class);

  id v6 = [(NSMutableDictionary *)self->_hostedViews objectForKey:v5];
  if (v6)
  {
    [(NSMutableDictionary *)self->_hostedViews removeObjectForKey:v5];
    if (![(NSMutableDictionary *)self->_hostedViews count])
    {
      hostedViews = self->_hostedViews;
      self->_hostedViews = 0;
    }
    v6[2](v6);
  }
}

- (void)performWithoutGeometryObserverNotifications:(id)a3
{
  self->_disableGeometryObserverNotifications = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_disableGeometryObserverNotifications = 0;
}

- (BOOL)_disableGeometryObserverNotification
{
  return self->_disableGeometryObserverNotifications;
}

- (void)setOffsetOrigin:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIView *)self origin];
  double v7 = v6 - self->_offsetOrigin.x;
  double v9 = v8 - self->_offsetOrigin.y;
  self->_offsetOrigin.CGFloat x = x;
  self->_offsetOrigin.CGFloat y = y;
  -[UIView setOrigin:](self, "setOrigin:", v7, v9);
}

- (void)setCenter:(CGPoint)a3
{
  CGFloat v3 = a3.x + self->_offsetOrigin.x;
  CGFloat v4 = a3.y + self->_offsetOrigin.y;
  v5.receiver = self;
  v5.super_class = (Class)UIInputSetContainerView;
  -[UIView setCenter:](&v5, sel_setCenter_, v3, v4);
}

- (BOOL)_isTransparentFocusRegion
{
  return 1;
}

- (CGPoint)offsetOrigin
{
  double x = self->_offsetOrigin.x;
  double y = self->_offsetOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedViews, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
}

@end