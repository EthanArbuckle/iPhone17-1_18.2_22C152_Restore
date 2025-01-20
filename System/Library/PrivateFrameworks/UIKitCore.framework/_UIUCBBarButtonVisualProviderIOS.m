@interface _UIUCBBarButtonVisualProviderIOS
+ (id)_defaultTitleAttributes;
- (BOOL)canUpdateMenuInPlace;
- (BOOL)shouldSuppressPointerSpecularFilter;
- (BOOL)shouldUseImageInsets;
- (CGPoint)menuAnchorPoint;
- (id)_constraintsForButton:(id)a3 withButtonItem:(id)a4;
- (id)_defaultTitleAttributes;
- (id)_newButtonForType:(int64_t)a3;
- (id)buttonContextMenuInteractionConfiguration;
- (id)buttonContextMenuStyleFromDefaultStyle:(id)a3;
- (id)buttonContextMenuTargetedPreview;
- (id)contentView;
- (id)imageSymbolConfiguration;
- (id)pointerShapeInContainer:(id)a3;
- (int64_t)_securePasteButtonSite;
- (void)_configureImageOrTitleFromBarItem:(id)a3;
- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5;
- (void)enableSecureButton:(BOOL)a3;
- (void)updateButton:(id)a3 forEnabledState:(BOOL)a4;
- (void)updateButton:(id)a3 forHighlightedState:(BOOL)a4;
- (void)updateMenu;
- (void)updateSecureButton;
@end

@implementation _UIUCBBarButtonVisualProviderIOS

- (void)updateButton:(id)a3 forHighlightedState:(BOOL)a4
{
  BOOL v4 = a4;
  contentButton = self->_contentButton;
  id v7 = a3;
  [(UIButton *)contentButton setHighlighted:v4];
  v8 = [v7 traitCollection];

  BOOL v9 = [v8 userInterfaceStyle] == 2;
  if (v4) {
    double v10 = dbl_186B935B0[v9];
  }
  else {
    double v10 = 1.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
  [WeakRetained setAlpha:v10];
}

- (void)updateButton:(id)a3 forEnabledState:(BOOL)a4
{
  BOOL v4 = a4;
  [(UIButton *)self->_contentButton setEnabled:a4];
  if (self->_slotViewHasRemoteContent)
  {
    [(_UIUCBBarButtonVisualProviderIOS *)self enableSecureButton:v4];
  }
}

- (id)contentView
{
  return self->_contentButton;
}

- (id)_newButtonForType:(int64_t)a3
{
  BOOL v4 = objc_opt_class();
  if (a3 == 1 || a3 == 3) {
    BOOL v4 = objc_opt_class();
  }
  v5 = [v4 buttonWithType:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setUserInteractionEnabled:0];
  [v5 _setWantsAccessibilityUnderline:0];
  [v5 _setImageContentMode:1];
  return v5;
}

+ (id)_defaultTitleAttributes
{
  if (qword_1EB25D2D0 != -1) {
    dispatch_once(&qword_1EB25D2D0, &__block_literal_global_50);
  }
  v2 = (void *)_MergedGlobals_11_3;
  return v2;
}

- (id)_defaultTitleAttributes
{
  v2 = objc_opt_class();
  return (id)[v2 _defaultTitleAttributes];
}

- (int64_t)_securePasteButtonSite
{
  return 0;
}

- (void)_configureImageOrTitleFromBarItem:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasImage] & 1) != 0 || (objc_msgSend(v4, "hasTitle"))
  {
    v5 = (char *)[v4 action];
    v6 = (char *)[v4 action];
    id v7 = (char *)[v4 action];
    if (!self->_contentButton) {
      goto LABEL_7;
    }
    objc_opt_class();
    if ((v5 == sel_assistantPaste_forEvent_) != (objc_opt_isKindOfClass() & 1))
    {
      [(UIView *)self->_contentButton removeFromSuperview];
      contentButton = self->_contentButton;
      self->_contentButton = 0;
    }
    if (!self->_contentButton)
    {
LABEL_7:
      uint64_t v9 = 3;
      if (v7 != sel_assistantDictationMicOn) {
        uint64_t v9 = 0;
      }
      uint64_t v10 = 2;
      if (v6 != sel_assistantDictation) {
        uint64_t v10 = v9;
      }
      if (v5 == sel_assistantPaste_forEvent_) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = v10;
      }
      v12 = [(_UIUCBBarButtonVisualProviderIOS *)self _newButtonForType:v11];
      v13 = self->_contentButton;
      self->_contentButton = v12;
    }
    if ([v4 hasImage])
    {
      v14 = [v4 _imageForState:0 compact:0 type:5];
      v15 = [(_UIUCBBarButtonVisualProviderIOS *)self imageSymbolConfiguration];
      if (v15)
      {
        uint64_t v16 = [v14 imageWithConfiguration:v15];

        v34 = 0;
        v35 = 0;
        v33 = 0;
        v14 = (void *)v16;
      }
      else
      {
        v34 = 0;
        v35 = 0;
        v33 = 0;
      }
    }
    else
    {
      v15 = [(_UIUCBBarButtonVisualProviderIOS *)self _defaultTitleAttributes];
      v33 = [v4 _attributedTitleForState:0 withDefaultAttributes:v15];
      v34 = [v4 _attributedTitleForState:1 withDefaultAttributes:v15];
      v35 = [v4 _attributedTitleForState:2 withDefaultAttributes:v15];
      v14 = 0;
    }

    [(UIButton *)self->_contentButton setImage:v14 forState:0];
    if ([(_UIUCBBarButtonVisualProviderIOS *)self shouldUseImageInsets])
    {
      v18 = self->_contentButton;
      [v14 alignmentRectInsets];
      -[UIButton setImageEdgeInsets:](v18, "setImageEdgeInsets:");
    }
    [(UIButton *)self->_contentButton setAttributedTitle:v33 forState:0];
    [(UIButton *)self->_contentButton setAttributedTitle:v34 forState:1];
    [(UIButton *)self->_contentButton setAttributedTitle:v35 forState:2];
    if ([v4 isKeyboardItem]
      && ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl()))
    {
      v19 = +[UIDevice currentDevice];
      uint64_t v20 = [v19 userInterfaceIdiom];

      if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        [(UIView *)self->_contentButton setAlpha:0.8];
      }
    }
    v21 = [v4 _gestureRecognizers];
    uint64_t v22 = [v21 count];

    if (v22)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v23 = [v4 _gestureRecognizers];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v43 != v25) {
              objc_enumerationMutation(v23);
            }
            [(UIView *)self->_contentButton addGestureRecognizer:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v24);
      }

      [(UIView *)self->_contentButton setUserInteractionEnabled:1];
    }
    if (v5 == sel_assistantPaste_forEvent_)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
      BOOL v28 = WeakRetained == 0;

      if (v28)
      {
        v29 = objc_alloc_init(_UISlotView);
        objc_storeWeak((id *)&self->_securePasteButtonSlotView, v29);
        v30 = objc_msgSend(MEMORY[0x1E4F881E0], "systemInputAssistantPasteButtonTagWithSite:", -[_UIUCBBarButtonVisualProviderIOS _securePasteButtonSite](self, "_securePasteButtonSite"));
        objc_initWeak(&location, self);
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke;
        v39[3] = &unk_1E52DDC40;
        id v31 = v30;
        id v40 = v31;
        [(_UISlotView *)v29 _setSlotStyleResolver:v39];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke_2;
        v36[3] = &unk_1E52DDCB8;
        id v32 = v31;
        id v37 = v32;
        objc_copyWeak(&v38, &location);
        [(_UISlotView *)v29 _setSlotAnyContentProvider:v36];
        [(_UISlotView *)v29 _overlayView:self->_contentButton centerInView:self->_contentButton];
        objc_destroyWeak(&v38);

        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    [(UIView *)self->_contentButton removeFromSuperview];
    v17 = self->_contentButton;
    self->_contentButton = 0;
  }
}

