@interface UIInterfaceActionVisualStyle
+ (id)idiomSpecificStyleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4;
- (BOOL)allowsZeroSizedSectionSeparators;
- (BOOL)isEqual:(id)a3;
- (BOOL)selectByIndirectPointerTouchRequired;
- (BOOL)selectByPressGestureRequired;
- (BOOL)selectionFeedbackEnabled;
- (CGSize)maximumActionGroupContentSize;
- (CGSize)minimumActionContentSize;
- (NSString)description;
- (UIEdgeInsets)actionSequenceEdgeInsets;
- (UIEdgeInsets)contentMargin;
- (UIInterfaceActionConcreteVisualStyleImpl)concreteVisualStyle;
- (UIInterfaceActionGroupViewState)groupViewState;
- (UIInterfaceActionOverrideVisualStyle)visualStyleOverride;
- (UIInterfaceActionVisualStyle)init;
- (UIInterfaceActionVisualStyle)initWithConcreteVisualStyle:(id)a3;
- (double)actionSectionSpacing;
- (double)actionSpacingForGroupViewState:(id)a3;
- (double)actionTitleLabelMinimumScaleFactor;
- (double)contentCornerRadius;
- (double)horizontalImageContentSpacing;
- (double)verticalImageContentSpacing;
- (id)_base_actionPropertiesAffectingImageViewStyling;
- (id)_base_actionPropertiesAffectingLabelStyling;
- (id)_styleForVisualProperties;
- (id)actionClassificationLabelColorForViewState:(id)a3;
- (id)actionClassificationLabelFontForViewState:(id)a3;
- (id)actionGroupPropertiesAffectingActionsScrollViewStyling;
- (id)actionImageViewTintColorForImageProperty:(id)a3 actionViewState:(id)a4;
- (id)actionPropertiesAffectingActionRepresentationViewStyling;
- (id)actionPropertiesAffectingImageViewStyling;
- (id)actionPropertiesAffectingLabelStyling;
- (id)actionTitleLabelColorForViewState:(id)a3;
- (id)actionTitleLabelCompositingFilterForViewState:(id)a3;
- (id)actionTitleLabelFontForViewState:(id)a3;
- (id)actionViewStateForAttachingToActionRepresentationView:(id)a3;
- (id)copyWithGroupViewState:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultConcreteActionTitleLabelPreferredFont;
- (id)defaultConcreteActionTitleLabelRegularFont;
- (id)defaultScreen;
- (id)fontForViewStateBlock;
- (id)newActionBackgroundViewForViewState:(id)a3;
- (id)newActionSeparatorViewForGroupViewState:(id)a3;
- (id)newGroupBackgroundViewWithGroupViewState:(id)a3;
- (id)newSectionSeparatorViewForGroupViewState:(id)a3;
- (void)_base_configureAttributesForImageView:(id)a3 imageProperty:(id)a4 actionViewState:(id)a5;
- (void)_base_configureAttributesForTitleLabel:(id)a3 classificationLabel:(id)a4 actionViewState:(id)a5;
- (void)configureAttributesForActionRepresentationView:(id)a3 actionViewState:(id)a4;
- (void)configureAttributesForActionScrollView:(id)a3 groupViewState:(id)a4;
- (void)configureAttributesForImageView:(id)a3 imageProperty:(id)a4 actionViewState:(id)a5;
- (void)configureAttributesForTitleLabel:(id)a3 classificationLabel:(id)a4 actionViewState:(id)a5;
- (void)configureForDismissingGroupView:(id)a3 alongsideTransitionCoordinator:(id)a4;
- (void)configureForPresentingGroupView:(id)a3 alongsideTransitionCoordinator:(id)a4;
- (void)setConcreteVisualStyle:(id)a3;
- (void)setFontForViewStateBlock:(id)a3;
- (void)setVisualStyleOverride:(id)a3;
@end

@implementation UIInterfaceActionVisualStyle

- (UIInterfaceActionVisualStyle)init
{
  v3 = objc_alloc_init(UIInterfaceActionConcreteVisualStyle);
  v4 = [(UIInterfaceActionVisualStyle *)self initWithConcreteVisualStyle:v3];

  return v4;
}

- (UIInterfaceActionVisualStyle)initWithConcreteVisualStyle:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIInterfaceActionVisualStyle;
  v6 = [(UIInterfaceActionVisualStyle *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_concreteVisualStyle, a3);
    visualStyleOverride = v7->_visualStyleOverride;
    v7->_visualStyleOverride = 0;

    v9 = objc_alloc_init(UIInterfaceActionGroupViewState);
    groupViewState = v7->_groupViewState;
    v7->_groupViewState = v9;
  }
  return v7;
}

