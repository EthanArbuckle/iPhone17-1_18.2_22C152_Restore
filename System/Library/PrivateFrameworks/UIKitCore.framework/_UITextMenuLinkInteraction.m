@interface _UITextMenuLinkInteraction
- (BOOL)_contextMenuInteraction:(id)a3 shouldAttemptToPresentConfiguration:(id)a4;
- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (_UITextMenuLinkInteraction)initWithShouldProxyContextMenuDelegate:(BOOL)a3;
- (id)_contextMenuInteraction:(id)a3 configuration:(id)a4 interactionEffectForTargetedPreview:(id)a5;
- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)_targetedPreviewForItem:(id)a3 dismissing:(BOOL)a4;
- (id)contextMenuDelegateProxy;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)editMenuInteraction;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (void)_willDisplayMenuForItem:(id)a3 animator:(id)a4;
- (void)_willEndMenuDisplayForItem:(id)a3 animator:(id)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)didMoveToView:(id)a3;
- (void)dismissEditMenuOnSelectionChangeIfNecessary;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)willMoveToView:(id)a3;
@end

@implementation _UITextMenuLinkInteraction

- (void)willMoveToView:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UITextMenuLinkInteraction;
  [(UITextInteraction *)&v10 willMoveToView:a3];
  if (![(_UITextSimpleLinkInteraction *)self shouldProxyContextMenuDelegate])
  {
    v4 = [(UITextLinkInteraction *)self contextMenuInteraction];

    if (v4)
    {
      v5 = [(UITextLinkInteraction *)self contextMenuInteraction];
      v6 = [v5 view];
      v7 = [(UITextLinkInteraction *)self contextMenuInteraction];
      [v6 removeInteraction:v7];
    }
  }
  editMenuInteraction = self->_editMenuInteraction;
  if (editMenuInteraction)
  {
    v9 = [(UIEditMenuInteraction *)editMenuInteraction view];
    [v9 removeInteraction:self->_editMenuInteraction];
  }
}

- (_UITextMenuLinkInteraction)initWithShouldProxyContextMenuDelegate:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UITextMenuLinkInteraction;
  v4 = -[_UITextSimpleLinkInteraction initWithShouldProxyContextMenuDelegate:](&v10, sel_initWithShouldProxyContextMenuDelegate_);
  if (v4)
  {
    if (!a3)
    {
      v5 = [[UIContextMenuInteraction alloc] initWithDelegate:v4];
      contextMenuInteraction = v4->super.super._contextMenuInteraction;
      v4->super.super._contextMenuInteraction = v5;
    }
    uint64_t v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    configurationItems = v4->_configurationItems;
    v4->_configurationItems = (NSMapTable *)v7;
  }
  return v4;
}

