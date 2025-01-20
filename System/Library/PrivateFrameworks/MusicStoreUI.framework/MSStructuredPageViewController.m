@interface MSStructuredPageViewController
- (BOOL)_handleInlinePreviewForIndexPath:(id)a3;
- (BOOL)_handleMediaPreviewForIndexPath:(id)a3;
- (BOOL)_handlePreviewForIndexPath:(id)a3;
- (BOOL)canDisplaySectionGroup:(id)a3;
- (BOOL)canSelectRowAtIndexPath:(id)a3;
- (BOOL)handleSelectionForIndexPath:(id)a3 tapCount:(int64_t)a4;
- (BOOL)purchaseItemAtIndexPath:(id)a3;
- (MSStructuredPageViewController)init;
- (id)setDisplayedSectionGroup:(id)a3;
- (void)_playerStatusChangeNotification:(id)a3;
- (void)_setPreviewStatus:(id)a3 forIndexPath:(id)a4 animated:(BOOL)a5;
- (void)_stopPreviewPlayback;
- (void)applicationDidEnterBackground;
- (void)dealloc;
- (void)reloadWithStorePage:(id)a3 forURL:(id)a4;
- (void)setSkLoading:(BOOL)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MSStructuredPageViewController

- (MSStructuredPageViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)MSStructuredPageViewController;
  v2 = [(SUStructuredPageGroupedViewController *)&v4 init];
  if (v2) {
    [(SUStructuredPageViewController *)v2 setDataSourceClass:objc_opt_class()];
  }
  return v2;
}

- (void)dealloc
{
  [(MSStructuredPageViewController *)self _stopPreviewPlayback];

  v3.receiver = self;
  v3.super_class = (Class)MSStructuredPageViewController;
  [(SUStructuredPageGroupedViewController *)&v3 dealloc];
}

- (void)applicationDidEnterBackground
{
  [(MSStructuredPageViewController *)self _setPreviewStatus:0 forIndexPath:0 animated:0];
  v3.receiver = self;
  v3.super_class = (Class)MSStructuredPageViewController;
  [(SUViewController *)&v3 applicationDidEnterBackground];
}

- (BOOL)canDisplaySectionGroup:(id)a3
{
  return [a3 style] == 1 && objc_msgSend((id)objc_msgSend(a3, "sections"), "count") == 2;
}

- (BOOL)canSelectRowAtIndexPath:(id)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "defaultStoreOffer"), "offerMedia"), "URL")
    && (objc_msgSend((id)objc_msgSend(v5, "contentRating"), "isRestricted") & 1) == 0
    && ([(SUTableDataSource *)[(SUTableViewController *)self dataSource] canShowPreviewForItem:v5] & 1) != 0)
  {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)MSStructuredPageViewController;
  return [(SUStructuredPageViewController *)&v7 canSelectRowAtIndexPath:a3];
}

- (BOOL)handleSelectionForIndexPath:(id)a3 tapCount:(int64_t)a4
{
  objc_super v7 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3);
  if (a4 == 1
    && (v8 = v7, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "defaultStoreOffer"), "offerMedia"), "URL"))
    && [(SUTableDataSource *)[(SUTableViewController *)self dataSource] canShowPreviewForItem:v8])
  {
    if (objc_msgSend((id)objc_msgSend(v8, "contentRating"), "isRestricted"))
    {
      return 0;
    }
    else
    {
      return [(MSStructuredPageViewController *)self _handlePreviewForIndexPath:a3];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MSStructuredPageViewController;
    return [(SUStructuredPageViewController *)&v10 handleSelectionForIndexPath:a3 tapCount:a4];
  }
}

- (BOOL)purchaseItemAtIndexPath:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MSStructuredPageViewController;
  BOOL v5 = -[SUStructuredPageGroupedViewController purchaseItemAtIndexPath:](&v9, sel_purchaseItemAtIndexPath_);
  if (v5)
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3);
    if (v6)
    {
      objc_super v7 = (void *)[objc_alloc(MEMORY[0x263F89630]) initWithItem:v6];
      [MEMORY[0x263F89638] sendDownloadPingRequestsForMediaPlayerItem:v7];
    }
  }
  return v5;
}

