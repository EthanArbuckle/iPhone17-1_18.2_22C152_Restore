@interface PreferencePane
+ (_TtC12NanoUniverse14PreferencePane)aegirRenderingPreferencePane;
+ (_TtC12NanoUniverse14PreferencePane)calliopeRenderingPreferencePane;
- (NSArray)panes;
- (NSArray)pickersSelections;
- (NSArray)sliders;
- (NSArray)toggles;
- (NSDictionary)defaultPickersSelections;
- (NSDictionary)defaultSliders;
- (NSDictionary)defaultToggles;
- (NSDictionary)pickerOptions;
- (NSString)name;
- (_TtC12NanoUniverse14PreferencePane)init;
- (_TtC12NanoUniverse14PreferencePane)initWithName:(id)a3 panes:(id)a4;
- (_TtC12NanoUniverse14PreferencePane)initWithName:(id)a3 userDefaults:(id)a4 sliders:(id)a5 toggles:(id)a6 pickerOptions:(id)a7 pickerSelections:(id)a8;
- (_TtP12NanoUniverse22PreferencePaneDelegate_)delegate;
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

+ (_TtC12NanoUniverse14PreferencePane)aegirRenderingPreferencePane
{
  if (qword_26AD344D8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26AD344B8;
  return (_TtC12NanoUniverse14PreferencePane *)v2;
}

- (id)fractionValueForOption:(id)a3
{
  uint64_t v4 = sub_21E8EE9F0();
  uint64_t v6 = v5;
  v7 = self;
  double v8 = COERCE_DOUBLE(sub_21E8D06E4(v4, v6));
  if (v9) {
    id v10 = 0;
  }
  else {
    id v10 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v8 / 100.0);
  }

  swift_bridgeObjectRelease();
  return v10;
}

+ (_TtC12NanoUniverse14PreferencePane)calliopeRenderingPreferencePane
{
  if (qword_26AD34340 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26AD34338;
  return (_TtC12NanoUniverse14PreferencePane *)v2;
}

- (NSString)name
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_21E8EE5E0();
  swift_release();
  swift_release();

  uint64_t v4 = (void *)sub_21E8EE9C0();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)setName:(id)a3
{
  sub_21E8EE9F0();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v4 = self;
  sub_21E8EE5F0();
}

- (NSArray)panes
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_21E8EE5E0();
  swift_release();
  swift_release();

  if (v6)
  {
    type metadata accessor for PreferencePane();
    uint64_t v4 = (void *)sub_21E8EEA40();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setPanes:(id)a3
{
  if (a3)
  {
    type metadata accessor for PreferencePane();
    sub_21E8EEA50();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v4 = self;
  sub_21E8EE5F0();
}

- (unsigned)changeSequence
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  swift_beginAccess();
  return *v2;
}

- (void)setChangeSequence:(unsigned int)a3
{
  uint64_t v4 = (unsigned int *)((char *)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (NSArray)sliders
{
  return (NSArray *)sub_21E8CEB10();
}

- (void)setSliders:(id)a3
{
}

- (NSArray)toggles
{
  return (NSArray *)sub_21E8CEB10();
}

- (void)setToggles:(id)a3
{
}

- (NSArray)pickersSelections
{
  return (NSArray *)sub_21E8CEB10();
}

- (void)setPickersSelections:(id)a3
{
}

- (NSDictionary)defaultSliders
{
  return (NSDictionary *)sub_21E8CEDC4();
}

- (void)setDefaultSliders:(id)a3
{
}

- (NSDictionary)defaultToggles
{
  return (NSDictionary *)sub_21E8CEDC4();
}

- (void)setDefaultToggles:(id)a3
{
}

- (NSDictionary)defaultPickersSelections
{
  return (NSDictionary *)sub_21E8CEDC4();
}

- (void)setDefaultPickersSelections:(id)a3
{
}

- (NSDictionary)pickerOptions
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions);
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D48000);
    v3 = (void *)sub_21E8EE980();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (void)setPickerOptions:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D48000);
    uint64_t v3 = sub_21E8EE990();
  }
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_pickerOptions);
  swift_beginAccess();
  *uint64_t v5 = v3;
  swift_bridgeObjectRelease();
}

- (_TtP12NanoUniverse22PreferencePaneDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x223C35660](v2);
  return (_TtP12NanoUniverse22PreferencePaneDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC12NanoUniverse14PreferencePane)initWithName:(id)a3 panes:(id)a4
{
  uint64_t v4 = sub_21E8EE9F0();
  uint64_t v6 = v5;
  type metadata accessor for PreferencePane();
  unint64_t v7 = sub_21E8EEA50();
  return (_TtC12NanoUniverse14PreferencePane *)PreferencePane.init(name:panes:)(v4, v6, v7);
}

- (_TtC12NanoUniverse14PreferencePane)initWithName:(id)a3 userDefaults:(id)a4 sliders:(id)a5 toggles:(id)a6 pickerOptions:(id)a7 pickerSelections:(id)a8
{
  uint64_t v9 = sub_21E8EE9F0();
  uint64_t v11 = v10;
  uint64_t v12 = sub_21E8EE990();
  uint64_t v13 = sub_21E8EE990();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D48000);
  uint64_t v14 = sub_21E8EE990();
  uint64_t v15 = sub_21E8EE990();
  id v16 = a4;
  return (_TtC12NanoUniverse14PreferencePane *)PreferencePane.init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)(v9, v11, a4, v12, v13, v14, v15);
}

- (id)getValueForKey:(id)a3
{
  uint64_t v4 = sub_21E8EE9F0();
  uint64_t v6 = v5;
  unint64_t v7 = self;
  sub_21E8D0B44(v4, v6, (uint64_t)v15);

  swift_bridgeObjectRelease();
  uint64_t v8 = v16;
  if (v16)
  {
    uint64_t v9 = __swift_project_boxed_opaque_existential_0(v15, v16);
    uint64_t v10 = *(void *)(v8 - 8);
    MEMORY[0x270FA5388](v9, v9);
    uint64_t v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    uint64_t v13 = (void *)sub_21E8EED30();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  }
  else
  {
    uint64_t v13 = 0;
  }
  return v13;
}

- (void)set:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    unint64_t v7 = self;
    swift_unknownObjectRetain();
    sub_21E8EEC10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a4;
    uint64_t v9 = self;
  }
  sub_21E8EE9F0();

  sub_21E8D1040((uint64_t)v10);
  swift_bridgeObjectRelease();

  sub_21E8D0E14((uint64_t)v10);
}

- (void)preferencePaneDidChangeWithPreference:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate;
  swift_beginAccess();
  id v6 = (void *)MEMORY[0x223C35660](v5);
  id v7 = a3;
  id v8 = self;
  if (v6)
  {
    objc_msgSend(v6, sel_preferencePaneDidChangeWithPreference_, v7);
    swift_unknownObjectRelease();
  }
  uint64_t v9 = (_DWORD *)((char *)v8 + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_changeSequence);
  swift_beginAccess();
  ++*v9;
}

- (void)reset
{
  v2 = self;
  sub_21E8D1470();
}

- (_TtC12NanoUniverse14PreferencePane)init
{
  result = (_TtC12NanoUniverse14PreferencePane *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane__name;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D47FF0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane__panes;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD34430);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21E8D2E00((uint64_t)self + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_delegate);
  id v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12NanoUniverse14PreferencePane_userDefaults);
}

@end