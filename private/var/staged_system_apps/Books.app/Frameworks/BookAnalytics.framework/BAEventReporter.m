@interface BAEventReporter
+ (BAEventReporter)sharedReporter;
- (BAEventReporter)init;
- (int64_t)seriesTypeForContentID:(id)a3;
- (void)emitAccountDidChangeEventWithTracker:(id)a3 type:(unint64_t)a4 reason:(unint64_t)a5;
- (void)emitAddToCollectionEventWithTracker:(id)a3 collectionID:(id)a4 contentData:(id)a5;
- (void)emitAddToCollectionEventWithTracker:(id)a3 collectionID:(id)a4 contentID:(id)a5 contentAcquisitionType:(int64_t)a6 contentType:(int64_t)a7 supplementalContentCount:(id)a8 seriesType:(int64_t)a9 productionType:(int64_t)a10;
- (void)emitAllInSeriesViewEventWithTracker:(id)a3 collectionID:(id)a4 collectionItemCount:(int64_t)a5;
- (void)emitAnnotationActionEventWithTracker:(id)a3 contentData:(id)a4 viewData:(id)a5;
- (void)emitBrowseCollectionScreenViewEventWithTracker:(id)a3 startDate:(id)a4 summaryData:(id)a5;
- (void)emitCloseSupplementalContentPDFPickerWithTracker:(id)a3 contentID:(id)a4 supplementalContentCount:(id)a5;
- (void)emitCollectionAddEventWithTracker:(id)a3 collectionID:(id)a4 collectionItemCount:(int64_t)a5;
- (void)emitCollectionDescriptionEventWithTracker:(id)a3 collectionID:(id)a4;
- (void)emitCollectionRemoveEventWithTracker:(id)a3 collectionID:(id)a4 collectionItemCount:(int64_t)a5;
- (void)emitCollectionScreenViewEventWithTracker:(id)a3 startDate:(id)a4 collectionID:(id)a5 collectionItemCount:(int64_t)a6;
- (void)emitContextualActionSheetExposureEventWithTracker:(id)a3 startDate:(id)a4 propertyProvider:(id)a5;
- (void)emitDragDropEventWithContentIDs:(id)a3;
- (void)emitExitLinkTapEventWithTracker:(id)a3 url:(id)a4;
- (void)emitGetStartedActionEventWithTracker:(id)a3 type:(int64_t)a4;
- (void)emitGetStartedViewEventWithTracker:(id)a3 startDate:(id)a4;
- (void)emitHideBookEventWithTracker:(id)a3 contentData:(id)a4;
- (void)emitInBookSearchEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5;
- (void)emitLibraryDataEditEventWithTracker:(id)a3 contentIDs:(id)a4 actionType:(int64_t)a5 result:(BOOL)a6;
- (void)emitLibraryViewEventWithTracker:(id)a3 startDate:(id)a4 librarySummary:(id)a5 displayType:(int64_t)a6 sortType:(int64_t)a7;
- (void)emitMarkAsFinishedEventWithTracker:(id)a3 contentData:(id)a4 markedData:(id)a5;
- (void)emitMarkAsFinishedEventWithTracker:(id)a3 contentID:(id)a4 contentAcquisitionType:(int64_t)a5 contentType:(int64_t)a6 supplementalContentCount:(id)a7 seriesType:(int64_t)a8 productionType:(int64_t)a9;
- (void)emitNotificationEngagementEventWithTracker:(id)a3 engagementData:(id)a4 notificationData:(id)a5;
- (void)emitPageViewEventForSupplementalContentPDFWithTracker:(id)a3 contentID:(id)a4 supplementalContentCount:(id)a5;
- (void)emitPurchaseAttemptEventWithTracker:(id)a3 contentData:(id)a4 purchaseData:(id)a5 upSellData:(id)a6;
- (void)emitPurchaseFailEventWithTracker:(_TtC13BookAnalytics9BATracker *)a3 contentData:(BAContentData *)a4 purchaseData:(BAPurchaseData *)a5 upSellData:(BAUpSellData *)a6 failData:(BAPurchaseFailData *)a7 completion:(id)a8;
- (void)emitPurchaseSuccessEventWithTracker:(_TtC13BookAnalytics9BATracker *)a3 contentData:(BAContentData *)a4 purchaseData:(BAPurchaseData *)a5 upSellData:(BAUpSellData *)a6 completion:(id)a7;
- (void)emitRatingEventWithTracker:(id)a3 rating:(id)a4 contentID:(id)a5 contentAcquisitionType:(int64_t)a6 contentType:(int64_t)a7 supplementalContentCount:(id)a8 productionType:(int64_t)a9;
- (void)emitReadEventWithTracker:(_TtC13BookAnalytics9BATracker *)a3 readingSessionData:(BAReadingSessionData *)a4 contentData:(BAContentData *)a5 readingSettingsData:(BAReadingSettingsData *)a6 upSellData:(BAUpSellData *)a7 contentSettingsData:(BAContentSettingsData *)a8 doNotDisturbData:(BADoNotDisturbData *)a9 startTime:(NSDate *)a10 completion:(id)a11;
- (void)emitReadingAutoNightSettingChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 isOn:(BOOL)a6;
- (void)emitReadingBackgroundColorChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 backgroundColorData:(id)a6;
- (void)emitReadingBrightnessChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 brightness:(int)a6;
- (void)emitReadingFontChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 fontName:(id)a6;
- (void)emitReadingFontSizeChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 fontSize:(float)a6;
- (void)emitReadingOrientationChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5;
- (void)emitReadingScrollViewSettingChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 fontSize:(float)a6 isOn:(BOOL)a7;
- (void)emitRemoveFromCollectionEventWithTracker:(id)a3 collectionID:(id)a4 contentData:(id)a5;
- (void)emitRemoveFromCollectionEventWithTracker:(id)a3 collectionID:(id)a4 contentID:(id)a5 contentAcquisitionType:(int64_t)a6 contentType:(int64_t)a7 supplementalContentCount:(id)a8 seriesType:(int64_t)a9 productionType:(int64_t)a10;
- (void)emitRemoveFromWantListEventWithTracker:(id)a3 contentData:(id)a4;
- (void)emitRemoveFromWantListEventWithTracker:(id)a3 contentID:(id)a4 contentType:(int64_t)a5;
- (void)emitScrubEventWithTracker:(id)a3 contentData:(id)a4 readingSettingsData:(id)a5 startPosition:(id)a6 endPosition:(id)a7 totalLength:(id)a8;
- (void)emitShareEventWithTracker:(id)a3 propertyProvider:(id)a4;
- (void)emitShareSheetExposureEventWithTracker:(id)a3 startDate:(id)a4 propertyProvider:(id)a5;
- (void)emitTabViewEventWithTracker:(id)a3 startDate:(id)a4;
- (void)emitUnifiedMessageActionEventWithTracker:(id)a3 startDate:(id)a4 messageType:(int64_t)a5 messageIdentifier:(id)a6 hasActionable:(BOOL)a7 actionIdentifier:(id)a8 placementName:(id)a9;
- (void)emitUnifiedMessageExposureEventWithTracker:(id)a3 startDate:(id)a4 messageType:(int64_t)a5 messageIdentifier:(id)a6 hasActionable:(BOOL)a7 actionIdentifier:(id)a8 placementName:(id)a9;
- (void)emitViewSupplementalContentWithTracker:(id)a3 contentID:(id)a4 sourceIsAction:(BOOL)a5 supplementalContentCount:(id)a6;
- (void)emitWantListAddEventWithTracker:(id)a3 contentData:(id)a4;
- (void)emitWantListAddEventWithTracker:(id)a3 contentID:(id)a4 contentAcquisitionType:(int64_t)a5 contentType:(int64_t)a6 supplementalContentCount:(id)a7 seriesType:(int64_t)a8 productionType:(int64_t)a9;
- (void)emitWidgetEngagementEventWithTracker:(id)a3 widgetData:(id)a4;
@end

