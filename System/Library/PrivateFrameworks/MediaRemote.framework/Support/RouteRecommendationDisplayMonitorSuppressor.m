@interface RouteRecommendationDisplayMonitorSuppressor
- (id)suppressionPolicyWithContext:(id)a3;
@end

@implementation RouteRecommendationDisplayMonitorSuppressor

- (id)suppressionPolicyWithContext:(id)a3
{
  uint64_t v4 = *(void *)&self->displayMonitor[24];
  uint64_t v5 = *(void *)&self->displayMonitor[32];
  sub_1001BDB5C(self->displayMonitor, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  id v7 = a3;
  swift_retain();
  if (v6(v4, v5))
  {
    type metadata accessor for RouteRecommendationSuppressionPolicy();
    v8 = (uint64_t *)sub_10030BC58();
    uint64_t v9 = *v8;
    uint64_t v10 = v8[1];
    swift_bridgeObjectRetain();
    id v11 = sub_10030BA90(v9, v10);

    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v11 = (id)*sub_10030BA44();

    swift_release();
  }

  return v11;
}

@end