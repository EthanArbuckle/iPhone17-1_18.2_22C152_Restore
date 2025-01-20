@interface KTEligibilityStatusReporting
- (_TtC13transparencyd28KTEligibilityStatusReporting)init;
- (_TtC13transparencyd28KTEligibilityStatusReporting)initWithPath:(id)a3 idsReporting:(id)a4 eligibilitySupport:(id)a5 error:(id *)a6;
- (void)aggregateResultWithSamples:(int64_t)a3 element:(NSString *)a4 completionHandler:(id)a5;
- (void)cachedLastRecommendationWithCompletionHandler:(id)a3;
- (void)cachedOSVersionWithCompletionHandler:(id)a3;
- (void)cachedTimeOfLastReportWithCompletionHandler:(id)a3;
- (void)clearEligibilityOverridesWithCompletionHandler:(id)a3;
- (void)clearReportOverridesWithCompletionHandler:(id)a3;
- (void)closeDatabaseWithCompletionHandler:(id)a3;
- (void)getLatestResultForElementWithElement:(NSString *)a3 completionHandler:(id)a4;
- (void)iCloudAnalyticsEnabledWithCompletionHandler:(id)a3;
- (void)insertOSVersionWithOsVersion:(NSString *)a3 completionHandler:(id)a4;
- (void)insertResultWithElement:(NSString *)a3 samplesAgo:(int64_t)a4 success:(BOOL)a5 completionHandler:(id)a6;
- (void)reportWithCompletionHandler:(id)a3;
- (void)setHasDoneOSUpdateWithValue:(BOOL)a3 completionHandler:(id)a4;
- (void)setLastIDSRecWithRecommendation:(BOOL)a3 completionHandler:(id)a4;
- (void)setOverrideReportValueWithReportValue:(BOOL)a3 completionHandler:(id)a4;
- (void)setOverrideTimeBetweenReportsWithValue:(double)a3 completionHandler:(id)a4;
- (void)storeWithStatus:(_TtC13transparencyd25KTEligibilityStatusResult *)a3 completionHandler:(id)a4;
@end

@implementation KTEligibilityStatusReporting

- (_TtC13transparencyd28KTEligibilityStatusReporting)initWithPath:(id)a3 idsReporting:(id)a4 eligibilitySupport:(id)a5 error:(id *)a6
{
  uint64_t v8 = type metadata accessor for URL();
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (_TtC13transparencyd28KTEligibilityStatusReporting *)sub_1000EC940(v10, (uint64_t)a4, (uint64_t)a5);
}

- (void)reportWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100322290;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100322298;
  v12[5] = v11;
  swift_retain();
  sub_10008AE84((uint64_t)v7, (uint64_t)&unk_1003222A0, (uint64_t)v12);
  swift_release();
}

- (void)storeWithStatus:(_TtC13transparencyd25KTEligibilityStatusResult *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100322270;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100322278;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_10008AE84((uint64_t)v9, (uint64_t)&unk_100322280, (uint64_t)v14);
  swift_release();
}

- (void)iCloudAnalyticsEnabledWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100322250;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100322258;
  v12[5] = v11;
  swift_retain();
  sub_10008AE84((uint64_t)v7, (uint64_t)&unk_100322260, (uint64_t)v12);
  swift_release();
}

- (void)getLatestResultForElementWithElement:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100322230;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100322238;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_10008AE84((uint64_t)v9, (uint64_t)&unk_100322240, (uint64_t)v14);
  swift_release();
}

- (void)aggregateResultWithSamples:(int64_t)a3 element:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100322210;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100322218;
  v16[5] = v15;
  v17 = a4;
  swift_retain();
  sub_10008AE84((uint64_t)v11, (uint64_t)&unk_100322220, (uint64_t)v16);
  swift_release();
}

- (void)insertOSVersionWithOsVersion:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1003221F0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1003221F8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_10008AE84((uint64_t)v9, (uint64_t)&unk_100322200, (uint64_t)v14);
  swift_release();
}

- (void)cachedOSVersionWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1003221D0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1003221D8;
  v12[5] = v11;
  swift_retain();
  sub_10008AE84((uint64_t)v7, (uint64_t)&unk_1003221E0, (uint64_t)v12);
  swift_release();
}

- (void)cachedTimeOfLastReportWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1003221B0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1003221B8;
  v12[5] = v11;
  swift_retain();
  sub_10008AE84((uint64_t)v7, (uint64_t)&unk_1003221C0, (uint64_t)v12);
  swift_release();
}

- (void)cachedLastRecommendationWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100322190;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100322198;
  v12[5] = v11;
  swift_retain();
  sub_10008AE84((uint64_t)v7, (uint64_t)&unk_1003221A0, (uint64_t)v12);
  swift_release();
}

- (void)clearEligibilityOverridesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100322170;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100322178;
  v12[5] = v11;
  swift_retain();
  sub_10008AE84((uint64_t)v7, (uint64_t)&unk_100322180, (uint64_t)v12);
  swift_release();
}

- (void)clearReportOverridesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100322150;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100322158;
  v12[5] = v11;
  swift_retain();
  sub_10008AE84((uint64_t)v7, (uint64_t)&unk_100322160, (uint64_t)v12);
  swift_release();
}

- (void)setOverrideReportValueWithReportValue:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100322130;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100322138;
  v14[5] = v13;
  swift_retain();
  sub_10008AE84((uint64_t)v9, (uint64_t)&unk_100322140, (uint64_t)v14);
  swift_release();
}

- (void)setLastIDSRecWithRecommendation:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100322110;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100322118;
  v14[5] = v13;
  swift_retain();
  sub_10008AE84((uint64_t)v9, (uint64_t)&unk_100322120, (uint64_t)v14);
  swift_release();
}

- (void)setHasDoneOSUpdateWithValue:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1003220F0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1003220F8;
  v14[5] = v13;
  swift_retain();
  sub_10008AE84((uint64_t)v9, (uint64_t)&unk_100322100, (uint64_t)v14);
  swift_release();
}

- (void)setOverrideTimeBetweenReportsWithValue:(double)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(double *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1003220D0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1003220D8;
  v14[5] = v13;
  swift_retain();
  sub_10008AE84((uint64_t)v9, (uint64_t)&unk_1003220E0, (uint64_t)v14);
  swift_release();
}

- (void)insertResultWithElement:(NSString *)a3 samplesAgo:(int64_t)a4 success:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  *(unsigned char *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1003220B0;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1003220B8;
  v18[5] = v17;
  v19 = a3;
  swift_retain();
  sub_10008AE84((uint64_t)v13, (uint64_t)&unk_1003220C0, (uint64_t)v18);
  swift_release();
}

- (void)closeDatabaseWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100322088;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100322090;
  v12[5] = v11;
  swift_retain();
  sub_10008AE84((uint64_t)v7, (uint64_t)&unk_100322098, (uint64_t)v12);
  swift_release();
}

- (_TtC13transparencyd28KTEligibilityStatusReporting)init
{
  swift_defaultActor_initialize();
  result = (_TtC13transparencyd28KTEligibilityStatusReporting *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end