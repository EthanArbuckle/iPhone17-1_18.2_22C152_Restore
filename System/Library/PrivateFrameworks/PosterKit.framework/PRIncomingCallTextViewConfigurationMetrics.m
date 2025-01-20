@interface PRIncomingCallTextViewConfigurationMetrics
+ (double)idealSpaceBetweenTopText:(id)a3 topFont:(id)a4 bottomText:(id)a5 bottomFont:(id)a6;
- (PRIncomingCallTextViewConfigurationMetrics)init;
@end

@implementation PRIncomingCallTextViewConfigurationMetrics

+ (double)idealSpaceBetweenTopText:(id)a3 topFont:(id)a4 bottomText:(id)a5 bottomFont:(id)a6
{
  uint64_t v8 = sub_18C2CAA00();
  uint64_t v10 = v9;
  uint64_t v11 = sub_18C2CAA00();
  uint64_t v13 = v12;
  id v14 = a4;
  id v15 = a6;
  swift_bridgeObjectRetain();
  sub_18C2A911C(v8, v10, v14, (uint64_t)v20);
  id v16 = v15;
  swift_bridgeObjectRetain();
  sub_18C2A911C(v11, v13, v16, (uint64_t)v21);
  sub_18C2A9538((uint64_t)v21);
  sub_18C2A9538((uint64_t)v20);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  double v17 = *(double *)&v20[12];
  double v18 = v22;

  return round(v17 + v18);
}

- (PRIncomingCallTextViewConfigurationMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IncomingCallTextViewConfigurationMetrics();
  return [(PRIncomingCallTextViewConfigurationMetrics *)&v3 init];
}

@end