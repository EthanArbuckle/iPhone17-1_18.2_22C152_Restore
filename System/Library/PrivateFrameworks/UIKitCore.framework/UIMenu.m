@interface UIMenu
+ (BOOL)supportsSecureCoding;
+ (UIMenu)menuWithChildren:(NSArray *)children;
+ (UIMenu)menuWithTitle:(NSString *)title children:(NSArray *)children;
+ (UIMenu)menuWithTitle:(NSString *)title image:(UIImage *)image identifier:(UIMenuIdentifier)identifier options:(UIMenuOptions)options children:(NSArray *)children;
+ (UIMenu)menuWithTitle:(id)a3 imageName:(id)a4 identifier:(id)a5 options:(unint64_t)a6 children:(id)a7;
+ (id)_defaultInlineMenuWithIdentifier:(id)a3 children:(id)a4;
+ (id)_defaultMenuImageNames;
+ (id)_defaultMenuTitles;
+ (id)_defaultMenuWithIdentifier:(id)a3 children:(id)a4;
+ (id)_defaultMenuWithIdentifier:(id)a3 options:(unint64_t)a4 children:(id)a5;
- ($9BEB610D0CE1B1EDC3D89DA2464F985F)metadata;
- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5;
- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4;
- (BOOL)_hasGlobalHeader;
- (BOOL)_shouldShowSelectionState;
- (BOOL)_surfacesSelectionState;
- (BOOL)forceAutomaticSelection;
- (BOOL)isEqual:(id)a3;
- (NSArray)children;
- (NSArray)selectedElements;
- (NSString)description;
- (UIMenu)initWithCoder:(NSCoder *)coder;
- (UIMenu)initWithMenu:(id)a3 overrideChildren:(id)a4;
- (UIMenu)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 identifier:(id)a6 options:(unint64_t)a7 children:(id)a8;
- (UIMenu)menuByReplacingChildren:(NSArray *)newChildren;
- (UIMenuDisplayPreferences)displayPreferences;
- (UIMenuElementSize)preferredElementSize;
- (UIMenuForcedAutomaticSelectionDelegate)forcedAutomaticSelectionDelegate;
- (UIMenuIdentifier)identifier;
- (UIMenuOptions)options;
- (UIView)headerView;
- (id)_copyWithOptions:(unint64_t)a3;
- (id)_immutableCopy;
- (id)_immutableCopySharingLeafObservers:(BOOL)a3;
- (id)_mutableCopy;
- (id)childElementForElement:(id)a3;
- (id)headerViewProvider;
- (id)recursivelySelectDefaultForcedSelection:(BOOL)a3;
- (int64_t)_resolvedElementSize;
- (unint64_t)behaviorOptions;
- (unint64_t)hash;
- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6;
- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4;
- (void)_elementStateDidChange:(id)a3;
- (void)_elementWillPerformAction:(id)a3;
- (void)_resolveElementSizeWithContext:(id)a3;
- (void)_setResolvedElementSize:(int64_t)a3;
- (void)_setSurfacesSelectionState:(BOOL)a3;
- (void)addAsStateObserver;
- (void)encodeWithCoder:(id)a3;
- (void)establishInitialDefaultSingleSelection;
- (void)removeAsStateObserver;
- (void)setBehaviorOptions:(unint64_t)a3;
- (void)setDisplayPreferences:(id)a3;
- (void)setForceAutomaticSelection:(BOOL)a3;
- (void)setForcedAutomaticSelectionDelegate:(id)a3;
- (void)setHeaderViewProvider:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPreferredElementSize:(UIMenuElementSize)preferredElementSize;
- (void)updateChildrenForSingleSelectedElement:(id)a3;
@end

@implementation UIMenu

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_forcedAutomaticSelectionDelegate);
  objc_storeStrong(&self->_headerViewProvider, 0);
  objc_storeStrong((id *)&self->_displayPreferences, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

- (void)setHeaderViewProvider:(id)a3
{
}

+ (UIMenu)menuWithTitle:(NSString *)title image:(UIImage *)image identifier:(UIMenuIdentifier)identifier options:(UIMenuOptions)options children:(NSArray *)children
{
  v11 = children;
  v12 = identifier;
  v13 = image;
  v14 = title;
  v15 = [[UIMenu alloc] initWithTitle:v14 image:v13 imageName:0 identifier:v12 options:options children:v11];

  return v15;
}

+ (id)_defaultMenuWithIdentifier:(id)a3 options:(unint64_t)a4 children:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a1 _defaultMenuTitles];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];
  v12 = (void *)v11;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  else {
    v13 = &stru_1ED0E84C0;
  }
  v14 = [a1 _defaultMenuImageNames];
  v15 = [v14 objectForKeyedSubscript:v9];
  v16 = [a1 menuWithTitle:v13 imageName:v15 identifier:v9 options:a4 children:v8];

  [v16 setBehaviorOptions:1];
  return v16;
}

