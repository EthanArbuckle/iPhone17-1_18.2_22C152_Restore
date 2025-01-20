@interface ToggleCell
- (_TtC16MusicApplication10ToggleCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication10ToggleCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)switchValueChanged:(id)a3;
@end

@implementation ToggleCell

- (_TtC16MusicApplication10ToggleCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication10ToggleCell *)sub_178278(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication10ToggleCell)initWithCoder:(id)a3
{
  *(void *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10ToggleCell_delegate] = 0;
  swift_unknownObjectWeakInit();
  self->super.super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ToggleCell__isToggled] = 0;
  *(void *)&self->super.super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ToggleCell_switchView] = 0;
  id v5 = a3;

  result = (_TtC16MusicApplication10ToggleCell *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_178668();
}

- (void)switchValueChanged:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_178C38(v4);
}

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC16MusicApplication10ToggleCell_delegate);
  v3 = *(void **)&self->super.super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ToggleCell_switchView];
}

@end