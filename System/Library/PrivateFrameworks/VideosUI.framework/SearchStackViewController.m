@interface SearchStackViewController
- (_TtC8VideosUI25SearchStackViewController)initWithCoder:(id)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4;
- (void)vui_didMoveToParentViewController:(id)a3;
- (void)vui_viewDidLoad;
@end

@implementation SearchStackViewController

- (_TtC8VideosUI25SearchStackViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E350D890();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E350D964();
}

- (void)vui_didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1E350DC3C(a3);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1E350DF3C((uint64_t)a3);
}

- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4
{
  uint64_t v6 = sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_31();
  uint64_t v12 = v11 - v10;
  sub_1E3876448();
  id v13 = a3;
  v14 = self;
  sub_1E350E284((uint64_t)v13);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI25SearchStackViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end