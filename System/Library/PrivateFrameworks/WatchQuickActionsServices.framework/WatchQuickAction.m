@interface WatchQuickAction
+ (BOOL)supportsSecureCoding;
+ (id)quickActionFromSerializedData:(id)a3 error:(id *)a4;
+ (id)serializedDataFromQuickAction:(id)a3 error:(id *)a4;
- (BOOL)allowsResizingAnimations;
- (BOOL)canShowOverlays;
- (BOOL)isEqual:(id)a3;
- (BOOL)started;
- (CGPoint)overlayInset;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedTitle;
- (UIBezierPath)path;
- (UIColor)overlayTintColor;
- (UIView)hostingView;
- (UIView)viewToOverlay;
- (WQAHostLifecycleObserver)hostLifecycleObserver;
- (WatchQuickAction)initWithCoder:(id)a3;
- (WatchQuickAction)initWithLocalizedTitle:(id)a3 activationCallback:(id)a4;
- (WatchQuickAction)initWithLocalizedTitle:(id)a3 targetView:(id)a4 activationCallback:(id)a5;
- (WatchQuickAction)initWithLocalizedTitle:(id)a3 targetView:(id)a4 hostingView:(id)a5 activationCallback:(id)a6;
- (WatchQuickActionAnimationHandler)animationHandler;
- (double)overlayCornerRadius;
- (id)activationCallback;
- (int64_t)internalQuickActionType;
- (int64_t)visualsToken;
- (void)_applyOverlayFromView:(id)a3 withHostingView:(id)a4;
- (void)_commonInitLocalizedTitle:(id)a3 quickActionType:(int64_t)a4 targetView:(id)a5 hostingView:(id)a6 withQuickActivationCallback:(id)a7 withQuickActivationEndCallback:(id)a8;
- (void)_updateOverlaysIfNecessary;
- (void)applyBezierPath:(id)a3 withHostingView:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)quickActionHostDidInvalidate;
- (void)setAllowsResizingAnimations:(BOOL)a3;
- (void)setAnimationHandler:(id)a3;
- (void)setHostLifecycleObserver:(id)a3;
- (void)setHostingView:(id)a3;
- (void)setInternalQuickActionType:(int64_t)a3;
- (void)setOverlayCornerRadius:(double)a3;
- (void)setOverlayInset:(CGPoint)a3;
- (void)setOverlayTintColor:(id)a3;
- (void)setPath:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setViewToOverlay:(id)a3;
- (void)setVisualsToken:(int64_t)a3;
- (void)start;
- (void)startWithCallback:(id)a3;
- (void)updateLocalizedTitle:(id)a3;
@end

@implementation WatchQuickAction

- (WatchQuickAction)initWithLocalizedTitle:(id)a3 activationCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WatchQuickAction;
  v8 = [(WatchQuickAction *)&v11 init];
  v9 = v8;
  if (v8) {
    [(WatchQuickAction *)v8 _commonInitLocalizedTitle:v6 quickActionType:1 targetView:0 hostingView:0 withQuickActivationCallback:v7 withQuickActivationEndCallback:0];
  }

  return v9;
}

- (WatchQuickAction)initWithLocalizedTitle:(id)a3 targetView:(id)a4 activationCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)WatchQuickAction;
  objc_super v11 = [(WatchQuickAction *)&v14 init];
  v12 = v11;
  if (v11) {
    [(WatchQuickAction *)v11 _commonInitLocalizedTitle:v8 quickActionType:1 targetView:v9 hostingView:0 withQuickActivationCallback:v10 withQuickActivationEndCallback:0];
  }

  return v12;
}

- (WatchQuickAction)initWithLocalizedTitle:(id)a3 targetView:(id)a4 hostingView:(id)a5 activationCallback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WatchQuickAction;
  objc_super v14 = [(WatchQuickAction *)&v17 init];
  v15 = v14;
  if (v14) {
    [(WatchQuickAction *)v14 _commonInitLocalizedTitle:v10 quickActionType:1 targetView:v11 hostingView:v12 withQuickActivationCallback:v13 withQuickActivationEndCallback:0];
  }

  return v15;
}