- (NSString)description
{
  visualStyleOverride = self->_visualStyleOverride;
  if (visualStyleOverride)
  {
    [NSString stringWithFormat:@", overridesStyle = %@", visualStyleOverride];
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1ED0E84C0;
  }
  id v5 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)UIInterfaceActionVisualStyle;
  v6 = [(UIInterfaceActionVisualStyle *)&v9 description];
  v7 = [v5 stringWithFormat:@"%@ concreteStyle = %@%@", v6, self->_concreteVisualStyle, v4];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    v8 = [(UIInterfaceActionVisualStyle *)self groupViewState];
    objc_super v9 = [v7 groupViewState];
    if ([v8 isEqual:v9])
    {
      v10 = [(UIInterfaceActionVisualStyle *)self concreteVisualStyle];
      v11 = [v7 concreteVisualStyle];
      char v6 = [v10 isEqual:v11];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(UIInterfaceActionGroupViewState *)self->_groupViewState copy];
  char v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(UIInterfaceActionConcreteVisualStyleImpl *)self->_concreteVisualStyle copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(UIInterfaceActionOverrideVisualStyle *)self->_visualStyleOverride copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (id)copyWithGroupViewState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(UIInterfaceActionVisualStyle *)self copy];
  char v6 = [v4 screen];

  if (!v6)
  {
    uint64_t v7 = [(UIInterfaceActionVisualStyle *)self defaultScreen];
    uint64_t v8 = [v4 copyWithScreen:v7];

    id v4 = (id)v8;
  }
  uint64_t v9 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (void)setVisualStyleOverride:(id)a3
{
  id v5 = a3;
  if (!-[UIInterfaceActionOverrideVisualStyle isEqual:](self->_visualStyleOverride, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_visualStyleOverride, a3);
    [(UIInterfaceActionVisualStyle *)self->_visualStyleOverride setConcreteVisualStyle:self->_concreteVisualStyle];
  }
}

- (void)setConcreteVisualStyle:(id)a3
{
  id v5 = a3;
  if ((-[UIInterfaceActionConcreteVisualStyleImpl isEqual:](self->_concreteVisualStyle, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_concreteVisualStyle, a3);
    [(UIInterfaceActionVisualStyle *)self->_visualStyleOverride setConcreteVisualStyle:self->_concreteVisualStyle];
  }
}

+ (id)idiomSpecificStyleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 userInterfaceIdiom];
  if (v6 == -1)
  {
    uint64_t v7 = +[UIDevice currentDevice];
    uint64_t v6 = [v7 userInterfaceIdiom];
  }
  v17[0] = &unk_1ED3F2988;
  v18[0] = objc_opt_class();
  v17[1] = &unk_1ED3F29A0;
  v18[1] = objc_opt_class();
  v17[2] = &unk_1ED3F29B8;
  v18[2] = objc_opt_class();
  v17[3] = &unk_1ED3F29D0;
  v18[3] = objc_opt_class();
  v17[4] = &unk_1ED3F29E8;
  v18[4] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  uint64_t v9 = [NSNumber numberWithInteger:v6];
  id v10 = (id)[v8 objectForKeyedSubscript:v9];

  if (!v10) {
    id v10 = (id)objc_opt_class();
  }
  v11 = [v10 styleForTraitCollection:v5 presentationStyle:a4];
  if (!v11)
  {
    v11 = +[UIInterfaceActionConcreteVisualStyleFactory_iOS styleForTraitCollection:v5 presentationStyle:a4];
  }
  objc_super v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConcreteVisualStyle:v11];
  v13 = [v12 groupViewState];
  uint64_t v14 = [v13 copyWithTraitCollection:v5];
  v15 = (void *)v12[1];
  v12[1] = v14;

  return v12;
}

- (id)_base_actionPropertiesAffectingLabelStyling
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1ED0EA300;
  v4[1] = 0x1ED0EA220;
  v4[2] = 0x1ED0EA280;
  v4[3] = 0x1ED0EA2C0;
  v4[4] = 0x1ED0EA2E0;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  return v2;
}

