@interface BAReadingSettingsData
- (BAReadingSettingsData)init;
- (BAReadingSettingsData)initWithScrollViewStatus:(int64_t)a3 autoNightThemeStatus:(int64_t)a4 backgroundColor:(int64_t)a5 font:(id)a6 fontSize:(id)a7 brightnessLevel:(id)a8;
@end

@implementation BAReadingSettingsData

- (BAReadingSettingsData)initWithScrollViewStatus:(int64_t)a3 autoNightThemeStatus:(int64_t)a4 backgroundColor:(int64_t)a5 font:(id)a6 fontSize:(id)a7 brightnessLevel:(id)a8
{
  uint64_t v14 = sub_27DDB0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSettingsData_scrollViewStatus) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSettingsData_autoNightThemeStatus) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSettingsData_backgroundColor) = (Class)a5;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___BAReadingSettingsData_font);
  uint64_t *v15 = v14;
  v15[1] = v16;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSettingsData_fontSize) = (Class)a7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSettingsData_brightnessLevel) = (Class)a8;
  v20.receiver = self;
  v20.super_class = (Class)type metadata accessor for BridgedReadingSettingsData();
  id v17 = a7;
  id v18 = a8;
  return [(BAReadingSettingsData *)&v20 init];
}

- (BAReadingSettingsData)init
{
  result = (BAReadingSettingsData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSettingsData_brightnessLevel);
}

@end