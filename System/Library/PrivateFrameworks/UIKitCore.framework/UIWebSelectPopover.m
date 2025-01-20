@interface UIWebSelectPopover
- (UIWebSelectPopover)initWithDOMHTMLSelectElement:(id)a3 cachedItems:(id)a4 singleSelectionItem:(id)a5 singleSelectionIndex:(unint64_t)a6 multipleSelection:(BOOL)a7;
- (UIWebSelectTableViewController)_tableViewController;
- (id)controlView;
- (void)controlBeginEditing;
- (void)dealloc;
- (void)set_tableViewController:(id)a3;
@end

@implementation UIWebSelectPopover

- (UIWebSelectPopover)initWithDOMHTMLSelectElement:(id)a3 cachedItems:(id)a4 singleSelectionItem:(id)a5 singleSelectionIndex:(unint64_t)a6 multipleSelection:(BOOL)a7
{
  BOOL v7 = a7;
  v21.receiver = self;
  v21.super_class = (Class)UIWebSelectPopover;
  v11 = -[UIWebFormRotatingAccessoryPopover initWithDOMNode:](&v21, sel_initWithDOMNode_, a3, a4, a5);
  if (v11)
  {
    +[UIKeyboard defaultSizeForInterfaceOrientation:](UIKeyboard, "defaultSizeForInterfaceOrientation:", [(id)UIApp _defaultSceneInterfaceOrientationReturningUnknownForNilScene:0]);
    [(UIWebSelectPopover *)v11 set_tableViewController:[[UIWebSelectTableViewController alloc] initWithDOMHTMLSelectNode:a3 cachedItems:a4 singleSelectionIndex:a6 multipleSelection:v7]];
    [(UIWebSelectTableViewController *)v11->_tableViewController set_popover:v11];
    tableViewController = v11->_tableViewController;
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a3, "title"), "length");
    if (v13)
    {
      v14 = [[UINavigationController alloc] initWithRootViewController:v11->_tableViewController];
      tableViewController = v14;
    }
    else
    {
      v14 = 0;
    }
    -[UITableView sizeThatFits:]([(UITableViewController *)v11->_tableViewController tableView], "sizeThatFits:", 320.0, 1.79769313e308);
    double v16 = v15;
    double v18 = v17;
    v19 = tableViewController;
    if (v13) {
      v19 = (void *)[tableViewController topViewController];
    }
    objc_msgSend(v19, "setPreferredContentSize:", v16, v18);
    [(UIWebRotatingNodePopover *)v11 setPopoverController:[[UIPopoverController alloc] initWithContentViewController:tableViewController]];

    [+[UIKeyboardImpl sharedInstance] setDelegate:v11->_tableViewController];
  }
  return v11;
}

- (void)dealloc
{
  [(UIWebSelectTableViewController *)self->_tableViewController set_selectionNode:0];
  [(UIWebSelectTableViewController *)self->_tableViewController set_cachedItems:0];
  [(UIWebSelectTableViewController *)self->_tableViewController set_popover:0];
  [[(UITableViewController *)self->_tableViewController tableView] setDataSource:0];
  [[(UITableViewController *)self->_tableViewController tableView] setDelegate:0];
  [(UIWebSelectPopover *)self set_tableViewController:0];
  v3.receiver = self;
  v3.super_class = (Class)UIWebSelectPopover;
  [(UIWebRotatingNodePopover *)&v3 dealloc];
}

- (id)controlView
{
  return 0;
}

- (void)controlBeginEditing
{
}

- (UIWebSelectTableViewController)_tableViewController
{
  return self->_tableViewController;
}

- (void)set_tableViewController:(id)a3
{
}

@end