@interface STAgePresetsAnalytics
- (_TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics)init;
- (void)sendChooseAgeButtonTappedAnalyticsEvent;
- (void)sendEnabledRestrictionsEventWithSelectionType:(int64_t)a3 lowerBound:(id)a4 upperBound:(id)a5;
- (void)sendPresetsValueChangedAnalyticsEventWithRecommendedPresetId:(id)a3 fieldName:(id)a4 recomendedValue:(id)a5 selectedValue:(id)a6;
- (void)sendPresetsViewedAnalyticsEventWithIsInitialSetup:(BOOL)a3;
- (void)sendResetAgePresetSelectedAnalyticsEvent;
- (void)sendSelectedAgeRangeAnalyticsEventWithLowerBound:(int64_t)a3 upperBound:(int64_t)a4;
- (void)sendSkippedAnalyticsEvent;
@end

@implementation STAgePresetsAnalytics

- (_TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics)init
{
  uint64_t v2 = sub_225C07690();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225C07680();
  uint64_t v7 = sub_225C07670();
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v10 = (objc_class *)type metadata accessor for STAgePresetsAnalytics();
  v11 = (char *)objc_allocWithZone(v10);
  v12 = (uint64_t *)&v11[OBJC_IVAR____TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics_sessionId];
  uint64_t *v12 = v7;
  v12[1] = v9;
  v15.receiver = v11;
  v15.super_class = v10;
  v13 = [(STAgePresetsAnalytics *)&v15 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

- (void)sendPresetsViewedAnalyticsEventWithIsInitialSetup:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_allocWithZone(MEMORY[0x263F670A0]);
  v6 = self;
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)sub_225C08400();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v5, sel_initWithSessionId_isInitialSetup_, v7, v3);

  objc_msgSend(self, sel_reportEvent_, v8);
}

- (void)sendSelectedAgeRangeAnalyticsEventWithLowerBound:(int64_t)a3 upperBound:(int64_t)a4
{
  id v7 = objc_allocWithZone(MEMORY[0x263F671F0]);
  id v8 = self;
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)sub_225C08400();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v7, sel_initWithSessionId_lowerBoundAgeRange_upperBoundAgeRange_, v9, a3, a4);

  objc_msgSend(self, sel_reportEvent_, v10);
}

- (void)sendChooseAgeButtonTappedAnalyticsEvent
{
}

- (void)sendResetAgePresetSelectedAnalyticsEvent
{
}

- (void)sendSkippedAnalyticsEvent
{
}

- (void)sendEnabledRestrictionsEventWithSelectionType:(int64_t)a3 lowerBound:(id)a4 upperBound:(id)a5
{
  id v9 = objc_allocWithZone(MEMORY[0x263F67200]);
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  swift_bridgeObjectRetain();
  v13 = (void *)sub_225C08400();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v9, sel_initWithSessionId_selectionType_lowerBoundAgeRange_upperBoundAgeRange_, v13, a3, v10, v11);

  objc_msgSend(self, sel_reportEvent_, v14);
}

- (void)sendPresetsValueChangedAnalyticsEventWithRecommendedPresetId:(id)a3 fieldName:(id)a4 recomendedValue:(id)a5 selectedValue:(id)a6
{
  if (a3)
  {
    uint64_t v9 = sub_225C08420();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  uint64_t v12 = sub_225C08420();
  uint64_t v14 = v13;
  if (!a5)
  {
    memset(v23, 0, sizeof(v23));
    swift_unknownObjectRetain();
    v16 = self;
    if (a6) {
      goto LABEL_6;
    }
LABEL_8:
    memset(v22, 0, sizeof(v22));
    goto LABEL_9;
  }
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  objc_super v15 = self;
  sub_225C08690();
  swift_unknownObjectRelease();
  if (!a6) {
    goto LABEL_8;
  }
LABEL_6:
  sub_225C08690();
  swift_unknownObjectRelease();
LABEL_9:
  uint64_t v17 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics_sessionId);
  uint64_t v18 = *(void *)&self->sessionId[OBJC_IVAR____TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics_sessionId];
  sub_225BF448C((uint64_t)v23, (uint64_t)v21);
  sub_225BF448C((uint64_t)v22, (uint64_t)v20);
  objc_allocWithZone(MEMORY[0x263F67208]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v19 = sub_225C02298(v17, v18, v9, v11, v12, v14, v21, v20);
  objc_msgSend(self, sel_reportEvent_, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_225C026EC((uint64_t)v22);
  sub_225C026EC((uint64_t)v23);
}

- (void).cxx_destruct
{
}

@end