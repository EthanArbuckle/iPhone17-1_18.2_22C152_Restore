@interface TUIControlView
+ (id)menuWithChildren:(id)a3;
+ (id)renderModelWithStateToButtonAttributes:(id)a3 stateToRenderModel:(id)a4 imageModelIDToResource:(id)a5 actionHandler:(id)a6 viewState:(id)a7 linkEntities:(id)a8 type:(unint64_t)a9 role:(unint64_t)a10 userInterfaceStyle:(unint64_t)a11 enabled:(BOOL)a12 pressScale:(double)a13 touchInsets:(UIEdgeInsets)a14 identifier:(id)a15 style:(id)a16 pointer:(id)a17 focusStyle:(id)a18 menu:(id)a19 contextMenuIsPrimaryAction:(BOOL)a20 name:(id)a21 axAttributes:(id)a22 enableBackgroundForHighlightPreview:(BOOL)a23 enableShadowForHighlightPreview:(BOOL)a24;
+ (id)tuiReuseIdentifier;
+ (int64_t)uiButtonRoleFromTUIButtonRole:(unint64_t)a3;
+ (int64_t)uiButtonTypeFromTUIButtonType:(unint64_t)a3;
+ (int64_t)uiUserInterfaceStyleFromTUIUserInterfaceStyle:(unint64_t)a3;
+ (unint64_t)uiControlStateFromTUIElementState:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)hoverActive;
- (BOOL)presentContextMenuForAccessibility;
- (NSMutableSet)cursorEnteredIdentifiers;
- (TUIButtonAttributes)currentButtonAttributes;
- (TUIControlView)initWithFrame:(CGRect)a3;
- (TUIFocusStylingHelper)focusHelper;
- (TUIInteractionsHelper)interactionHelper;
- (UIHoverGestureRecognizer)hoverGestureRecognizer;
- (UIPointerInteraction)pointerInteraction;
- (UITapGestureRecognizer)selectGestureRecognizer;
- (id)_contextMenuConfigurationForPoint:(CGPoint)a3;
- (id)_pointerTargetViewWithRefId:(id)a3;
- (id)accessibilityLabel;
- (id)contextMenuConfigurationForButton:(id)a3 point:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)currentState;
- (id)focusEffect;
- (id)focusGroupIdentifier;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)keyCommands;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_buttonPressed:(id)a3;
- (void)_cleanUp;
- (void)_hoverGesture:(id)a3;
- (void)_selectGesture:(id)a3;
- (void)_showContextMenu:(id)a3;
- (void)_updateHoverActive;
- (void)button:(id)a3 contextMenuInteraction:(id)a4 willDisplayMenuForConfiguration:(id)a5 animator:(id)a6;
- (void)button:(id)a3 contextMenuInteraction:(id)a4 willEndForConfiguration:(id)a5 animator:(id)a6;
- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)didUpdateSubviews;
- (void)imageResourceDidChangeImage:(id)a3;
- (void)loadControlIfNeeded;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)prepareForReuse;
- (void)renderModelUpdated;
- (void)setCurrentButtonAttributes:(id)a3;
- (void)tui_handleContextMenuKey:(id)a3;
- (void)tui_handleSelectKey:(id)a3;
- (void)viewDidEndDisplay;
@end

@implementation TUIControlView

