@interface RootSideBarController
- (_TtC8VideosUI21RootSideBarController)init;
- (_TtC8VideosUI21RootSideBarController)initWithCoder:(id)a3;
- (_TtC8VideosUI21RootSideBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)accountStoreDidChange:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)isLibraryOnlyCountryChanged:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RootSideBarController

- (_TtC8VideosUI21RootSideBarController)init
{
  return (_TtC8VideosUI21RootSideBarController *)sub_1E3128E7C();
}

- (void)viewDidLoad
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3128F24();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1E3129788(a3, (SEL *)&selRef_viewWillAppear_);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1E3129788(a3, (SEL *)&selRef_viewDidAppear_);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3129880();
}

- (_TtC8VideosUI21RootSideBarController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E312C50C();
}

- (_TtC8VideosUI21RootSideBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E312C5B4();
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI21RootSideBarController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21RootSideBarController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21RootSideBarController____lazy_storage___dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21RootSideBarController____lazy_storage___profileView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI21RootSideBarController____lazy_storage___toolbar);
}

- (void)accountStoreDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  OUTLINED_FUNCTION_81();
  sub_1E312C6B4();
}

- (void)isLibraryOnlyCountryChanged:(id)a3
{
  OUTLINED_FUNCTION_128();
  uint64_t v5 = sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_14();
  sub_1E3875BE8();
  id v9 = v3;
  sub_1E312C6B4();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v5);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_13();
  sub_1E3876448();
  id v11 = a3;
  v12 = self;
  sub_1E312CDA4();

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v7);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  OUTLINED_FUNCTION_81();
  sub_1E312D508();
}

@end