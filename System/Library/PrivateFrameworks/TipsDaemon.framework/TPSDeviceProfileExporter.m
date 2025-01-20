@interface TPSDeviceProfileExporter
+ (void)updateDeviceProfileWithDataSource:(TPSDeviceProfileDataSource *)a3 completionHandler:(id)a4;
- (TPSDeviceProfileExporter)init;
@end

@implementation TPSDeviceProfileExporter

+ (void)updateDeviceProfileWithDataSource:(TPSDeviceProfileDataSource *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5898);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_1E451BA28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EAE48560;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EAE48568;
  v14[5] = v13;
  swift_unknownObjectRetain();
  sub_1E4513D84((uint64_t)v9, (uint64_t)&unk_1EAE48570, (uint64_t)v14);
  swift_release();
}

- (TPSDeviceProfileExporter)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TPSDeviceProfileExporter *)&v3 init];
}

@end