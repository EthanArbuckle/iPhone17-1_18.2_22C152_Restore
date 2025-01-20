@interface UIKeyboardEmojiSplit
- (BOOL)shouldCache;
- (UIKeyboardEmojiSplit)initWithFrame:(CGRect)a3;
- (UITableView)picker;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)defaultIndexPath;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation UIKeyboardEmojiSplit

- (id)defaultIndexPath
{
  return (id)[MEMORY[0x1E4F28D58] indexPathForRow:1 inSection:0];
}

- (UIKeyboardEmojiSplit)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardEmojiSplit;
  v3 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(UIView *)v3 setBackgroundColor:v4];

    [(UIView *)v3 setOpaque:0];
    [(UIView *)v3 bounds];
    v9 = -[UITableView initWithFrame:]([UITableView alloc], "initWithFrame:", v5, v6, v7, v8);
    picker = v3->_picker;
    v3->_picker = v9;

    [(UITableView *)v3->_picker setSeparatorStyle:0];
    [(UITableView *)v3->_picker setDelaysContentTouches:0];
    v11 = +[UIColor clearColor];
    [(UITableView *)v3->_picker setBackgroundColor:v11];

    [(UIView *)v3 addSubview:v3->_picker];
    v12 = v3;
  }

  return v3;
}

- (BOOL)shouldCache
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
  int64_t v5 = [v4 preferencesActions];
  [v5 rivenSizeFactor:200.0];
  double v6 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v7 = [v6 preferencesActions];
  [v7 rivenSizeFactor:34.0];
  double v9 = v8;

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  [v5 setOpaque:0];
  id v6 = +[UIColor clearColor];
  [v5 setBackgroundColor:v6];
}

- (UITableView)picker
{
  return (UITableView *)objc_getProperty(self, a2, 600, 1);
}

- (void).cxx_destruct
{
}

@end