@interface SidebarOutlineCell
- (BOOL)_useLightForegroundColors;
- (BOOL)isHovering;
- (BOOL)useLightForegroundColors;
- (NSString)axSectionIdentifier;
- (SidebarOutlineCell)initWithFrame:(CGRect)a3;
- (SidebarOutlineCellBackgroundModel)backgroundModel;
- (SidebarOutlineCellHoverSource)hoverSource;
- (int64_t)_currentBackgroundColorMode;
- (void)_maps_addDisclosureIndicator;
- (void)_maps_removeDisclosureIndicator;
- (void)_updateBackgroundGrouping;
- (void)_updateBackgroundStyle;
- (void)_updateForegroundColors;
- (void)_updateHoverStateIfNeeded;
- (void)applyLayoutAttributes:(id)a3;
- (void)setAxSectionIdentifier:(id)a3;
- (void)setBackgroundModel:(id)a3;
- (void)setHoverSource:(id)a3;
- (void)setHovering:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setUseLightForegroundColors:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SidebarOutlineCell

- (void)_maps_addDisclosureIndicator
{
  id v3 = [objc_alloc((Class)_UICellAccessoryConfigurationOutlineDisclosure) initWithCellSelectionTogglesExpansionState:0];
  v4 = sub_100A92454();
  v5 = +[UIImage systemImageNamed:@"chevron.forward.circle.fill" withConfiguration:v4];
  [v3 setImage:v5];

  if ([(SidebarOutlineCell *)self isHovering]) {
    +[UIColor secondaryLabelColor];
  }
  else {
  v6 = +[UIColor clearColor];
  }
  [v3 setTintColor:v6];

  id v8 = v3;
  v7 = +[NSArray arrayWithObjects:&v8 count:1];
  [(SidebarOutlineCell *)self setTrailingAccessoryConfigurations:v7];
}

- (void)_maps_removeDisclosureIndicator
{
}

- (SidebarOutlineCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SidebarOutlineCell;
  id v3 = -[SidebarOutlineCell initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    id v8 = [(SidebarOutlineCell *)v3 contentView];
    [v8 setLayoutMargins:UIEdgeInsetsZero.top, left, bottom, right];

    [(SidebarOutlineCell *)v4 _updateBackgroundStyle];
    [(SidebarOutlineCell *)v4 _updateBackgroundGrouping];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [(SidebarOutlineCell *)v4 setAccessibilityIdentifier:v10];
  }
  return v4;
}

- (void)setBackgroundModel:(id)a3
{
  v5 = (SidebarOutlineCellBackgroundModel *)a3;
  v6 = v5;
  if (self->_backgroundModel != v5)
  {
    id v8 = v5;
    unsigned __int8 v7 = -[SidebarOutlineCellBackgroundModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backgroundModel, a3);
      [(SidebarOutlineCell *)self _updateBackgroundStyle];
      [(SidebarOutlineCell *)self _updateBackgroundGrouping];
      v6 = v8;
    }
  }
}

- (void)_updateBackgroundStyle
{
  id v4 = +[_UIBackgroundViewConfiguration outlineCellConfiguration];
  [v4 setBackgroundColorMode:[self _currentBackgroundColorMode]];
  if (![v4 backgroundColorMode])
  {
    id v3 = +[UIColor clearColor];
    [v4 setBackgroundColor:v3];
  }
  [(SidebarOutlineCell *)self _setBackgroundViewConfiguration:v4];
  [(SidebarOutlineCell *)self _updateForegroundColors];
}

- (int64_t)_currentBackgroundColorMode
{
  int64_t result = [(SidebarOutlineCellBackgroundModel *)self->_backgroundModel dropStyle];
  if (result != 1)
  {
    if (result == 2)
    {
      return 8;
    }
    else
    {
      id v4 = [(SidebarOutlineCell *)self traitCollection];
      id v5 = [v4 activeAppearance];

      unsigned int v6 = [(SidebarOutlineCellBackgroundModel *)self->_backgroundModel collectionViewFocused];
      unsigned int v7 = [(SidebarOutlineCellBackgroundModel *)self->_backgroundModel collectionViewProxyFocused];
      unsigned __int8 v8 = [(SidebarOutlineCellBackgroundModel *)self->_backgroundModel collectionViewHasDropSession];
      int v9 = (v5 != (id)1) & ~v7;
      if (v8) {
        int v9 = 1;
      }
      if ((v6 | v7) == 1) {
        int v10 = v9;
      }
      else {
        int v10 = 1;
      }
      int64_t result = [(SidebarOutlineCellBackgroundModel *)self->_backgroundModel style];
      switch(result)
      {
        case 2:
          if (v10) {
            return 9;
          }
          else {
            return 8;
          }
        case 1:
          if (v10) {
            return 9;
          }
          else {
            return 7;
          }
        case 0:
          if ([(SidebarOutlineCell *)self isSelected])
          {
            int64_t v11 = 3;
            if (v5 != (id)1) {
              int64_t v11 = 9;
            }
            if (v10) {
              return v11;
            }
            else {
              return 1;
            }
          }
          else
          {
            return 0;
          }
      }
    }
  }
  return result;
}