- (void)setBehaviorOptions:(unint64_t)a3
{
  self->_behaviorOptions = a3;
}

+ (id)_defaultMenuTitles
{
  if (_MergedGlobals_1281 != -1) {
    dispatch_once(&_MergedGlobals_1281, &__block_literal_global_593);
  }
  v2 = (void *)qword_1EB2649E8;
  return v2;
}

+ (id)_defaultMenuImageNames
{
  if (qword_1EB2649F0 != -1) {
    dispatch_once(&qword_1EB2649F0, &__block_literal_global_97_2);
  }
  v2 = (void *)qword_1EB2649F8;
  return v2;
}

+ (UIMenu)menuWithTitle:(id)a3 imageName:(id)a4 identifier:(id)a5 options:(unint64_t)a6 children:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [[UIMenu alloc] initWithTitle:v14 image:0 imageName:v13 identifier:v12 options:a6 children:v11];

  return v15;
}

+ (id)_defaultInlineMenuWithIdentifier:(id)a3 children:(id)a4
{
  return (id)[a1 _defaultMenuWithIdentifier:a3 options:1 children:a4];
}

- (UIMenu)initWithMenu:(id)a3 overrideChildren:(id)a4
{
  v6 = a3;
  id v7 = a4;
  id v8 = [v6 _imageOrName];
  id v9 = [v6 title];
  v10 = [v8 _asMenuElementImage];
  id v11 = [v8 _asMenuElementImageName];
  v27.receiver = self;
  v27.super_class = (Class)UIMenu;
  id v12 = [(UIMenuElement *)&v27 initWithTitle:v9 image:v10 imageName:v11];

  if (v12)
  {
    uint64_t v13 = [v6 attributedTitle];
    attributedTitle = v12->super._attributedTitle;
    v12->super._attributedTitle = (NSAttributedString *)v13;

    uint64_t v15 = [v6 subtitle];
    subtitle = v12->super._subtitle;
    v12->super._subtitle = (NSString *)v15;

    uint64_t v17 = [v6 identifier];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v17;

    v12->_options = [v6 options];
    v19 = v7;
    if (!v7)
    {
      v19 = [v6 children];
    }
    objc_storeStrong((id *)&v12->_children, v19);
    if (!v7) {

    }
    uint64_t v20 = [v6 accessibilityIdentifier];
    accessibilityIdentifier = v12->super._accessibilityIdentifier;
    v12->super._accessibilityIdentifier = (NSString *)v20;

    v12->_forceAutomaticSelection = [v6 forceAutomaticSelection];
    v12->_behaviorOptions = [v6 behaviorOptions];
    uint64_t v22 = [v6 headerViewProvider];
    id headerViewProvider = v12->_headerViewProvider;
    v12->_id headerViewProvider = (id)v22;

    v12->_preferredElementSize = [v6 preferredElementSize];
    v12->_resolvedElementSize = v6[11];
    v12->super.__preferredDisplayMode = [v6 _preferredDisplayMode];
    v12->__surfacesSelectionState = [v6 _surfacesSelectionState];
    v24 = [v6 _internalIdentifier];
    [(UIMenuElement *)v12 set_internalIdentifier:v24];

    v25 = [v6 displayPreferences];
    [(UIMenu *)v12 setDisplayPreferences:v25];

    if ((v12->_options & 0x20) != 0 || v12->_forceAutomaticSelection)
    {
      [(UIMenu *)v12 addAsStateObserver];
      [(UIMenu *)v12 establishInitialDefaultSingleSelection];
    }
  }

  return v12;
}

