@interface PosterRotatingViewController
- (_TtC26WatchFacesWallpaperSupport28PosterRotatingViewController)init;
- (_TtC26WatchFacesWallpaperSupport28PosterRotatingViewController)initWithCoder:(id)a3;
- (_TtC26WatchFacesWallpaperSupport28PosterRotatingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation PosterRotatingViewController

- (_TtC26WatchFacesWallpaperSupport28PosterRotatingViewController)init
{
  return (_TtC26WatchFacesWallpaperSupport28PosterRotatingViewController *)PosterRotatingViewController.init()();
}

- (_TtC26WatchFacesWallpaperSupport28PosterRotatingViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC26WatchFacesWallpaperSupport28PosterRotatingViewController_rotatingResponders) = (Class)MEMORY[0x263F8EE78];
  type metadata accessor for PosterRotatingViewController();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_26154F728(a3);
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_26154F83C((uint64_t)a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  long double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_26154F968(a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC26WatchFacesWallpaperSupport28PosterRotatingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC26WatchFacesWallpaperSupport28PosterRotatingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end