- (void)start
{
}

- (void)startWithCallback:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, uint64_t, void))a3;
  v13[0] = @"id";
  v5 = [(WatchQuickAction *)self identifier];
  v13[1] = @"started";
  v14[0] = v5;
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[WatchQuickAction started](self, "started"));
  v14[1] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  wqa_dump_call_stack(@"quick action start", v7);

  [(WatchQuickAction *)self _updateOverlaysIfNecessary];
  if ([(WatchQuickAction *)self started])
  {
    if (v4) {
      v4[2](v4, 1, 0);
    }
  }
  else
  {
    [(WatchQuickAction *)self setStarted:1];
    id v8 = +[WatchQuickActionsServices sharedInstance];
    id v12 = self;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
    [v8 registerQuickActions:v9 startupCallback:v4];

    id v10 = [(WatchQuickAction *)self viewToOverlay];

    if (v10)
    {
      id v11 = [(WatchQuickAction *)self viewToOverlay];
      objc_msgSend(v11, "_wqa_registerQuickActionForBoundingPathChanges:", self);
    }
  }
}

- (void)cancel
{
  v16[2] = *MEMORY[0x263EF8340];
  v15[0] = @"id";
  v3 = [(WatchQuickAction *)self identifier];
  v15[1] = @"started";
  v16[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[WatchQuickAction started](self, "started"));
  v16[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  wqa_dump_call_stack(@"quick action cancel", v5);

  if ([(WatchQuickAction *)self started])
  {
    [(WatchQuickAction *)self setStarted:0];
    id v6 = self;
    id v7 = [(WatchQuickAction *)v6 identifier];
    if (v7)
    {
      id v8 = +[WatchQuickActionsServices sharedInstance];
      objc_super v14 = v7;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
      [v8 unregisterQuickActionIdentifiers:v9 startupCallback:0];
    }
    id v10 = [(WatchQuickAction *)v6 animationHandler];
    id v11 = v10;
    if (v10) {
      [v10 quickActionDidBecomeInactive:v6];
    }
    id v12 = [(WatchQuickAction *)v6 viewToOverlay];

    if (v12)
    {
      id v13 = [(WatchQuickAction *)v6 viewToOverlay];
      objc_msgSend(v13, "_wqa_unregisterExistingQuickActionForBoundingPathChanges");
    }
  }
}

- (void)updateLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);

  [(WatchQuickAction *)self _updateOverlaysIfNecessary];
}

- (void)dealloc
{
  v3 = [(WatchQuickAction *)self viewToOverlay];
  objc_msgSend(v3, "_wqa_unregisterExistingQuickActionForBoundingPathChanges");

  [(WatchQuickAction *)self cancel];
  v4.receiver = self;
  v4.super_class = (Class)WatchQuickAction;
  [(WatchQuickAction *)&v4 dealloc];
}

- (void)_commonInitLocalizedTitle:(id)a3 quickActionType:(int64_t)a4 targetView:(id)a5 hostingView:(id)a6 withQuickActivationCallback:(id)a7 withQuickActivationEndCallback:(id)a8
{
  v27[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  objc_super v17 = (void *)MEMORY[0x263F08C38];
  id v18 = a7;
  v19 = [v17 UUID];
  v20 = [v19 UUIDString];
  identifier = self->_identifier;
  self->_identifier = v20;

  objc_storeStrong((id *)&self->_localizedTitle, a3);
  v22 = (void *)MEMORY[0x23ECAB890](v18);

  id activationCallback = self->_activationCallback;
  self->_id activationCallback = v22;

  *(_OWORD *)&self->_overlayCornerRadius = xmmword_239C03C10;
  self->_overlayInset.y = 2.0;
  [(WatchQuickAction *)self setInternalQuickActionType:a4];
  [(WatchQuickAction *)self setAllowsResizingAnimations:1];
  if (v15)
  {
    [(WatchQuickAction *)self _applyOverlayFromView:v15 withHostingView:v16];
    [v15 setQuickActionHostObserver:self];
  }
  v24 = self->_identifier;
  v26 = @"id";
  v27[0] = v24;
  v25 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
  wqa_dump_call_stack(@"quick action init", v25);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (WatchQuickAction *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WatchQuickAction *)v4 identifier];
      id v6 = [(WatchQuickAction *)self identifier];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSString)description
{
  v3 = [(WatchQuickAction *)self hostingView];

  objc_super v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  char v7 = [(WatchQuickAction *)self localizedTitle];
  if (v3)
  {
    id v8 = [(WatchQuickAction *)self hostingView];
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    id v11 = [(WatchQuickAction *)self hostingView];
    id v12 = [(WatchQuickAction *)self identifier];
    id v13 = [v4 stringWithFormat:@"[%@<%p>] title=%@, hostingView=[%@<%p>], id=\"%@\"", v6, self, v7, v10, v11, v12];
  }
  else
  {
    id v8 = [(WatchQuickAction *)self identifier];
    id v13 = [v4 stringWithFormat:@"[%@<%p>] title=%@, id=\"%@\"", v6, self, v7, v8];
  }

  return (NSString *)v13;
}

