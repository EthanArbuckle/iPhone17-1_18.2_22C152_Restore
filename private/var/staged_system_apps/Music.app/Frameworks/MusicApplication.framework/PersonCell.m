@interface PersonCell
- (NSString)personName;
- (_TtC16MusicApplication10PersonCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication10PersonCell)initWithFrame:(CGRect)a3;
- (void)setPersonName:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PersonCell

- (_TtC16MusicApplication10PersonCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication10PersonCell *)sub_472268(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication10PersonCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_47312C();
}

- (NSString)personName
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setPersonName:(id)a3
{
  uint64_t v5 = sub_AB6510();
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10PersonCell_personName];
  uint64_t *v6 = v5;
  v6[1] = v7;
  id v10 = a3;
  v8 = self;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  Swift::String v9 = String.trim()();
  swift_bridgeObjectRelease();
  TextStackView.Component.textValue.setter(v9._countAndFlagsBits, (uint64_t)v9._object);
  [(PersonCell *)v8 setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(PersonCell *)v5 traitCollection];
  sub_472D80(v6, *(void *)&v5->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10PersonCell_textComponents]);
  sub_4728D8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end