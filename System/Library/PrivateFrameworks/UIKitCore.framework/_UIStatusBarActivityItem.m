@interface _UIStatusBarActivityItem
- (BOOL)_enableForType:(int64_t)a3;
- (UIEdgeInsets)activityIndicatorAlignmentRectInsets;
- (_UIStatusBarActivityIndicator)activityIndicator;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (void)_create_activityIndicator;
- (void)setActivityIndicator:(id)a3;
@end

@implementation _UIStatusBarActivityItem

- (id)dependentEntryKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"activityEntry"];
}

- (UIEdgeInsets)activityIndicatorAlignmentRectInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (_UIStatusBarActivityIndicator)activityIndicator
{
  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    [(_UIStatusBarActivityItem *)self _create_activityIndicator];
    activityIndicator = self->_activityIndicator;
  }
  return activityIndicator;
}

- (void)_create_activityIndicator
{
  double v3 = [_UIStatusBarActivityIndicator alloc];
  double v4 = -[UIActivityIndicatorView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v4;

  [(UIActivityIndicatorView *)self->_activityIndicator setActivityIndicatorViewStyle:6];
  [(_UIStatusBarActivityItem *)self activityIndicatorAlignmentRectInsets];
  v6 = self->_activityIndicator;
  -[_UIStatusBarActivityIndicator setAlignmentRectInsets:](v6, "setAlignmentRectInsets:");
}

- (BOOL)_enableForType:(int64_t)a3
{
  return 1;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 dataChanged] & 1) != 0 || objc_msgSend(v6, "styleAttributesChanged"))
  {
    v8 = [v6 data];
    v9 = [v8 activityEntry];
    uint64_t v10 = [v9 type];

    LODWORD(v9) = [(_UIStatusBarActivityItem *)self _enableForType:v10];
    v11 = [(_UIStatusBarActivityItem *)self activityIndicator];
    v12 = v11;
    if (v9)
    {
      BOOL v13 = (v10 & 2) == 0;
      v14 = [v6 styleAttributes];
      [v14 iconScale];
      double v16 = v15;

      uint64_t v17 = 7;
      if (v16 > 1.0) {
        uint64_t v17 = 12;
      }
      uint64_t v18 = 6;
      if (v16 > 1.0) {
        uint64_t v18 = 11;
      }
      BOOL v19 = (v10 & 1) == 0;
      if (v10) {
        uint64_t v20 = v17;
      }
      else {
        uint64_t v20 = v18;
      }
      if (v19) {
        v21 = &dbl_186B9C260[v13];
      }
      else {
        v21 = (double *)((char *)&unk_186B9C250 + 8 * v13);
      }
      double v22 = *v21;
      if (v20 == [v12 activityIndicatorViewStyle])
      {
        [v12 setActivityIndicatorViewStyle:v20];
        [v12 setAnimationDuration:v22];
      }
      else
      {
        char v23 = [v6 styleAttributesChanged];
        [v12 setActivityIndicatorViewStyle:v20];
        [v12 setAnimationDuration:v22];
        if ((v23 & 1) == 0)
        {
          v24 = [(_UIStatusBarItem *)self statusBar];
          v25 = [v24 styleAttributes];
          [v12 applyStyleAttributes:v25];
        }
      }
      [v12 startAnimating];
    }
    else
    {
      [v11 stopAnimating];
      [v7 setEnabled:0];
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)_UIStatusBarActivityItem;
  v26 = [(_UIStatusBarItem *)&v28 applyUpdate:v6 toDisplayItem:v7];

  return v26;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end