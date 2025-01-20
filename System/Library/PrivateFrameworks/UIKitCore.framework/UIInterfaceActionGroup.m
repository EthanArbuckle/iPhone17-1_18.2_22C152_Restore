@interface UIInterfaceActionGroup
+ (BOOL)changedProperties:(id)a3 containsAny:(id)a4;
+ (id)actionGroupWithActions:(id)a3;
+ (id)actionGroupWithActionsBySection:(id)a3;
- (CGSize)leadingImageLayoutSize;
- (CGSize)trailingImageLayoutSize;
- (NSArray)actions;
- (NSArray)actionsBySection;
- (NSPointerArray)weakDisplayPropertyObservers;
- (NSString)description;
- (NSString)title;
- (UIInterfaceAction)preferredAction;
- (UIInterfaceActionGroup)initWithTitle:(id)a3 actionsBySection:(id)a4;
- (UIInterfaceActionVisualStyle)_visualStyle;
- (id)_deepCopyOfActionsBySection;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_addActionGroupDisplayPropertyObserver:(id)a3;
- (void)_beginObservingActions;
- (void)_endObservingActions;
- (void)_notifyObserversDidChangeActionProperty:(id)a3;
- (void)_notifyObserversVisualStyleDidChange;
- (void)_performWithActionObservingDisabled:(id)a3;
- (void)_reloadImageLayoutSizesUsingExistingActionImages;
- (void)_removeActionGroupDisplayPropertyObserver:(id)a3;
- (void)_setVisualStyle:(id)a3;
- (void)_updateActionImageLayoutSizes;
- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4;
- (void)setLeadingImageLayoutSize:(CGSize)a3;
- (void)setPreferredAction:(id)a3;
- (void)setTrailingImageLayoutSize:(CGSize)a3;
@end

@implementation UIInterfaceActionGroup

+ (BOOL)changedProperties:(id)a3 containsAny:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(v5, "containsObject:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

+ (id)actionGroupWithActions:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [[UIInterfaceActionSection alloc] initWithActions:v4];

  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v8 = (void *)[v5 initWithTitle:&stru_1ED0E84C0 actionsBySection:v7];

  return v8;
}

+ (id)actionGroupWithActionsBySection:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithTitle:&stru_1ED0E84C0 actionsBySection:v4];

  return v5;
}

- (UIInterfaceActionGroup)initWithTitle:(id)a3 actionsBySection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UIInterfaceActionGroup;
  uint64_t v9 = [(UIInterfaceActionGroup *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    uint64_t v11 = +[UIInterfaceActionSection actionsFromSections:v8];
    actions = v10->_actions;
    v10->_actions = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_actionsBySection, a4);
    uint64_t v13 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    weakDisplayPropertyObservers = v10->_weakDisplayPropertyObservers;
    v10->_weakDisplayPropertyObservers = (NSPointerArray *)v13;

    CGSize v15 = (CGSize)*MEMORY[0x1E4F1DB30];
    v10->_leadingImageLayoutSize = (CGSize)*MEMORY[0x1E4F1DB30];
    v10->_trailingImageLayoutSize = v15;
    [(UIInterfaceActionGroup *)v10 _beginObservingActions];
    [(UIInterfaceActionGroup *)v10 _reloadImageLayoutSizesUsingExistingActionImages];
  }

  return v10;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(NSString *)self->_title length])
  {
    id v4 = [NSString stringWithFormat:@"'%@'", self->_title];
    [v3 addObject:v4];
  }
  id v5 = NSString;
  if ([(NSArray *)self->_actions count]) {
    actions = self->_actions;
  }
  else {
    actions = (NSArray *)@"()";
  }
  id v7 = [v5 stringWithFormat:@"actions = %@", actions];
  [v3 addObject:v7];

  id v8 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)UIInterfaceActionGroup;
  uint64_t v9 = [(UIInterfaceActionGroup *)&v13 description];
  v10 = [v3 componentsJoinedByString:@", "];
  uint64_t v11 = [v8 stringWithFormat:@"%@ %@", v9, v10];

  return (NSString *)v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(UIInterfaceActionGroup *)self title];
  id v6 = [(UIInterfaceActionGroup *)self _deepCopyOfActionsBySection];
  uint64_t v7 = [v4 initWithTitle:v5 actionsBySection:v6];

  *(CGSize *)(v7 + 56) = self->_leadingImageLayoutSize;
  *(CGSize *)(v7 + 72) = self->_trailingImageLayoutSize;
  objc_storeStrong((id *)(v7 + 16), self->_preferredAction);
  return (id)v7;
}

- (void)setLeadingImageLayoutSize:(CGSize)a3
{
  if (self->_leadingImageLayoutSize.width != a3.width || self->_leadingImageLayoutSize.height != a3.height)
  {
    self->_leadingImageLayoutSize = a3;
    [(UIInterfaceActionGroup *)self _updateActionImageLayoutSizes];
  }
}