- (TUIControlView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUIControlView;
  result = -[TUIControlView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_cachedDynamicMenuDataLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)renderModelWithStateToButtonAttributes:(id)a3 stateToRenderModel:(id)a4 imageModelIDToResource:(id)a5 actionHandler:(id)a6 viewState:(id)a7 linkEntities:(id)a8 type:(unint64_t)a9 role:(unint64_t)a10 userInterfaceStyle:(unint64_t)a11 enabled:(BOOL)a12 pressScale:(double)a13 touchInsets:(UIEdgeInsets)a14 identifier:(id)a15 style:(id)a16 pointer:(id)a17 focusStyle:(id)a18 menu:(id)a19 contextMenuIsPrimaryAction:(BOOL)a20 name:(id)a21 axAttributes:(id)a22 enableBackgroundForHighlightPreview:(BOOL)a23 enableShadowForHighlightPreview:(BOOL)a24
{
  double right = a14.right;
  double bottom = a14.bottom;
  double left = a14.left;
  double top = a14.top;
  id v49 = a22;
  id v47 = a21;
  id v43 = a19;
  id v56 = a18;
  id v32 = a17;
  id v48 = a16;
  id v44 = a15;
  id v42 = a8;
  id v33 = a7;
  id v46 = a6;
  id v51 = a5;
  id v34 = a4;
  id v53 = a3;
  v35 = [TUIRenderModelButton alloc];
  v55 = [a1 tuiReuseIdentifier];
  LOWORD(v41) = __PAIR16__(a24, a23);
  LOBYTE(v40) = a20;
  LOBYTE(v39) = a12;
  v36 = v34;
  v37 = -[TUIRenderModelButton initWithReuseIdentifier:identifier:style:stateToButtonAttributes:stateToRenderModel:imageModelIDToResource:actionHandler:viewState:linkEntities:type:role:userInterfaceStyle:enabled:pressScale:touchInsets:pointer:focusStyle:menu:contextMenuIsPrimaryAction:name:axAttributes:enableBackgroundForHighlightPreview:enableShadowForHighlightPreview:](v35, "initWithReuseIdentifier:identifier:style:stateToButtonAttributes:stateToRenderModel:imageModelIDToResource:actionHandler:viewState:linkEntities:type:role:userInterfaceStyle:enabled:pressScale:touchInsets:pointer:focusStyle:menu:contextMenuIsPrimaryAction:name:axAttributes:enableBackgroundForHighlightPreview:enableShadowForHighlightPreview:", v55, v44, v48, v53, v34, v51, a13, top, left, bottom, right, v46, v33, v42, a9,
          a10,
          a11,
          v39,
          v32,
          v56,
          v43,
          v40,
          v47,
          v49,
          v41);

  return v37;
}

- (void)dealloc
{
  v3 = [(TUIInteractiveBaseView *)self control];
  [v3 removeTarget:self action:"_buttonPressed:" forControlEvents:64];
  [v3 removeObserver:self forKeyPath:@"enabled"];
  [v3 removeObserver:self forKeyPath:@"highlighted"];
  objc_super v4 = [(TUIInteractiveBaseView *)self renderModel];
  v5 = [v4 imageModelIDToResource];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1848A0;
  v7[3] = &unk_2518F8;
  v7[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];

  v6.receiver = self;
  v6.super_class = (Class)TUIControlView;
  [(TUIControlView *)&v6 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_2DEDC8 == a6)
  {
    if (+[NSThread isMainThread])
    {
      [(TUIInteractiveBaseView *)self updateFromState];
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1849D8;
      block[3] = &unk_251990;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TUIControlView;
    -[TUIControlView observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(TUIInteractiveBaseView *)self control];
  [v8 convertPoint:self x:y];
  double v10 = v9;
  double v12 = v11;

  if (([(TUIControlView *)self isHidden] & 1) != 0
    || ([(TUIControlView *)self alpha], v13 < 0.01)
    || ([(TUIInteractiveBaseView *)self control],
        v14 = objc_claimAutoreleasedReturnValue(),
        unsigned int v15 = objc_msgSend(v14, "pointInside:withEvent:", v7, v10, v12),
        v14,
        !v15))
  {
    v19.receiver = self;
    v19.super_class = (Class)TUIControlView;
    v17 = -[TUIControlView hitTest:withEvent:](&v19, "hitTest:withEvent:", v7, x, y);
  }
  else
  {
    v16 = [(TUIInteractiveBaseView *)self control];
    v17 = [v16 hitTest:v7 withEvent:v10, v12];
  }

  return v17;
}

- (void)renderModelUpdated
{
  v18.receiver = self;
  v18.super_class = (Class)TUIControlView;
  [(TUIInteractiveBaseView *)&v18 renderModelUpdated];
  focusHelper = self->_focusHelper;
  if (focusHelper)
  {
    objc_super v4 = [(TUIInteractiveBaseView *)self renderModel];
    v5 = [v4 focusStyle];
    [(TUIFocusStylingHelper *)focusHelper updateStyle:v5];
  }
  else
  {
    objc_super v6 = [TUIFocusStylingHelper alloc];
    objc_super v4 = [(TUIInteractiveBaseView *)self control];
    v5 = [(TUIInteractiveBaseView *)self renderModel];
    id v7 = [v5 focusStyle];
    v8 = [(TUIFocusStylingHelper *)v6 initWithContainer:self reference:v4 style:v7];
    double v9 = self->_focusHelper;
    self->_focusHelper = v8;
  }
  interactionHelper = self->_interactionHelper;
  if (!interactionHelper)
  {
    double v11 = [[TUIInteractionsHelper alloc] initWithView:self];
    double v12 = self->_interactionHelper;
    self->_interactionHelper = v11;

    interactionHelper = self->_interactionHelper;
  }
  double v13 = [(TUIInteractiveBaseView *)self renderModel];
  v14 = [v13 linkEntities];
  [(TUIInteractionsHelper *)interactionHelper updateWithLinkEntities:v14];

  unsigned int v15 = self->_interactionHelper;
  v16 = [(TUIReusableBaseView *)self feedControllerHost];
  v17 = [v16 interactionBuilder];
  [(TUIInteractionsHelper *)v15 updateInteractionsWithBuilder:v17];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)TUIControlView;
  [(TUIInteractiveBaseView *)&v3 prepareForReuse];
  [(TUIControlView *)self _cleanUp];
}

- (void)viewDidEndDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)TUIControlView;
  [(TUIInteractiveBaseView *)&v3 viewDidEndDisplay];
  [(TUIControlView *)self _cleanUp];
}

- (void)_cleanUp
{
  [(TUIFocusStylingHelper *)self->_focusHelper reset];
  focusHelper = self->_focusHelper;
  self->_focusHelper = 0;

  [(TUIInteractionsHelper *)self->_interactionHelper detachInteractions];
  interactionHelper = self->_interactionHelper;
  self->_interactionHelper = 0;

  if (self->_pointerInteraction)
  {
    v5 = [(TUIInteractiveBaseView *)self control];
    [v5 removeInteraction:self->_pointerInteraction];

    pointerInteraction = self->_pointerInteraction;
    self->_pointerInteraction = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customContextMenuInteraction);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_customContextMenuInteraction);
    [(TUIControlView *)self removeInteraction:v8];

    objc_storeWeak((id *)&self->_customContextMenuInteraction, 0);
  }
  if (self->_hoverGestureRecognizer)
  {
    -[TUIControlView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    hoverGestureRecognizer = self->_hoverGestureRecognizer;
    self->_hoverGestureRecognizer = 0;
  }
  if (self->_selectGestureRecognizer)
  {
    -[TUIControlView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    selectGestureRecognizer = self->_selectGestureRecognizer;
    self->_selectGestureRecognizer = 0;
  }
}

- (BOOL)canBecomeFocused
{
  return [(TUIFocusStylingHelper *)self->_focusHelper canBecomeFocused];
}

- (id)focusGroupIdentifier
{
  return [(TUIFocusStylingHelper *)self->_focusHelper focusGroupIdentifier];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v9 nextFocusedItem];

  if (v7 == self)
  {
    [(TUIFocusStylingHelper *)self->_focusHelper activateEffectWithAnimationCoordinator:v6];
  }
  else
  {
    id v8 = [v9 previouslyFocusedItem];

    if (v8 == self) {
      [(TUIFocusStylingHelper *)self->_focusHelper deactivateEffectWithAnimationCoordinator:v6];
    }
  }
}

