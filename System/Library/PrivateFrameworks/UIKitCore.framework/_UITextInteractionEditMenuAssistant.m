@interface _UITextInteractionEditMenuAssistant
- (BOOL)_editMenuDismissedByActionSelection;
- (BOOL)_editMenuDismissedRecently;
- (BOOL)_editMenuIsVisible;
- (BOOL)_editMenuIsVisibleOrDismissedRecently;
- (BOOL)_editMenuPrefersPresentationInView;
- (BOOL)_hasTextReplacements;
- (BOOL)_isAffectedByScrollNotification:(id)a3;
- (BOOL)_updateEditMenuPositionForPreferredArrowDirection:(int64_t)a3 replacements:(id)a4;
- (CGRect)_clippedTargetRect:(CGRect)a3;
- (CGRect)_editMenuRawTargetRect;
- (CGRect)_editMenuTargetRect;
- (CGRect)selectionBoundingBox;
- (CGRect)selectionBoundingBoxForRects:(id)a3;
- (NSArray)_preferredLayoutRectsForEditMenu;
- (NSArray)replacements;
- (UIMenu)overrideMenu;
- (UITextContextMenuInteraction)menuInteraction;
- (UITextInteractionAssistant)interactionAssistant;
- (UIView)_selectionView;
- (UIWindow)_editMenuSourceWindow;
- (_UITextInteractionEditMenuAssistant)initWithInteractionAssistant:(id)a3;
- (id)_editMenuConfigurationForCurrentSelectionWithPreferredArrowDirection:(int64_t)a3;
- (id)_screenCoordinateSpace;
- (id)_selectionViewCoordinateSpace;
- (id)_textViewCoordinateSpace;
- (id)_windowCoordinateSpace;
- (id)menuElementsForReplacements:(id)a3;
- (void)_didReceiveSelectionDidScrollNotification:(id)a3;
- (void)_didReceiveSelectionWillScrollNotification:(id)a3;
- (void)_hideSelectionCommandsWithReason:(int64_t)a3;
- (void)_presentEditMenuWithPreferredDirection:(int64_t)a3 overrideMenu:(id)a4;
- (void)_presentEditMenuWithPreferredDirection:(int64_t)a3 replacements:(id)a4;
- (void)_presentEditMenuWithPreferredDirection:(int64_t)a3 replacements:(id)a4 overrideMenu:(id)a5;
- (void)_showCommandsWithReplacements:(id)a3 forDictation:(BOOL)a4 afterDelay:(double)a5;
- (void)_showCommandsWithReplacements:(id)a3 isForContextMenu:(BOOL)a4 forDictation:(BOOL)a5 arrowDirection:(int64_t)a6;
- (void)_showSelectionCommandsForContextMenu:(BOOL)a3;
- (void)calculateReplacementsWithGenerator:(id)a3 andShowAfterDelay:(double)a4;
- (void)cancelDelayedCommandRequests;
- (void)hideSelectionCommands;
- (void)setMenuInteraction:(id)a3;
- (void)showCalloutBarAfterDelay:(double)a3;
- (void)showCommandsWithReplacements:(id)a3;
- (void)showReplacementsWithGenerator:(id)a3 forDictation:(BOOL)a4 afterDelay:(double)a5;
- (void)showSelectionCommands;
- (void)showSelectionCommandsAfterDelay:(double)a3;
@end

@implementation _UITextInteractionEditMenuAssistant

- (void)hideSelectionCommands
{
}

- (void)_didReceiveSelectionWillScrollNotification:(id)a3
{
  if ([(_UITextInteractionEditMenuAssistant *)self _isAffectedByScrollNotification:a3])
  {
    BOOL v4 = self->_wasShowingEditMenuBeforeScroll
      || [(_UITextInteractionEditMenuAssistant *)self _editMenuIsVisible];
    self->_wasShowingEditMenuBeforeScroll = v4;
    [(_UITextInteractionEditMenuAssistant *)self hideSelectionCommands];
  }
}

- (void)_didReceiveSelectionDidScrollNotification:(id)a3
{
  if ([(_UITextInteractionEditMenuAssistant *)self _isAffectedByScrollNotification:a3])
  {
    BOOL v4 = [(_UITextInteractionEditMenuAssistant *)self menuInteraction];
    [v4 updateVisibleMenuPosition];

    if (self->_wasShowingEditMenuBeforeScroll)
    {
      [(_UITextInteractionEditMenuAssistant *)self showCalloutBarAfterDelay:0.1];
      self->_wasShowingEditMenuBeforeScroll = 0;
    }
  }
}

