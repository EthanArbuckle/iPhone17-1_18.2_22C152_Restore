@interface TVProgramBrickItemCell
- (_TtC9SeymourUI22TVProgramBrickItemCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI22TVProgramBrickItemCell)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
@end

@implementation TVProgramBrickItemCell

- (_TtC9SeymourUI22TVProgramBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI22TVProgramBrickItemCell *)sub_23A45A1F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI22TVProgramBrickItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A45D654();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVProgramBrickItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(TVFocusableCollectionViewCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_23A45B93C(v6, v7);
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_itemInfo);
  long long v3 = *(_OWORD *)((char *)&self->super.super.super.super._viewFlags
                 + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout
                 + 16);
  v8[6] = *(_OWORD *)((char *)&self->super.super.super.super._viewFlags
                    + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[7] = v3;
  long long v4 = *(_OWORD *)((char *)&self->super.super.super.super._minimumSafeAreaInsets.bottom
                 + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[8] = *(_OWORD *)((char *)&self->super.super.super.super._minimumSafeAreaInsets.top
                    + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[9] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super.super.super.super._traitChangeRegistry
                 + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[2] = *(_OWORD *)((char *)&self->super.super.super.super._cachedTraitCollection
                    + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[3] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.super.super._gestureRecognizers
                 + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[4] = *(_OWORD *)((char *)&self->super.super.super.super._subviewCache
                    + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[5] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super.super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.super.isa
                    + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[1] = v7;
  sub_23A45D5B0((uint64_t)v8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_floatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_episodesLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_iconStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_bottomTextStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_recencyIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_gradient));
}

@end