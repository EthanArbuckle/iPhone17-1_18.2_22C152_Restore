@interface _UIInterfaceActionLabelsPropertyView
- (UIInterfaceAction)action;
- (_UIInterfaceActionLabelsPropertyView)initWithAction:(id)a3;
- (id)_classificationLabelIfVisible;
- (id)_interfaceActionViewState;
- (id)_newLabel;
- (id)_visualStyle;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_applyVisualStyle;
- (void)_applyVisualStyleToLabels;
- (void)_reloadContentClassificationLabelDisplayProperties;
- (void)_reloadContentForTitleDisplayProperties;
- (void)dealloc;
- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4;
@end

@implementation _UIInterfaceActionLabelsPropertyView

- (_UIInterfaceActionLabelsPropertyView)initWithAction:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIInterfaceActionLabelsPropertyView;
  v6 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    p_action = (id *)&v6->_action;
    objc_storeStrong((id *)&v6->_action, a3);
    [*p_action _addActionDisplayPropertyObserver:v7];
    [(_UIInterfaceActionLabelsPropertyView *)v7 interfaceAction:*p_action reloadDisplayedContentActionProperties:0];
    id v9 = *p_action;
    v10 = [*p_action _visualStyle];
    [(_UIInterfaceActionLabelsPropertyView *)v7 interfaceAction:v9 reloadDisplayedContentVisualStyle:v10];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel__contentSizeCategoryDidChangeNotification_ name:@"UIContentSizeCategoryDidChangeNotification" object:0];
  }
  return v7;
}