- (void)_base_configureAttributesForTitleLabel:(id)a3 classificationLabel:(id)a4 actionViewState:(id)a5
{
  id v30 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 action];
  v11 = [v10 _titleTextColor];
  objc_super v12 = v11;
  if (v8)
  {
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [(UIInterfaceActionVisualStyle *)self actionClassificationLabelColorForViewState:v9];
    }
    uint64_t v14 = v13;
    v15 = [(UIInterfaceActionVisualStyle *)self actionClassificationLabelFontForViewState:v9];
    [v8 setFont:v15];

    [v8 _setTextColorFollowsTintColor:1];
    [v8 setTintColor:v14];
  }
  if (v12)
  {
    id v16 = v12;
  }
  else
  {
    id v16 = [(UIInterfaceActionVisualStyle *)self actionTitleLabelColorForViewState:v9];
  }
  v17 = v16;
  v18 = [(UIInterfaceActionVisualStyle *)self actionTitleLabelFontForViewState:v9];
  [v30 setFont:v18];

  [v30 _setTextColorFollowsTintColor:1];
  [v30 setTintColor:v17];
  LODWORD(v19) = 1053609165;
  [v30 _setHyphenationFactor:v19];
  v20 = [(UIInterfaceActionVisualStyle *)self actionTitleLabelCompositingFilterForViewState:v9];
  v21 = [v30 layer];
  [v21 setCompositingFilter:v20];

  v22 = [v30 superview];
  v23 = [v22 layer];
  [v23 setAllowsGroupBlending:v20 == 0];

  v24 = [v30 superview];
  v25 = [v24 layer];
  [v25 setAllowsGroupOpacity:v20 == 0];

  v26 = [v30 traitCollection];
  v27 = [v26 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(v27))
  {
    [v30 setMinimumScaleFactor:1.0];
    [v30 setAdjustsFontSizeToFitWidth:0];
    [v30 setNumberOfLines:0];
    uint64_t v28 = 0;
    uint64_t v29 = 0;
  }
  else if (v8)
  {
    [v30 setMinimumScaleFactor:1.0];
    [v30 setAdjustsFontSizeToFitWidth:0];
    uint64_t v28 = 0;
    uint64_t v29 = 4;
  }
  else
  {
    uint64_t v28 = 1;
    [v30 setAdjustsFontSizeToFitWidth:1];
    [(UIInterfaceActionVisualStyle *)self actionTitleLabelMinimumScaleFactor];
    objc_msgSend(v30, "setMinimumScaleFactor:");
    uint64_t v29 = 5;
  }
  [v30 setBaselineAdjustment:v28];
  [v30 setLineBreakMode:v29];
}

- (id)_base_actionPropertiesAffectingImageViewStyling
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1ED0EA2A0;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)_base_configureAttributesForImageView:(id)a3 imageProperty:(id)a4 actionViewState:(id)a5
{
  id v23 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v8 action];
  id v11 = [(UIInterfaceActionVisualStyle *)self actionImageViewTintColorForImageProperty:v9 actionViewState:v8];

  if (v11) {
    goto LABEL_11;
  }
  objc_super v12 = [v10 _titleTextColor];
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [(UIInterfaceActionVisualStyle *)self actionTitleLabelColorForViewState:v8];
  }
  v15 = v14;
  id v16 = [v8 action];
  v17 = [v16 _imageTintColor];

  if (v17)
  {
    v18 = [v8 action];
    uint64_t v19 = [v18 _imageTintColor];
  }
  else
  {
    v20 = [v23 superview];
    v21 = [v20 tintColor];

    if (v15 != v21)
    {
      id v11 = v15;
      goto LABEL_10;
    }
    v18 = [v23 superview];
    uint64_t v19 = [v18 tintColor];
  }
  id v11 = (id)v19;

LABEL_10:
LABEL_11:
  [v23 setTintColor:v11];
  if ([v10 isEnabled]) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = 2;
  }
  if ([v23 tintAdjustmentMode] != v22) {
    [v23 setTintAdjustmentMode:v22];
  }
}

- (id)_styleForVisualProperties
{
  visualStyleOverride = self->_visualStyleOverride;
  if (!visualStyleOverride) {
    visualStyleOverride = self->_concreteVisualStyle;
  }
  return visualStyleOverride;
}

- (id)defaultScreen
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  v3 = [v2 defaultScreen];

  return v3;
}

- (CGSize)maximumActionGroupContentSize
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v2 maximumActionGroupContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)minimumActionContentSize
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v2 minimumActionContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)horizontalImageContentSpacing
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v2 horizontalImageContentSpacing];
  double v4 = v3;

  return v4;
}

- (double)verticalImageContentSpacing
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v2 verticalImageContentSpacing];
  double v4 = v3;

  return v4;
}