@implementation BAEventReporter

- (void)emitAddToCollectionEventWithTracker:(id)a3 collectionID:(id)a4 contentID:(id)a5 contentAcquisitionType:(int64_t)a6 contentType:(int64_t)a7 supplementalContentCount:(id)a8 seriesType:(int64_t)a9 productionType:(int64_t)a10
{
}

- (void)emitAddToCollectionEventWithTracker:(id)a3 collectionID:(id)a4 contentData:(id)a5
{
}

- (void)emitCollectionAddEventWithTracker:(id)a3 collectionID:(id)a4 collectionItemCount:(int64_t)a5
{
  uint64_t v7 = sub_27DDB0();
  uint64_t v9 = v8;
  v10 = self;
  id v11 = a3;
  if (a3) {
    goto LABEL_4;
  }
  id v12 = sub_103814();
  if (v12)
  {
    id v11 = v12;
LABEL_4:
    v13 = (void *)swift_allocObject();
    v13[2] = a5;
    v13[3] = v7;
    v13[4] = v9;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_69CE8;
    *(void *)(v14 + 24) = v13;
    id v15 = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_27D730();

    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
LABEL_5:
}

- (void)emitCollectionDescriptionEventWithTracker:(id)a3 collectionID:(id)a4
{
  uint64_t v6 = sub_27DDB0();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  *(void *)(v9 + 24) = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_69D88;
  *(void *)(v10 + 24) = v9;
  id v11 = a3;
  id v12 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_27D730();

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)emitCollectionRemoveEventWithTracker:(id)a3 collectionID:(id)a4 collectionItemCount:(int64_t)a5
{
  uint64_t v7 = sub_27DDB0();
  uint64_t v9 = v8;
  uint64_t v10 = self;
  id v11 = a3;
  if (a3) {
    goto LABEL_4;
  }
  id v12 = sub_103814();
  if (v12)
  {
    id v11 = v12;
LABEL_4:
    v13 = (void *)swift_allocObject();
    v13[2] = a5;
    v13[3] = v7;
    v13[4] = v9;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_69CE4;
    *(void *)(v14 + 24) = v13;
    id v15 = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_27D730();

    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
LABEL_5:
}

- (void)emitLibraryDataEditEventWithTracker:(id)a3 contentIDs:(id)a4 actionType:(int64_t)a5 result:(BOOL)a6
{
  uint64_t v9 = sub_27DEF0();
  uint64_t v10 = self;
  id v11 = a3;
  if (a3) {
    goto LABEL_4;
  }
  id v12 = sub_103814();
  if (v12)
  {
    id v11 = v12;
LABEL_4:
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v9;
    *(void *)(v13 + 24) = v11;
    *(void *)(v13 + 32) = a5;
    *(unsigned char *)(v13 + 40) = a6;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_69CF4;
    *(void *)(v14 + 24) = v13;
    id v15 = a3;
    swift_bridgeObjectRetain();
    id v16 = v11;
    swift_retain();
    sub_27D730();

    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
LABEL_5:
}

- (void)emitMarkAsFinishedEventWithTracker:(id)a3 contentID:(id)a4 contentAcquisitionType:(int64_t)a5 contentType:(int64_t)a6 supplementalContentCount:(id)a7 seriesType:(int64_t)a8 productionType:(int64_t)a9
{
}

- (void)emitMarkAsFinishedEventWithTracker:(id)a3 contentData:(id)a4 markedData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = self;
  _s13BookAnalytics13EventReporterC018emitMarkAsFinishedC05using4with10markedDatayAA9BATrackerCSg_AA014BridgedContentL0CAA0n6MarkedL0CSgtF_0(a3, (uint64_t)v10, (uint64_t)a5);
}

- (void)emitRemoveFromCollectionEventWithTracker:(id)a3 collectionID:(id)a4 contentID:(id)a5 contentAcquisitionType:(int64_t)a6 contentType:(int64_t)a7 supplementalContentCount:(id)a8 seriesType:(int64_t)a9 productionType:(int64_t)a10
{
}

- (void)emitRemoveFromCollectionEventWithTracker:(id)a3 collectionID:(id)a4 contentData:(id)a5
{
}

- (void)emitRemoveFromWantListEventWithTracker:(id)a3 contentID:(id)a4 contentType:(int64_t)a5
{
  uint64_t v8 = sub_27DDB0();
  uint64_t v10 = v9;
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v8;
  v11[4] = v10;
  v11[5] = a5;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_69CF0;
  *(void *)(v12 + 24) = v11;
  id v13 = a3;
  uint64_t v14 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_27D730();

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)emitRemoveFromWantListEventWithTracker:(id)a3 contentData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_DF4A4((uint64_t)v14);
  uint64_t v9 = (_OWORD *)swift_allocObject();
  long long v10 = v14[3];
  v9[3] = v14[2];
  v9[4] = v10;
  long long v11 = v14[5];
  v9[5] = v14[4];
  v9[6] = v11;
  long long v12 = v14[1];
  v9[1] = v14[0];
  v9[2] = v12;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_69D7C;
  *(void *)(v13 + 24) = v9;
  sub_68EB8((uint64_t)v14);
  swift_retain();
  sub_27D730();
  swift_release();
  swift_release();
  sub_6957C((uint64_t)v14);
}

- (void)emitWantListAddEventWithTracker:(id)a3 contentID:(id)a4 contentAcquisitionType:(int64_t)a5 contentType:(int64_t)a6 supplementalContentCount:(id)a7 seriesType:(int64_t)a8 productionType:(int64_t)a9
{
}

- (void)emitWantListAddEventWithTracker:(id)a3 contentData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  _s13BookAnalytics13EventReporterC015emitWantListAddC05using4withyAA9BATrackerCSg_AA18BridgedContentDataCtF_0(a3);
}

