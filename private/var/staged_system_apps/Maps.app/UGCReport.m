@interface UGCReport
- (BOOL)isComplete;
- (BOOL)shouldMigrateRatingsWithICloud;
- (FeedbackSubmissionManager)submitter;
- (MKMapItem)mapItem;
- (UGCReviewedPlace)newReviewedPlace;
- (_TtC4Maps9UGCReport)init;
- (_TtC4Maps9UGCReport)initWithReportType:(int64_t)a3 initialForm:(id)a4 mapItem:(id)a5 submitter:(id)a6;
- (id)buildPhotosSubmissionParameters;
- (id)buildRatingSubmissionParameters;
- (id)buildSubmissionParameters;
- (id)buildSubmissionParametersWithSubmissionFields:(id)a3;
- (void)fetchCoarsenedDeviceLocationWithCompletion:(id)a3;
- (void)persistSubmissionWithUpdatedReviewedPlace:(id)a3 communityIdentifier:(id)a4 completion:(id)a5;
- (void)setMapItem:(id)a3;
- (void)setNewReviewedPlace:(id)a3;
- (void)setShouldMigrateRatingsWithICloud:(BOOL)a3;
- (void)setSubmitter:(id)a3;
- (void)submitRatingsAndPhotosSimultaneouslyUsingDSIDWithUploadPolicy:(int64_t)a3 progressBlock:(id)a4 completion:(id)a5;
- (void)submitRatingsAndPhotosWithUploadPolicy:(int64_t)a3 progressBlock:(id)a4 completion:(id)a5;
@end

@implementation UGCReport

- (UGCReviewedPlace)newReviewedPlace
{
  v2 = self;
  v3 = (UGCReviewedPlace *)sub_10011FA10();

  return v3;
}

- (void)setNewReviewedPlace:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport____lazy_storage___newReviewedPlace);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport____lazy_storage___newReviewedPlace) = (Class)a3;
  id v3 = a3;
}

- (BOOL)isComplete
{
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_initialForm) isComplete];
}

- (FeedbackSubmissionManager)submitter
{
  return (FeedbackSubmissionManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                              + OBJC_IVAR____TtC4Maps9UGCReport_submitter));
}

- (void)setSubmitter:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_submitter);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_submitter) = (Class)a3;
  id v3 = a3;
}

- (MKMapItem)mapItem
{
  return (MKMapItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC4Maps9UGCReport_mapItem));
}

- (void)setMapItem:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_mapItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_mapItem) = (Class)a3;
  id v3 = a3;
}

- (BOOL)shouldMigrateRatingsWithICloud
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_shouldMigrateRatingsWithICloud);
}

- (void)setShouldMigrateRatingsWithICloud:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_shouldMigrateRatingsWithICloud) = a3;
}

- (_TtC4Maps9UGCReport)initWithReportType:(int64_t)a3 initialForm:(id)a4 mapItem:(id)a5 submitter:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = (_TtC4Maps9UGCReport *)sub_1001225EC(a3, v9, v10, v11);

  return v12;
}

- (_TtC4Maps9UGCReport)init
{
  result = (_TtC4Maps9UGCReport *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_mapItem);
}

- (void)submitRatingsAndPhotosSimultaneouslyUsingDSIDWithUploadPolicy:(int64_t)a3 progressBlock:(id)a4 completion:(id)a5
{
  v8 = (void (*)(id))_Block_copy(a4);
  id v9 = (uint64_t (*)())_Block_copy(a5);
  id v10 = v9;
  if (v8)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v8;
    v8 = (void (*)(id))sub_1001231FC;
    if (v10)
    {
LABEL_3:
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = v10;
      id v10 = sub_1001231F8;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
LABEL_6:
  v13 = self;
  sub_10011FF34(a3, v8, v11, (void (*)(void, uint64_t))v10, v12);
  sub_10006C5D8((uint64_t)v10);
  sub_10006C5D8((uint64_t)v8);
}

- (void)submitRatingsAndPhotosWithUploadPolicy:(int64_t)a3 progressBlock:(id)a4 completion:(id)a5
{
  v8 = (void (*)(id))_Block_copy(a4);
  id v9 = (uint64_t (*)())_Block_copy(a5);
  id v10 = v9;
  if (v8)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v8;
    v8 = (void (*)(id))sub_100118770;
    if (v10)
    {
LABEL_3:
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = v10;
      id v10 = sub_1001231F8;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
LABEL_6:
  v13 = self;
  sub_100120754(a3, v8, v11, (uint64_t)v10, v12);
  sub_10006C5D8((uint64_t)v10);
  sub_10006C5D8((uint64_t)v8);
}

- (id)buildSubmissionParameters
{
  return sub_100121D6C(self, (uint64_t)a2, (SEL *)&selRef_fillSubmissionFields_);
}

- (id)buildRatingSubmissionParameters
{
  return sub_100121D6C(self, (uint64_t)a2, (SEL *)&selRef_fillSubmissionFieldsForRatings_);
}

- (id)buildPhotosSubmissionParameters
{
  id v3 = objc_allocWithZone((Class)UGCSubmissionFields);
  id v4 = self;
  id v5 = [v3 init];
  id v6 = [self emptyRatingForm];
  [v6 fillSubmissionFields:v5];
  [*(id *)((char *)&v4->super.isa + OBJC_IVAR____TtC4Maps9UGCReport_initialForm) fillSubmissionFieldsForPhotos:v5];
  id v7 = [(UGCReport *)v4 buildSubmissionParametersWithSubmissionFields:v5];

  return v7;
}

- (id)buildSubmissionParametersWithSubmissionFields:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = (void *)sub_100121EFC(v4);

  return v6;
}

- (void)fetchCoarsenedDeviceLocationWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  id v5 = self;
  sub_1001226D8((uint64_t)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)persistSubmissionWithUpdatedReviewedPlace:(id)a3 communityIdentifier:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  id v12 = a3;
  v13 = self;
  sub_1001228C8(v12, v9, (uint64_t)a4, (uint64_t)sub_1001225E4, v11);

  swift_release();

  swift_bridgeObjectRelease();
}

@end