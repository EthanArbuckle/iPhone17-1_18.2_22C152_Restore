@interface WorkoutPlanGalleryBannerCell
- (_TtC9SeymourUI28WorkoutPlanGalleryBannerCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI28WorkoutPlanGalleryBannerCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation WorkoutPlanGalleryBannerCell

- (_TtC9SeymourUI28WorkoutPlanGalleryBannerCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI28WorkoutPlanGalleryBannerCell *)sub_23A5F6054(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI28WorkoutPlanGalleryBannerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A5F773C();
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
  [(WorkoutPlanGalleryBannerCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI28WorkoutPlanGalleryBannerCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v6, v9);
  swift_endAccess();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28WorkoutPlanGalleryBannerCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28WorkoutPlanGalleryBannerCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28WorkoutPlanGalleryBannerCell_actionButtonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28WorkoutPlanGalleryBannerCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28WorkoutPlanGalleryBannerCell_subtitleLabel));

  swift_bridgeObjectRelease();
}

@end