- (UIMenu)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 identifier:(id)a6 options:(unint64_t)a7 children:(id)a8
{
  id v14 = a6;
  id v15 = a8;
  v26.receiver = self;
  v26.super_class = (Class)UIMenu;
  v16 = [(UIMenuElement *)&v26 initWithTitle:a3 image:a4 imageName:a5];
  if (v16)
  {
    if (v14)
    {
      uint64_t v17 = (void *)[v14 copy];
    }
    else
    {
      v18 = NSString;
      a4 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v17 = [v18 stringWithFormat:@"com.apple.menu.dynamic.%@", a4];
    }
    objc_storeStrong((id *)&v16->_identifier, v17);
    if (!v14)
    {

      uint64_t v17 = a4;
    }

    v16->_options = a7;
    uint64_t v19 = [v15 copy];
    children = v16->_children;
    v16->_children = (NSArray *)v19;

    uint64_t v21 = ((v16->_options >> 2) & 1) - 1;
    v16->_preferredElementSize = v21;
    v16->_resolvedElementSize = v21;
    if ((v16->_options & 0x20) != 0)
    {
      [(UIMenu *)v16 addAsStateObserver];
      [(UIMenu *)v16 establishInitialDefaultSingleSelection];
    }
    uint64_t v22 = (UIMenuDisplayPreferences *)objc_opt_new();
    v23 = v22;
    if ((a7 & 8) != 0)
    {
      v16->_hasCustomizedDisplayPreferences = 1;
      [(UIMenuDisplayPreferences *)v22 setMaximumNumberOfTitleLines:1];
    }
    if ((a7 & 0x40) != 0)
    {
      v16->_hasCustomizedDisplayPreferences = 1;
      [(UIMenuDisplayPreferences *)v23 setMaximumNumberOfTitleLines:0];
    }
    displayPreferences = v16->_displayPreferences;
    v16->_displayPreferences = v23;
  }
  return v16;
}

- (void)setDisplayPreferences:(id)a3
{
}

+ (UIMenu)menuWithTitle:(NSString *)title children:(NSArray *)children
{
  v5 = children;
  v6 = title;
  id v7 = [[UIMenu alloc] initWithTitle:v6 image:0 imageName:0 identifier:0 options:0 children:v5];

  return v7;
}

+ (UIMenu)menuWithChildren:(NSArray *)children
{
  return +[UIMenu menuWithTitle:&stru_1ED0E84C0 children:children];
}

- (BOOL)forceAutomaticSelection
{
  return self->_forceAutomaticSelection;
}

- (UIMenuOptions)options
{
  return self->_options;
}

- (UIMenuElementSize)preferredElementSize
{
  return self->_preferredElementSize;
}

- (id)headerViewProvider
{
  return self->_headerViewProvider;
}

- (UIMenuDisplayPreferences)displayPreferences
{
  return self->_displayPreferences;
}

- (unint64_t)behaviorOptions
{
  return self->_behaviorOptions;
}

- (BOOL)_surfacesSelectionState
{
  return self->__surfacesSelectionState;
}

- (UIMenuIdentifier)identifier
{
  return self->_identifier;
}

- (id)_mutableCopy
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(UIMenu *)self children];
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "_mutableCopy", (void)v13);
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [(UIMenu *)self menuByReplacingChildren:v4];

  return v11;
}

- (NSArray)children
{
  return self->_children;
}

- (UIMenu)menuByReplacingChildren:(NSArray *)newChildren
{
  v4 = newChildren;
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = (void *)[(NSArray *)v4 copy];

  uint64_t v7 = (void *)[v5 initWithMenu:self overrideChildren:v6];
  return (UIMenu *)v7;
}