- (BOOL)shouldUseImageInsets
{
  return 1;
}

- (BOOL)shouldSuppressPointerSpecularFilter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);

  if (WeakRetained) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIUCBBarButtonVisualProviderIOS;
  return [(_UIButtonBarButtonVisualProvider *)&v5 shouldSuppressPointerSpecularFilter];
}

- (void)updateSecureButton
{
  self->_slotViewHasRemoteContent = 1;
  BOOL v3 = [(UIControl *)self->super._button isEnabled];
  [(_UIUCBBarButtonVisualProviderIOS *)self enableSecureButton:v3];
}

- (void)enableSecureButton:(BOOL)a3
{
  BOOL v5 = !a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
  [WeakRetained setHidden:v5];

  contentButton = self->_contentButton;
  if (a3)
  {
    id v8 = +[UIColor clearColor];
    [(UIButton *)contentButton _setImageColor:v8 forState:0];
  }
  else
  {
    [(UIButton *)contentButton _setImageColor:0 forState:0];
  }
}

- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5
{
  id v14 = a3;
  id v7 = a5;
  [v14 setPointerInteractionEnabled:1];
  id v8 = [v14 layer];
  [v8 setHitTestsAsOpaque:1];

  uint64_t v9 = self->_contentButton;
  [(_UIUCBBarButtonVisualProviderIOS *)self _configureImageOrTitleFromBarItem:v7];

  [v14 addSubview:self->_contentButton];
  contentButton = self->_contentButton;
  if (v9 != contentButton && contentButton != 0)
  {
    v12 = (void *)MEMORY[0x1E4F5B268];
    v13 = -[_UIUCBBarButtonVisualProviderIOS _constraintsForButton:withButtonItem:](self, "_constraintsForButton:withButtonItem:");
    [v12 activateConstraints:v13];
  }
  [(_UIUCBBarButtonVisualProviderIOS *)self updateMenu];
}

