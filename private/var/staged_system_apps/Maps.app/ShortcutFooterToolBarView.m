@interface ShortcutFooterToolBarView
- (void)_updateContent;
- (void)cancelListShortcutAction:(id)a3;
- (void)editListShortcutAction:(id)a3;
- (void)loadListShortcutActions;
- (void)loadListShortcutEditActions;
- (void)newShortcutAction:(id)a3;
@end

@implementation ShortcutFooterToolBarView

- (void)_updateContent
{
  unint64_t v3 = [(FooterToolBarView *)self state];
  if (v3)
  {
    if (v3 == 8)
    {
      [(ShortcutFooterToolBarView *)self loadListShortcutEditActions];
    }
    else if (v3 == 7)
    {
      [(ShortcutFooterToolBarView *)self loadListShortcutActions];
    }
  }
  else
  {
    id v4 = [(FooterToolBarView *)self toolBar];
    [v4 setItems:&__NSArray0__struct];
  }
}

- (void)loadListShortcutActions
{
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:4 target:self action:"newShortcutAction:"];
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"editListShortcutAction:"];
  v8[0] = v5;
  v8[1] = v4;
  v8[2] = v3;
  v6 = +[NSArray arrayWithObjects:v8 count:3];
  v7 = [(FooterToolBarView *)self toolBar];
  [v7 setItems:v6];
}

- (void)loadListShortcutEditActions
{
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"cancelListShortcutAction:"];
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  v7[0] = v3;
  v7[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v7 count:2];
  v6 = [(FooterToolBarView *)self toolBar];
  [v6 setItems:v5];
}

- (void)newShortcutAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsShortcutAction:2];
}

- (void)cancelListShortcutAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsShortcutAction:1];
}

- (void)editListShortcutAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsShortcutAction:0];
}

@end