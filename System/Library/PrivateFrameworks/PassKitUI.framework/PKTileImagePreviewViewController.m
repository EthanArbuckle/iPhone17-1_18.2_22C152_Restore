@interface PKTileImagePreviewViewController
+ (void)presentWithImageView:(id)a3 title:(id)a4 presenting:(id)a5;
- (BOOL)pkui_navigationBarHidden;
- (PKTileImagePreviewViewController)initWithCoder:(id)a3;
- (PKTileImagePreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)close;
- (void)loadView;
- (void)scrollViewDidZoom:(id)a3;
- (void)swiped:(id)a3;
- (void)tapped:(id)a3;
@end

@implementation PKTileImagePreviewViewController

- (PKTileImagePreviewViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKTileImagePreviewViewController_imageView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKTileImagePreviewViewController_scrollView) = 0;
  id v4 = a3;

  result = (PKTileImagePreviewViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

+ (void)presentWithImageView:(id)a3 title:(id)a4 presenting:(id)a5
{
  uint64_t v7 = sub_1A03B4988();
  uint64_t v9 = v8;
  id v10 = a3;
  id v11 = a5;
  _s9PassKitUI30TileImagePreviewViewControllerC7present05imageG05title10presentingySo07UIImageG0C_SSSo06UIViewH0CtFZ_0(v10, v7, v9, v11);

  swift_bridgeObjectRelease();
}

- (void)loadView
{
  v2 = self;
  TileImagePreviewViewController.loadView()();
}

- (BOOL)pkui_navigationBarHidden
{
  return 1;
}

- (void)tapped:(id)a3
{
  id v4 = (PKTileImagePreviewViewController *)a3;
  uint64_t v7 = self;
  v5 = (PKTileImagePreviewViewController *)[(PKTileImagePreviewViewController *)v7 navigationController];
  if (v5)
  {
    v6 = v5;
    [(PKTileImagePreviewViewController *)v5 setNavigationBarHidden:[(PKTileImagePreviewViewController *)v5 isNavigationBarHidden] ^ 1 animated:1];

    id v4 = v7;
    uint64_t v7 = v6;
  }
}

- (void)swiped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19F779E50();
}

- (void)close
{
  v2 = self;
  sub_19F779E50();
}

- (id)viewForZoomingInScrollView:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = _s9PassKitUI30TileImagePreviewViewControllerC14viewForZooming2inSo6UIViewCSgSo08UIScrollG0C_tF_0();

  return v6;
}

- (void)scrollViewDidZoom:(id)a3
{
  id v4 = (UIScrollView *)a3;
  v5 = self;
  TileImagePreviewViewController.scrollViewDidZoom(_:)(v4);
}

- (PKTileImagePreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (PKTileImagePreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKTileImagePreviewViewController_scrollView);
}

@end