- (void)setForceAutomaticSelection:(BOOL)a3
{
  if (self->_forceAutomaticSelection != a3)
  {
    BOOL v3 = a3;
    self->_forceAutomaticSelection = a3;
    char v5 = [(UIMenu *)self options];
    if (v3)
    {
      if ((v5 & 0x20) == 0) {
        [(UIMenu *)self addAsStateObserver];
      }
      [(UIMenu *)self establishInitialDefaultSingleSelection];
    }
    else if ((v5 & 0x20) == 0)
    {
      [(UIMenu *)self removeAsStateObserver];
    }
  }
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5
{
  if (a3) {
    return (*((uint64_t (**)(id, UIMenu *))a3 + 2))(a3, self);
  }
  else {
    return 0;
  }
}

- (void)setForcedAutomaticSelectionDelegate:(id)a3
{
}

+ (id)_defaultMenuWithIdentifier:(id)a3 children:(id)a4
{
  return (id)[a1 _defaultMenuWithIdentifier:a3 options:0 children:a4];
}

- (void)addAsStateObserver
{
}

- (void)_elementStateDidChange:(id)a3
{
  id v11 = a3;
  if (([(UIMenu *)self options] & 0x20) != 0
    || [(UIMenu *)self forceAutomaticSelection])
  {
    id v5 = [(UIMenu *)self childElementForElement:v11];
    uint64_t v6 = v5;
    if (v5 != v11) {
      objc_msgSend(v5, "_setState:notifyingObservers:", objc_msgSend(v11, "state"), 0);
    }
    [(UIMenu *)self updateChildrenForSingleSelectedElement:v6];
    if ([(UIMenu *)self forceAutomaticSelection])
    {
      if ([v6 state] != 1)
      {
        uint64_t v7 = [(UIMenu *)self recursivelySelectDefaultForcedSelection:0];

        uint64_t v6 = (void *)v7;
        if (!v7)
        {
          v10 = [MEMORY[0x1E4F28B00] currentHandler];
          [v10 handleFailureInMethod:a2 object:self file:@"UIMenu.m" lineNumber:691 description:@"Menu does not have a valid element for default selection"];

          uint64_t v6 = 0;
        }
      }
      uint64_t v8 = [(UIMenu *)self forcedAutomaticSelectionDelegate];

      if (v8)
      {
        uint64_t v9 = [(UIMenu *)self forcedAutomaticSelectionDelegate];
        [v9 forcedSelectionOfMenu:self willChangeTo:v6];
      }
    }
  }
}

- (void)establishInitialDefaultSingleSelection
{
  SEL v12 = a2;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__39;
  v23 = __Block_byref_object_dispose__39;
  id v24 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__UIMenu_establishInitialDefaultSingleSelection__block_invoke;
  aBlock[3] = &unk_1E52E4AA0;
  aBlock[4] = &v19;
  BOOL v3 = _Block_copy(aBlock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(UIMenu *)self children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __48__UIMenu_establishInitialDefaultSingleSelection__block_invoke_2;
        v13[3] = &unk_1E52E4AC8;
        v13[4] = &v19;
        objc_msgSend(v8, "_acceptMenuVisit:commandVisit:actionVisit:deferredElementVisit:", v13, v3, v3, 0, v12);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v25 count:16];
    }
    while (v5);
  }

  if ([(UIMenu *)self forceAutomaticSelection])
  {
    if (!v20[5])
    {
      uint64_t v9 = [(UIMenu *)self recursivelySelectDefaultForcedSelection:1];
      v10 = (void *)v20[5];
      v20[5] = v9;

      if (!v20[5])
      {
        id v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:v12 object:self file:@"UIMenu.m" lineNumber:612 description:@"Menu does not have a valid element for default selection"];
      }
    }
  }

  _Block_object_dispose(&v19, 8);
}

void __48__UIMenu_establishInitialDefaultSingleSelection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    [v3 updateChildrenForSingleSelectedElement:0];
  }
  else
  {
    v4 = [v3 selectedElements];
    uint64_t v5 = [v4 firstObject];

    if (v5)
    {
      [v6 updateChildrenForSingleSelectedElement:v5];
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5);
    }
  }
}

void __48__UIMenu_establishInitialDefaultSingleSelection__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 state] == 1)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void *)(v4 + 40);
    uint64_t v5 = (id *)(v4 + 40);
    if (v6) {
      [v7 _setState:0 notifyingObservers:0];
    }
    else {
      objc_storeStrong(v5, a2);
    }
  }
}

- (NSArray)selectedElements
{
  id v3 = objc_opt_new();
  recursivelyPopulateSelectedElements(self, v3);
  uint64_t v4 = [v3 array];

  return (NSArray *)v4;
}

- (void)updateChildrenForSingleSelectedElement:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__UIMenu_updateChildrenForSingleSelectedElement___block_invoke;
  aBlock[3] = &unk_1E52E4A78;
  id v5 = v4;
  id v20 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(UIMenu *)self children];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        SEL v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __49__UIMenu_updateChildrenForSingleSelectedElement___block_invoke_2;
        v13[3] = &unk_1E52E4B40;
        id v14 = v5;
        [v12 _acceptMenuVisit:v13 commandVisit:v6 actionVisit:v6 deferredElementVisit:0];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v9);
  }
}

void __49__UIMenu_updateChildrenForSingleSelectedElement___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqual:*(void *)(a1 + 32)] & 1) == 0 && objc_msgSend(v3, "state") == 1) {
    [v3 _setState:0 notifyingObservers:0];
  }
}

- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6
{
  if (a3) {
    (*((void (**)(id, UIMenu *))a3 + 2))(a3, self);
  }
}

