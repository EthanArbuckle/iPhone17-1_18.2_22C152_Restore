@interface SleepActivityConfigurationModel
- (_TtC13SleepHealthUI31SleepActivityConfigurationModel)init;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3;
@end

@implementation SleepActivityConfigurationModel

- (_TtC13SleepHealthUI31SleepActivityConfigurationModel)init
{
  result = (_TtC13SleepHealthUI31SleepActivityConfigurationModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI31SleepActivityConfigurationModel__layout;
  sub_1AD8A1C20(0, &qword_1E9A4A9E8, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI31SleepActivityConfigurationModel__scheduleModel;
  v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F1AC70];
  sub_1AD8A1BBC(0, &qword_1E9A4A9F8, (uint64_t (*)(uint64_t))type metadata accessor for SleepScheduleModel, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  v8 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI31SleepActivityConfigurationModel__settingsModel;
  sub_1AD8A1BBC(0, (unint64_t *)&unk_1E9A4AA08, (uint64_t (*)(uint64_t))type metadata accessor for SleepSettingsModel, v6);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepActivityConfigurationModel_watchAppInstalledProvider));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SleepHealthUI31SleepActivityConfigurationModel_behavior);
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  uint64_t v4 = sub_1AD9DF410();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  v8 = (uint64_t *)((char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1AD837214(0, (unint64_t *)&qword_1EB724D50);
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  uint64_t *v8 = sub_1AD9DFCA0();
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v8, *MEMORY[0x1E4FBCBF0], v4);
  LOBYTE(self) = sub_1AD9DF420();
  (*(void (**)(uint64_t *, uint64_t))(v5 + 8))(v8, v4);
  if (self)
  {
    sub_1AD8A0794();
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

@end