+ (BAEventReporter)sharedReporter
{
  if (qword_315750 != -1) {
    swift_once();
  }
  v2 = (void *)qword_319F60;

  return (BAEventReporter *)v2;
}

- (int64_t)seriesTypeForContentID:(id)a3
{
  uint64_t v4 = sub_27DDB0();
  uint64_t v6 = v5;
  id v7 = self;
  int64_t v8 = sub_AD004(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)emitAccountDidChangeEventWithTracker:(id)a3 type:(unint64_t)a4 reason:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = self;
  sub_AD0FC((uint64_t)v8, a4, a5);
}

- (void)emitDragDropEventWithContentIDs:(id)a3
{
  uint64_t v4 = sub_27DEF0();
  uint64_t v5 = self;
  sub_AD36C(v4);

  swift_bridgeObjectRelease();
}

- (void)emitHideBookEventWithTracker:(id)a3 contentData:(id)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a4;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_AE190;
  *(void *)(v8 + 24) = v7;
  id v9 = a4;
  id v10 = a3;
  long long v11 = self;
  swift_retain();
  sub_27D730();

  swift_release();

  swift_release();
}

- (void)emitInBookSearchEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v21 = self;
  sub_E1AD0((uint64_t)&v22);
  int v10 = v22;
  char v11 = v23;
  int v12 = v24;
  char v13 = v25;
  LOBYTE(self) = v26;
  char v14 = v27;
  sub_DF4A4((uint64_t)v28);
  uint64_t v15 = swift_allocObject();
  *(_DWORD *)(v15 + 16) = v10;
  *(unsigned char *)(v15 + 20) = v11;
  *(_DWORD *)(v15 + 24) = v12;
  *(unsigned char *)(v15 + 28) = v13;
  *(unsigned char *)(v15 + 29) = (_BYTE)self;
  *(unsigned char *)(v15 + 30) = v14;
  long long v16 = v28[5];
  *(_OWORD *)(v15 + 96) = v28[4];
  *(_OWORD *)(v15 + 112) = v16;
  long long v17 = v28[3];
  *(_OWORD *)(v15 + 64) = v28[2];
  *(_OWORD *)(v15 + 80) = v17;
  long long v18 = v28[1];
  *(_OWORD *)(v15 + 32) = v28[0];
  *(_OWORD *)(v15 + 48) = v18;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_AD4C4;
  *(void *)(v19 + 24) = v15;
  sub_68EB8((uint64_t)v28);
  swift_retain();
  sub_27D730();
  swift_release();
  swift_release();
  sub_6957C((uint64_t)v28);
}