- (void)setTrailingImageLayoutSize:(CGSize)a3
{
  if (self->_trailingImageLayoutSize.width != a3.width || self->_trailingImageLayoutSize.height != a3.height)
  {
    self->_trailingImageLayoutSize = a3;
    [(UIInterfaceActionGroup *)self _updateActionImageLayoutSizes];
  }
}

- (void)setPreferredAction:(id)a3
{
  id v5 = a3;
  if (([(UIInterfaceAction *)self->_preferredAction isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredAction, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__UIInterfaceActionGroup_setPreferredAction___block_invoke;
    v6[3] = &unk_1E52D9F70;
    v6[4] = self;
    [(UIInterfaceActionGroup *)self _performWithActionObservingDisabled:v6];
  }
}

uint64_t __45__UIInterfaceActionGroup_setPreferredAction___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) actions];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__UIInterfaceActionGroup_setPreferredAction___block_invoke_2;
  v4[3] = &unk_1E52DA370;
  v4[4] = *(void *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v4];

  return [*(id *)(a1 + 32) _notifyObserversDidChangeActionProperty:@"preferredAction"];
}

void __45__UIInterfaceActionGroup_setPreferredAction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  id v3 = a2;
  objc_msgSend(v3, "_setIsPreferred:", objc_msgSend(v3, "isEqual:", v2));
}

- (void)_setVisualStyle:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(UIInterfaceActionVisualStyle *)self->_visualStyle isEqual:v5])
  {
    objc_storeStrong((id *)&self->_visualStyle, a3);
    [(UIInterfaceActionGroup *)self _notifyObserversVisualStyleDidChange];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_actions;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "_setVisualStyle:", v5, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_addActionGroupDisplayPropertyObserver:(id)a3
{
  weakDisplayPropertyObservers = self->_weakDisplayPropertyObservers;
  id v5 = a3;
  [(NSPointerArray *)weakDisplayPropertyObservers compact];
  [(NSPointerArray *)self->_weakDisplayPropertyObservers addPointer:v5];
}

- (void)_removeActionGroupDisplayPropertyObserver:(id)a3
{
  weakDisplayPropertyObservers = self->_weakDisplayPropertyObservers;
  id v5 = a3;
  [(NSPointerArray *)weakDisplayPropertyObservers compact];
  id v6 = [(NSPointerArray *)self->_weakDisplayPropertyObservers allObjects];
  uint64_t v7 = [v6 indexOfObject:v5];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = self->_weakDisplayPropertyObservers;
    [(NSPointerArray *)v8 removePointerAtIndex:v7];
  }
}

- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v13[0] = 0x1ED0EA280;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  BOOL v9 = +[UIInterfaceAction changedProperties:v7 containsAny:v8];

  if (v9)
  {
    if ([v6 _isPreferred]) {
      [(UIInterfaceActionGroup *)self setPreferredAction:v6];
    }
  }
  else
  {
    v12[0] = 0x1ED0EA320;
    v12[1] = 0x1ED0EA360;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    BOOL v11 = +[UIInterfaceAction changedProperties:v7 containsAny:v10];

    if (v11) {
      [(UIInterfaceActionGroup *)self _reloadImageLayoutSizesUsingExistingActionImages];
    }
  }
}

- (void)_updateActionImageLayoutSizes
{
  actions = self->_actions;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__UIInterfaceActionGroup__updateActionImageLayoutSizes__block_invoke;
  v3[3] = &unk_1E52DA370;
  v3[4] = self;
  [(NSArray *)actions enumerateObjectsUsingBlock:v3];
}

void __55__UIInterfaceActionGroup__updateActionImageLayoutSizes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(double *)(v3 + 56);
  double v5 = *(double *)(v3 + 64);
  id v6 = a2;
  objc_msgSend(v6, "setLeadingImageLayoutSize:", v4, v5);
  objc_msgSend(v6, "setTrailingImageLayoutSize:", *(double *)(*(void *)(a1 + 32) + 72), *(double *)(*(void *)(a1 + 32) + 80));
}

- (void)_reloadImageLayoutSizesUsingExistingActionImages
{
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  id v32 = 0;
  uint64_t v22 = 0;
  v23 = (double *)&v22;
  uint64_t v24 = 0x3010000000;
  v25 = &unk_186D7DBA7;
  long long v26 = *MEMORY[0x1E4F1DB30];
  uint64_t v16 = 0;
  objc_super v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  uint64_t v11 = 0;
  long long v12 = (double *)&v11;
  uint64_t v13 = 0x3010000000;
  long long v14 = &unk_186D7DBA7;
  long long v15 = v26;
  actions = self->_actions;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __74__UIInterfaceActionGroup__reloadImageLayoutSizesUsingExistingActionImages__block_invoke;
  v10[3] = &unk_1E52DA398;
  v10[4] = &v27;
  v10[5] = &v22;
  v10[6] = &v16;
  v10[7] = &v11;
  [(NSArray *)actions enumerateObjectsUsingBlock:v10];
  [(id)v28[5] size];
  self->_leadingImageLayoutSize.width = v4;
  self->_leadingImageLayoutSize.height = v5;
  id v6 = v23;
  self->_leadingImageLayoutSize.width = v4 + v23[4];
  self->_leadingImageLayoutSize.height = v5 + v6[5];
  [(id)v17[5] size];
  self->_trailingImageLayoutSize.width = v7;
  self->_trailingImageLayoutSize.height = v8;
  BOOL v9 = v12;
  self->_trailingImageLayoutSize.width = v7 + v12[4];
  self->_trailingImageLayoutSize.height = v8 + v9[5];
  [(UIInterfaceActionGroup *)self _updateActionImageLayoutSizes];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v27, 8);
}

