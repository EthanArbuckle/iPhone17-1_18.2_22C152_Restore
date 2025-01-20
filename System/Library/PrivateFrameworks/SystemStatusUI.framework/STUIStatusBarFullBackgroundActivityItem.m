@interface STUIStatusBarFullBackgroundActivityItem
+ (STUIStatusBarIdentifier)detailDisplayIdentifier;
- (STUIStatusBarStringView)detailStringView;
- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)viewForIdentifier:(id)a3;
- (void)_create_backgroundView;
- (void)_create_detailStringView;
- (void)setDetailStringView:(id)a3;
@end

@implementation STUIStatusBarFullBackgroundActivityItem

+ (STUIStatusBarIdentifier)detailDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"detailDisplayIdentifier"];
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)STUIStatusBarFullBackgroundActivityItem;
  id v7 = a3;
  v8 = [(STUIStatusBarBackgroundActivityItem *)&v19 applyUpdate:v7 toDisplayItem:v6];
  v9 = objc_msgSend(v7, "data", v19.receiver, v19.super_class);
  v10 = [v9 backgroundActivityEntry];

  LODWORD(v9) = [v7 dataChanged];
  if (v9)
  {
    v11 = [v6 identifier];
    v12 = [(id)objc_opt_class() detailDisplayIdentifier];

    if (v11 == v12)
    {
      v13 = [v10 detailString];
      if ([v6 isEnabled]) {
        BOOL v17 = [v13 length] != 0;
      }
      else {
        BOOL v17 = 0;
      }
      [v6 setEnabled:v17];
      if (![v6 isEnabled]) {
        goto LABEL_11;
      }
      v16 = [(STUIStatusBarFullBackgroundActivityItem *)self detailStringView];
      [v16 setText:v13];
    }
    else
    {
      v13 = [v10 backgroundActivityIdentifier];
      v14 = [v6 identifier];
      v15 = [(id)objc_opt_class() backgroundDisplayIdentifier];

      if (v14 != v15)
      {
LABEL_11:

        goto LABEL_12;
      }
      v16 = +[STUIStatusBarActivityAction actionForBackgroundActivityWithIdentifier:v13];
      [v6 setAction:v16];
    }

    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

- (STUIStatusBarStringView)detailStringView
{
  detailStringView = self->_detailStringView;
  if (!detailStringView)
  {
    [(STUIStatusBarFullBackgroundActivityItem *)self _create_detailStringView];
    detailStringView = self->_detailStringView;
  }
  return detailStringView;
}

- (void)_create_detailStringView
{
  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  detailStringView = self->_detailStringView;
  self->_detailStringView = v4;
  MEMORY[0x1F41817F8](v4, detailStringView);
}

- (void)_create_backgroundView
{
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarFullBackgroundActivityItem;
  [(STUIStatusBarBackgroundActivityItem *)&v4 _create_backgroundView];
  v3 = [(STUIStatusBarBackgroundActivityItem *)self backgroundView];
  [v3 setCornerRadius:0.0];
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() detailDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v6 = [(STUIStatusBarFullBackgroundActivityItem *)self detailStringView];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarFullBackgroundActivityItem;
    uint64_t v6 = [(STUIStatusBarBackgroundActivityItem *)&v9 viewForIdentifier:v4];
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() backgroundDisplayIdentifier];

  if (v5 == v4)
  {
    v8 = _STUIStatusBar_BackgroundActivity_Log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7E39000, v8, OS_LOG_TYPE_DEFAULT, "Adding full display background activity item view", buf, 2u);
    }

    uint64_t v7 = +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:0.5];
  }
  else
  {
    id v6 = [(id)objc_opt_class() detailDisplayIdentifier];

    if (v6 == v4)
    {
      objc_super v9 = _STUIStatusBar_BackgroundActivity_Log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D7E39000, v9, OS_LOG_TYPE_DEFAULT, "Adding full display detail background activity item view", buf, 2u);
      }

      uint64_t v7 = +[STUIStatusBarAnimationFactory noAnimation];
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)STUIStatusBarFullBackgroundActivityItem;
      uint64_t v7 = [(STUIStatusBarBackgroundActivityItem *)&v12 additionAnimationForDisplayItemWithIdentifier:v4];
    }
  }
  v10 = (void *)v7;

  return v10;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() backgroundDisplayIdentifier];

  if (v5 == v4)
  {
    v8 = _STUIStatusBar_BackgroundActivity_Log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      objc_super v9 = "Removing full display background activity item view";
LABEL_8:
      _os_log_impl(&dword_1D7E39000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    }
  }
  else
  {
    id v6 = [(id)objc_opt_class() detailDisplayIdentifier];

    if (v6 != v4)
    {
      v12.receiver = self;
      v12.super_class = (Class)STUIStatusBarFullBackgroundActivityItem;
      uint64_t v7 = [(STUIStatusBarBackgroundActivityItem *)&v12 removalAnimationForDisplayItemWithIdentifier:v4];
      goto LABEL_10;
    }
    v8 = _STUIStatusBar_BackgroundActivity_Log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      objc_super v9 = "Removing full display detail background activity item view";
      goto LABEL_8;
    }
  }

  uint64_t v7 = +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:0.5];
LABEL_10:
  v10 = (void *)v7;

  return v10;
}

- (void)setDetailStringView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end