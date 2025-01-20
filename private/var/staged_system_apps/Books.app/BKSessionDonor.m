@interface BKSessionDonor
- (BKSessionDonor)init;
- (BKSessionDonor)initWithType:(id)a3;
- (BOOL)isCarPlayConnected;
- (uint64_t)libraryProvider:(uint64_t)a3 contentDidLoad:;
- (void)donateWithConfiguration:(id)a3 context:(id)a4 donationCompleteBlock:(id)a5;
- (void)reportAddToWTRButtonUsed;
- (void)reportAppleWatchAppUsed;
- (void)reportCarplayAppUsed;
- (void)reportNotificationSettingsVisited;
- (void)reportPreviewButtonUsed;
- (void)reportProductPageViewed:(id)a3 :(id)a4 :(BOOL)a5;
- (void)reportPurchase:(id)a3;
- (void)reportSampleButtonUsed;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)timeTracker:(id)a3 didBeginTrackingSession:(id)a4 trackerEventType:(unint64_t)a5 asset:(id)a6 readingFeatureFlags:(int64_t)a7;
- (void)timeTracker:(id)a3 didEndTrackingSession:(id)a4 duration:(double)a5 trackerEventType:(unint64_t)a6 asset:(id)a7 readingFeatureFlags:(int64_t)a8;
- (void)userNotificationSettingsDidChange;
@end

@implementation BKSessionDonor

- (BKSessionDonor)init
{
  NSString v3 = sub_1007FDC30();
  v4 = [(BKSessionDonor *)self initWithType:v3];

  return v4;
}

- (void)donateWithConfiguration:(id)a3 context:(id)a4 donationCompleteBlock:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_1007FDC70();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_copy(v8);
  id v11 = a3;
  v12 = self;
  sub_10004ABE0((uint64_t)v11, v9, (uint64_t)a4, v12, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (BOOL)isCarPlayConnected
{
  v2 = *(void **)&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_carSessionStatus];
  if (!v2) {
    return 0;
  }
  NSString v3 = self;
  id v4 = [v2 currentSession];

  if (!v4) {
    return 0;
  }

  return 1;
}

- (uint64_t)libraryProvider:(uint64_t)a3 contentDidLoad:
{
  sub_10004A860(0, (unint64_t *)&unk_100B2FF20);
  unint64_t v5 = sub_1007FDFF0();
  swift_unknownObjectRetain();
  id v6 = a1;
  sub_1000635E8(a3, v5);
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

- (BKSessionDonor)initWithType:(id)a3
{
  return (BKSessionDonor *)sub_10003A1C4();
}

- (void)reportPurchase:(id)a3
{
  uint64_t v4 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1007FDA70();
  uint64_t v8 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  uint64_t v9 = qword_100B22740;
  v10 = self;
  swift_bridgeObjectRetain();
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_100B2FBA0;
  uint64_t v12 = sub_10004BDCC(&qword_100B2EDA0, (void (*)(uint64_t))type metadata accessor for PropertyValueActor.ActorType);
  v13 = (void *)swift_allocObject();
  v13[2] = v11;
  v13[3] = v12;
  v13[4] = v10;
  v13[5] = v7;
  swift_retain();
  sub_10004BC14((uint64_t)v6, (uint64_t)&unk_100B2EDA8, (uint64_t)v13);
  swift_release();
  [(BKSessionDonor *)v10 propertyDidChange:v10 propertyConfiguration:*(void *)&v10->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_sessionConfiguration]];

  swift_bridgeObjectRelease();
}

- (void)reportNotificationSettingsVisited
{
}

- (void)reportSampleButtonUsed
{
}

- (void)reportPreviewButtonUsed
{
}

- (void)reportAddToWTRButtonUsed
{
}

- (void)reportAppleWatchAppUsed
{
}

- (void)reportCarplayAppUsed
{
}

- (void)reportProductPageViewed:(id)a3 :(id)a4 :(BOOL)a5
{
  uint64_t v7 = sub_1007FDC70();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1007FDC70();
  uint64_t v12 = v11;
  v13 = self;
  sub_1003B8D44(v7, v9, v10, v12, a5);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  NSString v3 = &self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_sessionStartDate];
  uint64_t v4 = sub_1007F2BA0();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)timeTracker:(id)a3 didBeginTrackingSession:(id)a4 trackerEventType:(unint64_t)a5 asset:(id)a6 readingFeatureFlags:(int64_t)a7
{
  uint64_t v10 = sub_1007F2BF0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2BD0();
  id v14 = a3;
  swift_unknownObjectRetain();
  v15 = self;
  sub_1003BAA44((uint64_t)v13, a6);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)timeTracker:(id)a3 didEndTrackingSession:(id)a4 duration:(double)a5 trackerEventType:(unint64_t)a6 asset:(id)a7 readingFeatureFlags:(int64_t)a8
{
  uint64_t v10 = sub_1007F2BF0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2BD0();
  id v14 = a3;
  swift_unknownObjectRetain();
  v15 = self;
  sub_1003BAE9C((uint64_t)v13);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003BAFE0();
}

- (void)sessionDidDisconnect:(id)a3
{
}

- (void)userNotificationSettingsDidChange
{
  v2 = self;
  sub_1003BA7B8();
}

@end