- (void)reloadWithStorePage:(id)a3 forURL:(id)a4
{
  [(MSStructuredPageViewController *)self _setPreviewStatus:0 forIndexPath:0 animated:0];
  v7.receiver = self;
  v7.super_class = (Class)MSStructuredPageViewController;
  [(SUStructuredPageViewController *)&v7 reloadWithStorePage:a3 forURL:a4];
}

- (id)setDisplayedSectionGroup:(id)a3
{
  int v5 = [(SUSegmentedControl *)self->_inlineSegmentedControl isDescendantOfView:[(UITableView *)[(SUTableViewController *)self tableView] tableHeaderView]];

  self->_inlineSegmentedControl = 0;
  if (a3)
  {
    uint64_t v6 = (SUSegmentedControl *)objc_alloc_init(MEMORY[0x263F896A0]);
    self->_inlineSegmentedControl = v6;
    [(SUSegmentedControl *)v6 setClientInterface:[(SUViewController *)self clientInterface]];
    -[SUSegmentedControl setItems:](self->_inlineSegmentedControl, "setItems:", objc_msgSend((id)objc_msgSend(a3, "sections"), "valueForKey:", @"segmentedControlItem"));
    -[SUSegmentedControl setTintColor:](self->_inlineSegmentedControl, "setTintColor:", [a3 tintColor]);
    -[SUSegmentedControl setTintStyle:](self->_inlineSegmentedControl, "setTintStyle:", [a3 tintStyle]);
    [(SUSegmentedControl *)self->_inlineSegmentedControl sizeToFit];
    [(SUSegmentedControl *)self->_inlineSegmentedControl frame];
    double v8 = v7;
    double v9 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = v7 + 10.0 + 11.0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "applicationFrame");
    double v13 = v12;
    -[SUSegmentedControl setFrame:](self->_inlineSegmentedControl, "setFrame:", 10.0, 11.0, v12 + -10.0 + -10.0, v8);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v9, v10, v13, v11);
    [v14 addSubview:self->_inlineSegmentedControl];
    [(UITableView *)[(SUTableViewController *)self tableView] setTableHeaderView:v14];
  }
  else if (v5)
  {
    [(UITableView *)[(SUTableViewController *)self tableView] setTableHeaderView:0];
  }
  return self->_inlineSegmentedControl;
}

- (void)setSkLoading:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MSStructuredPageViewController;
  -[SUStructuredPageGroupedViewController setSkLoading:](&v5, sel_setSkLoading_);
  if (v3) {
    [(MSStructuredPageViewController *)self _setPreviewStatus:0 forIndexPath:0 animated:0];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  if (self->_previewIndexPath && objc_msgSend(a5, "isEqual:"))
  {
    previewStatus = self->_previewStatus;
LABEL_6:
    [a4 setPreviewStatus:previewStatus];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    previewStatus = 0;
    goto LABEL_6;
  }
LABEL_7:
  v10.receiver = self;
  v10.super_class = (Class)MSStructuredPageViewController;
  [(SUTableViewController *)&v10 tableView:a3 willDisplayCell:a4 forRowAtIndexPath:a5];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MSStructuredPageViewController *)self _stopPreviewPlayback];
  [(MSStructuredPageViewController *)self _setPreviewStatus:0 forIndexPath:0 animated:0];
  v5.receiver = self;
  v5.super_class = (Class)MSStructuredPageViewController;
  [(SUItemTableViewController *)&v5 viewWillDisappear:v3];
}

- (void)_playerStatusChangeNotification:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "object"), "playerStatus"), "playerState") & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    [(MSStructuredPageViewController *)self _stopPreviewPlayback];
    previewIndexPath = self->_previewIndexPath;
    objc_super v5 = self;
    uint64_t v6 = 0;
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v6 = [(SUAudioPlayer *)self->_previewPlayer playerStatus];
    previewIndexPath = self->_previewIndexPath;
    objc_super v5 = self;
    uint64_t v7 = 0;
  }
  [(MSStructuredPageViewController *)v5 _setPreviewStatus:v6 forIndexPath:previewIndexPath animated:v7];
}

