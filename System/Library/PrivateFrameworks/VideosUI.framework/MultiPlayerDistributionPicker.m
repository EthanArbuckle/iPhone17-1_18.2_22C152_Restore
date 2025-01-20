@interface MultiPlayerDistributionPicker
- (NSArray)preferredFocusEnvironments;
- (_TtC8VideosUI29MultiPlayerDistributionPicker)initWithCoder:(id)a3;
- (_TtC8VideosUI29MultiPlayerDistributionPicker)initWithFrame:(CGRect)a3;
@end

@implementation MultiPlayerDistributionPicker

- (_TtC8VideosUI29MultiPlayerDistributionPicker)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI29MultiPlayerDistributionPicker *)sub_1E36106C8();
}

- (_TtC8VideosUI29MultiPlayerDistributionPicker)initWithCoder:(id)a3
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  sub_1E36108BC();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EADED388);
  v3 = (void *)sub_1E387CC88();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI29MultiPlayerDistributionPicker____lazy_storage___featuredDistributionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI29MultiPlayerDistributionPicker____lazy_storage___equalDistributionButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8VideosUI29MultiPlayerDistributionPicker_onDistributionChange);
  sub_1E2C5FB90(v3);
}

@end