@interface UIInputWindowControllerHosting
- (BOOL)host:(id)a3 isForPurpose:(unint64_t)a4;
- (BOOL)requiresConstraintUpdate;
- (BOOL)useCrescendoHostingItem;
- (CGRect)visibleFrame;
- (NSArray)allHostingItems;
- (UIEdgeInsets)_inputViewPadding;
- (UIInputWindowController)owner;
- (UIInputWindowControllerHosting)initWithHost:(id)a3;
- (id)expectedPlacementForHost:(id)a3;
- (id)itemForPurpose:(unint64_t)a3;
- (id)placementForHost:(id)a3;
- (id)scrollTrackingView;
- (id)subPlacementFromPlacement:(id)a3 forHost:(id)a4;
- (int)extraHostsRequired;
- (unint64_t)indexOfHost:(id)a3;
- (void)_updateBackdropViews;
- (void)clearInputAccessoryViewEdgeConstraints;
- (void)clearInputAssistantViewEdgeConstraints;
- (void)clearInputViewEdgeConstraints;
- (void)disableViewSizingConstraints:(unint64_t)a3 forNewView:(id)a4;
- (void)extendKeyboardBackdropHeight:(double)a3 withDuration:(double)a4;
- (void)initializeTranslateGestureRecognizerIfNecessary;
- (void)layoutIfNeeded;
- (void)performForInputAccessoryBackdropViews:(id)a3;
- (void)reloadForPlacementForInputViewSet:(id)a3;
- (void)removeAllAnimations;
- (void)removeInputAssistantHostView;
- (void)removeMatchMoveAnimationIfNeeded;
- (void)resetBackdropHeight;
- (void)resetInputViewVisibility;
- (void)setExtraHostsRequired:(int)a3;
- (void)setNeedsLayout;
- (void)setOwner:(id)a3;
- (void)setRequiresConstraintUpdate:(BOOL)a3;
- (void)unloadForPlacement;
- (void)updateBackdropViewForSplitKeyboard;
- (void)updateCombinedBackdropViewAnimated:(BOOL)a3 forKeyboardUp:(BOOL)a4;
- (void)updateConstraintInsets;
- (void)updateEmptyHeightConstraint;
- (void)updateViewConstraints;
- (void)updateViewSizingConstraints;
@end

@implementation UIInputWindowControllerHosting

- (UIInputWindowController)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (UIInputWindowController *)WeakRetained;
}

- (id)placementForHost:(id)a3
{
  p_owner = &self->_owner;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_owner);
  v7 = [WeakRetained placement];
  v8 = [(UIInputWindowControllerHosting *)self subPlacementFromPlacement:v7 forHost:v5];

  return v8;
}

- (id)subPlacementFromPlacement:(id)a3 forHost:(id)a4
{
  id v6 = a3;
  unint64_t v7 = [(UIInputWindowControllerHosting *)self indexOfHost:a4];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && (unint64_t v8 = v7) != 0)
  {
    v10 = [v6 subPlacements];
    id v9 = [v10 objectAtIndexedSubscript:v8 - 1];
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

- (unint64_t)indexOfHost:(id)a3
{
  return [(NSMutableArray *)self->_hostingItems indexOfObject:a3];
}

- (id)itemForPurpose:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  id v6 = [WeakRetained placement];
  unint64_t v7 = [v6 indexForPurpose:a3];

  if (v7 >= [(NSMutableArray *)self->_hostingItems count])
  {
    unint64_t v8 = 0;
  }
  else
  {
    unint64_t v8 = [(NSMutableArray *)self->_hostingItems objectAtIndexedSubscript:v7];
  }
  return v8;
}