- (void)emitRatingEventWithTracker:(id)a3 rating:(id)a4 contentID:(id)a5 contentAcquisitionType:(int64_t)a6 contentType:(int64_t)a7 supplementalContentCount:(id)a8 productionType:(int64_t)a9
{
  uint64_t v14 = sub_27DDB0();
  uint64_t v16 = v15;
  id v17 = a3;
  id v18 = a4;
  id v19 = a8;
  id v20 = self;
  sub_ABCF0(a3, v18, v14, v16, a6, a7, a8, a9);

  swift_bridgeObjectRelease();
}

- (void)emitShareEventWithTracker:(id)a3 propertyProvider:(id)a4
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = self;
  sub_AC3F4(a3, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)emitWidgetEngagementEventWithTracker:(id)a3 widgetData:(id)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a4;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_AE18C;
  *(void *)(v8 + 24) = v7;
  id v9 = a4;
  id v10 = a3;
  char v11 = self;
  swift_retain();
  sub_27D730();

  swift_release();

  swift_release();
}

- (BAEventReporter)init
{
  uint64_t v3 = OBJC_IVAR___BAEventReporter_dataProviders;
  sub_4E04(&qword_319FA8);
  uint64_t v4 = swift_allocObject();
  *(_DWORD *)(v4 + 24) = 0;
  *(void *)(v4 + 16) = _swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + v3) = (Class)v4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for EventReporter();
  return [(BAEventReporter *)&v6 init];
}

- (void).cxx_destruct
{
}