- (id)contextMenuDelegateProxy
{
  if ([(_UITextSimpleLinkInteraction *)self shouldProxyContextMenuDelegate]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (void)didMoveToView:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UITextMenuLinkInteraction;
  [(_UITextSimpleLinkInteraction *)&v7 didMoveToView:v4];
  if (![(_UITextSimpleLinkInteraction *)self shouldProxyContextMenuDelegate])
  {
    v5 = [(UITextLinkInteraction *)self contextMenuInteraction];

    if (v5)
    {
      v6 = [(UITextLinkInteraction *)self contextMenuInteraction];
      [v4 addInteraction:v6];
    }
  }
  if (self->_editMenuInteraction) {
    objc_msgSend(v4, "addInteraction:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_configurationItems, 0);
}

- (id)editMenuInteraction
{
  editMenuInteraction = self->_editMenuInteraction;
  if (!editMenuInteraction)
  {
    id v4 = [[UIEditMenuInteraction alloc] initWithDelegate:self];
    v5 = self->_editMenuInteraction;
    self->_editMenuInteraction = v4;

    [(UIEditMenuInteraction *)self->_editMenuInteraction setPresentsContextMenuAsSecondaryAction:0];
    v6 = [(UITextInteraction *)self view];
    [v6 addInteraction:self->_editMenuInteraction];

    editMenuInteraction = self->_editMenuInteraction;
  }
  return editMenuInteraction;
}

- (void)dismissEditMenuOnSelectionChangeIfNecessary
{
  if (!self->_isModifyingSelectionForLinkPresentation) {
    [(UIEditMenuInteraction *)self->_editMenuInteraction dismissMenu];
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  if (![(_UITextSimpleLinkInteraction *)self _allowItemInteractions])
  {
    objc_super v10 = 0;
    goto LABEL_11;
  }
  v8 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
  v9 = objc_msgSend(v8, "_textInteractableItemAtPoint:precision:", objc_msgSend(v7, "_inputPrecision"), x, y);

  if ([v7 _inputPrecision] == 2 && (objc_msgSend(v9, "hasPrimaryAction") & 1) == 0)
  {
    [(_UITextSimpleLinkInteraction *)self _removeInteractableItemFromCache:v9];

    v9 = 0;
  }
  else if (v9)
  {
    objc_super v10 = [v9 contextMenuConfiguration];
    if (v10) {
      [(NSMapTable *)self->_configurationItems setObject:v9 forKey:v10];
    }
    goto LABEL_10;
  }
  objc_super v10 = 0;
LABEL_10:

LABEL_11:
  return v10;
}

- (BOOL)_contextMenuInteraction:(id)a3 shouldAttemptToPresentConfiguration:(id)a4
{
  v5 = [(NSMapTable *)self->_configurationItems objectForKey:a4];
  if (v5)
  {
    v6 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
    char v7 = [v6 _allowInteraction:1 forTextInteractableItem:v5];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  getDDContextMenuConfigurationClass();
  if (objc_opt_isKindOfClass()) {
    int v8 = [v7 prefersActionMenuStyle];
  }
  else {
    int v8 = 0;
  }
  v9 = [(NSMapTable *)self->_configurationItems objectForKey:v7];
  objc_super v10 = +[_UIContextMenuStyle defaultStyle];
  v11 = v10;
  if (v8)
  {
    [v10 setPreferredLayout:1];
  }
  else if (self->super._presentingFromSimpleTap || ([v9 showsMenuPreview] & 1) == 0)
  {
    [v11 setPreferredLayout:3];
    v12 = [(_UITextMenuLinkInteraction *)self _targetedPreviewForItem:v9 dismissing:0];
    v13 = [v6 view];
    v14 = [v13 _window];

    v15 = [v12 target];
    v16 = [v15 container];
    v17 = [v12 target];
    [v17 center];
    objc_msgSend(v16, "convertPoint:toView:", v14);
    double v19 = v18;

    uint64_t v49 = 0;
    long long v47 = 0u;
    long long v48 = 0u;
    if (v11) {
      [v11 _preferredAnchor];
    }
    [v14 bounds];
    CGFloat MidY = CGRectGetMidY(v51);
    BOOL v21 = v19 <= MidY;
    uint64_t v22 = 4;
    if (v19 > MidY) {
      uint64_t v22 = 1;
    }
    double v23 = -8.0;
    if (!v21) {
      double v23 = 5.0;
    }
    *(void *)&long long v47 = v22;
    *(double *)&long long v48 = v23;
    v24 = [v6 view];
    v25 = [v24 traitCollection];
    v26 = _UIContextMenuGetPlatformMetrics([v25 userInterfaceIdiom]);
    [v26 menuItemInternalPadding];
    double v28 = v27;

    v29 = [v12 parameters];
    v30 = [v29 visiblePath];
    [v30 bounds];
    double v32 = v31;

    v33 = [v12 view];
    [v33 bounds];
    double v35 = v34 - v32 - v28;

    v36 = [v12 view];
    [v36 frame];
    double MidX = CGRectGetMidX(v52);
    v38 = [v12 target];
    v39 = [v38 container];
    [v39 center];
    double v41 = v40;

    double v42 = -v35;
    uint64_t v43 = 8;
    if (MidX < v41)
    {
      uint64_t v43 = 2;
      double v42 = v35;
    }
    *((void *)&v47 + 1) = v43;
    *((double *)&v48 + 1) = v42;
    uint64_t v46 = v49;
    v45[0] = v47;
    v45[1] = v48;
    objc_msgSend(v11, "set_preferredAnchor:", v45);
  }
  return v11;
}

- (id)_targetedPreviewForItem:(id)a3 dismissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
  int v8 = [v7 _targetedPreviewForTextInteractableItem:v6 dismissing:v4];

  return v8;
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  v5 = [(NSMapTable *)self->_configurationItems objectForKey:a4];
  if (v5)
  {
    id v6 = [(_UITextMenuLinkInteraction *)self _targetedPreviewForItem:v5 dismissing:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  v5 = [(NSMapTable *)self->_configurationItems objectForKey:a4];
  id v6 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
  id v7 = v6;
  if (v5 && ([v6 window], int v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    v9 = [(_UITextMenuLinkInteraction *)self _targetedPreviewForItem:v5 dismissing:1];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_contextMenuInteraction:(id)a3 configuration:(id)a4 interactionEffectForTargetedPreview:(id)a5
{
  id v7 = a5;
  int v8 = [(NSMapTable *)self->_configurationItems objectForKey:a4];
  if ([v8 showsMenuPreview])
  {
    v9 = 0;
  }
  else
  {
    v9 = +[_UINullClickHighlightEffect effectWithPreview:v7 continuingFromPreview:0];
  }

  return v9;
}

- (void)_willDisplayMenuForItem:(id)a3 animator:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    id v7 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_isModifyingSelectionForLinkPresentation = 1;
      int v8 = [v10 range];
      [v7 setSelectedTextRange:v8];

      self->_isModifyingSelectionForLinkPresentation = 0;
    }
    [v10 highlight];
    if (v6)
    {
      v9 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
      [v9 _textInteractableItem:v10 willDisplayMenuWithAnimator:v6];
    }
  }
}

- (void)_willEndMenuDisplayForItem:(id)a3 animator:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    [v10 unhighlight];
    if (v6)
    {
      id v7 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
      [v7 _textInteractableItem:v10 willDismissMenuWithAnimator:v6];
    }
    int v8 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
    v9 = [v8 _textInteractableItemCache];
    [v9 removeItem:v10];
  }
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  configurationItems = self->_configurationItems;
  id v8 = a5;
  id v9 = [(NSMapTable *)configurationItems objectForKey:a4];
  [(_UITextMenuLinkInteraction *)self _willDisplayMenuForItem:v9 animator:v8];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  configurationItems = self->_configurationItems;
  id v8 = a5;
  id v9 = [(NSMapTable *)configurationItems objectForKey:a4];
  [(_UITextMenuLinkInteraction *)self _willEndMenuDisplayForItem:v9 animator:v8];
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v6 = a4;
  [v6 sourcePoint];
  double v8 = v7;
  double v10 = v9;
  v11 = [(_UITextSimpleLinkInteraction *)self itemInteractableView];
  v12 = objc_msgSend(v11, "_textInteractableItemAtPoint:precision:", 0, v8, v10);

  if (v12)
  {
    [(NSMapTable *)self->_configurationItems setObject:v12 forKey:v6];
    v13 = [v12 preparedMenuConfiguration];
    v14 = [v13 menu];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v5 = [(NSMapTable *)self->_configurationItems objectForKey:a4];
  if (v5)
  {
    id v6 = [(_UITextMenuLinkInteraction *)self _targetedPreviewForItem:v5 dismissing:0];
    double v7 = (CGFloat *)MEMORY[0x1E4F1DB20];
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    double v10 = objc_msgSend(v6, "parameters", 0);
    v11 = [v10 _textLineRects];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      CGFloat x = *v7;
      CGFloat y = v7[1];
      uint64_t v16 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * i) CGRectValue];
          v42.origin.CGFloat x = v18;
          v42.origin.CGFloat y = v19;
          v42.size.double width = v20;
          v42.size.double height = v21;
          v39.origin.CGFloat x = x;
          v39.origin.CGFloat y = y;
          v39.size.double width = width;
          v39.size.double height = height;
          CGRect v40 = CGRectUnion(v39, v42);
          CGFloat x = v40.origin.x;
          CGFloat y = v40.origin.y;
          double width = v40.size.width;
          double height = v40.size.height;
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v13);
    }

    uint64_t v22 = [v6 target];
    [v22 center];
    double v24 = v23;
    double v26 = v25;

    double v27 = round(v26 - height * 0.5);
    double v28 = round(v24 - width * 0.5);
  }
  else
  {
    double v28 = *MEMORY[0x1E4F1DB20];
    double v27 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v29 = v28;
  double v30 = v27;
  double v31 = width;
  double v32 = height;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  configurationItems = self->_configurationItems;
  id v8 = a5;
  id v9 = [(NSMapTable *)configurationItems objectForKey:a4];
  [(_UITextMenuLinkInteraction *)self _willDisplayMenuForItem:v9 animator:v8];
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  configurationItems = self->_configurationItems;
  id v8 = a5;
  id v9 = [(NSMapTable *)configurationItems objectForKey:a4];
  [(_UITextMenuLinkInteraction *)self _willEndMenuDisplayForItem:v9 animator:v8];
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  getDDContextMenuConfigurationClass();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  id v8 = v6;
  id v9 = [v8 interactionURL];

  if (v9)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __111___UITextMenuLinkInteraction_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    aBlock[3] = &unk_1E52D9F70;
    id v21 = v8;
    double v10 = _Block_copy(aBlock);
    v11 = v21;
  }
  else
  {
    uint64_t v12 = [v8 interactionViewControllerProvider];
    if (!v12)
    {

LABEL_12:
      [v7 setPreferredCommitStyle:0];
      goto LABEL_13;
    }
    v11 = (void *)v12;
    uint64_t v13 = (*(void (**)(void))(v12 + 16))();
    if (v13)
    {
      v14 = [v7 previewViewController];
      v15 = [v14 presentingViewController];

      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __111___UITextMenuLinkInteraction_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_2;
      v17[3] = &unk_1E52D9F98;
      id v18 = v15;
      id v19 = v13;
      id v16 = v15;
      double v10 = _Block_copy(v17);
    }
    else
    {
      double v10 = 0;
    }
  }
  if (!v10) {
    goto LABEL_12;
  }
  [v7 addAnimations:v10];
  [v7 setPreferredCommitStyle:1];

LABEL_13:
}

@end