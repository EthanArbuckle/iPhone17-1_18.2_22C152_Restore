@interface ASCListItem
- (CGSize)intrinsicContentSize;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI11ASCListItem)initWithCoder:(id)a3;
- (_TtC8VideosUI11ASCListItem)initWithFrame:(CGRect)a3;
- (id)presentingViewControllerForLockupView:(id)a3;
- (void)lockupView:(id)a3 appStateDidChange:(id)a4;
- (void)lockupView:(id)a3 preprocessOffer:(id)a4 inState:(id)a5 completionBlock:(id)a6;
@end

@implementation ASCListItem

- (_TtC8VideosUI11ASCListItem)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E33EA200();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_1E33EA37C();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v5 = self;
  double v6 = sub_1E33EA3B8(a4);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC8VideosUI11ASCListItem)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI11ASCListItem_appInstallerHelper));

  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI11ASCListItem_advanceASCOfferHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI11ASCListItem_offerListUIConfiguration));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI11ASCListItem_dismissalUIConfiguration);
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  id v4 = a3;
  double v5 = self;
  id v6 = sub_1E33EA674();

  return v6;
}

- (void)lockupView:(id)a3 preprocessOffer:(id)a4 inState:(id)a5 completionBlock:(id)a6
{
  double v9 = _Block_copy(a6);
  uint64_t v10 = OUTLINED_FUNCTION_21_0();
  *(void *)(v10 + 16) = v9;
  id v11 = a3;
  swift_unknownObjectRetain();
  id v12 = a5;
  v13 = self;
  sub_1E33EAD88((uint64_t)v13, v14, (uint64_t)v12, (uint64_t)sub_1E32DFCBC, v10);

  swift_unknownObjectRelease();
  swift_release();
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_1E33EAFC4((uint64_t)v8, v7);
}

@end