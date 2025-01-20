@interface CRLAnalyticsSpatialPreview
+ (void)sendSpatialPreviewAnalyticsWithPreviewItem:(id)a3 isSharedWithSpatialParticipants:(BOOL)a4;
- (_TtC8Freeform26CRLAnalyticsSpatialPreview)init;
@end

@implementation CRLAnalyticsSpatialPreview

+ (void)sendSpatialPreviewAnalyticsWithPreviewItem:(id)a3 isSharedWithSpatialParticipants:(BOOL)a4
{
  v5 = a3;
  sub_101020D9C(v5, a4);
}

- (_TtC8Freeform26CRLAnalyticsSpatialPreview)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLAnalyticsSpatialPreview();
  return [(CRLAnalyticsSpatialPreview *)&v3 init];
}

@end