- (id)childElementForElement:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__39;
  uint64_t v26 = __Block_byref_object_dispose__39;
  id v27 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(UIMenu *)self children];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(v5);
      }
      uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __33__UIMenu_childElementForElement___block_invoke;
      v15[3] = &unk_1E52E4AF0;
      id v16 = v4;
      long long v17 = &v22;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __33__UIMenu_childElementForElement___block_invoke_2;
      v12[3] = &unk_1E52E4B18;
      id v13 = v16;
      id v14 = &v22;
      [v9 _acceptMenuVisit:v15 leafVisit:v12];
      LOBYTE(v9) = v23[5] == 0;

      if ((v9 & 1) == 0) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v10 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __33__UIMenu_childElementForElement___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isEqual:*(void *)(a1 + 32)]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

uint64_t __49__UIMenu_updateChildrenForSingleSelectedElement___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateChildrenForSingleSelectedElement:*(void *)(a1 + 32)];
}

void __33__UIMenu_childElementForElement___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 childElementForElement:*(void *)(a1 + 32)];
  if (v3)
  {
    id v4 = v3;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
    id v3 = v4;
  }
}

- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a3) {
    (*((void (**)(id, UIMenu *))a3 + 2))(a3, self);
  }
}

- (void)setPreferredElementSize:(UIMenuElementSize)preferredElementSize
{
  self->_preferredElementSize = preferredElementSize;
  self->_resolvedElementSize = preferredElementSize;
}

void __46__UIMenu_DefaultMenus___defaultMenuImageNames__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.menu.format";
  v2[1] = @"com.apple.menu.autofill";
  v3[0] = @"bold.italic.underline";
  v3[1] = @"text.insert";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)qword_1EB2649F8;
  qword_1EB2649F8 = v0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NSString *)self->_identifier isEqualToString:v4[12]];

  return v5;
}

void __42__UIMenu_DefaultMenus___defaultMenuTitles__block_invoke()
{
  v20[17] = *MEMORY[0x1E4F143B8];
  v19[0] = @"com.apple.menu.application";
  long long v18 = +[UIApplication _applicationNameForMenus];
  v20[0] = v18;
  v19[1] = @"com.apple.menu.services";
  long long v17 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUDITEM_APP_SERVICES", @"Services");
  v20[1] = v17;
  v19[2] = @"com.apple.menu.file";
  id v16 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUD_FILE", @"File");
  v20[2] = v16;
  v19[3] = @"com.apple.menu.edit";
  long long v15 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUD_EDIT", @"Edit");
  v20[3] = v15;
  v19[4] = @"com.apple.menu.spelling";
  id v14 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUDITEM_EDIT_SPELLING_AND_GRAMMAR", @"Spelling and Grammar");
  v20[4] = v14;
  v19[5] = @"com.apple.menu.substitutions";
  id v13 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUDITEM_EDIT_SUBSTITUTIONS", @"Substitutions");
  v20[5] = v13;
  v19[6] = @"com.apple.menu.transformations";
  SEL v12 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUDITEM_EDIT_TRANSFORMATIONS", @"Transformations");
  v20[6] = v12;
  v19[7] = @"com.apple.command.speech";
  uint64_t v0 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUDITEM_EDIT_SPEECH", @"Speech");
  v20[7] = v0;
  v19[8] = @"com.apple.menu.format";
  v1 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUD_FORMAT", @"Format");
  v20[8] = v1;
  v19[9] = @"com.apple.menu.font";
  v2 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUDITEM_FORMAT_FONT", @"Font");
  v20[9] = v2;
  v19[10] = @"com.apple.menu.text";
  id v3 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUDITEM_FORMAT_TEXT", @"Text");
  v20[10] = v3;
  v19[11] = @"com.apple.menu.writing-direction";
  id v4 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUDITEM_FORMAT_TEXT_WRITING_DIRECTION", @"Writing Direction");
  v20[11] = v4;
  v19[12] = @"com.apple.menu.view";
  BOOL v5 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUD_VIEW", @"View");
  v20[12] = v5;
  v19[13] = @"com.apple.menu.window";
  uint64_t v6 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUD_WINDOW", @"Window");
  v20[13] = v6;
  v19[14] = @"com.apple.menu.help";
  uint64_t v7 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUD_HELP", @"Help");
  v20[14] = v7;
  v19[15] = @"com.apple.menu.text-style";
  uint64_t v8 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUDITEM_FORMAT_TEXT_STYLE", @"Text Style");
  v20[15] = v8;
  v19[16] = @"com.apple.menu.autofill";
  uint64_t v9 = _UINSLocalizedStringWithDefaultValue(@"KEYSHORTCUTHUD_AUTOFILL", @"AutoFill");
  v20[16] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:17];
  uint64_t v11 = (void *)qword_1EB2649E8;
  qword_1EB2649E8 = v10;
}

