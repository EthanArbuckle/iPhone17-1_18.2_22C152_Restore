@interface PreferencePane
+ (_TtC9WeatherUI14PreferencePane)aegirRenderingPreferencePane;
+ (_TtC9WeatherUI14PreferencePane)calliopeRenderingPreferencePane;
- (NSArray)panes;
- (NSArray)pickersSelections;
- (NSArray)sliders;
- (NSArray)toggles;
- (NSDictionary)defaultPickersSelections;
- (NSDictionary)defaultSliders;
- (NSDictionary)defaultToggles;
- (NSDictionary)pickerOptions;
- (NSString)name;
- (_TtC9WeatherUI14PreferencePane)init;
- (_TtC9WeatherUI14PreferencePane)initWithName:(id)a3 panes:(id)a4;
- (_TtC9WeatherUI14PreferencePane)initWithName:(id)a3 userDefaults:(id)a4 sliders:(id)a5 toggles:(id)a6 pickerOptions:(id)a7 pickerSelections:(id)a8;
- (_TtP9WeatherUI22PreferencePaneDelegate_)delegate;
- (id)fractionValueForOption:(id)a3;
- (id)getValueForKey:(id)a3;
- (unsigned)changeSequence;
- (void)preferencePaneDidChangeWithPreference:(id)a3;
- (void)reset;
- (void)set:(id)a3 forKey:(id)a4;
- (void)setChangeSequence:(unsigned int)a3;
- (void)setDefaultPickersSelections:(id)a3;
- (void)setDefaultSliders:(id)a3;
- (void)setDefaultToggles:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setName:(id)a3;
- (void)setPanes:(id)a3;
- (void)setPickerOptions:(id)a3;
- (void)setPickersSelections:(id)a3;
- (void)setSliders:(id)a3;
- (void)setToggles:(id)a3;
@end

@implementation PreferencePane

- (NSString)name
{
  v2 = self;
  sub_1B47B3C9C();

  v3 = (void *)sub_1B4838CE0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  sub_1B4838D20();
  v4 = self;
  sub_1B47B3D80();
}

