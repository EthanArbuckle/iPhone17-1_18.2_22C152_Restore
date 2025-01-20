@interface STDeviceActivityDataSource
+ (BOOL)hasDataForUserWithAltDSID:(id)a3 userDeviceStates:(id)a4;
+ (NSArray)allLocallyUsedBundleIdentifiers;
+ (NSDictionary)deviceIdentifiersByUserAltDSID;
+ (id)lastUpdatedDateFor:(id)a3;
+ (id)totalWeeklyUsageDuringDateInterval:(id)a3 userAltDSID:(id)a4 error:(id *)a5;
+ (void)downloadRemoteData;
+ (void)refreshAndUploadLocalDataSinceDate:(id)a3 completionHandler:(id)a4;
+ (void)setGenesisDate:(id)a3;
- (_TtC14ScreenTimeCore26STDeviceActivityDataSource)init;
@end

@implementation STDeviceActivityDataSource

+ (NSDictionary)deviceIdentifiersByUserAltDSID
{
  _s14ScreenTimeCore26STDeviceActivityDataSourceC30deviceIdentifiersByUserAltDSIDSDySSSaySSGGvgZ_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DC670);
  v2 = (void *)sub_1DA5ABB40();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

+ (NSArray)allLocallyUsedBundleIdentifiers
{
  _s14ScreenTimeCore26STDeviceActivityDataSourceC31allLocallyUsedBundleIdentifiersSaySSGvgZ_0();
  v2 = (void *)sub_1DA5ABBD0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

+ (void)setGenesisDate:(id)a3
{
  uint64_t v3 = sub_1DA5AB8C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790]();
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA5AB8B0();
  _s14ScreenTimeCore26STDeviceActivityDataSourceC14setGenesisDateyy10Foundation0J0VFZ_0((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

+ (id)totalWeeklyUsageDuringDateInterval:(id)a3 userAltDSID:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1DA5AB840();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA5AB820();
  if (a4) {
    unint64_t v10 = sub_1DA5ABB70();
  }
  else {
    unint64_t v10 = 0;
  }
  v11 = (void *)sub_1DA59F1D8((uint64_t)v9, v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  return v11;
}

+ (id)lastUpdatedDateFor:(id)a3
{
  uint64_t v3 = sub_1DA5AB840();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (void (*)(char *, unint64_t, uint64_t))((char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DC628);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA5AB820();
  static STDeviceActivityDataSource.lastUpdatedDate(for:)(v6, (uint64_t)v9);
  (*(void (**)(void (*)(char *, unint64_t, uint64_t), uint64_t))(v4 + 8))(v6, v3);
  uint64_t v10 = sub_1DA5AB8C0();
  uint64_t v11 = *(void *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
  {
    v12 = (void *)sub_1DA5AB890();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  }
  return v12;
}

+ (void)refreshAndUploadLocalDataSinceDate:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DC530);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DC628);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x1F4188790](v9 - 8);
  uint64_t v13 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  v15 = (char *)&v25 - v14;
  v16 = _Block_copy(a4);
  if (a3)
  {
    sub_1DA5AB8B0();
    uint64_t v17 = sub_1DA5AB8C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = sub_1DA5AB8C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  }
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  uint64_t v20 = sub_1DA5ABC40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v8, 1, 1, v20);
  sub_1DA59F800((uint64_t)v15, (uint64_t)v13);
  unint64_t v21 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v22 = (v11 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = 0;
  *(void *)(v23 + 24) = 0;
  sub_1DA59F868((uint64_t)v13, v23 + v21);
  v24 = (void (**)(uint64_t))(v23 + v22);
  *v24 = sub_1DA5A0204;
  v24[1] = (void (*)(uint64_t))v19;
  swift_retain();
  sub_1DA595B24((uint64_t)v8, (uint64_t)&unk_1EA8DC668, v23);
  swift_release();
  swift_release();
  sub_1DA59F020((uint64_t)v15);
}

+ (void)downloadRemoteData
{
  uint64_t v2 = sub_1DA5ABA40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA5ABA30();
  sub_1DA5AB9E0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

+ (BOOL)hasDataForUserWithAltDSID:(id)a3 userDeviceStates:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1DA5ABB70();
    unint64_t v7 = v6;
    if (a4)
    {
LABEL_3:
      sub_1DA5A0134();
      sub_1DA5A0174();
      uint64_t v8 = sub_1DA5ABC60();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  uint64_t v9 = _s14ScreenTimeCore26STDeviceActivityDataSourceC30deviceIdentifiersByUserAltDSIDSDySSSaySSGGvgZ_0();
  if (qword_1EB500400 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1DA5ABAD0();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EB500408);
  uint64_t v11 = sub_1DA5ABAB0();
  char v12 = _s14ScreenTimeCore26STDeviceActivityDataSourceC03hasF018forUserWithAltDSID16userDeviceStates019deviceIdentifiersByjlM00qrsC14DuetIdentifierSbSSSg_ShySo06STUserO5StateCGSgSDySSSaySSGGSDySSShySSGGtFZ_0(v5, v7, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

- (_TtC14ScreenTimeCore26STDeviceActivityDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STDeviceActivityDataSource();
  return [(STDeviceActivityDataSource *)&v3 init];
}

@end