- (void)dealloc
{
  [(UIInterfaceAction *)self->_action _removeActionDisplayPropertyObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionLabelsPropertyView;
  [(UIView *)&v3 dealloc];
}

- (id)_visualStyle
{
  return [(UIInterfaceAction *)self->_action _visualStyle];
}

- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4
{
  id v5 = a4;
  [(_UIInterfaceActionLabelsPropertyView *)self _reloadContentForTitleDisplayProperties];
  [(_UIInterfaceActionLabelsPropertyView *)self _reloadContentClassificationLabelDisplayProperties];
  id v39 = [(_UIInterfaceActionLabelsPropertyView *)self _visualStyle];
  v6 = [v39 actionPropertiesAffectingLabelStyling];
  BOOL v7 = +[UIInterfaceAction changedProperties:v5 containsAny:v6];

  if (v7) {
    [(_UIInterfaceActionLabelsPropertyView *)self _applyVisualStyleToLabels];
  }
  v8 = [(_UIInterfaceActionLabelsPropertyView *)self _classificationLabelIfVisible];
  titleLabel = v8;
  if (!v8) {
    titleLabel = self->_titleLabel;
  }
  v10 = titleLabel;

  v11 = self->_titleLabel;
  v12 = [MEMORY[0x1E4F1CA48] array];
  objc_super v13 = [(UIView *)self heightAnchor];
  v14 = [(UIView *)self->_titleLabel heightAnchor];
  v15 = [v13 constraintEqualToAnchor:v14 constant:4.0];
  [(NSArray *)v12 addObject:v15];

  v16 = [(NSArray *)v12 lastObject];
  LODWORD(v17) = 1148837888;
  [v16 setPriority:v17];

  v18 = [(NSArray *)v12 lastObject];
  [v18 setIdentifier:@"labelsView-heightPlusMargin"];

  v19 = [(UIView *)v10 leadingAnchor];
  v20 = [(UIView *)self leadingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [(NSArray *)v12 addObject:v21];
  leadingLabelLeadingConstraint = self->_leadingLabelLeadingConstraint;
  self->_leadingLabelLeadingConstraint = v21;

  [(NSLayoutConstraint *)self->_leadingLabelLeadingConstraint setIdentifier:@"labelsView-leadingLabel-leading"];
  v23 = [(UIView *)v10 centerYAnchor];
  v24 = [(UIView *)self centerYAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  [(NSArray *)v12 addObject:v25];
  leadingLabelVerticalPositionConstraint = self->_leadingLabelVerticalPositionConstraint;
  self->_leadingLabelVerticalPositionConstraint = v25;

  v27 = @"labelsView-leadingLabel-verticalPosition";
  [(NSLayoutConstraint *)self->_leadingLabelVerticalPositionConstraint setIdentifier:@"labelsView-leadingLabel-verticalPosition"];
  v28 = [(UIView *)v11 trailingAnchor];
  v29 = [(UIView *)self trailingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [(NSArray *)v12 addObject:v30];
  trailingLabelTrailingConstraint = self->_trailingLabelTrailingConstraint;
  self->_trailingLabelTrailingConstraint = v30;

  [(NSLayoutConstraint *)self->_trailingLabelTrailingConstraint setIdentifier:@"labelsView-trailingLabel-trailing"];
  v32 = [(UIView *)v11 centerYAnchor];
  v33 = [(UIView *)self centerYAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [(NSArray *)v12 addObject:v34];
  v35 = self->_leadingLabelVerticalPositionConstraint;
  self->_leadingLabelVerticalPositionConstraint = v34;

  [(NSLayoutConstraint *)self->_leadingLabelVerticalPositionConstraint setIdentifier:@"labelsView-leadingLabel-verticalPosition"];
  if (v10 == v11)
  {
    id v36 = 0;
  }
  else
  {
    v27 = [(UIView *)v10 trailingAnchor];
    v32 = [(UIView *)v11 leadingAnchor];
    id v36 = [(__CFString *)v27 constraintEqualToAnchor:v32];
    [(NSArray *)v12 addObject:v36];
  }
  objc_storeStrong((id *)&self->_interLabelSpacingConstraint, v36);
  if (v10 != v11)
  {
  }
  [(NSLayoutConstraint *)self->_interLabelSpacingConstraint setIdentifier:@"labelsView-inter-label-spacing"];
  [MEMORY[0x1E4F5B268] deactivateConstraints:self->_labelConstraints];
  labelConstraints = self->_labelConstraints;
  self->_labelConstraints = v12;
  v38 = v12;

  [MEMORY[0x1E4F5B268] activateConstraints:self->_labelConstraints];
}

- (id)viewForFirstBaselineLayout
{
  return self->_titleLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_titleLabel;
}

- (void)_applyVisualStyle
{
  objc_super v3 = [(_UIInterfaceActionLabelsPropertyView *)self _visualStyle];
  if (v3)
  {
    id v4 = v3;
    [(_UIInterfaceActionLabelsPropertyView *)self _applyVisualStyleToLabels];
    objc_super v3 = v4;
  }
}

- (void)_applyVisualStyleToLabels
{
  if ([(UIView *)self->_classificationLabel isHidden]) {
    classificationLabel = 0;
  }
  else {
    classificationLabel = self->_classificationLabel;
  }
  id v4 = classificationLabel;
  id v7 = [(_UIInterfaceActionLabelsPropertyView *)self _visualStyle];
  titleLabel = self->_titleLabel;
  v6 = [(_UIInterfaceActionLabelsPropertyView *)self _interfaceActionViewState];
  [v7 configureAttributesForTitleLabel:titleLabel classificationLabel:v4 actionViewState:v6];
}

- (id)_interfaceActionViewState
{
  objc_super v3 = [(_UIInterfaceActionLabelsPropertyView *)self action];
  id v4 = +[UIInterfaceActionViewState viewStateForActionRepresentationViewDescendantView:self action:v3];

  return v4;
}

- (void)_reloadContentForTitleDisplayProperties
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = [(_UIInterfaceActionLabelsPropertyView *)self _newLabel];
    id v5 = self->_titleLabel;
    self->_titleLabel = v4;

    [(UIView *)self->_titleLabel _setLayoutDebuggingIdentifier:@"titleLabel"];
    titleLabel = self->_titleLabel;
  }
  v6 = [(_UIInterfaceActionLabelsPropertyView *)self action];
  id v7 = [v6 title];
  [(UILabel *)titleLabel setText:v7];

  v8 = self->_titleLabel;
  id v9 = [(_UIInterfaceActionLabelsPropertyView *)self action];
  -[UILabel setTextAlignment:](v8, "setTextAlignment:", [v9 titleAlignment]);
}

- (void)_reloadContentClassificationLabelDisplayProperties
{
  objc_super v3 = [(_UIInterfaceActionLabelsPropertyView *)self _classificationLabelIfVisible];

  classificationLabel = self->_classificationLabel;
  if (v3)
  {
    if (!classificationLabel)
    {
      id v5 = [(_UIInterfaceActionLabelsPropertyView *)self _newLabel];
      v6 = self->_classificationLabel;
      self->_classificationLabel = v5;

      [(UIView *)self->_titleLabel _setLayoutDebuggingIdentifier:@"classificationLabel"];
      classificationLabel = self->_classificationLabel;
    }
    id v7 = [(_UIInterfaceActionLabelsPropertyView *)self action];
    v8 = [v7 classificationTitle];
    [(UILabel *)classificationLabel setText:v8];

    id v9 = self->_classificationLabel;
    uint64_t v10 = 0;
  }
  else
  {
    id v9 = self->_classificationLabel;
    uint64_t v10 = 1;
  }
  [(UIView *)v9 setHidden:v10];
}

- (id)_classificationLabelIfVisible
{
  classificationLabel = self->_classificationLabel;
  if (classificationLabel)
  {
    if ([(UIView *)classificationLabel isHidden]) {
      classificationLabel = self->_classificationLabel;
    }
    else {
      classificationLabel = 0;
    }
  }
  return classificationLabel;
}

- (id)_newLabel
{
  objc_super v3 = [UILabel alloc];
  id v4 = -[UILabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v5 = +[UIColor clearColor];
  [(UIView *)v4 setBackgroundColor:v5];

  [(UILabel *)v4 setTextAlignment:1];
  LODWORD(v6) = 1148846080;
  [(UIView *)v4 setContentCompressionResistancePriority:0 forAxis:v6];
  [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self addSubview:v4];
  return v4;
}

- (UIInterfaceAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_classificationLabel, 0);
  objc_storeStrong((id *)&self->_interLabelSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_trailingLabelVerticalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_trailingLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingLabelVerticalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_leadingLabelLeadingConstraint, 0);
}

@end