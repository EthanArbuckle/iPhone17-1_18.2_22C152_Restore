@interface RadioShowCell
+ (UIEdgeInsets)visualContentInsets;
- (NSString)overlaySubtitle;
- (NSString)overlayTitle;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication13RadioShowCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication13RadioShowCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setOverlaySubtitle:(id)a3;
- (void)setOverlayTitle:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RadioShowCell

- (_TtC16MusicApplication13RadioShowCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13RadioShowCell *)RadioShowCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication13RadioShowCell)initWithCoder:(id)a3
{
  id v3 = a3;
  _s16MusicApplication13RadioShowCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (NSString)title
{
  return (NSString *)sub_1575BC();
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_1575BC();
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)overlayTitle
{
  return (NSString *)sub_1575BC();
}

- (void)setOverlayTitle:(id)a3
{
}

- (NSString)overlaySubtitle
{
  return (NSString *)sub_1575BC();
}

- (void)setOverlaySubtitle:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  RadioShowCell.layoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  RadioShowCell.traitCollectionDidChange(_:)(v9);
}

+ (UIEdgeInsets)visualContentInsets
{
  _s16MusicApplication13RadioShowCellC14textComponents33_2439E203BF4E5EEB2159C351D10618FFLLAC04TextG0AELLVvpfi_0();
  uint64_t v3 = v2;
  swift_beginAccess();
  double v4 = *(double *)(v3 + 104);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  double v5 = v4 + -2.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  result.right = v8;
  result.bottom = v5;
  result.left = v7;
  result.top = v6;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13RadioShowCell_backdropView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication13RadioShowCell_overlayTextStackView);
}

@end