@interface TTRIReminderLocationPickerMapAnnotation
- (CLLocationCoordinate2D)coordinate;
- (NSString)subtitle;
- (NSString)title;
- (_TtC15RemindersUICore39TTRIReminderLocationPickerMapAnnotation)init;
@end

@implementation TTRIReminderLocationPickerMapAnnotation

- (CLLocationCoordinate2D)coordinate
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore39TTRIReminderLocationPickerMapAnnotation_region), sel_center);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (NSString)title
{
  _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  double v2 = (void *)sub_1B996E9B0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)subtitle
{
  return (NSString *)0;
}

- (_TtC15RemindersUICore39TTRIReminderLocationPickerMapAnnotation)init
{
  CLLocationCoordinate2D result = (_TtC15RemindersUICore39TTRIReminderLocationPickerMapAnnotation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = *(void **)&self->item[OBJC_IVAR____TtC15RemindersUICore39TTRIReminderLocationPickerMapAnnotation_item + 40];
  v4 = *(void **)&self->item[OBJC_IVAR____TtC15RemindersUICore39TTRIReminderLocationPickerMapAnnotation_item + 48];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15RemindersUICore39TTRIReminderLocationPickerMapAnnotation_region);
}

@end