- (BOOL)host:(id)a3 isForPurpose:(unint64_t)a4
{
  uint64_t v6 = [(NSMutableArray *)self->_hostingItems indexOfObject:a3];
  uint64_t v7 = v6;
  if (a4 == 200) {
    return v6 == 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v10 = [WeakRetained placement];
  BOOL v8 = [v10 indexForPurpose:a4] == v7;

  return v8;
}

- (void)setExtraHostsRequired:(int)a3
{
  self->_extraHostsRequired = a3;
  unint64_t v4 = a3 + 1;
  while ([(NSMutableArray *)self->_hostingItems count] > v4)
  {
    id v5 = [(NSMutableArray *)self->_hostingItems lastObject];
    [v5 clearVisibilityConstraints];
    [(NSMutableArray *)self->_hostingItems removeLastObject];
  }
  while ([(NSMutableArray *)self->_hostingItems count] < v4)
  {
    if ([(UIInputWindowControllerHosting *)self useCrescendoHostingItem])
    {
      uint64_t v6 = [UIInputLayoutHostingItem alloc];
      uint64_t v7 = [(UIInputWindowControllerHosting *)self owner];
      BOOL v8 = [v7 inputViewSet];
      id v9 = [(UIInputLayoutHostingItem *)v6 initWithInputViewSet:v8 container:self];
    }
    else
    {
      id v9 = [[UIInputWindowControllerHostingItem alloc] initWithContainer:self];
    }
    [(NSMutableArray *)self->_hostingItems addObject:v9];
  }
}

- (BOOL)useCrescendoHostingItem
{
  return 0;
}

- (void)reloadForPlacementForInputViewSet:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)UIApp keyWindow];
  uint64_t v6 = [v5 firstResponder];

  uint64_t v7 = [(UIInputWindowControllerHosting *)self owner];
  BOOL v8 = [v7 inputViewSet];
  id v9 = [v8 inputAccessoryView];

  uint64_t v10 = [v6 inputAccessoryView];
  v49 = v9;
  v50 = v6;
  if ((void *)v10 == v9)
  {
  }
  else
  {
    v11 = (void *)v10;
    v12 = [v6 inputAccessoryViewController];
    v13 = [v12 view];

    if (v13 != v9)
    {
      id v14 = 0;
      goto LABEL_6;
    }
  }
  id v14 = v6;
LABEL_6:
  p_owner = &self->_owner;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v17 = [WeakRetained placement];

  v47 = v17;
  v51 = v4;
  v18 = [v17 subPlacementsForInputViewSet:v4];
  v45 = (void *)[(NSMutableArray *)self->_hostingItems copy];
  v46 = v18;
  -[UIInputWindowControllerHosting setExtraHostsRequired:](self, "setExtraHostsRequired:", [v18 count]);
  v19 = [(id)UIApp keyWindow];
  id v20 = [v19 firstResponder];

  if (v20 != v14) {
    [v14 becomeFirstResponder];
  }
  v48 = v14;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v21 = [(UIInputWindowControllerHosting *)self allHostingItems];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v53 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        v27 = [v26 placement];
        id v28 = objc_loadWeakRetained((id *)&self->_owner);
        char v29 = [v28 shouldNotifyRemoteKeyboards];

        if ((v29 & 1) == 0) {
          [v26 setPlacement];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v23);
  }

  unint64_t v30 = [v47 computeComparisonMask];
  if (self->_currentState != v30)
  {
    self->_currentState = v30;
    if (v51)
    {
      id v31 = v51;
    }
    else
    {
      id v32 = objc_loadWeakRetained((id *)&self->_owner);
      id v31 = [v32 inputViewSet];
    }
    v33 = [v31 inputViewController];
    v34 = [v33 parentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v36 = [v31 inputViewController];
      v37 = [v36 parentViewController];
      [v37 invalidateInputView];
    }
    v38 = [v31 assistantViewController];
    v39 = [v38 parentViewController];
    objc_opt_class();
    char v40 = objc_opt_isKindOfClass();

    if (v40)
    {
      v41 = [v31 assistantViewController];
      v42 = [v41 parentViewController];
      [v42 invalidateInputAssistantView];
    }
    id v43 = objc_loadWeakRetained((id *)p_owner);
    [v43 changeToInputViewSet:v31];

    if (([v47 isFloating] & 1) != 0 || objc_msgSend(v47, "isHiddenForFloatingTransition"))
    {
      id v44 = objc_loadWeakRetained((id *)p_owner);
      [v44 validateInputView];
    }
  }
}

