@interface NTKBundleComplicationMigrationTypeLookupGenerator
+ (void)generateLookupUsingService:(NTKBundleComplicationMigrationService *)a3 device:(CLKDevice *)a4 completion:(id)a5;
- (NTKBundleComplicationMigrationTypeLookupGenerator)init;
@end

@implementation NTKBundleComplicationMigrationTypeLookupGenerator

+ (void)generateLookupUsingService:(NTKBundleComplicationMigrationService *)a3 device:(CLKDevice *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FA60C0);
  MEMORY[0x1F4188790](v9 - 8, v10, v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a5);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = v14;
  v15[5] = a1;
  uint64_t v16 = sub_1BC871D58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E9FA62F0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1E9FA5F50;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  sub_1BC85FE7C((uint64_t)v13, (uint64_t)&unk_1E9FA5F58, (uint64_t)v18);
  swift_release();
}

- (NTKBundleComplicationMigrationTypeLookupGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKBundleComplicationMigrationTypeLookupGenerator;
  return [(NTKBundleComplicationMigrationTypeLookupGenerator *)&v3 init];
}

@end