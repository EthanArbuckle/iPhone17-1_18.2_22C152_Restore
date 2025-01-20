@interface SBIconListLayoutBlockObserver
- (id)boundsSizeChangeBlock;
- (id)didAddIconViewBlock;
- (id)didRemoveIconViewBlock;
- (void)iconListView:(id)a3 didAddIconView:(id)a4;
- (void)iconListView:(id)a3 didRemoveIconView:(id)a4;
- (void)iconListViewDidChangeBoundsSize:(id)a3;
- (void)invalidate;
- (void)setBoundsSizeChangeBlock:(id)a3;
- (void)setDidAddIconViewBlock:(id)a3;
- (void)setDidRemoveIconViewBlock:(id)a3;
@end

@implementation SBIconListLayoutBlockObserver

- (void)invalidate
{
  id didAddIconViewBlock = self->_didAddIconViewBlock;
  self->_id didAddIconViewBlock = 0;

  id didRemoveIconViewBlock = self->_didRemoveIconViewBlock;
  self->_id didRemoveIconViewBlock = 0;

  id boundsSizeChangeBlock = self->_boundsSizeChangeBlock;
  self->_id boundsSizeChangeBlock = 0;
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = _Block_copy(self->_didAddIconViewBlock);
  v8 = v7;
  if (v7) {
    (*((void (**)(void *, id, id))v7 + 2))(v7, v9, v6);
  }
}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = _Block_copy(self->_didRemoveIconViewBlock);
  v8 = v7;
  if (v7) {
    (*((void (**)(void *, id, id))v7 + 2))(v7, v9, v6);
  }
}

- (void)iconListViewDidChangeBoundsSize:(id)a3
{
  id v6 = a3;
  v4 = _Block_copy(self->_boundsSizeChangeBlock);
  v5 = v4;
  if (v4) {
    (*((void (**)(void *, id))v4 + 2))(v4, v6);
  }
}

- (id)didAddIconViewBlock
{
  return self->_didAddIconViewBlock;
}

- (void)setDidAddIconViewBlock:(id)a3
{
}

- (id)didRemoveIconViewBlock
{
  return self->_didRemoveIconViewBlock;
}

- (void)setDidRemoveIconViewBlock:(id)a3
{
}

- (id)boundsSizeChangeBlock
{
  return self->_boundsSizeChangeBlock;
}

- (void)setBoundsSizeChangeBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_boundsSizeChangeBlock, 0);
  objc_storeStrong(&self->_didRemoveIconViewBlock, 0);
  objc_storeStrong(&self->_didAddIconViewBlock, 0);
}

@end