- (UIInputWindowControllerHosting)initWithHost:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIInputWindowControllerHosting;
  id v5 = [(UIInputWindowControllerHosting *)&v12 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_owner, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    hostingItems = v6->_hostingItems;
    v6->_hostingItems = (NSMutableArray *)v7;

    [(UIInputWindowControllerHosting *)v6 reloadForPlacementForInputViewSet:0];
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v6 selector:sel_updateBackdropViewForSplitKeyboard name:0x1ED118340 object:0];

    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v6 selector:sel_updateBackdropViewForSplitKeyboard name:0x1ED118360 object:0];
  }
  return v6;
}

- (NSArray)allHostingItems
{
  v2 = (void *)[(NSMutableArray *)self->_hostingItems copy];
  return (NSArray *)v2;
}

- (void)updateViewConstraints
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  char v4 = [WeakRetained isChangingInputViews];

  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [(UIInputWindowControllerHosting *)self allHostingItems];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) updateViewConstraints];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    BOOL v5 = 0;
  }
  self->_requiresConstraintUpdate = v5;
}

- (void)updateBackdropViewForSplitKeyboard
{
  v3 = [(UIInputWindowControllerHosting *)self owner];
  char v4 = [v3 inputViewSet];
  int v5 = [v4 isSplit];

  if (v5)
  {
    [(UIInputWindowControllerHosting *)self _updateBackdropViews];
  }
}

- (void)unloadForPlacement
{
}

- (UIEdgeInsets)_inputViewPadding
{
  v3 = +[UIKeyboardInputModeController sharedInputModeController];
  char v4 = [v3 currentInputMode];

  int v5 = +[UIInputViewAnimationStyle animationStyleDefault];
  uint64_t v6 = [(UIInputWindowControllerHosting *)self owner];
  uint64_t v7 = [v6 inputViewSet];
  uint64_t v8 = [(UIInputWindowControllerHosting *)self owner];
  uint64_t v9 = [v8 _window];
  uint64_t v10 = [v9 windowScene];
  long long v11 = [v5 endPlacementForInputViewSet:v7 windowScene:v10];

  if (!+[UIKeyboard usesInputSystemUI]
    || (double v12 = 0.0,
        double v13 = 0.0,
        double v14 = 0.0,
        double v15 = 0.0,
        +[UIKeyboard usesLocalKeyboard]))
  {
    uint64_t v16 = [(UIInputWindowControllerHosting *)self owner];
    v17 = [v16 inputViewSet];
    int v18 = [v17 isCustomInputView];

    if (+[UIKeyboard usesInputSystemUI] && v18)
    {
      v19 = [(UIInputWindowControllerHosting *)self owner];
      id v20 = [v19 inputViewSet];
      [v20 inputViewBounds];
      LOBYTE(v18) = v21 == 0.0;
    }
    double v12 = 0.0;
    if (![v11 showsKeyboard] || (v18 & 1) != 0)
    {
      double v13 = 0.0;
      double v14 = 0.0;
      double v15 = 0.0;
    }
    else
    {
      uint64_t v22 = +[UIKeyboardImpl activeInstance];
      char v23 = [v22 isMinimized];

      double v13 = 0.0;
      double v14 = 0.0;
      double v15 = 0.0;
      if ((v23 & 1) == 0)
      {
        uint64_t v24 = [(UIInputWindowControllerHosting *)self owner];
        uint64_t v25 = [v24 keyboardOrientation];

        if (+[UIKeyboard usesInputSystemUI])
        {
          v26 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
          v27 = [v26 currentUIState];

          if (v27) {
            uint64_t v25 = [v27 orientation];
          }
        }
        +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:v25 inputMode:v4];
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
        double v35 = v34;
        +[UIKeyboardImpl deviceSpecificStaticHitBufferForInterfaceOrientation:v25 inputMode:v4];
        double v15 = -(v29 - v36);
        double v14 = v31 - v37;
        double v13 = -(v33 - v38);
        double v12 = -(v35 - v39);
      }
    }
  }

  double v40 = v15;
  double v41 = v14;
  double v42 = v13;
  double v43 = v12;
  result.right = v43;
  result.bottom = v42;
  result.left = v41;
  result.top = v40;
  return result;
}

