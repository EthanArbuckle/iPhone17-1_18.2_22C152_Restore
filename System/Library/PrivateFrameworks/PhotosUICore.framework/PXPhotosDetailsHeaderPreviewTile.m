@interface PXPhotosDetailsHeaderPreviewTile
- (UIView)_contentView;
- (void)_setContentView:(id)a3;
- (void)_updateContentViewFrame;
- (void)becomeReusable;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)prepareForReuse;
@end

@implementation PXPhotosDetailsHeaderPreviewTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (void)prepareForReuse
{
  id v2 = [(PXUIImageTile *)self view];
  [v2 setHidden:0];
}

- (void)becomeReusable
{
  id v2 = [(PXUIImageTile *)self view];
  [v2 setHidden:1];
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosDetailsHeaderPreviewTile;
  long long v5 = *(_OWORD *)&a3->contentSize.height;
  v11[8] = *(_OWORD *)&a3->hidden;
  v11[9] = v5;
  long long v6 = *(_OWORD *)&a3->contentsRect.size.height;
  v11[10] = *(_OWORD *)&a3->contentsRect.origin.y;
  v11[11] = v6;
  long long v7 = *(_OWORD *)&a3->transform.c;
  v11[4] = *(_OWORD *)&a3->transform.a;
  v11[5] = v7;
  long long v8 = *(_OWORD *)&a3->alpha;
  v11[6] = *(_OWORD *)&a3->transform.tx;
  v11[7] = v8;
  CGSize size = a3->frame.size;
  v11[0] = a3->frame.origin;
  v11[1] = size;
  CGSize v10 = a3->size;
  v11[2] = a3->center;
  v11[3] = v10;
  [(PXUIImageTile *)&v12 didApplyGeometry:v11 withUserData:a4];
  [(PXPhotosDetailsHeaderPreviewTile *)self _updateContentViewFrame];
}

- (void)_updateContentViewFrame
{
  id v3 = [(PXPhotosDetailsHeaderPreviewTile *)self _contentView];
  [(UIView *)self->_containerView bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)_setContentView:(id)a3
{
  long long v5 = (UIView *)a3;
  if (self->__contentView != v5)
  {
    long long v6 = v5;
    objc_storeStrong((id *)&self->__contentView, a3);
    [(PXPhotosDetailsHeaderPreviewTile *)self _updateContentViewFrame];
    long long v5 = v6;
  }
}

@end