- (void)_hideSelectionCommandsWithReason:(int64_t)a3
{
  [(_UITextInteractionEditMenuAssistant *)self cancelDelayedCommandRequests];
  id v5 = [(_UITextInteractionEditMenuAssistant *)self menuInteraction];
  [v5 dismissSelectionCommandsWithReason:a3];
}

- (UITextContextMenuInteraction)menuInteraction
{
  return self->_menuInteraction;
}

- (void)cancelDelayedCommandRequests
{
  [(NSTimer *)self->_delayedEditMenuTimer invalidate];
  delayedEditMenuTimer = self->_delayedEditMenuTimer;
  self->_delayedEditMenuTimer = 0;
}

- (BOOL)_editMenuIsVisible
{
  v2 = [(_UITextInteractionEditMenuAssistant *)self menuInteraction];
  char v3 = [v2 isDisplayingMenuForSelectionCommands];

  return v3;
}

- (void)setMenuInteraction:(id)a3
{
}

- (_UITextInteractionEditMenuAssistant)initWithInteractionAssistant:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UITextInteractionEditMenuAssistant;
  id v5 = [(_UITextInteractionEditMenuAssistant *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interactionAssistant, v4);
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__didReceiveSelectionWillScrollNotification_ name:@"UITextSelectionWillScroll" object:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v6 selector:sel__didReceiveSelectionDidScrollNotification_ name:@"UITextSelectionDidScroll" object:0];
  }
  return v6;
}

