@interface BKServiceCenter
- (BKPriceTrackingService)priceTrackingService;
- (BKReadingActivityService)readingActivityService;
- (BKServiceCenter)init;
- (BKServiceCenter)initWithAppConfiguration:(id)a3;
- (BKWidgetService)widgetService;
- (BKYearInReviewEligibilityService)yearInReviewEligibilityService;
- (void)deleteCloudDataWithCompletion:(id)a3;
- (void)setupServicesWithLibraryManager:(id)a3 appDelegate:(id)a4;
@end

@implementation BKServiceCenter

- (void)setupServicesWithLibraryManager:(id)a3 appDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  ServiceCenter.setupServices(withLibraryManager:appDelegate:)(v6, v7);
}

- (BKPriceTrackingService)priceTrackingService
{
  type metadata accessor for PriceTrackingService();
  v3 = self;
  sub_100058D18(&qword_100B3D848);
  uint64_t v4 = sub_1007FDD00();
  id v6 = (void *)sub_100041594(v4, v5, (void (*)(void))type metadata accessor for PriceTrackingService);

  swift_bridgeObjectRelease();

  return (BKPriceTrackingService *)v6;
}

- (BKServiceCenter)initWithAppConfiguration:(id)a3
{
  uint64_t v4 = (char *)objc_allocWithZone((Class)swift_getObjectType());
  uint64_t v5 = (BKServiceCenter *)sub_10001BE10(a3, v4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (BKYearInReviewEligibilityService)yearInReviewEligibilityService
{
  return (BKYearInReviewEligibilityService *)sub_1000393CC(self, (uint64_t)a2, (void (*)(void))type metadata accessor for YearInReviewEligibilityService, &qword_100B3D840, (void (*)(void))type metadata accessor for YearInReviewEligibilityService);
}

- (BKReadingActivityService)readingActivityService
{
  return (BKReadingActivityService *)sub_1000393CC(self, (uint64_t)a2, (void (*)(void))type metadata accessor for ReadingActivityService, &qword_100B45B20, (void (*)(void))type metadata accessor for ReadingActivityService);
}

- (BKWidgetService)widgetService
{
  return (BKWidgetService *)sub_1000393CC(self, (uint64_t)a2, (void (*)(void))type metadata accessor for WidgetService, &qword_100B3D838, (void (*)(void))type metadata accessor for WidgetService);
}

- (BKServiceCenter)init
{
  return (BKServiceCenter *)sub_100645434();
}

- (void)deleteCloudDataWithCompletion:(id)a3
{
  uint64_t v5 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_100647718;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = v8;
  v11[6] = v9;
  v12 = self;
  sub_10003E148((uint64_t)v8);
  sub_10004BC14((uint64_t)v7, (uint64_t)&unk_100B3FF40, (uint64_t)v11);
  swift_release();
  sub_10003E138((uint64_t)v8);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end