- (id)focusEffect
{
  return [(TUIFocusStylingHelper *)self->_focusHelper focusEffect];
}

- (id)keyCommands
{
  v2 = [(TUIInteractiveBaseView *)self renderModel];
  objc_super v3 = [v2 actionHandler];
  objc_super v4 = [v3 keyCommands];

  return v4;
}

- (void)tui_handleSelectKey:(id)a3
{
  id v5 = [(TUIInteractiveBaseView *)self renderModel];
  objc_super v4 = [v5 actionHandler];
  [v4 invoke:@"press" view:self];
}

- (void)tui_handleContextMenuKey:(id)a3
{
  id v5 = [(TUIInteractiveBaseView *)self renderModel];
  objc_super v4 = [v5 actionHandler];
  [v4 invoke:@"context-menu" view:self];
}

+ (id)tuiReuseIdentifier
{
  return @"TUIReuseIdentifierControlView";
}

- (id)currentState
{
  objc_super v3 = [(TUIInteractiveBaseView *)self control];
  unsigned int v4 = [v3 isEnabled];

  id v5 = [(TUIInteractiveBaseView *)self control];
  unsigned int v6 = [v5 isHighlighted];

  id v7 = [(TUIInteractiveBaseView *)self renderModel];
  id v8 = [v7 pointer];
  id v9 = [v8 refId];

  double v10 = TUIElementStateHover;
  if (!self->_hoverActive)
  {
    if ([v9 length])
    {
      if (![(NSMutableSet *)self->_cursorEnteredIdentifiers containsObject:v9]) {
        double v10 = TUIElementStateDefault;
      }
    }
    else
    {
      double v10 = TUIElementStateDefault;
    }
  }
  double v11 = TUIElementStateDisabled;
  if (v4) {
    double v11 = v10;
  }
  if (v6) {
    double v11 = TUIElementStateHighlighted;
  }
  double v12 = *v11;

  return v12;
}

- (void)didUpdateSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TUIControlView;
  [(TUIInteractiveBaseView *)&v3 didUpdateSubviews];
  [(UIPointerInteraction *)self->_pointerInteraction invalidate];
}

- (void)loadControlIfNeeded
{
  v54 = [(TUIInteractiveBaseView *)self control];
  if (!v54)
  {
    uint64_t v3 = objc_opt_class();
    unsigned int v4 = [(TUIInteractiveBaseView *)self renderModel];
    id v5 = TUIDynamicCast(v3, v4);

    v54 = +[TUIUIKitButton buttonWithType:](TUIUIKitButton, "buttonWithType:", +[TUIControlView uiButtonTypeFromTUIButtonType:](TUIControlView, "uiButtonTypeFromTUIButtonType:", [v5 type]));
    [(TUIControlView *)self bounds];
    [v54 frameForAlignmentRect:];
    [v54 setFrame:];
    [v54 setEnabled:1];
    [v54 setAutoresizingMask:18];
    [v54 addTarget:self action:"_buttonPressed:" forControlEvents:64];
    [v54 addObserver:self forKeyPath:@"enabled" options:0 context:off_2DEDC8];
    [v54 addObserver:self forKeyPath:@"highlighted" options:0 context:off_2DEDC8];
    [v54 setTui_delegate:self];
    [(TUIControlView *)self addSubview:v54];
    [(TUIInteractiveBaseView *)self setControl:v54];
  }
  if (!self->_selectGestureRecognizer)
  {
    unsigned int v6 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_selectGesture:"];
    selectGestureRecognizer = self->_selectGestureRecognizer;
    self->_selectGestureRecognizer = v6;

    [(UITapGestureRecognizer *)self->_selectGestureRecognizer setAllowedTouchTypes:&__NSArray0__struct];
    [(UITapGestureRecognizer *)self->_selectGestureRecognizer setAllowedPressTypes:&off_2663E0];
    [(TUIControlView *)self addGestureRecognizer:self->_selectGestureRecognizer];
  }
  if (_TUIDeviceHasInternalInstall())
  {
    uint64_t v8 = [(TUIInteractiveBaseView *)self renderModel];
    if (v8)
    {
      id v9 = (void *)v8;
      double v10 = [(TUIInteractiveBaseView *)self renderModel];
      char v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0)
      {
        v21 = TUIRenderModelLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_192C0C(self);
        }

        v22 = self;
        uint64_t v23 = 0;
        id v53 = v22;
        do
        {
          uint64_t v24 = objc_opt_class();
          uint64_t v25 = TUIDynamicCast(v24, v22);
          if (v25)
          {
            v26 = (void *)v25;
            uint64_t v27 = objc_opt_class();
            v28 = [(TUIControlView *)v22 scrollingDelegate];
            v29 = TUIDynamicCast(v27, v28);

            if (v29) {
              break;
            }
          }
          uint64_t v30 = objc_opt_class();
          TUIDynamicCast(v30, v22);
          v31 = (TUIControlView *)objc_claimAutoreleasedReturnValue();
          id v32 = TUIRenderModelLog();
          BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
          if (v31)
          {
            if (v33)
            {
              id v34 = [(TUIReusableBaseView *)v31 layoutAttributes];
              v35 = [v34 renderModel];
              *(_DWORD *)buf = 134218498;
              uint64_t v58 = v23;
              __int16 v59 = 2112;
              v60 = v31;
              __int16 v61 = 2112;
              v62 = v35;
              _os_log_error_impl(&def_141F14, v32, OS_LOG_TYPE_ERROR, "superview[%lu]: %@, renderModel=%@", buf, 0x20u);
            }
          }
          else if (v33)
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v58 = v23;
            __int16 v59 = 2112;
            v60 = v22;
            _os_log_error_impl(&def_141F14, v32, OS_LOG_TYPE_ERROR, "superView[%lu]: %@ (not renderModel based)", buf, 0x16u);
          }

          ++v23;
          uint64_t v36 = [(TUIControlView *)v22 superview];

          v22 = (TUIControlView *)v36;
        }
        while (v36);
        uint64_t v37 = objc_opt_class();
        v38 = TUIDynamicCast(v37, v22);
        uint64_t v39 = TUIRenderModelLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_192B6C(v38);
        }

        id v40 = objc_alloc((Class)NSException);
        v55[0] = @"renderModel";
        uint64_t v41 = [(TUIInteractiveBaseView *)v53 renderModel];
        v56[0] = v41;
        v55[1] = @"renderModelIdentifier";
        id v42 = [(TUIInteractiveBaseView *)v53 renderModel];
        id v43 = [v42 identifier];
        uint64_t v44 = [v43 tui_identifierToString];
        v45 = (void *)v44;
        if (v44) {
          CFStringRef v46 = (const __CFString *)v44;
        }
        else {
          CFStringRef v46 = @"nil";
        }
        v56[1] = v46;
        v55[2] = @"renderModelReuseIdentifier";
        id v47 = [(TUIInteractiveBaseView *)v53 renderModel];
        uint64_t v48 = [v47 reuseIdentifier];
        id v49 = (void *)v48;
        if (v48) {
          CFStringRef v50 = (const __CFString *)v48;
        }
        else {
          CFStringRef v50 = @"nil";
        }
        v56[2] = v50;
        id v51 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:3];
        id v52 = [v40 initWithName:@"InvalidRenderModel" reason:@"A renderModel of the wrong type is used" userInfo:v51];

        objc_exception_throw(v52);
      }
    }
  }
  double v12 = [(TUIInteractiveBaseView *)self renderModel];
  double v13 = [v12 pointer];
  v14 = [v13 refId];
  id v15 = [v14 length];

  pointerInteraction = self->_pointerInteraction;
  if (pointerInteraction) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v15 == 0;
  }
  if (v17)
  {
    if (pointerInteraction && !v15)
    {
      [v54 removeInteraction:];
      objc_super v18 = self->_pointerInteraction;
      self->_pointerInteraction = 0;
    }
  }
  else
  {
    objc_super v19 = (UIPointerInteraction *)[objc_alloc((Class)UIPointerInteraction) initWithDelegate:self];
    v20 = self->_pointerInteraction;
    self->_pointerInteraction = v19;

    [v54 addInteraction:self->_pointerInteraction];
  }
}