- (void)_setSurfacesSelectionState:(BOOL)a3
{
  BOOL v3 = a3;
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UIMenu.m" lineNumber:239 description:@"This may only be used by SpringBoard."];
  }
  if (self->__surfacesSelectionState != v3) {
    self->__surfacesSelectionState = v3;
  }
}

- (UIView)headerView
{
  headerView = (void (**)(void *, UIMenu *))self->_headerView;
  if (!headerView)
  {
    headerView = (void (**)(void *, UIMenu *))self->_headerViewProvider;
    if (headerView)
    {
      headerView[2](headerView, self);
      id v4 = (UIView *)objc_claimAutoreleasedReturnValue();
      BOOL v5 = self->_headerView;
      self->_headerView = v4;

      headerView = (void (**)(void *, UIMenu *))self->_headerView;
    }
  }
  return (UIView *)headerView;
}

- (void)_setResolvedElementSize:(int64_t)a3
{
  if (a3 == -1)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UIMenu.m" lineNumber:263 description:@"Cannot set the resolved element size to be .automatic"];
  }
  self->_resolvedElementSize = a3;
}

- (int64_t)_resolvedElementSize
{
  int64_t result = self->_resolvedElementSize;
  if (result == -1)
  {
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIMenu.m" lineNumber:269 description:@"UIMenu._resolvedElementSize cannot be called before the menu has been prepared for display"];

    return self->_resolvedElementSize;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIMenu;
  [(UIMenuElement *)&v7 encodeWithCoder:v4];
  [v4 encodeObject:self->_identifier forKey:@"identifier"];
  [v4 encodeInteger:self->_options forKey:@"options"];
  [v4 encodeInteger:self->_preferredElementSize forKey:@"preferredElementSize"];
  [v4 encodeInteger:self->_resolvedElementSize forKey:@"resolvedElementSize"];
  [v4 encodeObject:self->_children forKey:@"children"];
  [v4 encodeObject:self->_displayPreferences forKey:@"displayPreferences"];
  if (self->_forceAutomaticSelection) {
    [v4 encodeBool:1 forKey:@"automaticSelection"];
  }
  unint64_t behaviorOptions = self->_behaviorOptions;
  if (behaviorOptions) {
    [v4 encodeInteger:behaviorOptions forKey:@"behaviorOptions"];
  }
  if (self->__surfacesSelectionState) {
    [v4 encodeBool:1 forKey:@"surfacesSelectionState"];
  }
  p_metadata = &self->_metadata;
  if (p_metadata->isPreparedForDisplay) {
    [v4 encodeBool:1 forKey:@"metadata.isPreparedForDisplay"];
  }
  if (p_metadata->hasVisibleSelectedItem) {
    [v4 encodeBool:1 forKey:@"metadata.hasVisibleSelectedItem"];
  }
  if (p_metadata->hasDeepHierarchy) {
    [v4 encodeBool:1 forKey:@"metadata.hasDeepHierarchy"];
  }
  if (p_metadata->hasAtLeastOneVisibleItem) {
    [v4 encodeBool:1 forKey:@"metadata.hasAtLeastOneVisibleItem"];
  }
}

- (UIMenu)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v16.receiver = self;
  v16.super_class = (Class)UIMenu;
  BOOL v5 = [(UIMenuElement *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_options = [(NSCoder *)v4 decodeIntegerForKey:@"options"];
    v5->_preferredElementSize = [(NSCoder *)v4 decodeIntegerForKey:@"preferredElementSize"];
    v5->_resolvedElementSize = [(NSCoder *)v4 decodeIntegerForKey:@"resolvedElementSize"];
    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [(NSCoder *)v4 decodeObjectOfClasses:v10 forKey:@"children"];
    children = v5->_children;
    v5->_children = (NSArray *)v11;

    v5->_forceAutomaticSelection = [(NSCoder *)v4 decodeBoolForKey:@"automaticSelection"];
    v5->_unint64_t behaviorOptions = [(NSCoder *)v4 decodeIntegerForKey:@"behaviorOptions"];
    v5->__surfacesSelectionState = [(NSCoder *)v4 decodeBoolForKey:@"surfacesSelectionState"];
    uint64_t v13 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayPreferences"];
    displayPreferences = v5->_displayPreferences;
    v5->_displayPreferences = (UIMenuDisplayPreferences *)v13;

    v5->_metadata.isPreparedForDisplay = [(NSCoder *)v4 decodeBoolForKey:@"metadata.isPreparedForDisplay"];
    v5->_metadata.hasVisibleSelectedItem = [(NSCoder *)v4 decodeBoolForKey:@"metadata.hasVisibleSelectedItem"];
    v5->_metadata.hasDeepHierarchy = [(NSCoder *)v4 decodeBoolForKey:@"metadata.hasDeepHierarchy"];
    v5->_metadata.hasAtLeastOneVisibleItem = [(NSCoder *)v4 decodeBoolForKey:@"metadata.hasAtLeastOneVisibleItem"];
    if ((v5->_options & 0x20) != 0 || v5->_forceAutomaticSelection)
    {
      [(UIMenu *)v5 addAsStateObserver];
      [(UIMenu *)v5 establishInitialDefaultSingleSelection];
    }
  }

  return v5;
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a3) {
    return (*((uint64_t (**)(id, UIMenu *))a3 + 2))(a3, self);
  }
  else {
    return 0;
  }
}