- (void)updateCombinedBackdropViewAnimated:(BOOL)a3 forKeyboardUp:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(UIInputWindowControllerHosting *)self allHostingItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) updateCombinedBackdropViewAnimated:v5 forKeyboardUp:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)initializeTranslateGestureRecognizerIfNecessary
{
}

- (void)resetBackdropHeight
{
}

- (void)updateConstraintInsets
{
}

- (void)updateEmptyHeightConstraint
{
}

- (void)disableViewSizingConstraints:(unint64_t)a3 forNewView:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(UIInputWindowControllerHosting *)self allHostingItems];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) disableViewSizingConstraints:a3 forNewView:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)removeAllAnimations
{
  id v3 = [(UIInputWindowControllerHosting *)self owner];
  v2 = [v3 view];
  [v2 _removeAllAnimations:1];
}

- (void)setNeedsLayout
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(UIInputWindowControllerHosting *)self allHostingItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) hostView];
        [v7 setNeedsLayout];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)performForInputAccessoryBackdropViews:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(UIInputWindowControllerHosting *)self allHostingItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) _inputAccessoryBackdropView];
        v4[2](v4, v10);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)layoutIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(UIInputWindowControllerHosting *)self allHostingItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if ([(UIInputWindowControllerHosting *)self useCrescendoHostingItem])
        {
          [v8 someViewDidLayoutSubviews];
        }
        else
        {
          uint64_t v9 = [v8 hostView];
          [v9 layoutIfNeeded];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_updateBackdropViews
{
}

- (void)clearInputViewEdgeConstraints
{
}

- (void)resetInputViewVisibility
{
}

- (void)clearInputAccessoryViewEdgeConstraints
{
}

- (void)clearInputAssistantViewEdgeConstraints
{
}

- (void)removeInputAssistantHostView
{
}

- (void)updateViewSizingConstraints
{
}

- (void)extendKeyboardBackdropHeight:(double)a3 withDuration:(double)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(UIInputWindowControllerHosting *)self allHostingItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) extendKeyboardBackdropHeight:a3 withDuration:a4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (CGRect)visibleFrame
{
  v2 = [(UIInputWindowControllerHosting *)self itemForPurpose:0];
  [v2 visibleFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)expectedPlacementForHost:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  double v6 = [WeakRetained expectedPlacement];
  double v7 = [(UIInputWindowControllerHosting *)self subPlacementFromPlacement:v6 forHost:v4];
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)&self->_owner);
    double v11 = [v10 placement];
    double v12 = [(UIInputWindowControllerHosting *)self subPlacementFromPlacement:v11 forHost:v4];
    id v9 = [v12 expiringPlacement];
  }
  return v9;
}

- (id)scrollTrackingView
{
  v2 = [(UIInputWindowControllerHosting *)self itemForPurpose:3];
  double v3 = [v2 scrollTrackingView];

  return v3;
}

- (void)removeMatchMoveAnimationIfNeeded
{
  id v2 = [(UIInputWindowControllerHosting *)self itemForPurpose:3];
  [v2 removeMatchMoveAnimationIfNeeded];
}

- (void)setOwner:(id)a3
{
}

- (int)extraHostsRequired
{
  return self->_extraHostsRequired;
}

- (BOOL)requiresConstraintUpdate
{
  return self->_requiresConstraintUpdate;
}

- (void)setRequiresConstraintUpdate:(BOOL)a3
{
  self->_requiresConstraintUpdate = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_hostingItems, 0);
}

@end