@interface _UINavigationBarPalette
- (BOOL)_displaysWhenSearchActive;
- (BOOL)isPinned;
- (BOOL)transitioning;
- (NSString)assistantIdentifier;
- (NSString)description;
- (UINavigationItem)owningNavigationItem;
- (UIView)contentView;
- (_BYTE)_paletteForSearch;
- (_UINavigationBarPalette)init;
- (_UINavigationBarPalette)initWithContentView:(id)a3;
- (_UIPointerInteractionAssistant)assistant;
- (double)minimumHeight;
- (double)preferredHeight;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)_layoutPriority;
- (unint64_t)_contentViewMarginType;
- (void)_clearAssistants;
- (void)_setAssistants;
- (void)_setContentViewMarginType:(unint64_t)a3;
- (void)_setDisplaysWhenSearchActive:(BOOL)a3;
- (void)_setLayoutPriority:(int64_t)a3;
- (void)addSubview:(id)a3;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setAssistant:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setMinimumHeight:(double)a3;
- (void)setOwningNavigationItem:(id)a3;
- (void)setPinned:(BOOL)a3;
- (void)setPreferredHeight:(double)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)updateLayoutData:(id)a3 layoutWidth:(double)a4;
@end

@implementation _UINavigationBarPalette

- (_BYTE)_paletteForSearch
{
  if (a1)
  {
    if (a1[410]) {
      v2 = a1;
    }
    else {
      v2 = 0;
    }
    a1 = v2;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (int64_t)_layoutPriority
{
  return self->__layoutPriority;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarPalette;
  [(UIView *)&v3 layoutSubviews];
  if (!self->_transitioning)
  {
    [(UIView *)self bounds];
    -[UIView setFrame:](self->_contentView, "setFrame:");
  }
}

- (void)updateLayoutData:(id)a3 layoutWidth:(double)a4
{
  v10 = (double *)a3;
  UICeilToViewScale(self);
  double v6 = v5;
  if (self->_minimumHeight == -1.0)
  {
    v7 = v10;
    if (!v10) {
      goto LABEL_9;
    }
    v10[5] = v5;
    uint64_t v8 = 4;
  }
  else
  {
    UICeilToViewScale(self);
    v7 = v10;
    if (!v10) {
      goto LABEL_9;
    }
    v10[4] = v9;
    if (v9 >= v6) {
      double v6 = v9;
    }
    uint64_t v8 = 5;
  }
  v7[v8] = v6;
LABEL_9:
}

- (unint64_t)_contentViewMarginType
{
  return self->__contentViewMarginType;
}

- (void)setAssistantIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = self->_assistantIdentifier;
  double v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSString *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(_UINavigationBarPalette *)self _clearAssistants];
    uint64_t v8 = (NSString *)[(NSString *)v10 copy];
    assistantIdentifier = self->_assistantIdentifier;
    self->_assistantIdentifier = v8;

    [(_UINavigationBarPalette *)self _setAssistants];
  }
LABEL_9:
}

- (void)setAssistant:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);

  if (WeakRetained != obj)
  {
    [(_UINavigationBarPalette *)self _clearAssistants];
    objc_storeWeak((id *)&self->_assistant, obj);
    [(_UINavigationBarPalette *)self _setAssistants];
  }
}

- (void)_setAssistants
{
  p_assistant = &self->_assistant;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  if (WeakRetained)
  {
    assistantIdentifier = self->_assistantIdentifier;

    if (assistantIdentifier)
    {
      id v6 = objc_loadWeakRetained((id *)p_assistant);
      [v6 setAssistedView:self identifier:self->_assistantIdentifier];
    }
  }
}

- (void)_clearAssistants
{
  p_assistant = &self->_assistant;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  if (WeakRetained)
  {
    assistantIdentifier = self->_assistantIdentifier;

    if (assistantIdentifier)
    {
      id v6 = objc_loadWeakRetained((id *)p_assistant);
      [v6 setAssistedView:0 identifier:self->_assistantIdentifier];
    }
  }
}

- (void)_setLayoutPriority:(int64_t)a3
{
  self->__layoutPriority = a3;
}

- (double)preferredHeight
{
  return self->_preferredHeight;
}

- (void)setMinimumHeight:(double)a3
{
  if (a3 < 0.0) {
    a3 = -1.0;
  }
  if (self->_minimumHeight != a3)
  {
    self->_minimumHeight = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owningNavigationItem);
    [WeakRetained _updatePalette:self];
  }
}

- (void)setPreferredHeight:(double)a3
{
  if (self->_preferredHeight != a3)
  {
    self->_preferredHeight = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owningNavigationItem);
    [WeakRetained _updatePalette:self];
  }
}