- (BOOL)allowsZeroSizedSectionSeparators
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  char v3 = [v2 allowsZeroSizedSectionSeparators];

  return v3;
}

- (double)actionSectionSpacing
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v2 actionSectionSpacing];
  double v4 = v3;

  return v4;
}

- (UIEdgeInsets)actionSequenceEdgeInsets
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v2 actionSequenceEdgeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)contentCornerRadius
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v2 contentCornerRadius];
  double v4 = v3;

  return v4;
}

- (UIEdgeInsets)contentMargin
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v2 contentMargin];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)selectByPressGestureRequired
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  char v3 = [v2 selectByPressGestureRequired];

  return v3;
}

- (BOOL)selectionFeedbackEnabled
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  char v3 = [v2 selectionFeedbackEnabled];

  return v3;
}

- (BOOL)selectByIndirectPointerTouchRequired
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  char v3 = [v2 selectByIndirectPointerTouchRequired];

  return v3;
}

- (double)actionTitleLabelMinimumScaleFactor
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v2 actionTitleLabelMinimumScaleFactor];
  double v4 = v3;

  return v4;
}

- (id)actionViewStateForAttachingToActionRepresentationView:(id)a3
{
  id v4 = a3;
  double v5 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  double v6 = [v5 actionViewStateForAttachingToActionRepresentationView:v4];

  return v6;
}

- (id)newGroupBackgroundViewWithGroupViewState:(id)a3
{
  id v4 = a3;
  double v5 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  double v6 = (void *)[v5 newGroupBackgroundViewWithGroupViewState:v4];

  return v6;
}

- (id)newActionSeparatorViewForGroupViewState:(id)a3
{
  id v4 = a3;
  double v5 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  double v6 = (void *)[v5 newActionSeparatorViewForGroupViewState:v4];

  return v6;
}

- (id)newSectionSeparatorViewForGroupViewState:(id)a3
{
  id v4 = a3;
  double v5 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v5 actionSectionSpacing];
  double v7 = v6;

  double v8 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  int v9 = [v8 allowsZeroSizedSectionSeparators];

  if (v9) {
    BOOL v10 = v7 >= 0.0;
  }
  else {
    BOOL v10 = v7 > 0.0;
  }
  if (v10)
  {
    double v11 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
    double v12 = (void *)[v11 newSectionSeparatorViewForGroupViewState:v4];
    double v13 = v12;
    if (v12) {
      double v14 = v12;
    }
    else {
      double v14 = objc_alloc_init(_UIInterfaceActionBlankSeparatorView);
    }
    v15 = v14;

    [(_UIInterfaceActionBlankSeparatorView *)v15 setConstantAxisDimension:v7];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  id v4 = a3;
  double v5 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  double v6 = (void *)[v5 newActionBackgroundViewForViewState:v4];

  return v6;
}

- (id)actionTitleLabelFontForViewState:(id)a3
{
  id v4 = a3;
  double v5 = [(UIInterfaceActionVisualStyle *)self fontForViewStateBlock];

  if (v5)
  {
    double v6 = [(UIInterfaceActionVisualStyle *)self fontForViewStateBlock];
    ((void (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    double v6 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
    [v6 actionTitleLabelFontForViewState:v4];
  double v7 = };

  return v7;
}

- (id)actionTitleLabelColorForViewState:(id)a3
{
  id v4 = a3;
  double v5 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  double v6 = [v5 actionTitleLabelColorForViewState:v4];

  return v6;
}

- (id)actionTitleLabelCompositingFilterForViewState:(id)a3
{
  id v4 = a3;
  double v5 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  double v6 = [v5 actionTitleLabelCompositingFilterForViewState:v4];

  return v6;
}

- (id)actionClassificationLabelFontForViewState:(id)a3
{
  id v4 = a3;
  double v5 = [(UIInterfaceActionVisualStyle *)self fontForViewStateBlock];

  if (v5)
  {
    double v6 = [(UIInterfaceActionVisualStyle *)self fontForViewStateBlock];
    ((void (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    double v6 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
    [v6 actionClassificationLabelFontForViewState:v4];
  double v7 = };

  return v7;
}

- (id)actionClassificationLabelColorForViewState:(id)a3
{
  id v4 = a3;
  double v5 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  double v6 = [v5 actionClassificationLabelColorForViewState:v4];

  return v6;
}

- (id)actionImageViewTintColorForImageProperty:(id)a3 actionViewState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  int v9 = [v8 actionImageViewTintColorForImageProperty:v7 actionViewState:v6];

  return v9;
}

- (double)actionSpacingForGroupViewState:(id)a3
{
  id v4 = a3;
  double v5 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v5 actionSpacingForGroupViewState:v4];
  double v7 = v6;

  return v7;
}

- (void)configureForPresentingGroupView:(id)a3 alongsideTransitionCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v8 configureForPresentingGroupView:v7 alongsideTransitionCoordinator:v6];
}

- (void)configureForDismissingGroupView:(id)a3 alongsideTransitionCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v8 configureForDismissingGroupView:v7 alongsideTransitionCoordinator:v6];
}