- (NSArray)panes
{
  v2 = self;
  uint64_t v3 = sub_1B47B4160();

  if (v3)
  {
    type metadata accessor for PreferencePane();
    v4 = (void *)sub_1B4838FE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setPanes:(id)a3
{
  if (a3)
  {
    type metadata accessor for PreferencePane();
    sub_1B4838FF0();
  }
  v4 = self;
  sub_1B47B4248();
}

- (unsigned)changeSequence
{
  return sub_1B47B4588();
}

- (void)setChangeSequence:(unsigned int)a3
{
}

- (NSArray)sliders
{
  return (NSArray *)sub_1B47B4794((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1B47B4688);
}

- (void)setSliders:(id)a3
{
  uint64_t v4 = sub_1B4838FF0();
  v5 = self;
  sub_1B47B46FC(v4);
}

- (NSArray)toggles
{
  return (NSArray *)sub_1B47B4794((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1B47B47EC);
}

- (void)setToggles:(id)a3
{
  uint64_t v4 = sub_1B4838FF0();
  v5 = self;
  sub_1B47B4860(v4);
}

- (NSArray)pickersSelections
{
  return (NSArray *)sub_1B47B4794((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1B47B48F8);
}

- (void)setPickersSelections:(id)a3
{
  uint64_t v4 = sub_1B4838FF0();
  v5 = self;
  sub_1B47B496C(v4);
}

- (NSDictionary)defaultSliders
{
  return (NSDictionary *)sub_1B47B4B34((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1B47B4A0C);
}

- (void)setDefaultSliders:(id)a3
{
  uint64_t v4 = sub_1B4838BB0();
  v5 = self;
  sub_1B47B4A94(v4);
}

- (NSDictionary)defaultToggles
{
  return (NSDictionary *)sub_1B47B4B34((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1B47B4B9C);
}

- (void)setDefaultToggles:(id)a3
{
  uint64_t v4 = sub_1B4838BB0();
  v5 = self;
  sub_1B47B4C24(v4);
}

- (NSDictionary)defaultPickersSelections
{
  return (NSDictionary *)sub_1B47B4B34((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1B47B4CC4);
}

- (void)setDefaultPickersSelections:(id)a3
{
  uint64_t v4 = sub_1B4838BB0();
  v5 = self;
  sub_1B47B4D84(v4);
}

- (NSDictionary)pickerOptions
{
  if (sub_1B47B4EBC())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6AB820);
    v2 = (void *)sub_1B4838BA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (void)setPickerOptions:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6AB820);
    uint64_t v3 = sub_1B4838BB0();
  }
  v5 = self;
  sub_1B47B4F88(v3);
}

- (_TtP9WeatherUI22PreferencePaneDelegate_)delegate
{
  v2 = (void *)sub_1B47B5070();
  return (_TtP9WeatherUI22PreferencePaneDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1B47B5114();
}

- (_TtC9WeatherUI14PreferencePane)initWithName:(id)a3 panes:(id)a4
{
  sub_1B4838D20();
  type metadata accessor for PreferencePane();
  sub_1B4838FF0();
  PreferencePane.init(name:panes:)();
  return result;
}

- (_TtC9WeatherUI14PreferencePane)initWithName:(id)a3 userDefaults:(id)a4 sliders:(id)a5 toggles:(id)a6 pickerOptions:(id)a7 pickerSelections:(id)a8
{
  uint64_t v9 = sub_1B4838D20();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1B4838BB0();
  uint64_t v13 = sub_1B4838BB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6AB820);
  uint64_t v14 = sub_1B4838BB0();
  uint64_t v15 = sub_1B4838BB0();
  id v16 = a4;
  return (_TtC9WeatherUI14PreferencePane *)PreferencePane.init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)(v9, v11, a4, v12, v13, v14, v15);
}

- (id)getValueForKey:(id)a3
{
  uint64_t v4 = sub_1B4838D20();
  uint64_t v6 = v5;
  v7 = self;
  sub_1B47B6408(v4, v6, (uint64_t)v16);

  swift_bridgeObjectRelease();
  uint64_t v8 = v17;
  if (v17)
  {
    uint64_t v9 = __swift_project_boxed_opaque_existential_1(v16, v17);
    uint64_t v10 = *(void *)(v8 - 8);
    __n128 v11 = MEMORY[0x1F4188790](v9);
    uint64_t v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v10 + 16))(v13, v11);
    uint64_t v14 = (void *)sub_1B4839B30();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    uint64_t v14 = 0;
  }
  return v14;
}

- (void)set:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1B4839690();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a4;
    uint64_t v9 = self;
  }
  sub_1B4838D20();

  sub_1B47B67D0((uint64_t)v10);
  swift_bridgeObjectRelease();
  sub_1B476AE14((uint64_t)v10);
}

- (void)preferencePaneDidChangeWithPreference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1B47B6A54((uint64_t)v4);
}

- (void)reset
{
  v2 = self;
  sub_1B47B6B50();
}

- (_TtC9WeatherUI14PreferencePane)init
{
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9WeatherUI14PreferencePane__name;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D04840);
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC9WeatherUI14PreferencePane__panes;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6ABA50);
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(char *))(v6 + 8))(v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B4222C00((uint64_t)self + OBJC_IVAR____TtC9WeatherUI14PreferencePane_delegate);
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9WeatherUI14PreferencePane_userDefaults);
}

+ (_TtC9WeatherUI14PreferencePane)calliopeRenderingPreferencePane
{
  id v2 = static PreferencePane.calliopeRenderingPreferencePane.getter();
  return (_TtC9WeatherUI14PreferencePane *)v2;
}

+ (_TtC9WeatherUI14PreferencePane)aegirRenderingPreferencePane
{
  id v2 = static PreferencePane.aegirRenderingPreferencePane.getter();
  return (_TtC9WeatherUI14PreferencePane *)v2;
}

- (id)fractionValueForOption:(id)a3
{
  uint64_t v4 = sub_1B4838D20();
  uint64_t v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  uint64_t v9 = (void *)PreferencePane.fractionValue(forOption:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

@end