- (void)emitReadEventWithTracker:(_TtC13BookAnalytics9BATracker *)a3 readingSessionData:(BAReadingSessionData *)a4 contentData:(BAContentData *)a5 readingSettingsData:(BAReadingSettingsData *)a6 upSellData:(BAUpSellData *)a7 contentSettingsData:(BAContentSettingsData *)a8 doNotDisturbData:(BADoNotDisturbData *)a9 startTime:(NSDate *)a10 completion:(id)a11
{
  v37 = a9;
  v38 = a8;
  uint64_t v17 = sub_4E04(&qword_320350);
  __chkstk_darwin(v17 - 8);
  v36 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = _Block_copy(a11);
  id v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v21 = v38;
  v20[6] = a7;
  v20[7] = v21;
  v20[8] = a9;
  v20[9] = a10;
  v20[10] = v19;
  v20[11] = self;
  uint64_t v22 = sub_27DF30();
  uint64_t v23 = (uint64_t)v36;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v36, 1, 1, v22);
  int v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_31AAC8;
  v24[5] = v20;
  char v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_31AAD0;
  v25[5] = v24;
  char v26 = a3;
  char v27 = a4;
  v28 = a5;
  v29 = a6;
  v30 = a7;
  v31 = v38;
  v32 = v37;
  v33 = a10;
  v34 = self;
  sub_11AFB0(v23, (uint64_t)&unk_31AAD8, (uint64_t)v25);
  swift_release();
}

- (void)emitReadingAutoNightSettingChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 isOn:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = self;
  _s13BookAnalytics13EventReporterC033emitReadingAutoNightSettingChangeC05using18readingSessionData07contentN04isOnyAA9BATrackerCSg_AA07BridgedfmN0CAA0s7ContentN0CSbtF_0(a3, (uint64_t)v12, (uint64_t)v13, a6);
}

- (void)emitReadingBackgroundColorChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 backgroundColorData:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = self;
  _s13BookAnalytics13EventReporterC032emitReadingBackgroundColorChangeC05using18readingSessionData07contentM0010backgroundhM0yAA9BATrackerCSg_AA07BridgedflM0CAA0q7ContentM0CAA0qghM0CtF_0(a3, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14);
}

- (void)emitReadingBrightnessChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 brightness:(int)a6
{
  id v20 = a4;
  id v10 = a5;
  id v11 = self;
  id v12 = a3;
  if (a3) {
    goto LABEL_4;
  }
  id v13 = sub_103814();
  if (v13)
  {
    id v12 = v13;
LABEL_4:
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v20;
    *(void *)(v14 + 24) = v10;
    *(_DWORD *)(v14 + 32) = a6;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_C80A4;
    *(void *)(v15 + 24) = v14;
    id v16 = a3;
    id v17 = v20;
    id v18 = v10;
    id v19 = v16;
    swift_retain();
    sub_27D730();

    swift_release();
    swift_release();
    goto LABEL_5;
  }

LABEL_5:
}

- (void)emitReadingFontChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 fontName:(id)a6
{
  uint64_t v10 = sub_27DDB0();
  uint64_t v12 = v11;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = self;
  _s13BookAnalytics13EventReporterC021emitReadingFontChangeC05using18readingSessionData07contentL08fontNameyAA9BATrackerCSg_AA07BridgedfkL0CAA0q7ContentL0CSStF_0(a3, (uint64_t)v14, (uint64_t)v15, v10, v12);

  swift_bridgeObjectRelease();
}

- (void)emitReadingOrientationChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = self;
  sub_E1AD0((uint64_t)&v49);
  int v43 = v49;
  char v44 = v50;
  int v45 = v51;
  char v46 = v52;
  char v47 = v53;
  char v48 = v54;
  sub_DF4A4((uint64_t)&v28);
  long long v13 = v28;
  char v14 = v29;
  uint64_t v15 = v30;
  uint64_t v16 = v31;
  uint64_t v17 = v32;
  uint64_t v18 = v33;
  __int16 v19 = v34;
  int v20 = v35;
  char v21 = v36;
  int v22 = v37;
  char v23 = v38;
  int v24 = v39;
  char v25 = v40;
  uint64_t v26 = v41;
  uint64_t v27 = v42;
  _s13BookAnalytics13EventReporterC028emitReadingOrientationChangeC05using18readingSessionData07contentL0yAA9BATrackerCSg_AA0fkL0VAA07ContentL0VtF_0(a3, &v43, &v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)emitReadingFontSizeChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 fontSize:(float)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  char v14 = self;
  _s13BookAnalytics13EventReporterC025emitReadingFontSizeChangeC05using18readingSessionData07contentM004fontH0yAA9BATrackerCSg_AA07BridgedflM0CAA0q7ContentM0CSftF_0(a3, a6);
}

- (void)emitReadingScrollViewSettingChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 fontSize:(float)a6 isOn:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = self;
  _s13BookAnalytics13EventReporterC034emitReadingScrollViewSettingChangeC05using18readingSessionData07contentN08fontSize4isOnyAA9BATrackerCSg_AA07BridgedfmN0CAA0u7ContentN0CSfSbtF_0(a3, a6, (uint64_t)v14, (uint64_t)v15, a7);
}

- (void)emitAllInSeriesViewEventWithTracker:(id)a3 collectionID:(id)a4 collectionItemCount:(int64_t)a5
{
  uint64_t v8 = sub_27DDB0();
  uint64_t v10 = v9;
  id v11 = (void *)swift_allocObject();
  v11[2] = a5;
  v11[3] = v8;
  v11[4] = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_CE430;
  *(void *)(v12 + 24) = v11;
  id v13 = a3;
  id v14 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_27D730();

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)emitBrowseCollectionScreenViewEventWithTracker:(id)a3 startDate:(id)a4 summaryData:(id)a5
{
  uint64_t v8 = sub_27D0A0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v14 = (char *)&v21 - v13;
  sub_27D070();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16 + v15, v12, v8);
  *(void *)(v16 + ((v10 + v15 + 7) & 0xFFFFFFFFFFFFFFF8)) = a5;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_CD974;
  *(void *)(v17 + 24) = v16;
  id v18 = a5;
  id v19 = a3;
  int v20 = self;
  swift_retain();
  sub_27D730();

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

- (void)emitCollectionScreenViewEventWithTracker:(id)a3 startDate:(id)a4 collectionID:(id)a5 collectionItemCount:(int64_t)a6
{
  int64_t v22 = a6;
  char v23 = self;
  uint64_t v7 = sub_27D0A0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v22 - v12;
  sub_27D070();
  uint64_t v14 = sub_27DDB0();
  uint64_t v16 = v15;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  unint64_t v17 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  id v18 = (char *)swift_allocObject();
  *((void *)v18 + 2) = v22;
  *((void *)v18 + 3) = v14;
  *((void *)v18 + 4) = v16;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v18[v17], v11, v7);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_CD97C;
  *(void *)(v19 + 24) = v18;
  id v20 = a3;
  uint64_t v21 = v23;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_27D730();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)emitContextualActionSheetExposureEventWithTracker:(id)a3 startDate:(id)a4 propertyProvider:(id)a5
{
  uint64_t v8 = sub_27D0A0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v21 - v13;
  sub_27D070();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = (char *)swift_allocObject();
  *((void *)v16 + 2) = self;
  *((void *)v16 + 3) = a5;
  *((void *)v16 + 4) = a3;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v16[v15], v12, v8);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_CD998;
  *(void *)(v17 + 24) = v16;
  id v18 = a3;
  swift_unknownObjectRetain_n();
  uint64_t v19 = self;
  id v20 = v18;
  swift_retain();
  sub_27D730();

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

- (void)emitGetStartedViewEventWithTracker:(id)a3 startDate:(id)a4
{
  uint64_t v6 = sub_27D0A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v18 - v11;
  sub_27D070();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, v10, v6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_CD9B4;
  *(void *)(v15 + 24) = v14;
  id v16 = a3;
  uint64_t v17 = self;
  swift_retain();
  sub_27D730();

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)emitLibraryViewEventWithTracker:(id)a3 startDate:(id)a4 librarySummary:(id)a5 displayType:(int64_t)a6 sortType:(int64_t)a7
{
  int64_t v22 = a7;
  char v23 = self;
  uint64_t v9 = sub_27D0A0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  unint64_t v13 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v22 - v14;
  sub_27D070();
  type metadata accessor for BridgedLibraryItemTypeData();
  uint64_t v16 = sub_27DEF0();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = (char *)swift_allocObject();
  *((void *)v18 + 2) = v16;
  *((void *)v18 + 3) = a6;
  *((void *)v18 + 4) = v22;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v18[v17], v13, v9);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_CDA00;
  *(void *)(v19 + 24) = v18;
  id v20 = a3;
  uint64_t v21 = v23;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_27D730();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)emitShareSheetExposureEventWithTracker:(id)a3 startDate:(id)a4 propertyProvider:(id)a5
{
  uint64_t v8 = sub_27D0A0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v21 - v13;
  sub_27D070();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = (char *)swift_allocObject();
  *((void *)v16 + 2) = self;
  *((void *)v16 + 3) = a5;
  *((void *)v16 + 4) = a3;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v16[v15], v12, v8);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_CDA1C;
  *(void *)(v17 + 24) = v16;
  id v18 = a3;
  swift_unknownObjectRetain_n();
  uint64_t v19 = self;
  id v20 = v18;
  swift_retain();
  sub_27D730();

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