- (id)actionGroupPropertiesAffectingActionsScrollViewStyling
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  double v3 = [v2 actionPropertiesAffectingImageViewStyling];
  id v4 = v3;
  if (!v3) {
    double v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (void)configureAttributesForActionScrollView:(id)a3 groupViewState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v8 configureAttributesForActionScrollView:v7 groupViewState:v6];
}

- (id)actionPropertiesAffectingLabelStyling
{
  double v3 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  uint64_t v4 = [v3 actionPropertiesAffectingLabelStyling];
  id v5 = (void *)v4;
  id v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  id v8 = [(UIInterfaceActionVisualStyle *)self _base_actionPropertiesAffectingLabelStyling];
  int v9 = [v7 arrayByAddingObjectsFromArray:v8];

  return v9;
}

- (void)configureAttributesForTitleLabel:(id)a3 classificationLabel:(id)a4 actionViewState:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(UIInterfaceActionVisualStyle *)self _base_configureAttributesForTitleLabel:v10 classificationLabel:v9 actionViewState:v8];
  id v11 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v11 configureAttributesForTitleLabel:v10 classificationLabel:v9 actionViewState:v8];
}

- (id)actionPropertiesAffectingImageViewStyling
{
  double v3 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  uint64_t v4 = [v3 actionPropertiesAffectingImageViewStyling];
  id v5 = (void *)v4;
  id v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  id v8 = [(UIInterfaceActionVisualStyle *)self _base_actionPropertiesAffectingImageViewStyling];
  id v9 = [v7 arrayByAddingObjectsFromArray:v8];

  return v9;
}

- (void)configureAttributesForImageView:(id)a3 imageProperty:(id)a4 actionViewState:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(UIInterfaceActionVisualStyle *)self _base_configureAttributesForImageView:v10 imageProperty:v9 actionViewState:v8];
  id v11 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v11 configureAttributesForImageView:v10 imageProperty:v9 actionViewState:v8];
}

- (id)actionPropertiesAffectingActionRepresentationViewStyling
{
  v2 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  double v3 = [v2 actionPropertiesAffectingActionRepresentationViewStyling];
  uint64_t v4 = v3;
  if (!v3) {
    double v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (void)configureAttributesForActionRepresentationView:(id)a3 actionViewState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIInterfaceActionVisualStyle *)self _styleForVisualProperties];
  [v8 configureAttributesForActionRepresentationView:v7 actionViewState:v6];
}

- (UIInterfaceActionGroupViewState)groupViewState
{
  return self->_groupViewState;
}

- (UIInterfaceActionConcreteVisualStyleImpl)concreteVisualStyle
{
  return self->_concreteVisualStyle;
}

- (id)fontForViewStateBlock
{
  return self->_fontForViewStateBlock;
}

- (void)setFontForViewStateBlock:(id)a3
{
}

- (UIInterfaceActionOverrideVisualStyle)visualStyleOverride
{
  return self->_visualStyleOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyleOverride, 0);
  objc_storeStrong(&self->_fontForViewStateBlock, 0);
  objc_storeStrong((id *)&self->_concreteVisualStyle, 0);
  objc_storeStrong((id *)&self->_groupViewState, 0);
}

- (id)defaultConcreteActionTitleLabelRegularFont
{
  double v3 = +[UIInterfaceActionViewState viewStateRepresentingDefaultAction];
  uint64_t v4 = [(UIInterfaceActionConcreteVisualStyleImpl *)self->_concreteVisualStyle actionTitleLabelFontForViewState:v3];

  return v4;
}

- (id)defaultConcreteActionTitleLabelPreferredFont
{
  double v3 = +[UIInterfaceActionViewState viewStateRepresentingPreferredAction];
  uint64_t v4 = [(UIInterfaceActionConcreteVisualStyleImpl *)self->_concreteVisualStyle actionTitleLabelFontForViewState:v3];

  return v4;
}

@end