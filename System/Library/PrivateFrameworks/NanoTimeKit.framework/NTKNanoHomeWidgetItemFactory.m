@interface NTKNanoHomeWidgetItemFactory
+ (id)accessoryWidgetItemWithAccessoryIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5;
+ (id)currentLocationEnergyWidgetItemWithComplicationFamily:(int64_t)a3 sectionIdentifier:(id)a4;
+ (id)electricityRatesWidgetItemWithRatesIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5;
+ (id)electricityUsageWidgetItemWithUsageIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5;
+ (id)homeSpecificEnergyWidgetItemWithEnergyIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5;
+ (id)launcherWidgetItemWithComplicationFamily:(int64_t)a3 sectionIdentifier:(id)a4;
+ (id)sceneWidgetItemWithSceneIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5;
+ (id)smartStackWidgetItemWithComplicationFamily:(int64_t)a3 sectionIdentifier:(id)a4;
- (_TtC11NanoTimeKit28NTKNanoHomeWidgetItemFactory)init;
@end

@implementation NTKNanoHomeWidgetItemFactory

+ (id)currentLocationEnergyWidgetItemWithComplicationFamily:(int64_t)a3 sectionIdentifier:(id)a4
{
  uint64_t v5 = sub_1BC871CC8();
  uint64_t v7 = v6;
  id v8 = objc_msgSend(objc_allocWithZone((Class)sub_1BC8718E8()), sel_init);
  sub_1BC871898();
  uint64_t v9 = sub_1BC871868();
  unint64_t v11 = v10;
  sub_1BC871978();
  uint64_t v12 = sub_1BC871948();
  id v14 = sub_1BC852398(v8, v9, v11, v12, v13, a3, v5, v7, MEMORY[0x1E4F79C48], &qword_1E9FA5F20, MEMORY[0x1E4F79C48]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v14;
}

+ (id)homeSpecificEnergyWidgetItemWithEnergyIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5
{
  uint64_t v7 = sub_1BC871CC8();
  uint64_t v9 = v8;
  id v10 = a3;
  sub_1BC8718D8();
  if (v11)
  {
    sub_1BC871978();
    uint64_t v12 = sub_1BC871938();
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BC871978();
    uint64_t v12 = sub_1BC871948();
    uint64_t v14 = v15;
  }
  sub_1BC871898();
  id v16 = v10;
  uint64_t v17 = sub_1BC871868();
  id v19 = sub_1BC852398(v16, v17, v18, v12, v14, a4, v7, v9, MEMORY[0x1E4F79C48], &qword_1E9FA5F20, MEMORY[0x1E4F79C48]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v19;
}

+ (id)electricityUsageWidgetItemWithUsageIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5
{
  uint64_t v7 = sub_1BC871CC8();
  uint64_t v9 = v8;
  id v10 = a3;
  sub_1BC8719A8();
  if (v11)
  {
    sub_1BC871978();
    uint64_t v12 = sub_1BC871968();
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BC871978();
    uint64_t v12 = sub_1BC871928();
    uint64_t v14 = v15;
  }
  sub_1BC871898();
  id v16 = v10;
  uint64_t v17 = sub_1BC871858();
  id v19 = sub_1BC852398(v16, v17, v18, v12, v14, a4, v7, v9, MEMORY[0x1E4F79C58], &qword_1E9FA5F18, MEMORY[0x1E4F79C58]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v19;
}

+ (id)electricityRatesWidgetItemWithRatesIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5
{
  uint64_t v7 = sub_1BC871CC8();
  uint64_t v9 = v8;
  id v10 = a3;
  sub_1BC871988();
  if (v11)
  {
    sub_1BC871978();
    uint64_t v12 = sub_1BC871958();
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BC871978();
    uint64_t v12 = sub_1BC871918();
    uint64_t v14 = v15;
  }
  sub_1BC871898();
  id v16 = v10;
  uint64_t v17 = sub_1BC871848();
  id v19 = sub_1BC852398(v16, v17, v18, v12, v14, a4, v7, v9, MEMORY[0x1E4F79C50], &qword_1E9FA5F10, MEMORY[0x1E4F79C50]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v19;
}

+ (id)smartStackWidgetItemWithComplicationFamily:(int64_t)a3 sectionIdentifier:(id)a4
{
  uint64_t v5 = sub_1BC871CC8();
  uint64_t v7 = v6;
  id v8 = objc_msgSend(objc_allocWithZone((Class)sub_1BC8719F8()), sel_init);
  sub_1BC871898();
  uint64_t v9 = sub_1BC871838();
  unint64_t v11 = v10;
  sub_1BC871978();
  uint64_t v12 = sub_1BC871908();
  id v14 = sub_1BC852398(v8, v9, v11, v12, v13, a3, v5, v7, MEMORY[0x1E4F79C80], &qword_1E9FA5F08, MEMORY[0x1E4F79C80]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v14;
}

+ (id)accessoryWidgetItemWithAccessoryIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5
{
  uint64_t v7 = sub_1BC871CC8();
  uint64_t v9 = v8;
  sub_1BC871898();
  id v10 = a3;
  uint64_t v11 = sub_1BC871888();
  unint64_t v13 = v12;
  uint64_t v14 = sub_1BC8717E8();
  id v16 = sub_1BC852398(v10, v11, v13, v14, v15, a4, v7, v9, MEMORY[0x1E4F79C38], &qword_1E9FA5F00, MEMORY[0x1E4F79C38]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v16;
}

+ (id)sceneWidgetItemWithSceneIntent:(id)a3 complicationFamily:(int64_t)a4 sectionIdentifier:(id)a5
{
  uint64_t v7 = sub_1BC871CC8();
  uint64_t v9 = v8;
  sub_1BC871898();
  id v10 = a3;
  uint64_t v11 = sub_1BC871828();
  unint64_t v13 = v12;
  uint64_t v14 = sub_1BC871808();
  id v16 = sub_1BC852398(v10, v11, v13, v14, v15, a4, v7, v9, MEMORY[0x1E4F79C40], &qword_1E9FA5EF8, MEMORY[0x1E4F79C40]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v16;
}

+ (id)launcherWidgetItemWithComplicationFamily:(int64_t)a3 sectionIdentifier:(id)a4
{
  sub_1BC871CC8();
  id v5 = _s11NanoTimeKit28NTKNanoHomeWidgetItemFactoryC08launcherfG018complicationFamily17sectionIdentifierSo07NTKHomefG0CSgSo015CLKComplicationK0V_SStFZ_0(a3);
  swift_bridgeObjectRelease();

  return v5;
}

- (_TtC11NanoTimeKit28NTKNanoHomeWidgetItemFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(NTKNanoHomeWidgetItemFactory *)&v3 init];
}

@end