- (void)setOverlayTintColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_overlayTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overlayTintColor, a3);
    [(WatchQuickAction *)self _updateOverlaysIfNecessary];
  }
}

- (void)setOverlayCornerRadius:(double)a3
{
  if (self->_overlayCornerRadius != a3)
  {
    self->_overlayCornerRadius = a3;
    [(WatchQuickAction *)self _updateOverlaysIfNecessary];
  }
}

- (void)setOverlayInset:(CGPoint)a3
{
  if (self->_overlayInset.x != a3.x || self->_overlayInset.y != a3.y)
  {
    self->_overlayInset = a3;
    [(WatchQuickAction *)self _updateOverlaysIfNecessary];
  }
}

- (void)_updateOverlaysIfNecessary
{
  v3 = [(WatchQuickAction *)self viewToOverlay];

  if (v3)
  {
    id v5 = [(WatchQuickAction *)self viewToOverlay];
    objc_super v4 = [(WatchQuickAction *)self hostingView];
    [(WatchQuickAction *)self _applyOverlayFromView:v5 withHostingView:v4];
  }
}

- (void)_applyOverlayFromView:(id)a3 withHostingView:(id)a4
{
  id v47 = a3;
  id v6 = a4;
  [(WatchQuickAction *)self setViewToOverlay:v47];
  if (v6) {
    char v7 = v6;
  }
  else {
    char v7 = v47;
  }
  id v8 = v7;
  id v9 = [v47 parentFocusEnvironment];
  id v10 = [v9 focusItemContainer];
  id v11 = [v10 coordinateSpace];

  [v47 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [v8 coordinateSpace];
  objc_msgSend(v11, "convertRect:toCoordinateSpace:", v20, v13, v15, v17, v19);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;

  [(WatchQuickAction *)self overlayInset];
  CGFloat v30 = v29;
  [(WatchQuickAction *)self overlayInset];
  CGFloat v32 = v31;
  v49.origin.double x = v22;
  v49.origin.double y = v24;
  v49.size.double width = v26;
  v49.size.double height = v28;
  CGRect v50 = CGRectInset(v49, v30, v32);
  double x = v50.origin.x;
  double y = v50.origin.y;
  double width = v50.size.width;
  double height = v50.size.height;
  v37 = [v47 layer];
  [(WatchQuickAction *)self overlayCornerRadius];
  if (v38 >= 0.0)
  {
    [(WatchQuickAction *)self overlayCornerRadius];
    goto LABEL_8;
  }
  [v37 cornerRadius];
  double v39 = 8.0;
  if (v40 > 0.0)
  {
    [v37 cornerRadius];
LABEL_8:
    double v39 = v41;
  }
  [v37 cornerRadius];
  if (v42 > 0.0
    && ([v37 cornerCurve],
        v43 = objc_claimAutoreleasedReturnValue(),
        int v44 = [v43 isEqualToString:*MEMORY[0x263F15A20]],
        v43,
        v44))
  {
    uint64_t v45 = objc_msgSend(MEMORY[0x263F1C478], "_bezierPathWithPillRect:cornerRadius:", x, y, width, height, v39);
  }
  else
  {
    uint64_t v45 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v39);
  }
  v46 = (void *)v45;
  [(WatchQuickAction *)self applyBezierPath:v45 withHostingView:v8];
}

