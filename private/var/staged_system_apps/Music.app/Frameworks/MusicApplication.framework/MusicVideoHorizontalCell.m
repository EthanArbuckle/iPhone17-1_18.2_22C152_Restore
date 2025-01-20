@interface MusicVideoHorizontalCell
- (NSString)additionalDescription;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication24MusicVideoHorizontalCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication24MusicVideoHorizontalCell)initWithFrame:(CGRect)a3;
- (void)setAdditionalDescription:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MusicVideoHorizontalCell

- (_TtC16MusicApplication24MusicVideoHorizontalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication24MusicVideoHorizontalCell *)sub_4EF708(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication24MusicVideoHorizontalCell)initWithCoder:(id)a3
{
  self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_layoutStyle] = 0;
  v4 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_title];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0xE000000000000000;
  v5 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_subtitle];
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0xE000000000000000;
  v6 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_additionalDescription];
  *(void *)v6 = 0;
  *((void *)v6 + 1) = 0xE000000000000000;
  id v7 = a3;

  result = (_TtC16MusicApplication24MusicVideoHorizontalCell *)sub_AB8280();
  __break(1u);
  return result;
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_title];
  uint64_t *v6 = v5;
  v6[1] = v7;
  id v8 = a3;
  v9 = self;
  swift_bridgeObjectRelease();
  uint64_t v10 = *v6;
  uint64_t v11 = v6[1];
  swift_retain();
  swift_bridgeObjectRetain();
  TextStackView.Component.textValue.setter(v10, v11);

  swift_release();
}

- (NSString)subtitle
{
  return (NSString *)sub_42EA8();
}

- (void)setSubtitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_subtitle];
  uint64_t *v6 = v5;
  v6[1] = v7;
  id v8 = a3;
  v9 = self;
  swift_bridgeObjectRelease();
  uint64_t v10 = *v6;
  uint64_t v11 = v6[1];
  swift_retain();
  swift_bridgeObjectRetain();
  TextStackView.Component.textValue.setter(v10, v11);

  swift_release();
}

- (NSString)additionalDescription
{
  return (NSString *)sub_42EA8();
}

- (void)setAdditionalDescription:(id)a3
{
  uint64_t v5 = sub_AB6510();
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_additionalDescription];
  uint64_t *v6 = v5;
  v6[1] = v7;
  id v8 = a3;
  v9 = self;
  swift_bridgeObjectRelease();
  uint64_t v10 = *v6;
  uint64_t v11 = v6[1];
  swift_retain();
  swift_bridgeObjectRetain();
  TextStackView.Component.textValue.setter(v10, v11);

  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

@end