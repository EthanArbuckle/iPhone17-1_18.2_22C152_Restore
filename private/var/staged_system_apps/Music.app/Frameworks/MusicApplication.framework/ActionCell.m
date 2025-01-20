@interface ActionCell
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (NSString)title;
- (_TtC16MusicApplication10ActionCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication10ActionCell)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)tintColorDidChange;
@end

@implementation ActionCell

- (_TtC16MusicApplication10ActionCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication10ActionCell *)sub_461788(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication10ActionCell)initWithCoder:(id)a3
{
  v5 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ActionCell_title];
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0xE000000000000000;
  self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ActionCell_titleAlignment] = 4;
  v6 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ActionCell_textComponents];
  v7 = self;
  id v8 = a3;
  id v9 = [v7 whiteColor];
  *(void *)v6 = 0;
  v6[8] = 4;
  *((void *)v6 + 2) = v9;

  result = (_TtC16MusicApplication10ActionCell *)sub_AB8280();
  __break(1u);
  return result;
}

- (NSString)title
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ActionCell_title];
  uint64_t *v6 = v5;
  v6[1] = v7;
  id v8 = a3;
  id v9 = self;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_461AB0();
  swift_endAccess();
  uint64_t v10 = *v6;
  uint64_t v11 = v6[1];
  swift_bridgeObjectRetain();
  TextStackView.Component.textValue.setter(v10, v11);
  swift_release();
  [(ActionCell *)v9 setNeedsLayout];
}

- (BOOL)isHighlighted
{
  return sub_4620EC(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (objc_class *)type metadata accessor for ActionCell();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  unsigned int v7 = [(ActionCell *)&v9 isHighlighted];
  v8.receiver = v6;
  v8.super_class = v5;
  [(ActionCell *)&v8 setHighlighted:v3];
  if (v7 != [(ActionCell *)v6 isHighlighted]) {
    sub_4622C4();
  }
}

- (BOOL)isSelected
{
  return sub_4620EC(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  v4 = self;
  sub_462184(a3);
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActionCell();
  id v2 = v3.receiver;
  [(ActionCell *)&v3 tintColorDidChange];
  sub_4622C4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(id *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10ActionCell_textComponents + 8];
  swift_release();
}

@end