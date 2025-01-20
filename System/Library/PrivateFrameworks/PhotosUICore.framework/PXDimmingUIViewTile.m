@interface PXDimmingUIViewTile
- (PXDimmingUIViewTile)initWithFrame:(CGRect)a3;
- (void)becomeReusable;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)prepareForReuse;
@end

@implementation PXDimmingUIViewTile

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  v5 = objc_msgSend(a4, "viewSpec", a3);
  if (v5)
  {
    id v7 = v5;
    v6 = [v5 backgroundColor];
    [(PXDimmingUIViewTile *)self setBackgroundColor:v6];

    v5 = v7;
  }
}

- (void)prepareForReuse
{
  id v2 = [(PXDimmingUIViewTile *)self view];
  [v2 setHidden:0];
}

- (void)becomeReusable
{
  id v2 = [(PXDimmingUIViewTile *)self view];
  [v2 setHidden:1];
}

- (PXDimmingUIViewTile)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXDimmingUIViewTile;
  v3 = -[PXDimmingUIViewTile initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PXDimmingUIViewTile *)v3 setUserInteractionEnabled:0];
    v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(PXDimmingUIViewTile *)v4 setBackgroundColor:v5];
  }
  return v4;
}

@end