- (void)applyBezierPath:(id)a3 withHostingView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(WatchQuickAction *)self setVisualsToken:[(WatchQuickAction *)self visualsToken] + 1];
  [(WatchQuickAction *)self setHostingView:v6];

  [(WatchQuickAction *)self setPath:v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WatchQuickAction *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WatchQuickAction internalQuickActionType](self, "internalQuickActionType"), @"quickActionType");
  id v6 = [(WatchQuickAction *)self localizedTitle];
  [v4 encodeObject:v6 forKey:@"localizedTitle"];
}

- (WatchQuickAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WatchQuickAction;
  id v5 = [(WatchQuickAction *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_internalQuickActionType = [v4 decodeIntegerForKey:@"quickActionType"];
    uint64_t v8 = [v4 decodeObjectForKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v8;
  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (id)activationCallback
{
  return self->_activationCallback;
}

- (WatchQuickActionAnimationHandler)animationHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationHandler);

  return (WatchQuickActionAnimationHandler *)WeakRetained;
}

- (void)setAnimationHandler:(id)a3
{
}

- (UIView)viewToOverlay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewToOverlay);

  return (UIView *)WeakRetained;
}

- (void)setViewToOverlay:(id)a3
{
}

- (UIView)hostingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingView);

  return (UIView *)WeakRetained;
}

- (void)setHostingView:(id)a3
{
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (int64_t)visualsToken
{
  return self->_visualsToken;
}

- (void)setVisualsToken:(int64_t)a3
{
  self->_visualsToken = a3;
}

- (int64_t)internalQuickActionType
{
  return self->_internalQuickActionType;
}

- (void)setInternalQuickActionType:(int64_t)a3
{
  self->_internalQuickActionType = a3;
}

- (WQAHostLifecycleObserver)hostLifecycleObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostLifecycleObserver);

  return (WQAHostLifecycleObserver *)WeakRetained;
}

- (void)setHostLifecycleObserver:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (UIColor)overlayTintColor
{
  return self->_overlayTintColor;
}

- (BOOL)allowsResizingAnimations
{
  return self->_allowsResizingAnimations;
}

- (void)setAllowsResizingAnimations:(BOOL)a3
{
  self->_allowsResizingAnimations = a3;
}

- (double)overlayCornerRadius
{
  return self->_overlayCornerRadius;
}

- (CGPoint)overlayInset
{
  double x = self->_overlayInset.x;
  double y = self->_overlayInset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayTintColor, 0);
  objc_destroyWeak((id *)&self->_hostLifecycleObserver);
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak((id *)&self->_hostingView);
  objc_destroyWeak((id *)&self->_viewToOverlay);
  objc_destroyWeak((id *)&self->_animationHandler);
  objc_storeStrong(&self->_activationCallback, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)serializedDataFromQuickAction:(id)a3 error:(id *)a4
{
  id v9 = 0;
  id v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v9];
  id v6 = v9;
  id v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return v5;
}

+ (id)quickActionFromSerializedData:(id)a3 error:(id *)a4
{
  void v15[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 length])
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    uint64_t v8 = [v6 setWithArray:v7];

    id v14 = 0;
    id v9 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v8 fromData:v5 error:&v14];
    id v10 = v14;
    objc_super v11 = v10;
    if (a4) {
      *a4 = v10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v9;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)quickActionHostDidInvalidate
{
  id v3 = [(WatchQuickAction *)self hostLifecycleObserver];
  [v3 quickActionHostInvalidated:self];
}

- (BOOL)canShowOverlays
{
  id v3 = [(WatchQuickAction *)self quickActionHostingView];
  if (v3)
  {
    id v4 = [(WatchQuickAction *)self quickActionPrimaryView];
    if (v4)
    {
      id v5 = [(WatchQuickAction *)self quickActionPath];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end