- (void)setOwningNavigationItem:(id)a3
{
}

- (_UINavigationBarPalette)initWithContentView:(id)a3
{
  id v5 = a3;
  [v5 frame];
  v9.receiver = self;
  v9.super_class = (Class)_UINavigationBarPalette;
  id v6 = -[UIView initWithFrame:](&v9, sel_initWithFrame_);
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentView, a3);
    [v5 frame];
    v7->_preferredHeight = CGRectGetHeight(v10);
    v7->_minimumHeight = -1.0;
    [(_UINavigationBarPalette *)v7 addSubview:v7->_contentView];
    [(UIView *)v7 setClipsToBounds:1];
  }

  return v7;
}

- (void)addSubview:(id)a3
{
  id v4 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView == v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)_UINavigationBarPalette;
    [(UIView *)&v6 addSubview:v4];
  }
  else
  {
    [(UIView *)contentView addSubview:v4];
    if (self->_preferredHeight == 0.0)
    {
      [(UIView *)v4 frame];
      self->_preferredHeight = CGRectGetHeight(v7);
    }
  }
}

- (_UINavigationBarPalette)init
{
  objc_super v3 = objc_opt_new();
  id v4 = [(_UINavigationBarPalette *)self initWithContentView:v3];

  return v4;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)_UINavigationBarPalette;
  objc_super v3 = [(UIView *)&v10 description];
  id v4 = (void *)[v3 mutableCopy];

  if (self->_minimumHeight >= 0.0) {
    objc_msgSend(v4, "appendFormat:", @" minimumHeight=%f", *(void *)&self->_minimumHeight);
  }
  else {
    [v4 appendString:@" minimumHeight=auto"];
  }
  objc_msgSend(v4, "appendFormat:", @" preferredHeight=%f", *(void *)&self->_preferredHeight);
  if (self->__displaysWhenSearchActive) {
    [v4 appendString:@" displaysWhenSearchActive"];
  }
  unint64_t contentViewMarginType = self->__contentViewMarginType;
  if (contentViewMarginType == 1)
  {
    objc_super v6 = @" marginsFollowBar";
  }
  else
  {
    if (contentViewMarginType != 2) {
      goto LABEL_11;
    }
    objc_super v6 = @" marginsFollowLargeTitle";
  }
  [v4 appendString:v6];
LABEL_11:
  int64_t layoutPriority = self->__layoutPriority;
  if (layoutPriority == 1)
  {
    uint64_t v8 = @" priorityAfterSearch";
  }
  else
  {
    if (layoutPriority != 2) {
      goto LABEL_16;
    }
    uint64_t v8 = @" priorityAfterLargeTitle";
  }
  [v4 appendString:v8];
LABEL_16:
  return (NSString *)v4;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 request:v8 locationInView:self];
    objc_super v9 = -[UIView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
    objc_opt_class();
    objc_super v10 = 0;
    if (objc_opt_isKindOfClass())
    {
      if ([v9 isEnabled])
      {
        [v9 bounds];
        objc_super v10 = objc_msgSend(v7, "createRegionFromRect:targetView:identifier:selected:", v9, @"com.apple.UIKit.UINavigationBar.Palette.UIButton", objc_msgSend(v9, "isSelected"), v11, v12, v13, v14);
      }
      else
      {
        objc_super v10 = 0;
      }
    }
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = -[_UIPointerAssistantRegion targetViewAsButton]((uint64_t)v6);
    if (v7)
    {
      id v8 = [v5 createStyleForButton:v7 shapeProvider:0];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6 = a5;
  -[_UIPointerAssistantRegion targetViewAsButton]((uint64_t)a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v8 _visualProvider];
  [v7 pointerWillEnter:v6];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v6 = a5;
  -[_UIPointerAssistantRegion targetViewAsButton]((uint64_t)a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v8 _visualProvider];
  [v7 pointerWillExit:v6];
}

- (UIView)contentView
{
  return self->_contentView;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (_UIPointerInteractionAssistant)assistant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  return (_UIPointerInteractionAssistant *)WeakRetained;
}

- (BOOL)transitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

- (UINavigationItem)owningNavigationItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningNavigationItem);
  return (UINavigationItem *)WeakRetained;
}

- (void)_setContentViewMarginType:(unint64_t)a3
{
  self->__unint64_t contentViewMarginType = a3;
}

- (BOOL)_displaysWhenSearchActive
{
  return self->__displaysWhenSearchActive;
}

- (void)_setDisplaysWhenSearchActive:(BOOL)a3
{
  self->__displaysWhenSearchActive = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningNavigationItem);
  objc_destroyWeak((id *)&self->_assistant);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end