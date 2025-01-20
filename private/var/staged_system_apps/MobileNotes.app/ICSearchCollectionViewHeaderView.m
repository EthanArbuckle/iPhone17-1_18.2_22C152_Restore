@interface ICSearchCollectionViewHeaderView
- (BOOL)isAccessibilityElement;
- (BOOL)styleForCalculator;
- (ICSearchCollectionViewHeaderView)init;
- (NSString)detail;
- (NSString)title;
- (double)horizontalInsetsOverride;
- (unint64_t)accessibilityTraits;
- (void)setDetail:(id)a3;
- (void)setHorizontalInsetsOverride:(double)a3;
- (void)setStyleForCalculator:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitle:(id)a3 detail:(id)a4;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation ICSearchCollectionViewHeaderView

- (ICSearchCollectionViewHeaderView)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICSearchCollectionViewHeaderView;
  result = [(ICSearchCollectionViewHeaderView *)&v3 init];
  if (result) {
    result->_horizontalInsetsOverride = 2.22507386e-308;
  }
  return result;
}

- (void)setTitle:(id)a3 detail:(id)a4
{
  id v6 = a4;
  [(ICSearchCollectionViewHeaderView *)self setTitle:a3];
  [(ICSearchCollectionViewHeaderView *)self setDetail:v6];

  [(ICSearchCollectionViewHeaderView *)self setNeedsUpdateConfiguration];
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  id v23 = +[UIBackgroundConfiguration clearConfiguration];
  v5 = [v23 updatedConfigurationForState:v4];
  [(ICSearchCollectionViewHeaderView *)self setBackgroundConfiguration:v5];

  id v6 = +[UIListContentConfiguration prominentInsetGroupedHeaderConfiguration];
  v7 = [v6 updatedConfigurationForState:v4];

  [v7 setPrefersSideBySideTextAndSecondaryText:1];
  v8 = [(ICSearchCollectionViewHeaderView *)self title];
  [v7 setText:v8];

  v9 = [(ICSearchCollectionViewHeaderView *)self detail];
  [v7 setSecondaryText:v9];

  if ([(ICSearchCollectionViewHeaderView *)self styleForCalculator])
  {
    v10 = +[UIColor secondaryLabelColor];
    v11 = [v7 textProperties];
    [v11 setColor:v10];

    v12 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    v13 = [v7 textProperties];
    [v13 setFont:v12];

    [(ICSearchCollectionViewHeaderView *)self setHorizontalInsetsOverride:24.0];
  }
  [(ICSearchCollectionViewHeaderView *)self horizontalInsetsOverride];
  if (v14 != 2.22507386e-308)
  {
    [v7 directionalLayoutMargins];
    double v16 = v15;
    double v18 = v17;
    [(ICSearchCollectionViewHeaderView *)self horizontalInsetsOverride];
    double v20 = v19;
    [(ICSearchCollectionViewHeaderView *)self horizontalInsetsOverride];
    double v22 = v21;
    [v7 setAxesPreservingSuperviewLayoutMargins:2];
    [v7 setDirectionalLayoutMargins:v16, v20, v18, v22];
  }
  [(ICSearchCollectionViewHeaderView *)self setContentConfiguration:v7];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ICSearchCollectionViewHeaderView;
  return UIAccessibilityTraitHeader | [(ICSearchCollectionViewHeaderView *)&v3 accessibilityTraits];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
}

- (double)horizontalInsetsOverride
{
  return self->_horizontalInsetsOverride;
}

- (void)setHorizontalInsetsOverride:(double)a3
{
  self->_horizontalInsetsOverride = a3;
}

- (BOOL)styleForCalculator
{
  return self->_styleForCalculator;
}

- (void)setStyleForCalculator:(BOOL)a3
{
  self->_styleForCalculator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end