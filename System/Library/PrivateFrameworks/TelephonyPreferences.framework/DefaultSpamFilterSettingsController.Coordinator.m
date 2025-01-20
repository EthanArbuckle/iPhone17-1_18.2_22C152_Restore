@interface DefaultSpamFilterSettingsController.Coordinator
- (_TtCV20TelephonyPreferences35DefaultSpamFilterSettingsController11Coordinator)init;
- (void)canEditExtensionsDidChangeForController:(id)a3 canEditExtensions:(BOOL)a4;
@end

@implementation DefaultSpamFilterSettingsController.Coordinator

- (void)canEditExtensionsDidChangeForController:(id)a3 canEditExtensions:(BOOL)a4
{
  uint64_t v7 = type metadata accessor for DefaultSpamFilterSettingsController(0) - 8;
  MEMORY[0x1F4188790]();
  v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x58);
  id v11 = a3;
  v12 = self;
  v10();
  v13 = &v9[*(int *)(v7 + 28)];
  uint64_t v14 = *(void *)v13;
  uint64_t v15 = *((void *)v13 + 1);
  LOBYTE(v13) = v13[16];
  uint64_t v17 = v14;
  uint64_t v18 = v15;
  char v19 = (char)v13;
  v16[7] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE98138);
  sub_1E4E0C4C8();
  sub_1E4E07DA4((uint64_t)v9);
}

- (_TtCV20TelephonyPreferences35DefaultSpamFilterSettingsController11Coordinator)init
{
  result = (_TtCV20TelephonyPreferences35DefaultSpamFilterSettingsController11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end