- (BOOL)_isAffectedByScrollNotification:(id)a3
{
  id v4 = [a3 object];
  if (v4)
  {
    id v5 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
    v6 = [v5 view];
    v7 = [v6 textInputView];
    if (v7)
    {
      v8 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
      v9 = [v8 view];
      objc_super v10 = [v9 textInputView];
      char v11 = [v4 containsView:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (UITextInteractionAssistant)interactionAssistant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionAssistant);
  return (UITextInteractionAssistant *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMenu, 0);
  objc_storeStrong((id *)&self->_replacements, 0);
  objc_storeStrong((id *)&self->_menuInteraction, 0);
  objc_destroyWeak((id *)&self->_interactionAssistant);
  objc_storeStrong((id *)&self->_interactionAssistantViewRespondsShouldShowEditMenu, 0);
  objc_storeStrong((id *)&self->_delayedEditMenuTimer, 0);
}

- (UIView)_selectionView
{
  BOOL v3 = +[UITextSelectionDisplayInteraction isModernSelectionViewEnabled];
  id v4 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
  id v5 = v4;
  if (v3)
  {
    v6 = [v4 _selectionViewManager];
    v7 = [v6 highlightView];
  }
  else
  {
    v7 = [v4 _legacySelectionView];
  }

  return (UIView *)v7;
}

- (id)_selectionViewCoordinateSpace
{
  v2 = [(_UITextInteractionEditMenuAssistant *)self _selectionView];
  BOOL v3 = [v2 coordinateSpace];

  return v3;
}

- (id)_textViewCoordinateSpace
{
  v2 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
  BOOL v3 = [v2 view];
  id v4 = [v3 textInputView];

  return v4;
}

- (id)_screenCoordinateSpace
{
  v2 = [(_UITextInteractionEditMenuAssistant *)self _selectionView];
  BOOL v3 = [v2 _screen];
  id v4 = [v3 coordinateSpace];

  return v4;
}

- (id)_windowCoordinateSpace
{
  v2 = [(_UITextInteractionEditMenuAssistant *)self _selectionView];
  BOOL v3 = [v2 window];

  return v3;
}

- (void)_presentEditMenuWithPreferredDirection:(int64_t)a3 replacements:(id)a4
{
  id v6 = a4;
  v7 = [(_UITextInteractionEditMenuAssistant *)self menuElementsForReplacements:v6];
  id v8 = +[UIMenu menuWithChildren:v7];

  [(_UITextInteractionEditMenuAssistant *)self _presentEditMenuWithPreferredDirection:a3 replacements:v6 overrideMenu:v8];
}

- (void)_presentEditMenuWithPreferredDirection:(int64_t)a3 overrideMenu:(id)a4
{
}

- (void)_presentEditMenuWithPreferredDirection:(int64_t)a3 replacements:(id)a4 overrideMenu:(id)a5
{
  id v32 = a4;
  id v9 = a5;
  objc_super v10 = [(_UITextInteractionEditMenuAssistant *)self _selectionView];
  char v11 = [v10 window];

  if (v11)
  {
    v12 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
    v13 = [v12 view];

    interactionAssistantViewRespondsShouldShowEditMenu = self->_interactionAssistantViewRespondsShouldShowEditMenu;
    if (!interactionAssistantViewRespondsShouldShowEditMenu && v13)
    {
      v15 = [NSNumber numberWithBool:objc_opt_respondsToSelector() & 1];
      v16 = self->_interactionAssistantViewRespondsShouldShowEditMenu;
      self->_interactionAssistantViewRespondsShouldShowEditMenu = v15;

      interactionAssistantViewRespondsShouldShowEditMenu = self->_interactionAssistantViewRespondsShouldShowEditMenu;
    }
    if (!interactionAssistantViewRespondsShouldShowEditMenu
      || ![(NSNumber *)interactionAssistantViewRespondsShouldShowEditMenu BOOLValue]
      || !v13
      || [v13 _shouldShowEditMenu])
    {
      [(_UITextInteractionEditMenuAssistant *)self _editMenuRawTargetRect];
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      -[_UITextInteractionEditMenuAssistant _clippedTargetRect:](self, "_clippedTargetRect:");
      v35.origin.x = v25;
      v35.origin.y = v26;
      v35.size.width = v27;
      v35.size.height = v28;
      v34.origin.x = v18;
      v34.origin.y = v20;
      v34.size.width = v22;
      v34.size.height = v24;
      if (CGRectIntersectsRect(v34, v35))
      {
        objc_storeStrong((id *)&self->_replacements, a4);
        objc_storeStrong((id *)&self->_overrideMenu, a5);
        v29 = [(_UITextInteractionEditMenuAssistant *)self _editMenuConfigurationForCurrentSelectionWithPreferredArrowDirection:a3];
        v30 = [(_UITextInteractionEditMenuAssistant *)self menuInteraction];
        [v30 presentSelectionCommandsWithConfiguration:v29];

        v31 = +[UIKeyboardImpl activeInstance];
        [v31 _textSelectionEditMenuDidShow];
      }
    }
  }
}

- (id)_editMenuConfigurationForCurrentSelectionWithPreferredArrowDirection:(int64_t)a3
{
  id v5 = [(_UITextInteractionEditMenuAssistant *)self _selectionView];
  [(_UITextInteractionEditMenuAssistant *)self _editMenuTargetRect];
  double v8 = v7 + v6 * 0.5;
  double v11 = v10 + v9 * 0.5;
  v12 = [(_UITextInteractionEditMenuAssistant *)self menuInteraction];
  v13 = [v12 view];
  objc_msgSend(v5, "convertPoint:toView:", v13, v8, v11);
  double v15 = v14;
  double v17 = v16;

  CGFloat v18 = +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", 0x1ED173F80, v15, v17);
  objc_msgSend(v18, "set_ignoresPassthroughInView:", 1);
  objc_msgSend(v18, "set_prefersMenuPresentationInView:", -[_UITextInteractionEditMenuAssistant _editMenuPrefersPresentationInView](self, "_editMenuPrefersPresentationInView"));
  if ((unint64_t)(a3 - 1) >= 4) {
    int64_t v19 = 0;
  }
  else {
    int64_t v19 = a3;
  }
  [v18 setPreferredArrowDirection:v19];
  CGFloat v20 = [(_UITextInteractionEditMenuAssistant *)self _editMenuSourceWindow];
  objc_msgSend(v18, "set_overrideSourceWindow:", v20);

  return v18;
}

- (CGRect)selectionBoundingBox
{
  BOOL v3 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
  uint64_t v4 = [v3 activeSelectionController];
  id v5 = [(id)v4 selection];

  double v6 = [v5 selectedRange];
  LOBYTE(v4) = [v6 _isRanged];

  if (v4)
  {
    double v7 = [v5 selectionRects];
    [(_UITextInteractionEditMenuAssistant *)self selectionBoundingBoxForRects:v7];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)selectionBoundingBoxForRects:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  *(void *)v42 = *MEMORY[0x1E4F1DB28];
  *(void *)&v42[8] = *(void *)(MEMORY[0x1E4F1DB28] + 8);
  *(void *)&v42[16] = *(void *)(MEMORY[0x1E4F1DB28] + 16);
  *(void *)&v42[24] = *(void *)(MEMORY[0x1E4F1DB28] + 24);
  id v5 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
  double v6 = [v5 view];
  double v7 = [v6 textInputView];
  [v7 visibleBounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v16 = v4;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    int v19 = 0;
    uint64_t v20 = *(void *)v44;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v44 != v20) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * v21), "rect", *(void *)v42, *(void *)&v42[8], *(void *)&v42[16], *(void *)&v42[24], (void)v43);
        double x = v49.origin.x;
        double y = v49.origin.y;
        double width = v49.size.width;
        double height = v49.size.height;
        v53.origin.double x = v9;
        v53.origin.double y = v11;
        v53.size.double width = v13;
        v53.size.double height = v15;
        CGRect v50 = CGRectIntersection(v49, v53);
        if (!CGRectIsNull(v50))
        {
          CGFloat v26 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
          CGFloat v27 = [v26 view];
          CGFloat v28 = [v27 textInputView];
          v29 = [(_UITextInteractionEditMenuAssistant *)self _selectionViewCoordinateSpace];
          objc_msgSend(v28, "convertRect:toCoordinateSpace:", v29, x, y, width, height);
          CGFloat v31 = v30;
          CGFloat v33 = v32;
          CGFloat v35 = v34;
          CGFloat v37 = v36;

          if (v19)
          {
            v54.origin.double x = v31;
            v54.origin.double y = v33;
            v54.size.double width = v35;
            v54.size.double height = v37;
            CGRect v51 = CGRectUnion(*(CGRect *)v42, v54);
            CGFloat v31 = v51.origin.x;
            CGFloat v33 = v51.origin.y;
            CGFloat v35 = v51.size.width;
            CGFloat v37 = v51.size.height;
          }
          ++v19;
          *(CGFloat *)&v42[16] = v35;
          *(CGFloat *)&v42[24] = v37;
          *(CGFloat *)v42 = v31;
          *(CGFloat *)&v42[8] = v33;
        }
        ++v21;
      }
      while (v18 != v21);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v18);
  }

  double v38 = *(double *)v42;
  double v39 = *(double *)&v42[8];
  double v40 = *(double *)&v42[16];
  double v41 = *(double *)&v42[24];
  result.size.double height = v41;
  result.size.double width = v40;
  result.origin.double y = v39;
  result.origin.double x = v38;
  return result;
}

