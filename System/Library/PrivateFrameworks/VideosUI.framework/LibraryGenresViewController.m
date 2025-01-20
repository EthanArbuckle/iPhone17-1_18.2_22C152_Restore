@interface LibraryGenresViewController
- (UINavigationItem)navigationItem;
- (_TtC8VideosUI27LibraryGenresViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI27LibraryGenresViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didSelectMenuItemAtIndexPath:(id)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
@end

@implementation LibraryGenresViewController

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_1E34BBA40();

  return (UINavigationItem *)v3;
}

- (_TtC8VideosUI27LibraryGenresViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E34BBE48();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E34BBEF0();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E34BC00C();
}

- (_TtC8VideosUI27LibraryGenresViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E34BC27C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27LibraryGenresViewController_mediaLibrary));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27LibraryGenresViewController_menuController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)didSelectMenuItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E3876448();
  v10 = self;
  uint64_t v11 = OUTLINED_FUNCTION_199_0();
  sub_1E34BC37C(v11);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

@end