@interface UserProfileSectionFooterView
- (UserProfileSectionFooterViewModel)viewModel;
- (void)_footerLinkHandler;
- (void)_setupView;
- (void)_updateForCollapsed;
- (void)_updateForFooter;
- (void)configureWithViewModel:(id)a3;
@end

@implementation UserProfileSectionFooterView

- (void)configureWithViewModel:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_viewModel, a3);
  v5 = [(UserProfileSectionFooterView *)self viewModel];
  self->_collapsed = [v5 isCollapsed];

  [(UserProfileSectionFooterView *)self setAccessibilityIdentifier:@"UserProfileSectionFooter"];
  if (!self->_textLabel) {
    [(UserProfileSectionFooterView *)self _setupView];
  }
  v6 = [(UserProfileSectionFooterView *)self viewModel];
  v7 = [v6 contentString];
  [(UILabel *)self->_textLabel setAttributedText:v7];

  v8 = [(UILabel *)self->_textLabel text];

  if (!v8) {
    self->_collapsed = 1;
  }
  [(UserProfileSectionFooterView *)self _updateForFooter];
}

- (void)_setupView
{
  v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  textLabel = self->_textLabel;
  self->_textLabel = v3;

  [(UILabel *)self->_textLabel setAccessibilityIdentifier:@"TextLabel"];
  [(UILabel *)self->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_textLabel setNumberOfLines:0];
  v5 = [(MapsThemeCollectionReusableView *)self contentView];
  [v5 addSubview:self->_textLabel];

  -[UserProfileSectionFooterView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
  v6 = self->_textLabel;
  v7 = [(MapsThemeCollectionReusableView *)self contentView];
  LODWORD(v8) = 1148846080;
  id v18 = [(UILabel *)v6 _maps_constraintsEqualToEdgesOfView:v7 priority:v8];

  id v9 = [v18 topConstraint];
  topConstraint = self->_topConstraint;
  self->_topConstraint = v9;

  v11 = [v18 bottomConstraint];
  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = v11;

  v13 = [(MapsThemeCollectionReusableView *)self contentView];
  v14 = [v13 heightAnchor];
  v15 = [v14 constraintEqualToConstant:0.0];
  collapsedHeightConstraint = self->_collapsedHeightConstraint;
  self->_collapsedHeightConstraint = v15;

  v17 = [v18 allConstraints];
  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)_updateForCollapsed
{
  if (self->_collapsed)
  {
    [(NSLayoutConstraint *)self->_topConstraint setActive:0];
    [(NSLayoutConstraint *)self->_bottomConstraint setActive:0];
    p_collapsedHeightConstraint = &self->_collapsedHeightConstraint;
    [(NSLayoutConstraint *)*p_collapsedHeightConstraint setConstant:0.0];
  }
  else
  {
    [(NSLayoutConstraint *)self->_collapsedHeightConstraint setActive:0];
    [(NSLayoutConstraint *)self->_topConstraint setActive:1];
    p_collapsedHeightConstraint = &self->_bottomConstraint;
  }
  v4 = *p_collapsedHeightConstraint;

  [(NSLayoutConstraint *)v4 setActive:1];
}

- (void)_updateForFooter
{
  uint64_t v3 = sub_1000BBB44(self);
  v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleFootnote];
  [(UILabel *)self->_textLabel setFont:v4];

  v5 = [(UserProfileSectionFooterView *)self viewModel];
  unsigned __int8 v6 = [v5 containsLink];

  if (v6)
  {
    [(UserProfileSectionFooterView *)self _footerLinkHandler];
  }
  else
  {
    v7 = +[UIColor secondaryLabelColor];
    [(UILabel *)self->_textLabel setTextColor:v7];
  }
  double v8 = 0.0;
  -[UserProfileSectionFooterView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
  double v9 = 4.0;
  if (v3 == 5) {
    double v8 = 6.0;
  }
  else {
    double v9 = 0.0;
  }
  [(NSLayoutConstraint *)self->_topConstraint setConstant:v9];
  [(NSLayoutConstraint *)self->_bottomConstraint setConstant:v8];

  [(UserProfileSectionFooterView *)self _updateForCollapsed];
}

- (void)_footerLinkHandler
{
  id v3 = objc_alloc((Class)UITapGestureRecognizer);
  v4 = [(UserProfileSectionFooterView *)self viewModel];
  v5 = [v4 target];
  unsigned __int8 v6 = [(UserProfileSectionFooterView *)self viewModel];
  id v7 = [v3 initWithTarget:v5 action:[v6 action]];

  [v7 setNumberOfTapsRequired:1];
  [(UserProfileSectionFooterView *)self addGestureRecognizer:v7];
  [(UserProfileSectionFooterView *)self setUserInteractionEnabled:1];
}

- (UserProfileSectionFooterViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);

  objc_storeStrong((id *)&self->_collapsedHeightConstraint, 0);
}

@end