- (CGRect)_clippedTargetRect:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (+[UIKeyboard isKeyboardProcess]) {
    goto LABEL_29;
  }
  double v8 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
  CGFloat v9 = [v8 view];
  double v10 = [v9 textInputView];
  [v10 visibleBounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  int v19 = [(_UITextInteractionEditMenuAssistant *)self _selectionViewCoordinateSpace];
  uint64_t v20 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
  uint64_t v21 = [v20 view];
  CGFloat v22 = [v21 textInputView];
  objc_msgSend(v19, "convertRect:fromCoordinateSpace:", v22, v12, v14, v16, v18);
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;

  v130.origin.CGFloat x = v24;
  v130.origin.CGFloat y = v26;
  v130.size.CGFloat width = v28;
  v130.size.double height = v30;
  v141.origin.CGFloat x = x;
  v141.origin.CGFloat y = y;
  v141.size.CGFloat width = width;
  v141.size.double height = height;
  CGRect v131 = CGRectIntersection(v130, v141);
  double v31 = v131.origin.x;
  double v32 = v131.origin.y;
  double v33 = v131.size.width;
  double v34 = v131.size.height;
  CGFloat v35 = [(_UITextInteractionEditMenuAssistant *)self _selectionView];
  double v36 = [v35 _scroller];

  if (v36
    && ([v36 traitCollection],
        CGFloat v37 = objc_claimAutoreleasedReturnValue(),
        uint64_t v38 = [v37 userInterfaceIdiom],
        v37,
        v38 == 6))
  {
    double v39 = [(_UITextInteractionEditMenuAssistant *)self _selectionViewCoordinateSpace];
    [v36 bounds];
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    uint64_t v48 = [v36 coordinateSpace];
    objc_msgSend(v39, "convertRect:fromCoordinateSpace:", v48, v41, v43, v45, v47);
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;

    -[_UITextInteractionEditMenuAssistant _expandClippingArea:forIdiom:](self, "_expandClippingArea:forIdiom:", 6, v50, v52, v54, v56);
    double v58 = v57;
    double v60 = v59;
    double v62 = v61;
    double v64 = v63;
  }
  else
  {
    v65 = [(_UITextInteractionEditMenuAssistant *)self _selectionView];
    v66 = [v65 _screen];
    [v66 bounds];
    double v68 = v67;
    double v70 = v69;
    double v72 = v71;
    double v74 = v73;

    v75 = [(_UITextInteractionEditMenuAssistant *)self _windowCoordinateSpace];
    v76 = [(_UITextInteractionEditMenuAssistant *)self _screenCoordinateSpace];
    objc_msgSend(v75, "convertRect:fromCoordinateSpace:", v76, v68, v70, v72, v74);
    double v78 = v77;
    double v80 = v79;
    double v82 = v81;
    double v84 = v83;

    v85 = [(_UITextInteractionEditMenuAssistant *)self _selectionViewCoordinateSpace];
    v86 = [(_UITextInteractionEditMenuAssistant *)self _windowCoordinateSpace];
    objc_msgSend(v85, "convertRect:fromCoordinateSpace:", v86, v78, v80, v82, v84);
    double v58 = v87;
    double v60 = v88;
    double v62 = v89;
    double v64 = v90;
  }
  v132.origin.CGFloat x = v58;
  v132.origin.CGFloat y = v60;
  v132.size.CGFloat width = v62;
  v132.size.double height = v64;
  v142.origin.CGFloat x = v31;
  v142.origin.CGFloat y = v32;
  v142.size.CGFloat width = v33;
  v142.size.double height = v34;
  if (CGRectIntersectsRect(v132, v142)) {
    goto LABEL_17;
  }
  double v91 = v58 + v62;
  if (v58 + v62 < v31 + 10.0)
  {
    double v92 = -10.0;
LABEL_11:
    double v31 = v91 + v92;
    goto LABEL_12;
  }
  if (v31 + v33 < v58 + 10.0)
  {
    double v91 = v58 - v33;
    double v92 = 10.0;
    goto LABEL_11;
  }
LABEL_12:
  double v93 = v60 + v64;
  if (v60 + v64 < v32 + 10.0)
  {
    double v94 = -10.0;
LABEL_16:
    double v32 = v93 + v94;
    goto LABEL_17;
  }
  if (v32 + v34 < v60 + 10.0)
  {
    double v93 = v60 - v34;
    double v94 = 10.0;
    goto LABEL_16;
  }
LABEL_17:
  v133.origin.CGFloat x = v58;
  v133.origin.CGFloat y = v60;
  v133.size.CGFloat width = v62;
  v133.size.double height = v64;
  v143.origin.CGFloat x = v31;
  v143.origin.CGFloat y = v32;
  v143.size.CGFloat width = v33;
  v143.size.double height = v34;
  CGRect v134 = CGRectIntersection(v133, v143);
  CGFloat x = v134.origin.x;
  CGFloat y = v134.origin.y;
  CGFloat width = v134.size.width;
  double height = v134.size.height;
  if (v36)
  {
    v95 = [(_UITextInteractionEditMenuAssistant *)self _selectionViewCoordinateSpace];
    [v36 bounds];
    objc_msgSend(v95, "convertRect:fromCoordinateSpace:", v36);
    double v97 = v96;
    double v99 = v98;
    double v101 = v100;
    double v103 = v102;

    v104 = [v36 traitCollection];
    -[_UITextInteractionEditMenuAssistant _expandClippingArea:forIdiom:](self, "_expandClippingArea:forIdiom:", [v104 userInterfaceIdiom], v97, v99, v101, v103);
    CGFloat v106 = v105;
    CGFloat v108 = v107;
    CGFloat v110 = v109;
    CGFloat v112 = v111;

    v135.origin.CGFloat x = v106;
    v135.origin.CGFloat y = v108;
    v135.size.CGFloat width = v110;
    v135.size.double height = v112;
    v144.origin.CGFloat x = x;
    v144.origin.CGFloat y = y;
    v144.size.CGFloat width = width;
    v144.size.double height = height;
    CGRect v136 = CGRectIntersection(v135, v144);
    double v113 = v136.origin.x;
    double v114 = v136.origin.y;
    double v115 = v136.size.width;
    double v116 = v136.size.height;
    if (CGRectIsEmpty(v136))
    {
      CGFloat x = *MEMORY[0x1E4F1DB28];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else if (v116 >= height)
    {
      CGFloat x = v113;
      CGFloat y = v114;
      CGFloat width = v115;
      double height = v116;
    }
    else
    {
      if (height >= 40.0)
      {
        v117 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
        v118 = [v117 view];
        int v119 = [v118 isEditing];

        if (v119)
        {
          v120 = +[UIKeyboardImpl activeInstance];
          v121 = [(_UITextInteractionEditMenuAssistant *)self _selectionView];
          objc_msgSend(v120, "subtractKeyboardFrameFromRect:inView:", v121, v113, v114, v115, v116);
          double v113 = v122;
          double v114 = v123;
          double v115 = v124;
          double v116 = v125;
        }
        v139.origin.CGFloat x = v113;
        v139.origin.CGFloat y = v114;
        v139.size.CGFloat width = v115;
        v139.size.double height = v116;
        CGRect v138 = CGRectInset(v139, 0.0, -10.0);
      }
      else
      {
        v137.origin.CGFloat x = v113;
        v137.origin.CGFloat y = v114;
        v137.size.CGFloat width = v115;
        v137.size.double height = v116;
        v145.origin.CGFloat x = x;
        v145.origin.CGFloat y = y;
        v145.size.CGFloat width = width;
        v145.size.double height = height;
        CGRect v138 = CGRectUnion(v137, v145);
      }
      CGFloat x = v138.origin.x;
      CGFloat y = v138.origin.y;
      CGFloat width = v138.size.width;
      double height = v138.size.height;
    }
  }

LABEL_29:
  double v126 = x;
  double v127 = y;
  double v128 = width;
  double v129 = height;
  result.size.double height = v129;
  result.size.CGFloat width = v128;
  result.origin.CGFloat y = v127;
  result.origin.CGFloat x = v126;
  return result;
}

- (UIWindow)_editMenuSourceWindow
{
  v2 = [(_UITextInteractionEditMenuAssistant *)self _selectionView];
  BOOL v3 = [v2 keyboardSceneDelegate];
  id v4 = [v3 containerWindow];

  id v5 = [v2 window];
  int v6 = [v5 _isRemoteKeyboardWindow];

  if (v6)
  {
    uint64_t v7 = [v2 window];

    id v4 = (void *)v7;
  }

  return (UIWindow *)v4;
}

- (CGRect)_editMenuRawTargetRect
{
  BOOL v3 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
  id v4 = [v3 activeSelectionController];
  id v5 = [v4 selection];

  int v6 = [v5 selectedRange];
  LODWORD(v4) = [v6 isEmpty];

  if (v4)
  {
    [v5 caretRect];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
    double v16 = [v15 view];
    double v17 = [v16 textInputView];
    double v18 = [(_UITextInteractionEditMenuAssistant *)self _selectionViewCoordinateSpace];
    objc_msgSend(v17, "convertRect:toCoordinateSpace:", v18, v8, v10, v12, v14);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
  }
  else
  {
    [(_UITextInteractionEditMenuAssistant *)self selectionBoundingBox];
    double v20 = v27;
    double v22 = v28;
    double v24 = v29;
    double v26 = v30;
  }

  double v31 = v20;
  double v32 = v22;
  double v33 = v24;
  double v34 = v26;
  result.size.double height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (NSArray)_preferredLayoutRectsForEditMenu
{
  v2 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
  BOOL v3 = [v2 _selectionViewManager];
  id v4 = [v3 _preferredLayoutRectsForEditMenu];

  return (NSArray *)v4;
}

- (CGRect)_editMenuTargetRect
{
  [(_UITextInteractionEditMenuAssistant *)self _editMenuRawTargetRect];
  -[_UITextInteractionEditMenuAssistant _clippedTargetRect:](self, "_clippedTargetRect:");
  result.size.double height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (BOOL)_editMenuIsVisibleOrDismissedRecently
{
  if ([(_UITextInteractionEditMenuAssistant *)self _editMenuIsVisible]) {
    return 1;
  }
  return [(_UITextInteractionEditMenuAssistant *)self _editMenuDismissedRecently];
}

- (BOOL)_editMenuDismissedRecently
{
  v2 = [(_UITextInteractionEditMenuAssistant *)self menuInteraction];
  char v3 = [v2 dismissedRecently];

  return v3;
}

- (BOOL)_editMenuDismissedByActionSelection
{
  v2 = [(_UITextInteractionEditMenuAssistant *)self menuInteraction];
  char v3 = [v2 dismissedByActionSelection];

  return v3;
}

- (BOOL)_editMenuPrefersPresentationInView
{
  v2 = [(_UITextInteractionEditMenuAssistant *)self _selectionView];
  char v3 = [v2 traitCollection];
  BOOL v4 = [v3 userInterfaceIdiom] == 6;

  return v4;
}

- (BOOL)_hasTextReplacements
{
  v2 = [(_UITextInteractionEditMenuAssistant *)self replacements];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)menuElementsForReplacements:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v10 = [v9 menuTitle];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __67___UITextInteractionEditMenuAssistant_menuElementsForReplacements___block_invoke;
        v14[3] = &unk_1E52DB038;
        v14[4] = v9;
        double v11 = +[UIAction actionWithTitle:v10 image:0 identifier:0 handler:v14];

        if ([v9 _isNoReplacementsFoundItem]) {
          objc_msgSend(v11, "setAttributes:", objc_msgSend(v11, "attributes") | 1);
        }
        [v4 addObject:v11];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

- (BOOL)_updateEditMenuPositionForPreferredArrowDirection:(int64_t)a3 replacements:(id)a4
{
  id v6 = a4;
  if ([(_UITextInteractionEditMenuAssistant *)self _editMenuIsVisible]) {
    [(_UITextInteractionEditMenuAssistant *)self _presentEditMenuWithPreferredDirection:a3 replacements:v6];
  }

  return 1;
}

- (void)showSelectionCommandsAfterDelay:(double)a3
{
  replacements = self->_replacements;
  self->_replacements = 0;

  overrideMenu = self->_overrideMenu;
  self->_overrideMenu = 0;

  [(_UITextInteractionEditMenuAssistant *)self showCalloutBarAfterDelay:a3];
}

- (void)showCommandsWithReplacements:(id)a3
{
}

- (void)showSelectionCommands
{
}

- (void)showCalloutBarAfterDelay:(double)a3
{
  p_interactionAssistant = &self->_interactionAssistant;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionAssistant);
  id v10 = [WeakRetained _editMenuAssistant];

  if (![v10 _editMenuDismissedRecently]
    || [v10 _editMenuDismissedByActionSelection])
  {
    [(_UITextInteractionEditMenuAssistant *)self cancelDelayedCommandRequests];
    uint64_t v7 = [(_UITextInteractionEditMenuAssistant *)self replacements];
    [(_UITextInteractionEditMenuAssistant *)self _showCommandsWithReplacements:v7 forDictation:0 afterDelay:a3];

    double v8 = [(_UITextInteractionEditMenuAssistant *)self replacements];
    LODWORD(v7) = [v8 count] != 0;

    id v9 = objc_loadWeakRetained((id *)p_interactionAssistant);
    [v9 setSelectionHighlightMode:(2 * v7)];
  }
}

- (void)calculateReplacementsWithGenerator:(id)a3 andShowAfterDelay:(double)a4
{
  id v6 = [a3 replacements];
  if ([v6 count]) {
    [(_UITextInteractionEditMenuAssistant *)self _showCommandsWithReplacements:v6 forDictation:0 afterDelay:a4];
  }
}

- (void)showReplacementsWithGenerator:(id)a3 forDictation:(BOOL)a4 afterDelay:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  [(_UITextInteractionEditMenuAssistant *)self cancelDelayedCommandRequests];
  if (v6)
  {
    char v9 = 0;
    uint64_t v10 = 3;
  }
  else
  {
    int v11 = [v8 isStringToReplaceMisspelled];
    char v9 = v11;
    if (v11) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionAssistant);
  [WeakRetained setSelectionHighlightMode:v10];

  if ((v9 & 1) != 0 || v6)
  {
    double v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"UIKeyboardPredictionsAvailable" object:0];
  }
  id v14 = objc_loadWeakRetained((id *)&self->_interactionAssistant);
  int v15 = [v14 viewConformsToAsynchronousInteractionProtocol];

  if (v15)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    double v22 = __93___UITextInteractionEditMenuAssistant_showReplacementsWithGenerator_forDictation_afterDelay___block_invoke;
    double v23 = &unk_1E52E3628;
    double v24 = self;
    id v25 = v8;
    long long v16 = _Block_copy(&v20);
    long long v17 = +[UIKeyboardImpl sharedInstance];
    long long v18 = [v17 taskQueue];
    id v19 = (id)[v18 scheduleTask:v16 timeInterval:0 repeats:a5];
  }
  else
  {
    [(_UITextInteractionEditMenuAssistant *)self calculateReplacementsWithGenerator:v8 andShowAfterDelay:a5];
  }
}