- (BOOL)presentContextMenuForAccessibility
{
  uint64_t v3 = [(TUIInteractiveBaseView *)self control];
  if ([v3 showsMenuAsPrimaryAction])
  {
    uint64_t WeakRetained = [v3 contextMenuInteraction];
  }
  else
  {
    uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_customContextMenuInteraction);
  }
  id v5 = (void *)WeakRetained;
  if (WeakRetained)
  {
    [v3 accessibilityActivationPoint];
    [v5 _presentMenuAtLocation:];
  }

  return v5 != 0;
}

- (void)_updateHoverActive
{
  BOOL v3 = (char *)[(UIHoverGestureRecognizer *)self->_hoverGestureRecognizer state] - 1 < (unsigned char *)&def_141F14 + 2;
  if (self->_hoverActive != v3)
  {
    self->_hoverActive = v3;
    [(TUIInteractiveBaseView *)self updateFromState];
  }
}

- (void)_hoverGesture:(id)a3
{
}

- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  char v11 = [(TUIInteractiveBaseView *)self renderModel];
  double v12 = TUIDynamicCast(v10, v11);

  uint64_t v13 = objc_opt_class();
  v14 = TUIDynamicCast(v13, v9);
  id v15 = [(TUIInteractiveBaseView *)self control];
  id v16 = [v15 buttonType];

  if (v16 != (id)+[TUIControlView uiButtonTypeFromTUIButtonType:](TUIControlView, "uiButtonTypeFromTUIButtonType:", [v14 type]))
  {
    BOOL v17 = [(TUIInteractiveBaseView *)self control];
    [v17 removeFromSuperview];

    if (self->_pointerInteraction)
    {
      objc_super v18 = [(TUIInteractiveBaseView *)self control];
      [v18 removeInteraction:self->_pointerInteraction];

      pointerInteraction = self->_pointerInteraction;
      self->_pointerInteraction = 0;
    }
    [(TUIInteractiveBaseView *)self setControl:0];
  }
  v20 = [v14 stateToModel];
  v21 = [v20 objectForKeyedSubscript:@"hover"];

  hoverGestureRecognizer = self->_hoverGestureRecognizer;
  if (v21)
  {
    if (!hoverGestureRecognizer)
    {
      uint64_t v23 = (UIHoverGestureRecognizer *)[objc_alloc((Class)UIHoverGestureRecognizer) initWithTarget:self action:"_hoverGesture:"];
      uint64_t v24 = self->_hoverGestureRecognizer;
      self->_hoverGestureRecognizer = v23;

      [(TUIControlView *)self addGestureRecognizer:self->_hoverGestureRecognizer];
LABEL_10:
      self->_hoverActive = 0;
    }
  }
  else if (hoverGestureRecognizer)
  {
    -[TUIControlView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    uint64_t v25 = self->_hoverGestureRecognizer;
    self->_hoverGestureRecognizer = 0;

    goto LABEL_10;
  }
  v107.receiver = self;
  v107.super_class = (Class)TUIControlView;
  -[TUIInteractiveBaseView configureWithModel:outsets:](&v107, "configureWithModel:outsets:", v9, top, left, bottom, right);
  if (v12 != v14 && ([v12 isEqualToRenderModel:v14] & 1) == 0)
  {
    id v99 = v9;
    v100 = v12;
    int64_t v26 = +[TUIControlView uiButtonRoleFromTUIButtonRole:](TUIControlView, "uiButtonRoleFromTUIButtonRole:", [v14 role]);
    uint64_t v27 = [(TUIInteractiveBaseView *)self control];
    [v27 setRole:v26];

    -[TUIControlView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", +[TUIControlView uiUserInterfaceStyleFromTUIUserInterfaceStyle:](TUIControlView, "uiUserInterfaceStyleFromTUIUserInterfaceStyle:", [v14 userInterfaceStyle]));
    [v14 touchInsets];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    uint64_t v36 = [(TUIInteractiveBaseView *)self control];
    [v36 setTouchInsets:v29, v31, v33, v35];

    uint64_t v37 = [v14 axAttributes];
    v38 = [v37 axLabel];
    uint64_t v39 = [(TUIInteractiveBaseView *)self control];
    [v39 setAccessibilityLabel:v38];

    id v40 = [v14 axAttributes];
    uint64_t v41 = [v40 axValue];
    id v42 = [(TUIInteractiveBaseView *)self control];
    [v42 setAccessibilityValue:v41];

    id v43 = [v14 axAttributes];
    uint64_t v44 = [v43 axHint];
    v45 = [(TUIInteractiveBaseView *)self control];
    [v45 setAccessibilityHint:v44];

    CFStringRef v46 = [v14 axAttributes];
    id v47 = [v46 axIdentifier];
    uint64_t v48 = [(TUIInteractiveBaseView *)self control];
    [v48 setAccessibilityIdentifier:v47];

    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    v108[0] = @"default";
    v108[1] = @"highlighted";
    v108[2] = @"disabled";
    id v49 = +[NSArray arrayWithObjects:v108 count:3];
    id v50 = [v49 countByEnumeratingWithState:&v103 objects:v109 count:16];
    if (v50)
    {
      id v51 = v50;
      uint64_t v52 = *(void *)v104;
      do
      {
        for (i = 0; i != v51; i = (char *)i + 1)
        {
          if (*(void *)v104 != v52) {
            objc_enumerationMutation(v49);
          }
          uint64_t v54 = *(void *)(*((void *)&v103 + 1) + 8 * i);
          unint64_t v55 = +[TUIControlView uiControlStateFromTUIElementState:v54];
          id v56 = [v14 stateToButtonAttributes];
          v57 = [v56 objectForKeyedSubscript:v54];

          uint64_t v58 = [(TUIInteractiveBaseView *)self control];
          __int16 v59 = [v57 image];
          [v58 setImage:v59 forState:v55];

          v60 = [(TUIInteractiveBaseView *)self control];
          __int16 v61 = [v57 title];
          [v60 setAttributedTitle:v61 forState:v55];
        }
        id v51 = [v49 countByEnumeratingWithState:&v103 objects:v109 count:16];
      }
      while (v51);
    }

    v62 = [v14 imageModelIDToResource];
    [v62 enumerateKeysAndObjectsUsingBlock:&stru_2573C8];

    double v12 = v100;
    v63 = [v100 imageModelIDToResource];
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = sub_186260;
    v102[3] = &unk_2518F8;
    v102[4] = self;
    [v63 enumerateKeysAndObjectsUsingBlock:v102];

    v64 = [v14 imageModelIDToResource];
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_1862B4;
    v101[3] = &unk_2518F8;
    v101[4] = self;
    [v64 enumerateKeysAndObjectsUsingBlock:v101];

    v65 = [(TUIInteractiveBaseView *)self control];
    [(TUIControlView *)self bounds];
    [v65 frameForAlignmentRect:];
    double v67 = v66;
    double v69 = v68;
    double v71 = v70;
    double v73 = v72;
    v74 = [(TUIInteractiveBaseView *)self control];
    [v74 setFrame:v67, v69, v71, v73];

    v75 = [(TUIInteractiveBaseView *)self renderModel];
    v76 = [v75 actionHandler];
    unsigned int v77 = [v76 hasActionForTrigger:@"context-menu"];

    unsigned int v78 = [v14 enabled];
    unsigned int v79 = v78;
    if (v77 && v78)
    {
      unsigned int v80 = [v14 contextMenuIsPrimaryAction];
      v81 = [(TUIInteractiveBaseView *)self control];
      [v81 setTui_menu:0];

      v82 = [(TUIInteractiveBaseView *)self control];
      v83 = v82;
      if (v80)
      {
        [v82 setContextMenuInteractionEnabled:1];

        v84 = [(TUIInteractiveBaseView *)self control];
        v85 = v84;
        uint64_t v86 = 1;
      }
      else
      {
        [v82 setContextMenuInteractionEnabled:0];

        v84 = [(TUIInteractiveBaseView *)self control];
        v85 = v84;
        uint64_t v86 = 0;
      }
      [v84 setShowsMenuAsPrimaryAction:v86];
      id v9 = v99;

      int v94 = v80 ^ 1;
    }
    else
    {
      v87 = [v14 menu];
      if (v87) {
        unsigned int v88 = v79;
      }
      else {
        unsigned int v88 = 0;
      }

      if (v88 == 1)
      {
        v89 = [v14 menu];
        v90 = [v14 imageModelIDToResource];
        [v89 loadImagesFromResourceMap:v90];

        v91 = [(TUIInteractiveBaseView *)self control];
        [v91 setTui_menu:v89];
      }
      else
      {
        v92 = [(TUIInteractiveBaseView *)self control];
        [v92 setContextMenuInteractionEnabled:0];

        v93 = [(TUIInteractiveBaseView *)self control];
        [v93 setShowsMenuAsPrimaryAction:0];

        v89 = [(TUIInteractiveBaseView *)self control];
        [v89 setTui_menu:0];
      }

      int v94 = 0;
      id v9 = v99;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_customContextMenuInteraction);

    if (!WeakRetained && v94)
    {
      id v96 = [objc_alloc((Class)UIContextMenuInteraction) initWithDelegate:self];
      [(TUIControlView *)self addInteraction:v96];
      objc_storeWeak((id *)&self->_customContextMenuInteraction, v96);
    }
    id v97 = objc_loadWeakRetained((id *)&self->_customContextMenuInteraction);
    if (!v97) {
      LOBYTE(v94) = 1;
    }

    if ((v94 & 1) == 0)
    {
      id v98 = objc_loadWeakRetained((id *)&self->_customContextMenuInteraction);
      [(TUIControlView *)self removeInteraction:v98];

      objc_storeWeak((id *)&self->_customContextMenuInteraction, 0);
    }
  }
}

- (void)imageResourceDidChangeImage:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_18635C;
  v4[3] = &unk_251828;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (id)_pointerTargetViewWithRefId:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(TUIInteractiveBaseView *)self descendentViewWithRefId:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a4;
  if (self->_pointerInteraction == a3)
  {
    id v9 = [(TUIInteractiveBaseView *)self renderModel];
    uint64_t v10 = [v9 pointer];
    char v11 = [v10 refId];

    double v12 = [(TUIControlView *)self _pointerTargetViewWithRefId:v11];
    if (v12)
    {
      uint64_t v13 = TUIProtocolCast(&OBJC_PROTOCOL___TUITouchInsetting, v12);
      v14 = v13;
      if (v13)
      {
        [v13 computedTouchInsets];
        double top = v15;
        double left = v17;
        double bottom = v19;
        double right = v21;
      }
      else
      {
        double top = UIEdgeInsetsZero.top;
        double left = UIEdgeInsetsZero.left;
        double bottom = UIEdgeInsetsZero.bottom;
        double right = UIEdgeInsetsZero.right;
      }
      [v12 bounds];
      -[TUIControlView convertRect:fromView:](self, "convertRect:fromView:", v12, left + v23, top + v24, v25 - (right + left), v26 - (bottom + top));
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      [v7 location];
      v52.double x = v35;
      v52.double y = v36;
      v53.origin.double x = v28;
      v53.origin.double y = v30;
      v53.size.width = v32;
      v53.size.height = v34;
      if (CGRectContainsPoint(v53, v52)
        && ([(TUIInteractiveBaseView *)self control],
            uint64_t v37 = objc_claimAutoreleasedReturnValue(),
            unsigned int v38 = [v37 isEnabled],
            v37,
            v38))
      {
        [v12 bounds];
        -[TUIControlView convertRect:fromView:](self, "convertRect:fromView:", v12);
        double v40 = v39;
        double v42 = v41;
        double v44 = v43;
        double v46 = v45;
        id v47 = [(TUIInteractiveBaseView *)self renderModel];
        uint64_t v48 = [v47 pointer];
        id v49 = [v48 refId];
        uint64_t v8 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v49, v40, v42, v44, v46);
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = [a4 identifier:a3];
  unsigned int v6 = [(TUIControlView *)self _pointerTargetViewWithRefId:v5];
  id v7 = v6;
  if (v6)
  {
    [(TUIControlView *)v6 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    id v16 = [(TUIReusableBaseView *)self feedControllerHost];
    double v17 = [v16 hostingContainerView];

    v60 = v5;
    if (([(TUIControlView *)v7 isDescendantOfView:v17] & 1) == 0)
    {
      objc_super v18 = [(TUIReusableBaseView *)self feedControllerHost];
      double v19 = [v18 hostingNavigationBar];

      if ([(TUIControlView *)v7 isDescendantOfView:v19])
      {
        double v17 = v19;
      }
      else
      {
        double v17 = [(TUIControlView *)v7 superview];
      }
    }
    double v21 = v15;
    double v22 = v13;
    double v23 = v11;
    double v24 = v9;
    if (v7 == self)
    {
      double v25 = [(TUIControlView *)self superview];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      double v21 = v15;
      double v22 = v13;
      double v23 = v11;
      double v24 = v9;
      if (isKindOfClass)
      {
        double v27 = [(TUIControlView *)self superview];
        CGFloat v28 = [v27 superview];
        double v29 = [v28 superview];

        -[TUIControlView convertRect:toView:](self, "convertRect:toView:", v29, v9, v11, v13, v15);
        double v31 = v30;
        double v33 = v32;
        [v29 bounds];
        [v29 convertRect:self toView:v31];
        double v24 = v34;
        double v23 = v35;
        double v22 = v36;
        double v21 = v37;
      }
    }
    double v58 = v22;
    double v38 = v21;
    v63.origin.double x = v9;
    v63.origin.double y = v11;
    v63.size.width = v13;
    v63.size.height = v15;
    double MidX = CGRectGetMidX(v63);
    v64.origin.double x = v9;
    v64.origin.double y = v11;
    v64.size.width = v13;
    v64.size.height = v15;
    [v17 convertPoint:v7 fromView:MidX, CGRectGetMidY(v64)];
    __int16 v59 = v17;
    id v42 = [objc_alloc((Class)UIPreviewTarget) initWithContainer:v17 center:v40];
    id v43 = objc_alloc_init((Class)UIPreviewParameters);
    id v44 = [objc_alloc((Class)UITargetedPreview) initWithView:v7 parameters:v43 target:v42];
    double v45 = [(TUIInteractiveBaseView *)self renderModel];
    double v46 = [v45 pointer];
    id v47 = [v46 style];
    uint64_t v48 = [v47 pointerEffectWithPreview:v44];
    id v49 = v48;
    if (v48)
    {
      id v50 = v48;
    }
    else
    {
      id v50 = +[UIPointerEffect effectWithPreview:v44];
    }
    id v51 = v50;

    CGPoint v52 = [(TUIInteractiveBaseView *)self renderModel];
    CGRect v53 = [v52 pointer];
    uint64_t v54 = [v53 style];
    unint64_t v55 = [v54 cursor];
    id v56 = [v55 pointerShapeWithBounds:v44 preview:v24];

    v20 = +[UIPointerStyle styleWithEffect:v51 shape:v56];

    id v5 = v60;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v7 = a5;
  double v8 = [a4 identifier];
  cursorEnteredIdentifiers = self->_cursorEnteredIdentifiers;
  if (cursorEnteredIdentifiers)
  {
    if ([(NSMutableSet *)cursorEnteredIdentifiers containsObject:v8]) {
      goto LABEL_6;
    }
  }
  else
  {
    double v10 = (NSMutableSet *)objc_opt_new();
    double v11 = self->_cursorEnteredIdentifiers;
    self->_cursorEnteredIdentifiers = v10;
  }
  [(NSMutableSet *)self->_cursorEnteredIdentifiers addObject:v8];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_186C74;
  v12[3] = &unk_251990;
  v12[4] = self;
  [v7 addAnimations:v12];
LABEL_6:
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7 = a5;
  double v8 = [a4 identifier];
  cursorEnteredIdentifiers = self->_cursorEnteredIdentifiers;
  if (cursorEnteredIdentifiers
    && [(NSMutableSet *)cursorEnteredIdentifiers containsObject:v8])
  {
    double v10 = (char *)[(NSMutableSet *)self->_cursorEnteredIdentifiers count];
    double v11 = self->_cursorEnteredIdentifiers;
    if (v10 == (unsigned char *)&def_141F14 + 1)
    {
      self->_cursorEnteredIdentifiers = 0;
    }
    else
    {
      [(NSMutableSet *)v11 removeObject:v8];
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_186DA0;
    v12[3] = &unk_251990;
    v12[4] = self;
    [v7 addAnimations:v12];
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  return -[TUIControlView _contextMenuConfigurationForPoint:](self, "_contextMenuConfigurationForPoint:", a3, a4.x, a4.y);
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(TUIInteractiveBaseView *)self control];
  if ([v11 isStaticMenu])
  {
  }
  else
  {
    double v12 = [(TUIInteractiveBaseView *)self control];
    double v13 = [v12 tui_menu];

    if (!v13)
    {
      double v14 = [(TUIReusableBaseView *)self feedControllerHost];
      double v15 = [v14 contextMenuConfigurationProvider];
      [v15 contextMenuInteraction:v8 willDisplayMenuForConfiguration:v9];
      goto LABEL_6;
    }
  }
  double v14 = [(TUIInteractiveBaseView *)self renderModel];
  double v15 = [v14 actionHandler];
  [v15 invoke:@"menuPresent" view:self];
LABEL_6:

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_186F60;
  v17[3] = &unk_251828;
  v17[4] = self;
  id v18 = v8;
  id v16 = v8;
  [v10 addCompletion:v17];
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6 = objc_alloc_init((Class)UIPreviewParameters);
  id v7 = [(TUIInteractiveBaseView *)self renderModel];
  unsigned __int8 v8 = [v7 enableBackgroundForHighlightPreview];

  if ((v8 & 1) == 0)
  {
    id v9 = +[UIColor clearColor];
    [v6 setBackgroundColor:v9];
  }
  id v10 = [(TUIInteractiveBaseView *)self renderModel];
  unsigned __int8 v11 = [v10 enableShadowForHighlightPreview];

  if ((v11 & 1) == 0)
  {
    double v12 = +[UIBezierPath bezierPath];
    [v6 setShadowPath:v12];
  }
  id v13 = objc_alloc((Class)UITargetedPreview);
  double v14 = [(TUIInteractiveBaseView *)self control];
  id v15 = [v13 initWithView:v14 parameters:v6];

  return v15;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  id v6 = objc_alloc_init((Class)UIPreviewParameters);
  id v7 = +[UIColor clearColor];
  [v6 setBackgroundColor:v7];

  unsigned __int8 v8 = +[UIBezierPath bezierPath];
  [v6 setShadowPath:v8];

  id v9 = objc_alloc((Class)UITargetedPreview);
  id v10 = [(TUIInteractiveBaseView *)self control];
  id v11 = [v9 initWithView:v10 parameters:v6];

  return v11;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(TUIInteractiveBaseView *)self control];
  if ([v8 isStaticMenu])
  {

LABEL_4:
    id v11 = [(TUIInteractiveBaseView *)self renderModel];
    double v12 = [v11 actionHandler];
    [v12 invoke:@"menuDismiss" view:self];
    goto LABEL_6;
  }
  id v9 = [(TUIInteractiveBaseView *)self control];
  id v10 = [v9 tui_menu];

  if (v10) {
    goto LABEL_4;
  }
  os_unfair_lock_lock(&self->_cachedDynamicMenuDataLock);
  cachedDynamicMenuData = self->_cachedDynamicMenuData;
  self->_cachedDynamicMenuData = 0;
  double v14 = cachedDynamicMenuData;

  os_unfair_lock_unlock(&self->_cachedDynamicMenuDataLock);
  id v11 = [(TUIReusableBaseView *)self feedControllerHost];
  double v12 = [v11 contextMenuConfigurationProvider];
  [v12 contextMenuInteraction:v15 willEndForConfiguration:v7 withData:v14];

LABEL_6:
}

- (void)button:(id)a3 contextMenuInteraction:(id)a4 willDisplayMenuForConfiguration:(id)a5 animator:(id)a6
{
}

- (void)button:(id)a3 contextMenuInteraction:(id)a4 willEndForConfiguration:(id)a5 animator:(id)a6
{
}

- (id)contextMenuConfigurationForButton:(id)a3 point:(CGPoint)a4
{
  return -[TUIControlView _contextMenuConfigurationForPoint:](self, "_contextMenuConfigurationForPoint:", a3, a4.x, a4.y);
}

- (id)accessibilityLabel
{
  v2 = [(TUIInteractiveBaseView *)self control];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (void)_buttonPressed:(id)a3
{
  id v5 = [(TUIInteractiveBaseView *)self renderModel];
  id v4 = [v5 actionHandler];
  [v4 invoke:@"press" view:self];
}

- (void)_showContextMenu:(id)a3
{
  id v5 = [(TUIInteractiveBaseView *)self renderModel];
  id v4 = [v5 actionHandler];
  [v4 invoke:@"context-menu" view:self];
}

- (void)_selectGesture:(id)a3
{
  id v5 = [(TUIInteractiveBaseView *)self renderModel];
  id v4 = [v5 actionHandler];
  [v4 invoke:@"press" view:self];
}

+ (int64_t)uiButtonTypeFromTUIButtonType:(unint64_t)a3
{
  if (qword_2DFA80 != -1) {
    dispatch_once(&qword_2DFA80, &stru_257410);
  }
  id v4 = (void *)qword_2DFA78;
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = [v6 integerValue];
  }
  else {
    id v7 = 0;
  }

  return (int64_t)v7;
}

+ (int64_t)uiButtonRoleFromTUIButtonRole:(unint64_t)a3
{
  if (qword_2DFA90 != -1) {
    dispatch_once(&qword_2DFA90, &stru_257430);
  }
  id v4 = (void *)qword_2DFA88;
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = [v6 integerValue];
  }
  else {
    id v7 = 0;
  }

  return (int64_t)v7;
}

+ (unint64_t)uiControlStateFromTUIElementState:(id)a3
{
  id v3 = a3;
  if (qword_2DFAA0 != -1) {
    dispatch_once(&qword_2DFAA0, &stru_257450);
  }
  id v4 = [(id)qword_2DFA98 objectForKeyedSubscript:v3];
  id v5 = v4;
  if (v4) {
    id v6 = [v4 unsignedIntegerValue];
  }
  else {
    id v6 = 0;
  }

  return (unint64_t)v6;
}

+ (int64_t)uiUserInterfaceStyleFromTUIUserInterfaceStyle:(unint64_t)a3
{
  if (qword_2DFAB0 != -1) {
    dispatch_once(&qword_2DFAB0, &stru_257470);
  }
  id v4 = (void *)qword_2DFAA8;
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = [v6 integerValue];
  }
  else {
    id v7 = 0;
  }

  return (int64_t)v7;
}

- (id)_contextMenuConfigurationForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v6 = [(TUIInteractiveBaseView *)self renderModel];
  id v7 = [v6 actionHandler];
  unsigned int v8 = [v7 hasActionForTrigger:@"context-menu"];

  if (v8
    && ([(TUIReusableBaseView *)self feedControllerHost],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v9 contextMenuConfigurationProvider],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_187ED4;
    v16[3] = &unk_2574E8;
    objc_copyWeak(v17, &location);
    v16[4] = self;
    v17[1] = *(id *)&x;
    v17[2] = *(id *)&y;
    +[UIDeferredMenuElement elementWithUncachedProvider:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1882D4;
    v14[3] = &unk_257308;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v11;
    double v12 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v14];

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

+ (id)menuWithChildren:(id)a3
{
  return +[UIMenu menuWithTitle:&stru_257BF0 image:0 identifier:@"TUIPlatformButtonDefaultIdentifier" options:1 children:a3];
}

- (TUIButtonAttributes)currentButtonAttributes
{
  return self->_currentButtonAttributes;
}

- (void)setCurrentButtonAttributes:(id)a3
{
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (NSMutableSet)cursorEnteredIdentifiers
{
  return self->_cursorEnteredIdentifiers;
}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (BOOL)hoverActive
{
  return self->_hoverActive;
}

- (TUIFocusStylingHelper)focusHelper
{
  return self->_focusHelper;
}

- (UITapGestureRecognizer)selectGestureRecognizer
{
  return self->_selectGestureRecognizer;
}

- (TUIInteractionsHelper)interactionHelper
{
  return self->_interactionHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionHelper, 0);
  objc_storeStrong((id *)&self->_selectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_focusHelper, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_cursorEnteredIdentifiers, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_currentButtonAttributes, 0);
  objc_storeStrong((id *)&self->_cachedDynamicMenuData, 0);

  objc_destroyWeak((id *)&self->_customContextMenuInteraction);
}

@end