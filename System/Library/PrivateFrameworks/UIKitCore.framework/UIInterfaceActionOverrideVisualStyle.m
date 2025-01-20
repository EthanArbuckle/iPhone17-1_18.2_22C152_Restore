@interface UIInterfaceActionOverrideVisualStyle
+ (id)styleOverride;
- (BOOL)alignActionSeparatorLeadingEdgeWithContent;
- (BOOL)isEqual:(id)a3;
- (UIInterfaceActionHighlightAttributes)customActionHighlightAttributes;
- (UIInterfaceActionSeparatorAttributes)customSeparatorAttributes;
- (double)customSelectionHighlightContinuousCornerRadius;
- (id)actionTitleLabelFontForViewState:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customTitleLabelFontProviderForViewState;
- (id)newActionBackgroundViewForViewState:(id)a3;
- (id)newActionSeparatorViewForGroupViewState:(id)a3;
- (void)setAlignActionSeparatorLeadingEdgeWithContent:(BOOL)a3;
- (void)setCustomActionHighlightAttributes:(id)a3;
- (void)setCustomSelectionHighlightContinuousCornerRadius:(double)a3;
- (void)setCustomSeparatorAttributes:(id)a3;
- (void)setCustomTitleLabelFontProviderForViewState:(id)a3;
@end

@implementation UIInterfaceActionOverrideVisualStyle

+ (id)styleOverride
{
  id v2 = objc_alloc((Class)a1);
  v3 = objc_alloc_init(UIInterfaceActionConcreteVisualStyle);
  v4 = (void *)[v2 initWithConcreteVisualStyle:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UIInterfaceActionOverrideVisualStyle;
  v4 = [(UIInterfaceActionVisualStyle *)&v12 copyWithZone:a3];
  uint64_t v5 = [(UIInterfaceActionSeparatorAttributes *)self->_customSeparatorAttributes copy];
  v6 = (void *)v4[7];
  v4[7] = v5;

  uint64_t v7 = [(UIInterfaceActionHighlightAttributes *)self->_customActionHighlightAttributes copy];
  v8 = (void *)v4[8];
  v4[8] = v7;

  uint64_t v9 = [self->_customTitleLabelFontProviderForViewState copy];
  v10 = (void *)v4[9];
  v4[9] = v9;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIInterfaceActionOverrideVisualStyle;
  if ([(UIInterfaceActionVisualStyle *)&v14 isEqual:v4])
  {
    id v5 = v4;
    customSeparatorAttributes = self->_customSeparatorAttributes;
    uint64_t v7 = [v5 customSeparatorAttributes];
    if (customSeparatorAttributes == v7)
    {
      char v10 = 1;
    }
    else
    {
      customActionHighlightAttributes = self->_customActionHighlightAttributes;
      uint64_t v9 = [v5 customActionHighlightAttributes];
      if ([(UIInterfaceActionHighlightAttributes *)customActionHighlightAttributes isEqual:v9])
      {
        char v10 = 1;
      }
      else
      {
        v11 = self->_customSeparatorAttributes;
        objc_super v12 = [v5 customSeparatorAttributes];
        char v10 = [(UIInterfaceActionSeparatorAttributes *)v11 isEqual:v12];
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  id v4 = a3;
  if ([v4 isHighlighted]
    && ([(UIInterfaceActionOverrideVisualStyle *)self customActionHighlightAttributes],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [(UIInterfaceActionOverrideVisualStyle *)self customActionHighlightAttributes];
    id v7 = (id)[v6 newBackgroundHighlightView];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIInterfaceActionOverrideVisualStyle;
    id v7 = [(UIInterfaceActionVisualStyle *)&v11 newActionBackgroundViewForViewState:v4];
  }
  [(UIInterfaceActionOverrideVisualStyle *)self customSelectionHighlightContinuousCornerRadius];
  if (v7)
  {
    double v9 = v8;
    if ([v4 isHighlighted])
    {
      if (v9 > 0.0)
      {
        [v7 setClipsToBounds:1];
        [v7 _setContinuousCornerRadius:v9];
        objc_msgSend(v7, "setRoundedCornerPosition:", objc_msgSend(v4, "visualCornerPosition"));
      }
    }
  }

  return v7;
}

- (id)newActionSeparatorViewForGroupViewState:(id)a3
{
  id v4 = a3;
  id v5 = [(UIInterfaceActionOverrideVisualStyle *)self customSeparatorAttributes];
  id v6 = (id)[v5 newSeparatorView];

  if (!v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIInterfaceActionOverrideVisualStyle;
    id v6 = [(UIInterfaceActionVisualStyle *)&v9 newActionSeparatorViewForGroupViewState:v4];
  }
  if (self->_alignActionSeparatorLeadingEdgeWithContent)
  {
    [(UIInterfaceActionVisualStyle *)self contentMargin];
    [v6 setHorizontalLineLeadingInset:v7];
  }

  return v6;
}

- (id)actionTitleLabelFontForViewState:(id)a3
{
  id v4 = a3;
  customTitleLabelFontProviderForViewState = (void (**)(id, id))self->_customTitleLabelFontProviderForViewState;
  if (!customTitleLabelFontProviderForViewState
    || (customTitleLabelFontProviderForViewState[2](customTitleLabelFontProviderForViewState, v4),
        (id v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionOverrideVisualStyle;
    id v6 = [(UIInterfaceActionVisualStyle *)&v8 actionTitleLabelFontForViewState:v4];
  }

  return v6;
}

- (double)customSelectionHighlightContinuousCornerRadius
{
  return self->_customSelectionHighlightContinuousCornerRadius;
}

- (void)setCustomSelectionHighlightContinuousCornerRadius:(double)a3
{
  self->_customSelectionHighlightContinuousCornerRadius = a3;
}

- (BOOL)alignActionSeparatorLeadingEdgeWithContent
{
  return self->_alignActionSeparatorLeadingEdgeWithContent;
}

- (void)setAlignActionSeparatorLeadingEdgeWithContent:(BOOL)a3
{
  self->_alignActionSeparatorLeadingEdgeWithContent = a3;
}

- (UIInterfaceActionSeparatorAttributes)customSeparatorAttributes
{
  return self->_customSeparatorAttributes;
}

- (void)setCustomSeparatorAttributes:(id)a3
{
}

- (UIInterfaceActionHighlightAttributes)customActionHighlightAttributes
{
  return self->_customActionHighlightAttributes;
}

- (void)setCustomActionHighlightAttributes:(id)a3
{
}

- (id)customTitleLabelFontProviderForViewState
{
  return self->_customTitleLabelFontProviderForViewState;
}

- (void)setCustomTitleLabelFontProviderForViewState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_customTitleLabelFontProviderForViewState, 0);
  objc_storeStrong((id *)&self->_customActionHighlightAttributes, 0);
  objc_storeStrong((id *)&self->_customSeparatorAttributes, 0);
}

@end