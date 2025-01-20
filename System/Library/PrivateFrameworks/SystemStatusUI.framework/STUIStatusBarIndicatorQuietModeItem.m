@interface STUIStatusBarIndicatorQuietModeItem
+ (STUIStatusBarIdentifier)emphasizedQuietModeIdentifier;
- (BOOL)shouldUpdateIndicatorForIdentifier:(id)a3;
- (NSString)focusName;
- (STUIStatusBarImageView)emphasizedImageView;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)imageViewForIdentifier:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
- (id)viewForIdentifier:(id)a3;
- (void)_create_emphasizedImageView;
- (void)setEmphasizedImageView:(id)a3;
- (void)setFocusName:(id)a3;
@end

@implementation STUIStatusBarIndicatorQuietModeItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA97A0];
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() emphasizedQuietModeIdentifier];

  if (v5 == v4)
  {
    uint64_t v6 = [(STUIStatusBarIndicatorQuietModeItem *)self emphasizedImageView];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarIndicatorQuietModeItem;
    uint64_t v6 = [(STUIStatusBarIndicatorItem *)&v9 viewForIdentifier:v4];
  }
  v7 = (void *)v6;

  return v7;
}

+ (STUIStatusBarIdentifier)emphasizedQuietModeIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"emphasizedQuietModeIdentifier"];
}

- (STUIStatusBarImageView)emphasizedImageView
{
  emphasizedImageView = self->_emphasizedImageView;
  if (!emphasizedImageView)
  {
    [(STUIStatusBarIndicatorQuietModeItem *)self _create_emphasizedImageView];
    emphasizedImageView = self->_emphasizedImageView;
  }
  return emphasizedImageView;
}

- (void)_create_emphasizedImageView
{
  v3 = [STUIStatusBarImageView alloc];
  id v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  emphasizedImageView = self->_emphasizedImageView;
  self->_emphasizedImageView = v4;

  uint64_t v6 = self->_emphasizedImageView;
  [(STUIStatusBarImageView *)v6 setFontStyle:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emphasizedImageView, 0);
  objc_storeStrong((id *)&self->_focusName, 0);
}

- (id)imageViewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() emphasizedQuietModeIdentifier];

  if (v5 == v4)
  {
    uint64_t v6 = [(STUIStatusBarIndicatorQuietModeItem *)self emphasizedImageView];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarIndicatorQuietModeItem;
    uint64_t v6 = [(STUIStatusBarIndicatorItem *)&v9 imageViewForIdentifier:v4];
  }
  v7 = (void *)v6;

  return v7;
}

- (BOOL)shouldUpdateIndicatorForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() emphasizedQuietModeIdentifier];
  if (v5 == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)STUIStatusBarIndicatorQuietModeItem;
    BOOL v6 = [(STUIStatusBarIndicatorItem *)&v8 shouldUpdateIndicatorForIdentifier:v4];
  }

  return v6;
}

- (id)systemImageNameForUpdate:(id)a3
{
  v3 = [a3 data];
  id v4 = [v3 quietModeEntry];
  id v5 = [v4 imageName];
  BOOL v6 = v5;
  if (!v5) {
    id v5 = @"moon.fill";
  }
  v7 = v5;

  return v7;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)STUIStatusBarIndicatorQuietModeItem;
  objc_super v8 = [(STUIStatusBarIndicatorItem *)&v20 applyUpdate:v6 toDisplayItem:v7];
  if ([v6 dataChanged])
  {
    objc_super v9 = [v6 data];
    v10 = [v9 quietModeEntry];
    int v11 = [v10 BOOLValue];

    double v12 = 0.3;
    if (v11) {
      double v12 = 1.0;
    }
    [v7 setViewAlpha:v12];
    uint64_t v13 = v11 ^ 1u;
    v14 = [v7 identifier];
    v15 = [(STUIStatusBarIndicatorQuietModeItem *)self imageViewForIdentifier:v14];
    [v15 setUseDisabledAppearanceForAccessibilityHUD:v13];

    v16 = [v6 data];
    v17 = [v16 quietModeEntry];
    v18 = [v17 focusName];
    [(STUIStatusBarIndicatorQuietModeItem *)self setFocusName:v18];
  }
  return v8;
}

- (NSString)focusName
{
  return self->_focusName;
}

- (void)setFocusName:(id)a3
{
}

- (void)setEmphasizedImageView:(id)a3
{
}

@end