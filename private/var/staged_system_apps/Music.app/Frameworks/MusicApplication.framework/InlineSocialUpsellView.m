@interface InlineSocialUpsellView
- (CGRect)bounds;
- (CGRect)frame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplication22InlineSocialUpsellView)initWithCoder:(id)a3;
- (_TtC16MusicApplication22InlineSocialUpsellView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation InlineSocialUpsellView

- (_TtC16MusicApplication22InlineSocialUpsellView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication22InlineSocialUpsellView *)InlineSocialUpsellView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication22InlineSocialUpsellView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s16MusicApplication22InlineSocialUpsellViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CGRect)frame
{
  sub_9103C(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  InlineSocialUpsellView.frame.setter(x, y, width, height);
}

- (CGRect)bounds
{
  sub_9103C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  InlineSocialUpsellView.bounds.setter(x, y, width, height);
}

- (void)layoutSubviews
{
  double v2 = self;
  InlineSocialUpsellView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v4 = self;
  id v5 = [(InlineSocialUpsellView *)v4 traitCollection];
  InlineSocialUpsellView.preferredHeight(traitCollection:containerWidth:)(v5, width);
  double v7 = v6;

  double v8 = width;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  v9.is_nil = (char)v6;
  double v7 = v6;
  v9.value.super.isa = (Class)a3;
  InlineSocialUpsellView.traitCollectionDidChange(_:)(v9);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_lockupImageArtworkCatalog));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_closeButtonHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_primaryButtonHandler));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_textStackView));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView____lazy_storage___closeButton));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView____lazy_storage___primaryButton);
}

@end