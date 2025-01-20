@interface TSADebugTableViewController
- (TSADebugTableViewController)init;
- (TSADebugTableViewController)initWithParent:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)addItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)dealloc;
- (void)hideImmediately;
- (void)loadView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSADebugTableViewController

- (TSADebugTableViewController)init
{
  return [(TSADebugTableViewController *)self initWithParent:0];
}

- (TSADebugTableViewController)initWithParent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSADebugTableViewController;
  v4 = [(TSADebugTableViewController *)&v8 init];
  if (v4)
  {
    if (!a3)
    {
      v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSADebugTableViewController initWithParent:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADebugTableViewController.mm"), 71, @"invalid nil value for '%s'", "parent");
    }
    v4->_parent = (TSADebugViewController *)a3;
  }
  [(TSADebugTableViewController *)v4 view];
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSADebugTableViewController;
  [(TSADebugTableViewController *)&v3 dealloc];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSMutableArray *)self->_debugItems count];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v5 = (void *)-[NSMutableArray objectAtIndex:](self->_debugItems, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  objc_msgSend((id)objc_msgSend(v5, "target"), "performSelector:withObject:", objc_msgSend(v5, "action"), self);
  parent = self->_parent;

  [(TSADebugViewController *)parent hideIt:parent];
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)TSADebugTableViewController;
  [(TSADebugTableViewController *)&v5 loadView];
  id v3 = objc_alloc(MEMORY[0x263F1CA40]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v4 setOpaque:0];
  [v4 setAutoresizingMask:18];
  [(TSADebugTableViewController *)self setTableView:v4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = (id)[a3 dequeueReusableCellWithIdentifier:@"DebugCell"];
  if (!v6) {
    id v6 = (id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"DebugCell"];
  }
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_debugItems, "objectAtIndex:", objc_msgSend(a4, "row")), "title"));
  return v6;
}

- (void)addItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  debugItems = self->_debugItems;
  if (!debugItems)
  {
    debugItems = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_debugItems = debugItems;
  }
  uint64_t v10 = [(NSMutableArray *)debugItems count];
  if (v10 < 1)
  {
LABEL_7:
    v13 = [[DebugItem alloc] initWithTitle:a3 target:a4 action:a5];
    [(NSMutableArray *)self->_debugItems addObject:v13];
    objc_msgSend((id)-[TSADebugTableViewController tableView](self, "tableView"), "reloadData");
  }
  else
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    while ((objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_debugItems, "objectAtIndex:", v12), "title"), "isEqualToString:", a3) & 1) == 0)
    {
      if (v11 == ++v12) {
        goto LABEL_7;
      }
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSADebugTableViewController;
  [(TSADebugTableViewController *)&v8 viewWillAppear:a3];
  objc_msgSend((id)objc_msgSend((id)-[TSADebugTableViewController tableView](self, "tableView"), "superview"), "frame");
  objc_msgSend((id)-[TSADebugTableViewController view](self, "view"), "setFrame:", v4, v5, v6, v7);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)[(TSADebugTableViewController *)self tableView];
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", objc_msgSend(v5, "indexPathForSelectedRow"), 0);
  objc_msgSend(v5, "setContentOffset:animated:", 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  v6.receiver = self;
  v6.super_class = (Class)TSADebugTableViewController;
  [(TSADebugTableViewController *)&v6 viewDidDisappear:v3];
}

- (void)hideImmediately
{
}

@end