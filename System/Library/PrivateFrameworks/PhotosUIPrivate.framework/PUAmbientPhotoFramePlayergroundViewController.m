@interface PUAmbientPhotoFramePlayergroundViewController
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (PUAmbientPhotoFramePlayergroundViewController)initWithCoder:(id)a3;
- (PUAmbientPhotoFramePlayergroundViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUAmbientPhotoFramePlayergroundViewController)initWithPhotoLibrary:(id)a3;
- (void)handleLongPress:(id)a3;
- (void)handleTap:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUAmbientPhotoFramePlayergroundViewController

- (PUAmbientPhotoFramePlayergroundViewController)initWithPhotoLibrary:(id)a3
{
  return (PUAmbientPhotoFramePlayergroundViewController *)sub_1AEB8BF74(a3);
}

- (PUAmbientPhotoFramePlayergroundViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AEB8C0C8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AEB8C1EC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AEB8C2D4(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1AEB8C3B0(a3);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEB8C76C(v4);
}

- (void)handleLongPress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEB8C898(v4);
}

- (PUAmbientPhotoFramePlayergroundViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AEF96DE0();
  }
  id v5 = a4;
  sub_1AEB8E0B8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController_photoLibrary));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController____lazy_storage___renderer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController____lazy_storage___photoFrameController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController____lazy_storage___environment));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController_preferences));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController_foregroundView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___PUAmbientPhotoFramePlayergroundViewController_floatingView);
}

@end