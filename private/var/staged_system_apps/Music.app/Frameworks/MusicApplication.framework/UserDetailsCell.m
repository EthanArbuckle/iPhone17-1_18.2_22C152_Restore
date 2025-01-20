@interface UserDetailsCell
- (NSString)accessoryText;
- (NSString)subtitle;
- (NSString)title;
- (UIMenu)accessoryButtonMenu;
- (_TtC16MusicApplication15UserDetailsCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication15UserDetailsCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)setAccessoryButtonMenu:(id)a3;
- (void)setAccessoryText:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UserDetailsCell

- (_TtC16MusicApplication15UserDetailsCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication15UserDetailsCell *)sub_34CC6C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication15UserDetailsCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_34E7BC();
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_title];
  uint64_t *v6 = v5;
  v6[1] = v7;
  id v9 = a3;
  v8 = self;
  swift_bridgeObjectRelease();
  sub_34D1AC();
}

- (NSString)subtitle
{
  return (NSString *)sub_42EA8();
}

- (void)setSubtitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  uint64_t v7 = v6;
  id v9 = a3;
  v8 = self;
  sub_34D870(v5, v7);
}

- (NSString)accessoryText
{
  if (*(void *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_accessoryText])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setAccessoryText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_AB6510();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_accessoryText];
  uint64_t v7 = *(void *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_accessoryText];
  uint64_t v8 = *(void *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_accessoryText];
  uint64_t *v6 = v4;
  v6[1] = v5;
  id v9 = self;
  sub_34DA48(v7, v8);

  swift_bridgeObjectRelease();
}

- (UIMenu)accessoryButtonMenu
{
  return (UIMenu *)*(id *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_accessoryButtonMenu];
}

- (void)setAccessoryButtonMenu:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_34E88C(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_34DBE4((uint64_t)a3);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(UserDetailsCell *)v5 traitCollection];
  sub_34E56C();
  sub_322E28(v7, v6, 0, 0);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  [v4 frame];
  [v4 setFrame:];

  return v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  id v3 = *(void **)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell____lazy_storage___accessorybuttonView];
}

@end