- (void)_showSelectionCommandsForContextMenu:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionAssistant);
  BOOL v6 = [WeakRetained activeSelectionController];
  uint64_t v7 = [v6 selection];
  int v8 = [v7 isCommitting];

  if (v8)
  {
    [(_UITextInteractionEditMenuAssistant *)self showCommandsWithReplacements:0];
  }
  else if (v3)
  {
    [(_UITextInteractionEditMenuAssistant *)self _showCommandsWithReplacements:0 isForContextMenu:1 forDictation:0 arrowDirection:0];
  }
  else
  {
    char v9 = [(_UITextInteractionEditMenuAssistant *)self interactionAssistant];
    [v9 updateDisplayedSelection];

    [(_UITextInteractionEditMenuAssistant *)self _showCommandsWithReplacements:0 forDictation:0 afterDelay:0.0];
  }
}

- (void)_showCommandsWithReplacements:(id)a3 forDictation:(BOOL)a4 afterDelay:(double)a5
{
  id v8 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93___UITextInteractionEditMenuAssistant__showCommandsWithReplacements_forDictation_afterDelay___block_invoke;
  aBlock[3] = &unk_1E52EA800;
  aBlock[4] = self;
  id v14 = v8;
  BOOL v15 = a4;
  id v9 = v8;
  uint64_t v10 = _Block_copy(aBlock);
  int v11 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v10 block:a5];
  delayedEditMenuTimer = self->_delayedEditMenuTimer;
  self->_delayedEditMenuTimer = v11;
}