- (void)_updateBackgroundGrouping
{
  int64_t v3 = [(SidebarOutlineCellBackgroundModel *)self->_backgroundModel grouping];
  if ((unint64_t)(v3 - 1) >= 4) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = v3;
  }

  [(SidebarOutlineCell *)self _setBackgroundViewConfigurationGrouping:v4];
}

- (BOOL)_useLightForegroundColors
{
  return (id)[(SidebarOutlineCell *)self _currentBackgroundColorMode] == (id)1;
}

- (void)_updateForegroundColors
{
  BOOL v3 = [(SidebarOutlineCell *)self _useLightForegroundColors];
  if (self->_useLightForegroundColors != v3)
  {
    [(SidebarOutlineCell *)self setUseLightForegroundColors:v3];
  }
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SidebarOutlineCell;
  [(SidebarOutlineCell *)&v4 setSelected:a3];
  [(SidebarOutlineCell *)self _updateBackgroundStyle];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SidebarOutlineCell;
  id v4 = a3;
  [(MapsThemeCollectionViewOutlineCell *)&v8 traitCollectionDidChange:v4];
  id v5 = [(SidebarOutlineCell *)self traitCollection];
  id v6 = [v5 activeAppearance];
  id v7 = [v4 activeAppearance];

  if (v6 != v7) {
    [(SidebarOutlineCell *)self _updateBackgroundStyle];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SidebarOutlineCell;
  [(SidebarOutlineCell *)&v4 applyLayoutAttributes:a3];
  [(SidebarOutlineCell *)self _updateHoverStateIfNeeded];
}

- (void)setHoverSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hoverSource);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_hoverSource);
    id v6 = [v5 hoverChangeObservers];
    [v6 unregisterObserver:self];

    id v7 = objc_storeWeak((id *)&self->_hoverSource, obj);
    objc_super v8 = [obj hoverChangeObservers];
    [v8 registerObserver:self];

    [(SidebarOutlineCell *)self _updateHoverStateIfNeeded];
  }
}

- (void)_updateHoverStateIfNeeded
{
  BOOL v3 = [(SidebarOutlineCell *)self hoverSource];
  id v20 = [v3 hoverGestureRecognizer];

  objc_super v4 = [(SidebarOutlineCell *)self hoverSource];
  id v5 = [v4 hoverScrollView];
  if ([v5 isDragging])
  {
    unsigned int v6 = 1;
  }
  else
  {
    id v7 = [(SidebarOutlineCell *)self hoverSource];
    objc_super v8 = [v7 hoverScrollView];
    unsigned int v6 = [v8 isDecelerating];
  }
  if (!objc_msgSend(v20, "_maps_isHovering") || v6)
  {
    if (![(SidebarOutlineCell *)self isHovering]) {
      goto LABEL_11;
    }
    BOOL v19 = 0;
    goto LABEL_10;
  }
  [(SidebarOutlineCell *)self bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [v20 locationInView:self];
  v22.x = v17;
  v22.y = v18;
  v23.origin.x = v10;
  v23.origin.y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  BOOL v19 = CGRectContainsPoint(v23, v22);
  if (v19 != [(SidebarOutlineCell *)self isHovering]) {
LABEL_10:
  }
    [(SidebarOutlineCell *)self setHovering:v19];
LABEL_11:
}

- (SidebarOutlineCellBackgroundModel)backgroundModel
{
  return self->_backgroundModel;
}

- (SidebarOutlineCellHoverSource)hoverSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hoverSource);

  return (SidebarOutlineCellHoverSource *)WeakRetained;
}

- (BOOL)isHovering
{
  return self->_hovering;
}

- (void)setHovering:(BOOL)a3
{
  self->_hovering = a3;
}

- (BOOL)useLightForegroundColors
{
  return self->_useLightForegroundColors;
}

- (void)setUseLightForegroundColors:(BOOL)a3
{
  self->_useLightForegroundColors = a3;
}

- (NSString)axSectionIdentifier
{
  return self->_axSectionIdentifier;
}

- (void)setAxSectionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axSectionIdentifier, 0);
  objc_destroyWeak((id *)&self->_hoverSource);

  objc_storeStrong((id *)&self->_backgroundModel, 0);
}

@end