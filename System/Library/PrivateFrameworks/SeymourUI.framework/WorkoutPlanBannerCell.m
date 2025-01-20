@interface WorkoutPlanBannerCell
- (_TtC9SeymourUI21WorkoutPlanBannerCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI21WorkoutPlanBannerCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation WorkoutPlanBannerCell

- (_TtC9SeymourUI21WorkoutPlanBannerCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI21WorkoutPlanBannerCell *)sub_239F2302C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI21WorkoutPlanBannerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239F24CF0();
}

- (void)prepareForReuse
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11.receiver = self;
  v11.super_class = ObjectType;
  v7 = self;
  [(WorkoutPlanBannerCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v6, v9);
  swift_endAccess();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_delegate);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_itemInfo, &qword_268A0E7E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_artwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_actionButtonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_platterView));
  id v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_styleProvider;
  uint64_t v4 = *(void **)((char *)&self->super.super.super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_styleProvider);
  uint64_t v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_styleProvider);
  id v7 = v4;
  v6 = (void *)*((void *)v3 + 3);
}

@end