- (id)_immutableCopy
{
  BOOL v3 = ([(UIMenu *)self options] & 0x20) != 0
    || [(UIMenu *)self forceAutomaticSelection];
  return [(UIMenu *)self _immutableCopySharingLeafObservers:v3];
}

- (id)_immutableCopySharingLeafObservers:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(UIMenu *)self children];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v6) {
    goto LABEL_22;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v23;
  long long v19 = v4;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v5);
      }
      SEL v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
      if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v13 = [v12 _immutableCopySharingLeafObservers:1];
      }
      else
      {
        uint64_t v13 = [v12 _immutableCopy];
      }
      id v14 = (void *)v13;
      if ((void *)v13 != v12)
      {
        if (v9)
        {
          if (v3) {
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v9 = (void *)[v5 mutableCopy];
          if (v3)
          {
LABEL_13:
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __45__UIMenu__immutableCopySharingLeafObservers___block_invoke;
            aBlock[3] = &unk_1E52E4A78;
            id v21 = v14;
            long long v15 = _Block_copy(aBlock);
            [v12 _acceptMenuVisit:0 commandVisit:v15 actionVisit:v15 deferredElementVisit:0];
          }
        }
        [v9 setObject:v14 atIndexedSubscript:v8 + v11];
      }

      ++v11;
    }
    while (v7 != v11);
    uint64_t v16 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    uint64_t v7 = v16;
    v8 += v11;
  }
  while (v16);
  id v4 = v19;
  if (v9)
  {
    long long v17 = [(UIMenu *)v19 menuByReplacingChildren:v9];
    [(UIMenu *)v17 setMetadata:[(UIMenu *)v19 metadata] & 0xFFFFFFFFFFLL];
    goto LABEL_23;
  }
LABEL_22:
  long long v17 = v4;
  uint64_t v9 = 0;
LABEL_23:

  return v17;
}

void __45__UIMenu__immutableCopySharingLeafObservers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(id *)(a1 + 32);
  id v4 = [a2 _getStateObservers];
  [v3 _setStateObservers:v4];
}

