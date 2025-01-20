@interface NHOIntentsUtilities
+ (id)pickableAccessoryIntentsWithHome:(id)a3 room:(id)a4;
+ (id)pickableActionSetIntentsWithHome:(id)a3;
+ (void)pickableElectricityRatesIntentsWithHome:(HMHome *)a3 completionHandler:(id)a4;
+ (void)pickableElectricityUsageIntentsWithHome:(HMHome *)a3 completionHandler:(id)a4;
+ (void)pickableEnergyForecastIntentsWithHome:(HMHome *)a3 completionHandler:(id)a4;
- (NHOIntentsUtilities)init;
@end

@implementation NHOIntentsUtilities

+ (void)pickableEnergyForecastIntentsWithHome:(HMHome *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FA60C0);
  MEMORY[0x1F4188790](v7 - 8, v8, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = v12;
  v13[4] = a1;
  uint64_t v14 = sub_1BC871D58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E9FA5F88;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E9FA5F90;
  v16[5] = v15;
  v17 = a3;
  sub_1BC85FE7C((uint64_t)v11, (uint64_t)&unk_1E9FA5F98, (uint64_t)v16);
  swift_release();
}

+ (void)pickableElectricityUsageIntentsWithHome:(HMHome *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FA60C0);
  MEMORY[0x1F4188790](v7 - 8, v8, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = v12;
  v13[4] = a1;
  uint64_t v14 = sub_1BC871D58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E9FA5F68;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E9FA5F70;
  v16[5] = v15;
  v17 = a3;
  sub_1BC85FE7C((uint64_t)v11, (uint64_t)&unk_1E9FA5F78, (uint64_t)v16);
  swift_release();
}

+ (void)pickableElectricityRatesIntentsWithHome:(HMHome *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FA60C0);
  MEMORY[0x1F4188790](v7 - 8, v8, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = v12;
  v13[4] = a1;
  uint64_t v14 = sub_1BC871D58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E9FA5F48;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E9FA5F50;
  v16[5] = v15;
  v17 = a3;
  sub_1BC85FE7C((uint64_t)v11, (uint64_t)&unk_1E9FA5F58, (uint64_t)v16);
  swift_release();
}

+ (id)pickableActionSetIntentsWithHome:(id)a3
{
  id v3 = a3;
  sub_1BC871DF8();

  sub_1BC871818();
  v4 = (void *)sub_1BC871CE8();
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)pickableAccessoryIntentsWithHome:(id)a3 room:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_1BC871DE8();

  sub_1BC8717F8();
  uint64_t v7 = (void *)sub_1BC871CE8();
  swift_bridgeObjectRelease();

  return v7;
}

- (NHOIntentsUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(NHOIntentsUtilities *)&v3 init];
}

@end