@interface _UIStatusBarActivityItem_Split
+ (_UIStatusBarIdentifier)pillDisplayIdentifier;
+ (_UIStatusBarIdentifier)syncStartDisplayIdentifier;
- (UIEdgeInsets)activityIndicatorAlignmentRectInsets;
- (_UIStatusBarActivityIndicator)syncStartView;
- (_UIStatusBarActivityView)activityView;
- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)viewForIdentifier:(id)a3;
- (void)_create_activityView;
- (void)_create_syncStartView;
- (void)setActivityView:(id)a3;
- (void)setSyncStartView:(id)a3;
@end

@implementation _UIStatusBarActivityItem_Split

+ (_UIStatusBarIdentifier)pillDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"pillDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)syncStartDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"syncStartDisplayIdentifier"];
}

- (UIEdgeInsets)activityIndicatorAlignmentRectInsets
{
  double v2 = 2.66666667;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (_UIStatusBarActivityView)activityView
{
  activityView = self->_activityView;
  if (!activityView)
  {
    [(_UIStatusBarActivityItem_Split *)self _create_activityView];
    activityView = self->_activityView;
  }
  return activityView;
}

- (void)_create_activityView
{
  double v3 = [_UIStatusBarActivityView alloc];
  double v4 = -[_UIStatusBarActivityView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  activityView = self->_activityView;
  self->_activityView = v4;
}

- (_UIStatusBarActivityIndicator)syncStartView
{
  syncStartView = self->_syncStartView;
  if (!syncStartView)
  {
    [(_UIStatusBarActivityItem_Split *)self _create_syncStartView];
    syncStartView = self->_syncStartView;
  }
  return syncStartView;
}

- (void)_create_syncStartView
{
  double v3 = [_UIStatusBarActivityIndicator alloc];
  double v4 = -[UIActivityIndicatorView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  syncStartView = self->_syncStartView;
  self->_syncStartView = v4;

  v6 = self->_syncStartView;
  [(UIActivityIndicatorView *)v6 setActivityIndicatorViewStyle:12];
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() syncStartDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v7 = [(_UIStatusBarActivityItem_Split *)self syncStartView];
  }
  else
  {
    id v6 = [(id)objc_opt_class() pillDisplayIdentifier];

    if (v6 == v4)
    {
      uint64_t v7 = [(_UIStatusBarActivityItem_Split *)self activityView];
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)_UIStatusBarActivityItem_Split;
      uint64_t v7 = [(_UIStatusBarActivityItem *)&v10 viewForIdentifier:v4];
    }
  }
  v8 = (void *)v7;

  return v8;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UIStatusBarActivityItem_Split;
  v8 = [(_UIStatusBarActivityItem *)&v20 applyUpdate:v6 toDisplayItem:v7];
  if ([v6 dataChanged])
  {
    v9 = [v6 data];
    objc_super v10 = [v9 activityEntry];
    unint64_t v11 = [v10 type];

    v12 = [v7 identifier];
    v13 = [(id)objc_opt_class() syncStartDisplayIdentifier];

    if (v12 != v13)
    {
      v14 = [v7 identifier];
      v15 = [(id)objc_opt_class() pillDisplayIdentifier];

      if (v14 != v15) {
        goto LABEL_9;
      }
      v16 = [(_UIStatusBarActivityItem_Split *)self activityView];
      [v16 setIsSlow:(v11 >> 1) & 1];
      goto LABEL_7;
    }
    if ([(_UIStatusBarActivityItem_SyncOnly *)self _enableForType:v11])
    {
      [v7 setViewAlpha:0.8];
      double v17 = dbl_186B9C250[(v11 & 2) == 0];
      v18 = [(_UIStatusBarActivityItem_Split *)self syncStartView];
      [v18 setAnimationDuration:v17];

      v16 = [(_UIStatusBarActivityItem_Split *)self syncStartView];
      [v16 startAnimating];
LABEL_7:

      goto LABEL_9;
    }
    [v7 setEnabled:0];
  }
LABEL_9:

  return v8;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() pillDisplayIdentifier];

  if (v5 == v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80___UIStatusBarActivityItem_Split_additionAnimationForDisplayItemWithIdentifier___block_invoke;
    v10[3] = &unk_1E53051A0;
    v10[4] = self;
    uint64_t v6 = +[_UIStatusBarAnimation animationWithBlock:v10];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarActivityItem_Split;
    uint64_t v6 = [(_UIStatusBarItem *)&v9 additionAnimationForDisplayItemWithIdentifier:v4];
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() pillDisplayIdentifier];

  if (v5 == v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79___UIStatusBarActivityItem_Split_removalAnimationForDisplayItemWithIdentifier___block_invoke;
    v10[3] = &unk_1E53051A0;
    v10[4] = self;
    uint64_t v6 = +[_UIStatusBarAnimation animationWithBlock:v10];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarActivityItem_Split;
    uint64_t v6 = [(_UIStatusBarItem *)&v9 removalAnimationForDisplayItemWithIdentifier:v4];
  }
  id v7 = (void *)v6;

  return v7;
}

- (void)setActivityView:(id)a3
{
}

- (void)setSyncStartView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncStartView, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
}

@end