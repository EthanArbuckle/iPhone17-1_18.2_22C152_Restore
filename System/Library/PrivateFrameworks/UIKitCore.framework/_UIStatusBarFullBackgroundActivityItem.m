@interface _UIStatusBarFullBackgroundActivityItem
+ (_UIStatusBarIdentifier)detailDisplayIdentifier;
- (_UIStatusBarStringView)detailStringView;
- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)viewForIdentifier:(id)a3;
- (void)_create_backgroundView;
- (void)_create_detailStringView;
- (void)setDetailStringView:(id)a3;
@end

@implementation _UIStatusBarFullBackgroundActivityItem

+ (_UIStatusBarIdentifier)detailDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"detailDisplayIdentifier"];
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UIStatusBarFullBackgroundActivityItem;
  id v7 = a3;
  v8 = [(_UIStatusBarBackgroundActivityItem *)&v20 applyUpdate:v7 toDisplayItem:v6];
  v9 = objc_msgSend(v7, "data", v20.receiver, v20.super_class);
  v10 = [v9 backgroundActivityEntry];

  LODWORD(v9) = [v7 dataChanged];
  if (v9)
  {
    v11 = [v6 identifier];
    v12 = [(id)objc_opt_class() detailDisplayIdentifier];

    if (v11 == v12)
    {
      v16 = [v10 detailString];
      if ([v6 isEnabled]) {
        BOOL v17 = [v16 length] != 0;
      }
      else {
        BOOL v17 = 0;
      }
      [v6 setEnabled:v17];
      if ([v6 isEnabled])
      {
        v18 = [(_UIStatusBarFullBackgroundActivityItem *)self detailStringView];
        [v18 setText:v16];
      }
    }
    else
    {
      uint64_t v13 = [v10 type];
      v14 = [v6 identifier];
      v15 = [(id)objc_opt_class() backgroundDisplayIdentifier];

      if (v14 != v15) {
        goto LABEL_11;
      }
      v16 = +[_UIStatusBarActivityAction actionForBackgroundActivityType:v13];
      [v6 setAction:v16];
    }
  }
LABEL_11:

  return v8;
}

- (_UIStatusBarStringView)detailStringView
{
  detailStringView = self->_detailStringView;
  if (!detailStringView)
  {
    [(_UIStatusBarFullBackgroundActivityItem *)self _create_detailStringView];
    detailStringView = self->_detailStringView;
  }
  return detailStringView;
}

- (void)_create_detailStringView
{
  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  detailStringView = self->_detailStringView;
  self->_detailStringView = v4;
}

- (void)_create_backgroundView
{
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarFullBackgroundActivityItem;
  [(_UIStatusBarBackgroundActivityItem *)&v4 _create_backgroundView];
  v3 = [(_UIStatusBarBackgroundActivityItem *)self backgroundView];
  [v3 setCornerRadius:0.0];
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() detailDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v6 = [(_UIStatusBarFullBackgroundActivityItem *)self detailStringView];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarFullBackgroundActivityItem;
    uint64_t v6 = [(_UIStatusBarBackgroundActivityItem *)&v9 viewForIdentifier:v4];
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
    v8 = _UIStatusBar_Log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "Adding full display background activity item view", buf, 2u);
    }

    uint64_t v7 = +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:0.5];
  }
  else
  {
    id v6 = [(id)objc_opt_class() detailDisplayIdentifier];

    if (v6 == v4)
    {
      objc_super v9 = _UIStatusBar_Log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Adding full display detail background activity item view", buf, 2u);
      }

      uint64_t v7 = +[_UIStatusBarAnimationFactory noAnimation];
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)_UIStatusBarFullBackgroundActivityItem;
      uint64_t v7 = [(_UIStatusBarBackgroundActivityItem *)&v12 additionAnimationForDisplayItemWithIdentifier:v4];
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
    v8 = _UIStatusBar_Log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      objc_super v9 = "Removing full display background activity item view";
LABEL_8:
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    }
  }
  else
  {
    id v6 = [(id)objc_opt_class() detailDisplayIdentifier];

    if (v6 != v4)
    {
      v12.receiver = self;
      v12.super_class = (Class)_UIStatusBarFullBackgroundActivityItem;
      uint64_t v7 = [(_UIStatusBarBackgroundActivityItem *)&v12 removalAnimationForDisplayItemWithIdentifier:v4];
      goto LABEL_10;
    }
    v8 = _UIStatusBar_Log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      objc_super v9 = "Removing full display detail background activity item view";
      goto LABEL_8;
    }
  }

  uint64_t v7 = +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:0.5];
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