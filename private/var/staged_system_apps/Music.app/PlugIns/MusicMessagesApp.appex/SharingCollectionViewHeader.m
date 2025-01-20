@interface SharingCollectionViewHeader
- (CGSize)sizeThatFits:(CGSize)a3;
- (UILabel)accessibilityShareRecentlyPlayedLabel;
- (_TtC16MusicMessagesApp27SharingCollectionViewHeader)initWithCoder:(id)a3;
- (_TtC16MusicMessagesApp27SharingCollectionViewHeader)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SharingCollectionViewHeader

- (_TtC16MusicMessagesApp27SharingCollectionViewHeader)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicMessagesApp27SharingCollectionViewHeader *)sub_100026B00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicMessagesApp27SharingCollectionViewHeader)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicMessagesApp27SharingCollectionViewHeader_layoutInvalidationHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC16MusicMessagesApp27SharingCollectionViewHeader *)sub_100485590();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SharingCollectionViewHeader();
  [(SharingCollectionViewHeader *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp27SharingCollectionViewHeader__label));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicMessagesApp27SharingCollectionViewHeader_layoutInvalidationHandler);

  sub_1000109BC(v3);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SharingCollectionViewHeader();
  v2 = (char *)v3.receiver;
  [(SharingCollectionViewHeader *)&v3 prepareForReuse];
  [*(id *)&v2[OBJC_IVAR____TtC16MusicMessagesApp27SharingCollectionViewHeader__label] sizeToFit];
  [v2 setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_100026FE0(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100027168();
}

- (UILabel)accessibilityShareRecentlyPlayedLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC16MusicMessagesApp27SharingCollectionViewHeader__label));
}

@end