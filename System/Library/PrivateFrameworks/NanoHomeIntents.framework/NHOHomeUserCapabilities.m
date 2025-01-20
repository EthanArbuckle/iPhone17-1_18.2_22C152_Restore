@interface NHOHomeUserCapabilities
+ (BOOL)currentLocationEnergyForecastEnabled;
- (BOOL)energyForecastEnabled;
- (BOOL)restrictedGuest;
- (BOOL)shouldShowElectricity;
- (NHOHomeUserCapabilities)init;
- (NHOHomeUserCapabilities)initWithHome:(id)a3;
- (void)updateCapabilitiesWithCompletionHandler:(id)a3;
@end

@implementation NHOHomeUserCapabilities

- (BOOL)shouldShowElectricity
{
  if ((*((unsigned char *)&self->super.isa + OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded) & 1) != 0
    || *((unsigned char *)&self->super.isa + OBJC_IVAR___NHOHomeUserCapabilities_hasMockData) == 1)
  {
    char v2 = 1;
  }
  else
  {
    v3 = self;
    char v2 = sub_2573185EC();
  }
  return v2 & 1;
}

+ (BOOL)currentLocationEnergyForecastEnabled
{
  return sub_25731A46C(0xD000000000000024, 0x8000000257324CC0) & 1;
}

- (BOOL)energyForecastEnabled
{
  return sub_25731A46C(0xD000000000000015, 0x8000000257324D60) & 1;
}

- (BOOL)restrictedGuest
{
  char v2 = self;
  char v3 = sub_2573185EC();

  return v3 & 1;
}

- (NHOHomeUserCapabilities)initWithHome:(id)a3
{
  uint64_t v4 = OBJC_IVAR___NHOHomeUserCapabilities_logger;
  uint64_t v5 = qword_269FE52E0;
  v6 = (objc_class *)a3;
  v7 = self;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_257321708();
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_269FE5590);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))((char *)v7 + v4, v9, v8);
  *((unsigned char *)&v7->super.isa + OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded) = 0;
  *((unsigned char *)&v7->super.isa + OBJC_IVAR___NHOHomeUserCapabilities_hasMockData) = 0;
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___NHOHomeUserCapabilities_home) = v6;
  v10 = v6;

  v13.receiver = v7;
  v13.super_class = (Class)type metadata accessor for NHOHomeUserCapabilities();
  v11 = [(NHOHomeUserCapabilities *)&v13 init];

  return v11;
}

- (void)updateCapabilitiesWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269FE57D0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_257321958();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269FE5A98;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269FE5AA8;
  v12[5] = v11;
  objc_super v13 = self;
  sub_257319B54((uint64_t)v7, (uint64_t)&unk_269FE5AB8, (uint64_t)v12);
  swift_release();
}

- (NHOHomeUserCapabilities)init
{
  result = (NHOHomeUserCapabilities *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char v3 = (char *)self + OBJC_IVAR___NHOHomeUserCapabilities_logger;
  uint64_t v4 = sub_257321708();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NHOHomeUserCapabilities_home);
}

@end