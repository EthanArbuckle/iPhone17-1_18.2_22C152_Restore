@interface ProductMediaItemCollectionViewCell
- (_TtC8AppStore34ProductMediaItemCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore34ProductMediaItemCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ProductMediaItemCollectionViewCell

- (_TtC8AppStore34ProductMediaItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore34ProductMediaItemCollectionViewCell *)sub_100714ECC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore34ProductMediaItemCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore34ProductMediaItemCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8AppStore34ProductMediaItemCollectionViewCell_shouldForcePortrait) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore34ProductMediaItemCollectionViewCell_artworkDisplaySize;
  *(void *)v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  id v8 = a3;
  static VideoConfiguration.defaultConfiguration.getter();
  swift_unknownObjectWeakInit();

  result = (_TtC8AppStore34ProductMediaItemCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1007152F0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100715484();
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore34ProductMediaItemCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34ProductMediaItemCollectionViewCell_borderedScreenshotView));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore34ProductMediaItemCollectionViewCell_configuration;
  uint64_t v4 = type metadata accessor for VideoConfiguration();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectWeakDestroy();
}

@end