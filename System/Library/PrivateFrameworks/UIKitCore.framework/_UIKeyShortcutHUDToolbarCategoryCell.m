@interface _UIKeyShortcutHUDToolbarCategoryCell
- (id)_defaultContentConfigurationWithCategory:(id)a3;
- (void)configureForDisplayingInHUDWithCategory:(id)a3;
- (void)configureForMetricsCalculationsWithCategory:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation _UIKeyShortcutHUDToolbarCategoryCell

- (void)updateConfigurationUsingState:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_UIKeyShortcutHUDToolbarCategoryCell;
  id v4 = a3;
  [(_UIKeyShortcutHUDToolbarCell *)&v11 updateConfigurationUsingState:v4];
  v5 = [(UICollectionViewCell *)self contentConfiguration];
  int v6 = [v4 isCategoryVisible];

  v7 = +[UIKeyShortcutHUDMetrics currentMetrics];
  v8 = v7;
  if (v6) {
    [v7 toolbarCategoryVisibleFont];
  }
  else {
  v9 = [v7 toolbarCategoryRegularFont];
  }
  v10 = [v5 textProperties];
  [v10 setFont:v9];

  [(UICollectionViewCell *)self setContentConfiguration:v5];
}

- (id)_defaultContentConfigurationWithCategory:(id)a3
{
  id v4 = a3;
  v5 = [(_UIKeyShortcutHUDCell *)self defaultContentConfiguration];
  int v6 = [v4 title];

  [v5 setText:v6];
  return v5;
}

- (void)configureForMetricsCalculationsWithCategory:(id)a3
{
  id v4 = [(_UIKeyShortcutHUDToolbarCategoryCell *)self _defaultContentConfigurationWithCategory:a3];
  [(UICollectionViewCell *)self setContentConfiguration:v4];
}

- (void)configureForDisplayingInHUDWithCategory:(id)a3
{
  id v5 = [(_UIKeyShortcutHUDToolbarCategoryCell *)self _defaultContentConfigurationWithCategory:a3];
  id v4 = [v5 textProperties];
  [v4 setAlignment:1];

  [(UICollectionViewCell *)self setContentConfiguration:v5];
}

@end