- (void)_showCommandsWithReplacements:(id)a3 isForContextMenu:(BOOL)a4 forDictation:(BOOL)a5 arrowDirection:(int64_t)a6
{
  BOOL v7 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (a4
    || ([(_UITextInteractionEditMenuAssistant *)self interactionAssistant],
        int v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 shouldSuppressSelectionCommands],
        v11,
        (v12 & 1) == 0))
  {
    [(_UITextInteractionEditMenuAssistant *)self cancelDelayedCommandRequests];
    if ([(_UITextInteractionEditMenuAssistant *)self _editMenuIsVisible])
    {
      if (![(_UITextInteractionEditMenuAssistant *)self _updateEditMenuPositionForPreferredArrowDirection:a6 replacements:v10])[(_UITextInteractionEditMenuAssistant *)self hideSelectionCommands]; {
    }
      }
    else
    {
      double v13 = +[UIKeyboardImpl activeInstance];
      char v14 = [v13 hasMarkedText];

      if ((v14 & 1) == 0)
      {
        uint64_t v15 = [v10 indexOfObjectPassingTest:&__block_literal_global_148];
        long long v16 = +[UIKeyboardImpl activeInstance];
        int v17 = [v16 isPredictionViewControllerVisible];

        if (v7 && v15 == 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v18 = +[UIDevice currentDevice];
          uint64_t v19 = [v18 userInterfaceIdiom];

          if ((v19 & 0xFFFFFFFFFFFFFFFBLL) != 1)
          {
            int v20 = [v10 count] ? v17 : 0;
            if (v20 == 1)
            {
              uint64_t v21 = +[UIKeyboardImpl activeInstance];
              double v30 = [v21 autocorrectionController];

              double v22 = [MEMORY[0x1E4F1CA48] array];
              long long v31 = 0u;
              long long v32 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              id v23 = v10;
              uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
              if (v24)
              {
                uint64_t v25 = v24;
                uint64_t v26 = *(void *)v32;
                do
                {
                  for (uint64_t i = 0; i != v25; ++i)
                  {
                    if (*(void *)v32 != v26) {
                      objc_enumerationMutation(v23);
                    }
                    double v28 = +[UITextReplacementCandidate textReplacementCandidateForTextReplacement:*(void *)(*((void *)&v31 + 1) + 8 * i)];
                    [v22 addObject:v28];
                  }
                  uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
                }
                while (v25);
              }

              double v29 = [MEMORY[0x1E4FAE278] listWithAutocorrection:0 predictions:v22];
              [v30 setAutocorrectionList:v29];
            }
          }
        }
        [(_UITextInteractionEditMenuAssistant *)self _presentEditMenuWithPreferredDirection:a6 replacements:v10];
      }
    }
  }
}

- (NSArray)replacements
{
  return self->_replacements;
}

- (UIMenu)overrideMenu
{
  return self->_overrideMenu;
}

@end