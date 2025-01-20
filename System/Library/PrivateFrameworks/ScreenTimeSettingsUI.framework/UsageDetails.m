@interface UsageDetails
+ (NSString)appUsageItemIdentifier;
+ (NSString)categoryUsageItemIdentifier;
+ (NSString)notificationUsageItemIdentifier;
+ (NSString)pickupUsageItemIdentifier;
+ (NSString)screenTimeUsageItemIdentifier;
+ (NSString)webUsageItemIdentifier;
+ (id)detailsForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 dateInterval:(id)a5 referenceDate:(id)a6 usageContext:(int64_t)a7 error:(id *)a8;
+ (id)earliestUsageDateForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 error:(id *)a5;
- (NSArray)usageItems;
- (NSDate)lastUpdatedDate;
- (NSDictionary)firstPickupByWeekdayByWeek;
- (_TtC20ScreenTimeSettingsUI12UsageDetails)init;
@end

@implementation UsageDetails

- (NSArray)usageItems
{
  sub_225BC40BC();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_225C084B0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (NSDate)lastUpdatedDate
{
  v2 = (void *)sub_225C07610();

  return (NSDate *)v2;
}

- (NSDictionary)firstPickupByWeekdayByWeek
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268116490);
  v2 = (void *)sub_225C083B0();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (_TtC20ScreenTimeSettingsUI12UsageDetails)init
{
  result = (_TtC20ScreenTimeSettingsUI12UsageDetails *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI12UsageDetails_lastUpdatedDate;
  uint64_t v4 = sub_225C07660();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

+ (NSString)appUsageItemIdentifier
{
  v2 = (void *)sub_225C08400();

  return (NSString *)v2;
}

+ (NSString)categoryUsageItemIdentifier
{
  v2 = (void *)sub_225C08400();

  return (NSString *)v2;
}

+ (NSString)pickupUsageItemIdentifier
{
  v2 = (void *)sub_225C08400();

  return (NSString *)v2;
}

+ (NSString)notificationUsageItemIdentifier
{
  v2 = (void *)sub_225C08400();

  return (NSString *)v2;
}

+ (NSString)screenTimeUsageItemIdentifier
{
  v2 = (void *)sub_225C08400();

  return (NSString *)v2;
}

+ (NSString)webUsageItemIdentifier
{
  v2 = (void *)sub_225C08400();

  return (NSString *)v2;
}

+ (id)earliestUsageDateForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_225C07660();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v9);
  v11 = (char *)&v18[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    a3 = (id)sub_225C08420();
    v13 = v12;
    if (a4)
    {
LABEL_3:
      v14 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))sub_225C08420();
      goto LABEL_6;
    }
  }
  else
  {
    v13 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  v14 = 0;
LABEL_6:
  v18[3] = sub_225C07930();
  v18[4] = sub_225BC42F4(&qword_268116390, MEMORY[0x263F04A30]);
  __swift_allocate_boxed_opaque_existential_1(v18);
  sub_225C07920();
  sub_225BBE68C((void (**)(char *, uint64_t, uint64_t))a3, v13, v14, v18, v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v15 = (void *)sub_225C07610();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  return v15;
}

+ (id)detailsForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 dateInterval:(id)a5 referenceDate:(id)a6 usageContext:(int64_t)a7 error:(id *)a8
{
  uint64_t v32 = a7;
  uint64_t v11 = sub_225C07660();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11, v13);
  v15 = (void (**)(char *, char *, uint64_t))((char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = sub_225C07560();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v16, v18);
  v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = a8;
  uint64_t v30 = v19;
  uint64_t v31 = v11;
  if (a3)
  {
    uint64_t v22 = sub_225C08420();
    uint64_t v24 = v23;
    if (a4)
    {
LABEL_3:
      v25 = (uint64_t *)sub_225C08420();
      a4 = v26;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v24 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  v25 = 0;
LABEL_6:
  sub_225C07540();
  sub_225C07640();
  v33[3] = sub_225C07930();
  v33[4] = sub_225BC42F4(&qword_268116390, MEMORY[0x263F04A30]);
  __swift_allocate_boxed_opaque_existential_1(v33);
  sub_225C07920();
  v27 = (void *)sub_225BC31F0(v22, v24, v25, (char *)a4, (uint64_t)v21, v15, v32, v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(void (**)(char *, char *, uint64_t), uint64_t))(v12 + 8))(v15, v31);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v21, v30);

  return v27;
}

@end