- (void)emitTabViewEventWithTracker:(id)a3 startDate:(id)a4
{
  uint64_t v6 = sub_27D0A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v18 - v11;
  sub_27D070();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, v10, v6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_CDA38;
  *(void *)(v15 + 24) = v14;
  id v16 = a3;
  uint64_t v17 = self;
  swift_retain();
  sub_27D730();

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)emitUnifiedMessageExposureEventWithTracker:(id)a3 startDate:(id)a4 messageType:(int64_t)a5 messageIdentifier:(id)a6 hasActionable:(BOOL)a7 actionIdentifier:(id)a8 placementName:(id)a9
{
  BOOL v35 = a7;
  int64_t v34 = a5;
  id v36 = a3;
  int v37 = self;
  uint64_t v11 = sub_27D0A0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v32 - v16;
  sub_27D070();
  if (!a6)
  {
    uint64_t v32 = 0;
    uint64_t v19 = 0;
    if (!a8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v32 = sub_27DDB0();
  uint64_t v19 = v18;
  if (a8) {
LABEL_3:
  }
    a8 = (id)sub_27DEF0();
LABEL_4:
  uint64_t v20 = sub_27DDB0();
  uint64_t v22 = v21;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  uint64_t v23 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v24 = v11;
  uint64_t v33 = v11;
  uint64_t v25 = (v23 + 72) & ~v23;
  uint64_t v26 = swift_allocObject();
  uint64_t v27 = v32;
  *(void *)(v26 + 16) = v34;
  *(void *)(v26 + 24) = v27;
  *(void *)(v26 + 32) = v19;
  *(unsigned char *)(v26 + 40) = v35;
  *(void *)(v26 + 48) = a8;
  *(void *)(v26 + 56) = v20;
  *(void *)(v26 + 64) = v22;
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v26 + v25, v15, v24);
  long long v28 = v36;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = sub_CDA84;
  *(void *)(v29 + 24) = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  id v30 = v28;
  uint64_t v31 = v37;
  swift_bridgeObjectRetain();
  sub_27D730();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v33);
}

- (void)emitPurchaseAttemptEventWithTracker:(id)a3 contentData:(id)a4 purchaseData:(id)a5 upSellData:(id)a6
{
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a4;
  v11[3] = a5;
  v11[4] = a6;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_11B968;
  *(void *)(v12 + 24) = v11;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = v13;
  id v17 = v14;
  id v18 = v15;
  id v19 = a3;
  uint64_t v20 = self;
  swift_retain();
  sub_27D730();

  swift_release();

  swift_release();
}

- (void)emitPurchaseSuccessEventWithTracker:(_TtC13BookAnalytics9BATracker *)a3 contentData:(BAContentData *)a4 purchaseData:(BAPurchaseData *)a5 upSellData:(BAUpSellData *)a6 completion:(id)a7
{
  uint64_t v13 = sub_4E04(&qword_320350);
  __chkstk_darwin(v13 - 8);
  id v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = _Block_copy(a7);
  id v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = sub_27DF30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  id v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_31D530;
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_31D538;
  v20[5] = v19;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  uint64_t v24 = a6;
  uint64_t v25 = self;
  sub_11AFB0((uint64_t)v15, (uint64_t)&unk_31D540, (uint64_t)v20);
  swift_release();
}

- (void)emitPurchaseFailEventWithTracker:(_TtC13BookAnalytics9BATracker *)a3 contentData:(BAContentData *)a4 purchaseData:(BAPurchaseData *)a5 upSellData:(BAUpSellData *)a6 failData:(BAPurchaseFailData *)a7 completion:(id)a8
{
  uint64_t v15 = sub_4E04(&qword_320350);
  __chkstk_darwin(v15 - 8);
  id v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = _Block_copy(a8);
  id v19 = (void *)swift_allocObject();
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = a6;
  v19[6] = a7;
  v19[7] = v18;
  v19[8] = self;
  uint64_t v20 = sub_27DF30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_31D500;
  v21[5] = v19;
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_31AAD0;
  v22[5] = v21;
  uint64_t v23 = a3;
  uint64_t v24 = a4;
  uint64_t v25 = a5;
  uint64_t v26 = a6;
  uint64_t v27 = a7;
  long long v28 = self;
  sub_11AFB0((uint64_t)v17, (uint64_t)&unk_31AAD8, (uint64_t)v22);
  swift_release();
}

