@interface PUScrubberBarItemController
- (PUBrowsingSession)browsingSession;
- (UIBarButtonItem)scrubberBarButtonItem;
- (void)_invalidateScrubberBarButtonItem;
- (void)_updateScrubberBarButtonItemIfNeeded;
- (void)setBrowsingSession:(id)a3;
@end

@implementation PUScrubberBarItemController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browsingSession, 0);
  objc_storeStrong((id *)&self->_scrubberBarButtonItem, 0);
  objc_storeStrong((id *)&self->_scrubberView, 0);
}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (void)_updateScrubberBarButtonItemIfNeeded
{
  if (!self->_scrubberBarButtonItem)
  {
    if (self->_scrubberView) {
      goto LABEL_5;
    }
    v3 = [(PUScrubberBarItemController *)self browsingSession];
    v4 = -[PUScrubberView initWithFrame:]([PUScrubberView alloc], "initWithFrame:", 0.0, 0.0, 10.0, 40.0);
    scrubberView = self->_scrubberView;
    self->_scrubberView = v4;

    [(PUScrubberView *)self->_scrubberView setBrowsingSession:v3];
    [(PUScrubberView *)self->_scrubberView updateIfNeeded];

    if (!self->_scrubberBarButtonItem)
    {
LABEL_5:
      v6 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_scrubberView];
      scrubberBarButtonItem = self->_scrubberBarButtonItem;
      self->_scrubberBarButtonItem = v6;

      v8 = self->_scrubberBarButtonItem;
      [(UIBarButtonItem *)v8 _setFlexible:1];
    }
  }
}

- (void)_invalidateScrubberBarButtonItem
{
  scrubberBarButtonItem = self->_scrubberBarButtonItem;
  self->_scrubberBarButtonItem = 0;

  scrubberView = self->_scrubberView;
  self->_scrubberView = 0;
}

- (UIBarButtonItem)scrubberBarButtonItem
{
  [(PUScrubberBarItemController *)self _updateScrubberBarButtonItemIfNeeded];
  scrubberBarButtonItem = self->_scrubberBarButtonItem;
  return scrubberBarButtonItem;
}

- (void)setBrowsingSession:(id)a3
{
  v5 = (PUBrowsingSession *)a3;
  if (self->_browsingSession != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_browsingSession, a3);
    [(PUScrubberBarItemController *)self _invalidateScrubberBarButtonItem];
    v5 = v6;
  }
}

@end