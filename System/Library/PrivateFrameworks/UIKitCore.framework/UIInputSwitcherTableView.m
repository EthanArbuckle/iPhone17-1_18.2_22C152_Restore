@interface UIInputSwitcherTableView
- (UIKeyboardMenuView)menu;
- (void)deselectRowAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)selectRowAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(int64_t)a5;
- (void)setMenu:(id)a3;
@end

@implementation UIInputSwitcherTableView

- (void)deselectRowAtIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(UITableView *)self cellForRowAtIndexPath:v6];
  v8 = [(UIInputSwitcherTableView *)self menu];
  if ([v8 usesDarkTheme]) {
    +[UIColor whiteColor];
  }
  else {
  v9 = +[UIColor blackColor];
  }
  v10 = [v7 textLabel];
  [v10 setTextColor:v9];

  v11 = [(UIInputSwitcherTableView *)self menu];
  if ([v11 usesDarkTheme]) {
    +[UIColor whiteColor];
  }
  else {
  v12 = +[UIColor blackColor];
  }
  v13 = [v7 detailTextLabel];
  [v13 setTextColor:v12];

  v14 = [v7 backgroundView];
  [v14 setNeedsDisplay];

  v15.receiver = self;
  v15.super_class = (Class)UIInputSwitcherTableView;
  [(UITableView *)&v15 deselectRowAtIndexPath:v6 animated:v4];
}

- (void)selectRowAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [v8 section];
  if (v9 >= [(UITableView *)self numberOfSections]
    || (uint64_t v10 = [v8 row],
        v10 >= -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", [v8 section])))
  {
    if (os_variant_has_internal_diagnostics())
    {
      v18 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v8;
        __int16 v22 = 2112;
        v23 = self;
        _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Attempted to select an out-of-bounds index path (%@) in %@", buf, 0x16u);
      }
    }
    else
    {
      v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &selectRowAtIndexPath_animated_scrollPosition____s_category)+ 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v8;
        __int16 v22 = 2112;
        v23 = self;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Attempted to select an out-of-bounds index path (%@) in %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v11 = [(UITableView *)self cellForRowAtIndexPath:v8];
    v12 = +[UIColor whiteColor];
    v13 = [v11 textLabel];
    [v13 setTextColor:v12];

    v14 = +[UIColor whiteColor];
    objc_super v15 = [v11 detailTextLabel];
    [v15 setTextColor:v14];

    v16 = [v11 backgroundView];
    [v16 setNeedsDisplay];

    v19.receiver = self;
    v19.super_class = (Class)UIInputSwitcherTableView;
    [(UITableView *)&v19 selectRowAtIndexPath:v8 animated:v6 scrollPosition:a5];
  }
}

- (UIKeyboardMenuView)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  self->_menu = (UIKeyboardMenuView *)a3;
}

@end