- (void)emitAnnotationActionEventWithTracker:(id)a3 contentData:(id)a4 viewData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  _s13BookAnalytics13EventReporterC020emitAnnotationActionC05using11contentData04viewJ0yAA9BATrackerC_AA014BridgedContentJ0CAA0m4ViewJ0CtF_0();
}

- (void)emitExitLinkTapEventWithTracker:(id)a3 url:(id)a4
{
  uint64_t v6 = sub_27CFF0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  id v10 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v18 - v11;
  sub_27CFD0();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, v10, v6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_12FB9C;
  *(void *)(v15 + 24) = v14;
  id v16 = a3;
  id v17 = self;
  swift_retain();
  sub_27D730();

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)emitGetStartedActionEventWithTracker:(id)a3 type:(int64_t)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a4;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_130350;
  *(void *)(v8 + 24) = v7;
  id v9 = a3;
  id v10 = self;
  swift_retain();
  sub_27D730();

  swift_release();

  swift_release();
}

- (void)emitNotificationEngagementEventWithTracker:(id)a3 engagementData:(id)a4 notificationData:(id)a5
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a5;
  *(void *)(v9 + 24) = a4;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_130388;
  *(void *)(v10 + 24) = v9;
  id v11 = a4;
  id v12 = a5;
  id v13 = v11;
  id v14 = a3;
  uint64_t v15 = self;
  swift_retain();
  sub_27D730();

  swift_release();

  swift_release();
}

- (void)emitScrubEventWithTracker:(id)a3 contentData:(id)a4 readingSettingsData:(id)a5 startPosition:(id)a6 endPosition:(id)a7 totalLength:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = self;
  _s13BookAnalytics13EventReporterC09emitScrubC05using11contentData015readingSettingsI013startPosition03endM011totalLengthyAA9BATrackerC_AA014BridgedContentI0CAA0r7ReadingkI0CSo8NSNumberCA2RtF_0((uint64_t)v14, (uint64_t)v15, (uint64_t)v16, v17, v18, v19);
}

- (void)emitUnifiedMessageActionEventWithTracker:(id)a3 startDate:(id)a4 messageType:(int64_t)a5 messageIdentifier:(id)a6 hasActionable:(BOOL)a7 actionIdentifier:(id)a8 placementName:(id)a9
{
  uint64_t v13 = sub_27DDB0();
  uint64_t v15 = v14;
  if (a6)
  {
    a6 = (id)sub_27DDB0();
    uint64_t v17 = v16;
    if (!a8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v17 = 0;
  if (a8) {
LABEL_3:
  }
    a8 = (id)sub_27DEF0();
LABEL_4:
  uint64_t v18 = sub_27DDB0();
  uint64_t v20 = v19;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a5;
  *(void *)(v21 + 24) = v13;
  *(void *)(v21 + 32) = v15;
  *(void *)(v21 + 40) = a6;
  *(void *)(v21 + 48) = v17;
  *(unsigned char *)(v21 + 56) = a7;
  *(void *)(v21 + 64) = a8;
  *(void *)(v21 + 72) = v18;
  *(void *)(v21 + 80) = v20;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_12FE24;
  *(void *)(v22 + 24) = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  id v23 = a3;
  uint64_t v24 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_27D730();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)emitViewSupplementalContentWithTracker:(id)a3 contentID:(id)a4 sourceIsAction:(BOOL)a5 supplementalContentCount:(id)a6
{
  uint64_t v10 = sub_27DDB0();
  uint64_t v12 = v11;
  id v13 = a3;
  id v14 = a6;
  uint64_t v15 = self;
  EventReporter.emitViewSupplementalContent(using:for:sourceIsAction:with:)(a3, v10, v12, a5, a6);

  swift_bridgeObjectRelease();
}

- (void)emitCloseSupplementalContentPDFPickerWithTracker:(id)a3 contentID:(id)a4 supplementalContentCount:(id)a5
{
}

- (void)emitPageViewEventForSupplementalContentPDFWithTracker:(id)a3 contentID:(id)a4 supplementalContentCount:(id)a5
{
}

@end