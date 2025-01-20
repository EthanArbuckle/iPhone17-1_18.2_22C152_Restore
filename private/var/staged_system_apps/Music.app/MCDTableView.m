@interface MCDTableView
- (BOOL)_shouldShowHeadersAndFooters;
- (BOOL)canBecomeFirstResponder;
- (BOOL)shouldShowHeadersAndFooters;
- (MCDTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (id)preferredFocusEnvironments;
- (void)setShouldShowHeadersAndFooters:(BOOL)a3;
@end

@implementation MCDTableView

- (MCDTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MCDTableView;
  v4 = -[MCDTableView initWithFrame:style:](&v7, "initWithFrame:style:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    [(MCDTableView *)v4 setContentInsetAdjustmentBehavior:0];
    [(MCDTableView *)v5 setRowHeight:UITableViewAutomaticDimension];
    [(MCDTableView *)v5 setEstimatedRowHeight:UITableViewAutomaticDimension];
    [(MCDTableView *)v5 setAccessibilityIdentifier:@"CPListTemplate"];
  }
  return v5;
}

- (BOOL)_shouldShowHeadersAndFooters
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)preferredFocusEnvironments
{
  v3 = [(MCDTableView *)self window];

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)MCDTableView;
    v4 = [(MCDTableView *)&v6 preferredFocusEnvironments];
  }
  else
  {
    objc_super v7 = self;
    v4 = +[NSArray arrayWithObjects:&v7 count:1];
  }

  return v4;
}

- (BOOL)shouldShowHeadersAndFooters
{
  return self->_shouldShowHeadersAndFooters;
}

- (void)setShouldShowHeadersAndFooters:(BOOL)a3
{
  self->_shouldShowHeadersAndFooters = a3;
}

@end