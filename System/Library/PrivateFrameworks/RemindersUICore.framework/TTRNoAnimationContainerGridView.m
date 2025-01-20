@interface TTRNoAnimationContainerGridView
- (_TtC15RemindersUICore31TTRNoAnimationContainerGridView)initWithArrangedSubviewRows:(id)a3;
- (_TtC15RemindersUICore31TTRNoAnimationContainerGridView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore31TTRNoAnimationContainerGridView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TTRNoAnimationContainerGridView

- (void)layoutSubviews
{
  v2 = self;
  TTRNoAnimationContainerGridView.layoutSubviews()();
}

- (_TtC15RemindersUICore31TTRNoAnimationContainerGridView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore31TTRNoAnimationContainerGridView *)sub_1B96A5BD0(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for TTRNoAnimationContainerGridView);
}

- (_TtC15RemindersUICore31TTRNoAnimationContainerGridView)initWithArrangedSubviewRows:(id)a3
{
  v3 = a3;
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9ACBC0);
    sub_1B996EE50();
    v3 = (void *)sub_1B996EE40();
    swift_bridgeObjectRelease();
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRNoAnimationContainerGridView();
  v5 = [(NUIContainerGridView *)&v7 initWithArrangedSubviewRows:v3];

  return v5;
}

- (_TtC15RemindersUICore31TTRNoAnimationContainerGridView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore31TTRNoAnimationContainerGridView *)sub_1B96A5E6C(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for TTRNoAnimationContainerGridView);
}

@end