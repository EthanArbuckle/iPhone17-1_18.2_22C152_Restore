@interface LibraryHostingViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UINavigationItem)navigationItem;
- (_TtC8VideosUI28LibraryHostingViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI28LibraryHostingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidLoad;
- (void)vui_viewWillAppear:(BOOL)a3;
- (void)vui_viewWillLayoutSubviews;
@end

@implementation LibraryHostingViewController

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_1E33CBE08();

  return (UINavigationItem *)v3;
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E33CBE48();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E33CBF64(v4);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E33CC160(v4);
}

- (void)vui_viewWillLayoutSubviews
{
  v2 = self;
  sub_1E33CC294();
}

- (_TtC8VideosUI28LibraryHostingViewController)initWithCoder:(id)a3
{
}

- (_TtC8VideosUI28LibraryHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E33CC40C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28LibraryHostingViewController_childController));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

@end