void __74__UIInterfaceActionGroup__reloadImageLayoutSizesUsingExistingActionImages__block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(a1[4] + 8);
  double v8 = *(void **)(v7 + 40);
  id v34 = v6;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v9;
  }
  else
  {
    uint64_t v11 = [v6 leadingImage];
    uint64_t v12 = *(void *)(a1[4] + 8);
    uint64_t v10 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

  uint64_t v13 = *(void **)(*(void *)(a1[4] + 8) + 40);
  if (v13)
  {
    [v13 alignmentRectInsets];
    double v15 = v14;
    [*(id *)(*(void *)(a1[4] + 8) + 40) alignmentRectInsets];
    *(double *)(*(void *)(a1[5] + 8) + 32) = -(v15 + v16);
    [*(id *)(*(void *)(a1[4] + 8) + 40) alignmentRectInsets];
    double v18 = v17;
    [*(id *)(*(void *)(a1[4] + 8) + 40) alignmentRectInsets];
    *(double *)(*(void *)(a1[5] + 8) + 40) = -(v18 + v19);
  }
  uint64_t v20 = *(void *)(a1[6] + 8);
  id v21 = *(void **)(v20 + 40);
  if (v21)
  {
    id v22 = v21;
    v23 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v22;
  }
  else
  {
    uint64_t v24 = [v34 trailingImage];
    uint64_t v25 = *(void *)(a1[6] + 8);
    v23 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;
  }

  long long v26 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (v26)
  {
    [v26 alignmentRectInsets];
    double v28 = v27;
    [*(id *)(*(void *)(a1[6] + 8) + 40) alignmentRectInsets];
    *(double *)(*(void *)(a1[7] + 8) + 32) = -(v28 + v29);
    [*(id *)(*(void *)(a1[6] + 8) + 40) alignmentRectInsets];
    double v31 = v30;
    [*(id *)(*(void *)(a1[6] + 8) + 40) alignmentRectInsets];
    *(double *)(*(void *)(a1[7] + 8) + 40) = -(v31 + v32);
  }
  uint64_t v33 = *(void *)(*(void *)(a1[4] + 8) + 40);
  if (v33) {
    LOBYTE(v33) = *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
  }
  *a4 = v33;
}

- (void)_notifyObserversVisualStyleDidChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(NSPointerArray *)self->_weakDisplayPropertyObservers compact];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = (void *)[(NSPointerArray *)self->_weakDisplayPropertyObservers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) interfaceActionGroup:self reloadDisplayedContentVisualStyle:self->_visualStyle];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversDidChangeActionProperty:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSPointerArray *)self->_weakDisplayPropertyObservers compact];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObject:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = (void *)[(NSPointerArray *)self->_weakDisplayPropertyObservers copy];
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
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) interfaceActionGroup:self reloadDisplayedContentActionGroupProperties:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_performWithActionObservingDisabled:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(UIInterfaceActionGroup *)self _endObservingActions];
  v4[2](v4);

  [(UIInterfaceActionGroup *)self _beginObservingActions];
}

- (void)_beginObservingActions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_actions;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "_addActionDisplayPropertyObserver:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_endObservingActions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_actions;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "_removeActionDisplayPropertyObserver:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_deepCopyOfActionsBySection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_actionsBySection;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "copy", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSArray)actions
{
  return self->_actions;
}

- (UIInterfaceAction)preferredAction
{
  return self->_preferredAction;
}

- (NSPointerArray)weakDisplayPropertyObservers
{
  return self->_weakDisplayPropertyObservers;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)actionsBySection
{
  return self->_actionsBySection;
}

- (CGSize)leadingImageLayoutSize
{
  double width = self->_leadingImageLayoutSize.width;
  double height = self->_leadingImageLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)trailingImageLayoutSize
{
  double width = self->_trailingImageLayoutSize.width;
  double height = self->_trailingImageLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIInterfaceActionVisualStyle)_visualStyle
{
  return self->_visualStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_actionsBySection, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_weakDisplayPropertyObservers, 0);
  objc_storeStrong((id *)&self->_preferredAction, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end