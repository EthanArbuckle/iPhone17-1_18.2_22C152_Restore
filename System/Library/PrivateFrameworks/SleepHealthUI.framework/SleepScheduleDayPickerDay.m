@interface SleepScheduleDayPickerDay
- (BOOL)isSelected;
- (_TtC13SleepHealthUI25SleepScheduleDayPickerDay)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI25SleepScheduleDayPickerDay)initWithFrame:(CGRect)a3;
- (id)accessibilityWeekday;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation SleepScheduleDayPickerDay

- (_TtC13SleepHealthUI25SleepScheduleDayPickerDay)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD8B0B20();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AD8AFA80();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SleepScheduleDayPickerDay();
  id v2 = v3.receiver;
  [(SleepScheduleDayPickerDay *)&v3 tintColorDidChange];
  sub_1AD8AFF00();
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SleepScheduleDayPickerDay();
  return [(SleepScheduleDayPickerDay *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SleepScheduleDayPickerDay();
  id v4 = v5.receiver;
  [(SleepScheduleDayPickerDay *)&v5 setSelected:v3];
  sub_1AD8AFF00();
}

- (id)accessibilityWeekday
{
  id v2 = self;
  id v3 = [(SleepScheduleDayPickerDay *)v2 largeContentTitle];
  if (v3
    || (id v3 = objc_msgSend(*(id *)((char *)&v2->super.super.super.super.isa+ OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_dayLabel), sel_text)) != 0)
  {
    sub_1AD9DF710();

    id v4 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {

    id v4 = 0;
  }
  return v4;
}

- (_TtC13SleepHealthUI25SleepScheduleDayPickerDay)initWithFrame:(CGRect)a3
{
  result = (_TtC13SleepHealthUI25SleepScheduleDayPickerDay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_configuration);
  id v4 = *(NSMutableArray **)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_configuration);
  objc_super v5 = *(UITraitCollection **)((char *)&self->super.super._cachedTraitCollection
                             + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_configuration);
  v6 = *(id *)((char *)&self->super.super._swiftAnimationInfo
             + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_configuration);
  v7 = *(_UITraitChangeRegistry **)((char *)&self->super.super._traitChangeRegistry
                                  + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_configuration);
  objc_release(*(id *)((char *)&self->super.super._subviewCache
                     + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_configuration));

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_background));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_dayLabel));
  v8 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_elsewhereIndicator);
}

@end