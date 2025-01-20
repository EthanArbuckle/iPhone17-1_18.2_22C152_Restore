@interface PCRuntimeParameters
+ (int64_t)contextPrefetchLimit;
+ (void)rateLimitRequestsInFeed:(float)a3 inArticle:(float)a4 betweenArticle:(float)a5 videoInArticle:(float)a6 nativeInFeed:(float)a7 nativeInArticle:(float)a8;
+ (void)setContextPrefetchLimit:(int64_t)a3;
@end

@implementation PCRuntimeParameters

+ (void)setContextPrefetchLimit:(int64_t)a3
{
  qword_26AB31BA0 = a3;
}

+ (int64_t)contextPrefetchLimit
{
  if (qword_26AB31BA0 >= 0) {
    return qword_26AB31BA0;
  }
  else {
    return 3;
  }
}

+ (void)rateLimitRequestsInFeed:(float)a3 inArticle:(float)a4 betweenArticle:(float)a5 videoInArticle:(float)a6 nativeInFeed:(float)a7 nativeInArticle:(float)a8
{
  v23[6] = *MEMORY[0x263EF8340];
  v22[0] = *MEMORY[0x263F20BC0];
  v13 = sub_220C1D7DC(a3);
  v23[0] = v13;
  v22[1] = *MEMORY[0x263F20BB8];
  v14 = sub_220C1D7DC(a4);
  v23[1] = v14;
  v22[2] = *MEMORY[0x263F20BB0];
  v15 = sub_220C1D7DC(a5);
  v23[2] = v15;
  v22[3] = *MEMORY[0x263F20BD8];
  v16 = sub_220C1D7DC(a6);
  v23[3] = v16;
  v22[4] = *MEMORY[0x263F20BD0];
  v17 = sub_220C1D7DC(a7);
  v23[4] = v17;
  v22[5] = *MEMORY[0x263F20BC8];
  v18 = sub_220C1D7DC(a8);
  v23[5] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:6];

  v20 = objc_msgSend(objc_alloc((Class)objc_msgSend(MEMORY[0x263F20BA8], "metricClass")), "initWithPurpose:metric:contentIdentifier:contextIdentifier:handle:branch:properties:internalProperties:relayData:environment:order:options:", -1, 77000, 0, 0, 0, 0, v19, 0, 0, 0, 0, 0);
  v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F20BA8], "daemonDeliveryClass"), "daemonDelivery");
  [v21 receivedMetric:v20];
}

@end