- (id)_constraintsForButton:(id)a3 withButtonItem:(id)a4
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  uint64_t v20 = [v6 leadingAnchor];
  v19 = [v5 leadingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v21[0] = v18;
  id v7 = [v6 trailingAnchor];
  id v8 = [v5 trailingAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8];
  v21[1] = v9;
  uint64_t v10 = [v6 topAnchor];
  uint64_t v11 = [v5 topAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v21[2] = v12;
  v13 = [v6 bottomAnchor];

  id v14 = [v5 bottomAnchor];

  v15 = [v13 constraintEqualToAnchor:v14];
  v21[3] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];

  return v16;
}

- (id)imageSymbolConfiguration
{
  return 0;
}

- (id)pointerShapeInContainer:(id)a3
{
  button = self->super._button;
  id v5 = a3;
  [(_UIButtonBarButton *)button _buttonBarHitRect];
  double v10 = (48.0 - v8) * 0.5;
  BOOL v11 = v8 < 48.0;
  if (v8 < 48.0) {
    double v8 = 48.0;
  }
  double v12 = 0.0;
  if (v11) {
    double v12 = v10;
  }
  -[UIView convertRect:toView:](self->super._button, "convertRect:toView:", v5, v6 - v12, v7 + (v9 + -37.0) * 0.5, v8, 37.0);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  return +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v14, v16, v18, v20);
}

- (id)buttonContextMenuInteractionConfiguration
{
  if (self->_menuProvider)
  {
    v2 = +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", @"UIBarButtonItemContextMenu", 0);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)buttonContextMenuStyleFromDefaultStyle:(id)a3
{
  id v4 = a3;
  [(_UIUCBBarButtonVisualProviderIOS *)self menuAnchorPoint];
  double v6 = v5;
  CGFloat v8 = v7;
  button = self->super._button;
  double v10 = [(_UIUCBBarButtonVisualProviderIOS *)self buttonContextMenuTargetedPreview];
  _UIControlMenuSupportUpdateStyleForBarButtons(v4, button, v10, 0, v6, v8);

  return v4;
}

- (id)buttonContextMenuTargetedPreview
{
  return _UIControlMenuSupportTargetedPreviewOverViews(self->super._button, self->_contentButton, 0);
}

- (CGPoint)menuAnchorPoint
{
  button = self->super._button;
  [(UIView *)button bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(UIView *)self->super._button window];
  -[UIView convertRect:toView:](button, "convertRect:toView:", v12, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v21 = [(UIView *)self->super._button window];
  double v22 = _UIControlMenuAttachmentPointForRectInContainer(v21, v14, v16, v18, v20);
  double v24 = v23;

  double v25 = v22;
  double v26 = v24;
  result.y = v26;
  result.x = v25;
  return result;
}

- (BOOL)canUpdateMenuInPlace
{
  return 1;
}

- (void)updateMenu
{
  p_barButtonItem = &self->super._barButtonItem;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
  double v5 = [WeakRetained menu];

  id v6 = objc_loadWeakRetained((id *)p_barButtonItem);
  uint64_t v7 = [v6 _menuIsPrimary];

  id v8 = objc_loadWeakRetained((id *)p_barButtonItem);
  double v9 = [v8 _secondaryActionsProvider];

  if (v9)
  {
    objc_copyWeak(&to, (id *)p_barButtonItem);
    if (v7)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke;
      v26[3] = &unk_1E52DDB88;
      double v10 = &v27;
      id v27 = v9;
      double v11 = &v28;
      objc_copyWeak(&v28, &to);
      double v12 = v26;
    }
    else
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke_2;
      aBlock[3] = &unk_1E52DDB88;
      double v10 = &v24;
      id v24 = v9;
      double v11 = &v25;
      objc_copyWeak(&v25, &to);
      double v12 = aBlock;
    }
    double v16 = _Block_copy(v12);
    id menuProvider = self->_menuProvider;
    self->_id menuProvider = v16;

    objc_destroyWeak(v11);
    objc_destroyWeak(&to);
  }
  else
  {
    if (v5)
    {
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      double v20 = __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke_3;
      v21 = &unk_1E52DD380;
      id v22 = v5;
      double v13 = _Block_copy(&v18);
      id v14 = self->_menuProvider;
      self->_id menuProvider = v13;

      id v15 = v22;
    }
    else
    {
      id v15 = self->_menuProvider;
      self->_id menuProvider = 0;
    }
  }
  -[UIControl setContextMenuInteractionEnabled:](self->super._button, "setContextMenuInteractionEnabled:", self->_menuProvider != 0, v18, v19, v20, v21);
  [(UIControl *)self->super._button setShowsMenuAsPrimaryAction:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_menuProvider, 0);
  objc_destroyWeak((id *)&self->_securePasteButtonSlotView);
  objc_storeStrong((id *)&self->_contentButton, 0);
}

@end