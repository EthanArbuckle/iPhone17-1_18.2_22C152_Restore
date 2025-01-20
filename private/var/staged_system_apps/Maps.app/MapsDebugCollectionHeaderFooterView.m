@interface MapsDebugCollectionHeaderFooterView
- (BOOL)isCollapsed;
- (BOOL)isFooter;
- (MapsDebugCollectionHeaderFooterView)initWithFrame:(CGRect)a3;
- (UILabel)textLabel;
- (void)_updateForCollapsed;
- (void)_updateForFooter;
- (void)setCollapsed:(BOOL)a3;
- (void)setFooter:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation MapsDebugCollectionHeaderFooterView

- (MapsDebugCollectionHeaderFooterView)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)MapsDebugCollectionHeaderFooterView;
  v3 = -[MapsThemeCollectionReusableView initWithFrame:](&v34, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(MapsDebugCollectionHeaderFooterView *)v3 setAccessibilityIdentifier:v5];

    v6 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    textLabel = v3->_textLabel;
    v3->_textLabel = v6;

    [(UILabel *)v3->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_textLabel setNumberOfLines:0];
    [(UILabel *)v3->_textLabel setAdjustsFontForContentSizeCategory:sub_1000BBB44(v3) != 5];
    LODWORD(v8) = 1148846080;
    [(UILabel *)v3->_textLabel setContentHuggingPriority:1 forAxis:v8];
    LODWORD(v9) = 1148846080;
    [(UILabel *)v3->_textLabel setContentCompressionResistancePriority:1 forAxis:v9];
    [(UILabel *)v3->_textLabel setAccessibilityIdentifier:@"TextLabel"];
    v10 = [(MapsThemeCollectionReusableView *)v3 contentView];
    [v10 addSubview:v3->_textLabel];

    uint64_t v11 = sub_1000BBB44(v3);
    double v12 = 15.0;
    if (v11 != 5) {
      double v12 = 0.0;
    }
    -[MapsDebugCollectionHeaderFooterView setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:", 0.0, v12, 0.0, v12);
    if (sub_1000BBB44(v3) != 5)
    {
      v13 = [(MapsThemeCollectionReusableView *)v3 contentView];
      LODWORD(v14) = 1148846080;
      v15 = [(MapsDebugCollectionHeaderFooterView *)v3 _maps_constraintsEqualToEdgesOfView:v13 priority:v14];

      v16 = [v15 allConstraints];
      +[NSLayoutConstraint activateConstraints:v16];
    }
    v17 = v3->_textLabel;
    v18 = [(MapsThemeCollectionReusableView *)v3 contentView];
    LODWORD(v19) = 1148846080;
    v20 = [(UILabel *)v17 _maps_constraintsEqualToEdgesOfView:v18 priority:v19];

    uint64_t v21 = [v20 topConstraint];
    topConstraint = v3->_topConstraint;
    v3->_topConstraint = (NSLayoutConstraint *)v21;

    uint64_t v23 = [v20 bottomConstraint];
    bottomConstraint = v3->_bottomConstraint;
    v3->_bottomConstraint = (NSLayoutConstraint *)v23;

    uint64_t v25 = sub_1000BBB44(v3);
    v26 = [(MapsThemeCollectionReusableView *)v3 contentView];
    v27 = [v26 heightAnchor];
    v28 = v27;
    if (v25 == 5) {
      double v29 = 6.0;
    }
    else {
      double v29 = 32.0;
    }
    uint64_t v30 = [v27 constraintEqualToConstant:v29];
    collapsedHeightConstraint = v3->_collapsedHeightConstraint;
    v3->_collapsedHeightConstraint = (NSLayoutConstraint *)v30;

    v32 = [v20 allConstraints];
    +[NSLayoutConstraint activateConstraints:v32];

    [(MapsDebugCollectionHeaderFooterView *)v3 _updateForFooter];
  }
  return v3;
}

- (void)setFooter:(BOOL)a3
{
  if (self->_footer != a3)
  {
    self->_footer = a3;
    [(MapsDebugCollectionHeaderFooterView *)self _updateForFooter];
    [(MapsDebugCollectionHeaderFooterView *)self _updateForCollapsed];
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    [(MapsDebugCollectionHeaderFooterView *)self _updateForCollapsed];
  }
}

- (void)_updateForCollapsed
{
  if (self->_collapsed)
  {
    [(NSLayoutConstraint *)self->_topConstraint setActive:0];
    [(NSLayoutConstraint *)self->_bottomConstraint setActive:0];
    double v3 = 0.0;
    if (!self->_footer)
    {
      uint64_t v4 = sub_1000BBB44(self);
      double v3 = 32.0;
      if (v4 == 5) {
        double v3 = 6.0;
      }
    }
    p_collapsedHeightConstraint = &self->_collapsedHeightConstraint;
    [(NSLayoutConstraint *)*p_collapsedHeightConstraint setConstant:v3];
  }
  else
  {
    [(NSLayoutConstraint *)self->_collapsedHeightConstraint setActive:0];
    [(NSLayoutConstraint *)self->_topConstraint setActive:1];
    p_collapsedHeightConstraint = &self->_bottomConstraint;
  }
  v6 = *p_collapsedHeightConstraint;

  [(NSLayoutConstraint *)v6 setActive:1];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MapsDebugCollectionHeaderFooterView;
  -[MapsDebugCollectionHeaderFooterView setHidden:](&v5, "setHidden:");
  [(MapsDebugCollectionHeaderFooterView *)self setCollapsed:v3];
}

- (void)_updateForFooter
{
  uint64_t v3 = sub_1000BBB44(self);
  if ([(MapsDebugCollectionHeaderFooterView *)self isFooter])
  {
    if (v3 == 5)
    {
      uint64_t v4 = +[UIFont systemFontOfSize:15.0];
      double v5 = 3.0;
      double v6 = 8.0;
    }
    else
    {
      uint64_t v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
      double v5 = 6.0;
      double v6 = 16.0;
    }
    p_textLabel = &self->_textLabel;
    [(UILabel *)self->_textLabel setFont:v4];

    uint64_t v8 = +[UIColor tertiaryLabelColor];
  }
  else
  {
    if (v3 == 5)
    {
      double v9 = +[UIFont systemFontOfSize:17.0];
      double v5 = 8.0;
      double v6 = 5.0;
    }
    else
    {
      double v9 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleSubheadline weight:UIFontWeightSemibold];
      double v5 = 16.0;
      double v6 = 10.0;
    }
    p_textLabel = &self->_textLabel;
    [(UILabel *)self->_textLabel setFont:v9];

    uint64_t v8 = +[UIColor secondaryLabelColor];
  }
  v10 = (void *)v8;
  [(UILabel *)*p_textLabel setTextColor:v8];

  [(NSLayoutConstraint *)self->_topConstraint setConstant:v5];
  bottomConstraint = self->_bottomConstraint;

  [(NSLayoutConstraint *)bottomConstraint setConstant:v6];
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (BOOL)isFooter
{
  return self->_footer;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);

  objc_storeStrong((id *)&self->_collapsedHeightConstraint, 0);
}

@end