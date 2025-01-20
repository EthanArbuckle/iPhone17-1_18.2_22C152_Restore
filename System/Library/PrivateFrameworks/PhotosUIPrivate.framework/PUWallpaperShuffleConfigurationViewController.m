@interface PUWallpaperShuffleConfigurationViewController
- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithCoder:(id)a3;
- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithPhotoLibrary:(id)a3;
- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithPhotoLibrary:(id)a3 style:(int64_t)a4;
- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithPhotoLibrary:(id)a3 style:(int64_t)a4 posterConfiguration:(id)a5 centerMedia:(id)a6;
- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithPhotoLibrary:(id)a3 style:(int64_t)a4 posterConfiguration:(id)a5 centerMedia:(id)a6 contentMode:(int64_t)a7;
- (_TtP15PhotosUIPrivate53PUWallpaperShuffleConfigurationViewControllerDelegate_)delegate;
- (void)didFailFinishingWithPosterConfiguration;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUWallpaperShuffleConfigurationViewController

- (_TtP15PhotosUIPrivate53PUWallpaperShuffleConfigurationViewControllerDelegate_)delegate
{
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AEA21B88();
}

- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithPhotoLibrary:(id)a3 style:(int64_t)a4 posterConfiguration:(id)a5 centerMedia:(id)a6 contentMode:(int64_t)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  return (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *)sub_1AEA21C34(v11, a4, a5, a6, a7);
}

- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithPhotoLibrary:(id)a3 style:(int64_t)a4 posterConfiguration:(id)a5 centerMedia:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  return (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *)sub_1AEA21DD8(v9, a4, a5, a6);
}

- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithPhotoLibrary:(id)a3 style:(int64_t)a4
{
  return (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *)sub_1AEA21EA4(a3, a4);
}

- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithPhotoLibrary:(id)a3
{
  return (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *)sub_1AEA21F20(a3);
}

- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AEA21F94();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AEA2202C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AEA225A4(a3);
}

- (void)didFailFinishingWithPosterConfiguration
{
  v2 = self;
  sub_1AEA226B4();
}

- (_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AEF96DE0();
  }
  id v5 = a4;
  PUWallpaperShuffleConfigurationViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController_manualSelectionPhotoPicker));
  sub_1AEA2489C((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController____lazy_storage___contentViewController);
}

- (void)presentationControllerWillDismiss:(id)a3
{
  v4 = (UIPresentationController *)a3;
  id v5 = self;
  PUWallpaperShuffleConfigurationViewController.presentationControllerWillDismiss(_:)(v4);
}

@end