- (BOOL)_handleInlinePreviewForIndexPath:(id)a3
{
  objc_super v5 = [(SUTableViewController *)self tableView];
  previewIndexPath = self->_previewIndexPath;
  if (!previewIndexPath
    || (char v7 = [(NSIndexPath *)previewIndexPath isEqual:a3],
        [(MSStructuredPageViewController *)self _setPreviewStatus:0 forIndexPath:self->_previewIndexPath animated:1], [(MSStructuredPageViewController *)self _stopPreviewPlayback], (v7 & 1) == 0))
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3), "defaultStoreOffer"), "offerMedia"), "URL");
    if (v8)
    {
      self->_previewPlayer = (SUAudioPlayer *)[objc_alloc(MEMORY[0x263F895C0]) initWithURL:v8];
      double v9 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      [v9 addObserver:self selector:sel__playerStatusChangeNotification_ name:*MEMORY[0x263F89738] object:self->_previewPlayer];
      [(MSStructuredPageViewController *)self _setPreviewStatus:[(SUAudioPlayer *)self->_previewPlayer playerStatus] forIndexPath:a3 animated:1];
      [(SUAudioPlayer *)self->_previewPlayer play];
    }

    self->_previewIndexPath = (NSIndexPath *)a3;
  }
  [(UITableView *)v5 deselectRowAtIndexPath:a3 animated:1];
  return 1;
}

- (BOOL)_handleMediaPreviewForIndexPath:(id)a3
{
  objc_super v4 = objc_msgSend(objc_alloc(MEMORY[0x263F89630]), "initWithItem:", objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3));
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x263F89638]) initWithMediaPlayerItem:v4];
  objc_msgSend(v5, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  [(MSStructuredPageViewController *)self presentViewController:v5 animated:1 completion:0];

  return 1;
}

- (BOOL)_handlePreviewForIndexPath:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3), "itemType");
  if ((unint64_t)(v5 - 1001) > 8 || ((1 << (v5 + 23)) & 0x147) == 0)
  {
    return [(MSStructuredPageViewController *)self _handleInlinePreviewForIndexPath:a3];
  }
  else
  {
    return [(MSStructuredPageViewController *)self _handleMediaPreviewForIndexPath:a3];
  }
}

- (void)_setPreviewStatus:(id)a3 forIndexPath:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  previewStatus = self->_previewStatus;
  if (previewStatus != a3)
  {

    self->_previewStatus = (SUPlayerStatus *)a3;
  }
  previewIndexPath = self->_previewIndexPath;
  if (a4 && previewIndexPath)
  {
    if ([(NSIndexPath *)previewIndexPath isEqual:a4])
    {
LABEL_11:
      [(UITableViewCell *)[(UITableView *)[(SUTableViewController *)self tableView] cellForRowAtIndexPath:self->_previewIndexPath] setPreviewStatus:a3 animated:v5];
      goto LABEL_12;
    }
    previewIndexPath = self->_previewIndexPath;
  }
  if (previewIndexPath)
  {
    [(UITableViewCell *)[(UITableView *)[(SUTableViewController *)self tableView] cellForRowAtIndexPath:self->_previewIndexPath] setPreviewStatus:0 animated:v5];
    double v11 = self->_previewIndexPath;
  }
  else
  {
    double v11 = 0;
  }

  double v12 = (NSIndexPath *)[a4 copy];
  self->_previewIndexPath = v12;
  if (v12) {
    goto LABEL_11;
  }
LABEL_12:
  if (!self->_previewStatus)
  {

    self->_previewIndexPath = 0;
  }
}

- (void)_stopPreviewPlayback
{
  if (self->_previewPlayer)
  {
    BOOL v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263F89738] object:0];
    [(SUAudioPlayer *)self->_previewPlayer stop];

    self->_previewPlayer = 0;
  }
}

@end