- (id)_copyWithOptions:(unint64_t)a3
{
  id result = (id)[objc_alloc((Class)objc_opt_class()) initWithMenu:self overrideChildren:0];
  *((void *)result + 13) = a3;
  return result;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = [(UIMenuElement *)self title];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [(UIMenuElement *)self title];
    [v3 appendFormat:@"; title = %@", v6];
  }
  uint64_t v7 = [(UIMenu *)self identifier];
  [v3 appendFormat:@"; identifier = %@", v7];

  uint64_t v8 = [(UIMenuElement *)self image];
  if (v8)
  {
    [v3 appendFormat:@"; image = <%@: %p", objc_opt_class(), v8];
    if ([v8 isSymbolImage])
    {
      uint64_t v9 = _UIImageName(v8);
      [v3 appendFormat:@"; symbol = (%@)", v9];
    }
    [v3 appendString:@">"];
  }
  if ([(UIMenu *)self options])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    if ([(UIMenu *)self options]) {
      [v10 addObject:@"Inline"];
    }
    if (([(UIMenu *)self options] & 2) != 0) {
      [v10 addObject:@"Destructive"];
    }
    if (([(UIMenu *)self options] & 4) != 0) {
      [v10 addObject:@"Compact"];
    }
    if (([(UIMenu *)self options] & 0x10) != 0) {
      [v10 addObject:@"AlwaysDisplayChildImages"];
    }
    if (([(UIMenu *)self options] & 0x20) != 0) {
      [v10 addObject:@"SingleSelection"];
    }
    if (([(UIMenu *)self options] & 0x80) != 0) {
      [v10 addObject:@"Palette"];
    }
    uint64_t v11 = [v10 componentsJoinedByString:@"|"];
    [v3 appendFormat:@"; options = (%@)", v11];
  }
  if ([(UIMenu *)self forceAutomaticSelection]) {
    [v3 appendString:@"; forcesAutomaticSelection"];
  }
  SEL v12 = [(UIMenu *)self selectedElements];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    id v14 = [(UIMenu *)self selectedElements];
    objc_msgSend(v3, "appendFormat:", @"; currentSelection = <NSArray: %p>", v14);
  }
  if (self->_hasCustomizedDisplayPreferences)
  {
    long long v15 = [(UIMenu *)self displayPreferences];
    uint64_t v16 = objc_opt_class();
    long long v17 = [(UIMenu *)self displayPreferences];
    [v3 appendFormat:@"; displayPreferences = <%@: %p>", v16, v17];
  }
  UIMenuElementSize v18 = [(UIMenu *)self preferredElementSize];
  if ((unint64_t)v18 <= UIMenuElementSizeLarge) {
    [v3 appendString:off_1E52E4C28[v18]];
  }
  long long v19 = [(UIMenu *)self children];
  objc_msgSend(v3, "appendFormat:", @"; children = <NSArray: %p>>", v19);

  return (NSString *)v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (void)removeAsStateObserver
{
}

- (void)_elementWillPerformAction:(id)a3
{
  id v3 = a3;
  if ([v3 state] != 1) {
    [v3 _setState:1 notifyingObservers:1];
  }
}

- (id)recursivelySelectDefaultForcedSelection:(BOOL)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__39;
  long long v25 = __Block_byref_object_dispose__39;
  id v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__UIMenu_recursivelySelectDefaultForcedSelection___block_invoke;
  aBlock[3] = &unk_1E52E4B68;
  BOOL v20 = a3;
  void aBlock[4] = &v21;
  uint64_t v5 = _Block_copy(aBlock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(UIMenu *)self children];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __50__UIMenu_recursivelySelectDefaultForcedSelection___block_invoke_2;
      v13[3] = &unk_1E52E4B90;
      void v13[4] = &v21;
      BOOL v14 = a3;
      [v10 _acceptMenuVisit:v13 commandVisit:v5 actionVisit:v5 deferredElementVisit:0];
      if (v22[5]) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v27 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v11 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __50__UIMenu_recursivelySelectDefaultForcedSelection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 _setState:1 notifyingObservers:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __50__UIMenu_recursivelySelectDefaultForcedSelection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 recursivelySelectDefaultForcedSelection:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- ($9BEB610D0CE1B1EDC3D89DA2464F985F)metadata
{
  return ($9BEB610D0CE1B1EDC3D89DA2464F985F)(*(unsigned int *)&self->_metadata.isPreparedForDisplay | ((unint64_t)self->_metadata.hasVisibleLargePalette << 32));
}

- (void)setMetadata:(id)a3
{
  self->_metadata = ($1FE16939D5FD5624FB4B9D09B9AC0BB3)a3;
}

- (UIMenuForcedAutomaticSelectionDelegate)forcedAutomaticSelectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forcedAutomaticSelectionDelegate);
  return (UIMenuForcedAutomaticSelectionDelegate *)WeakRetained;
}

- (BOOL)_hasGlobalHeader
{
  uint64_t v3 = [(UIMenuElement *)self title];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(UIMenu *)self headerView];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)_shouldShowSelectionState
{
  if (![(UIMenu *)self _surfacesSelectionState]) {
    return 0;
  }
  uint64_t v3 = [(UIMenu *)self selectedElements];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)_resolveElementSizeWithContext:(id)a3
{
  BOOL v4 = [a3 elementSizeSolver];
  [(UIMenu *)self _setResolvedElementSize:v4[2](v4, self)];
}

@end