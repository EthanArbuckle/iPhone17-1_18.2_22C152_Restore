@interface APAttributionRetryWorkerBridge
+ (BOOL)startWithSession:(id)a3 request:(id)a4 requestorId:(id)a5 intervalId:(unint64_t)a6 reportingStorefront:(id)a7 requestTimestamp:(id)a8 daemonStartTime:(id)a9 tokenReturnedToClientDate:(id)a10 payloadDeliveryStartDate:(id)a11;
- (APAttributionRetryWorkerBridge)init;
@end

@implementation APAttributionRetryWorkerBridge

+ (BOOL)startWithSession:(id)a3 request:(id)a4 requestorId:(id)a5 intervalId:(unint64_t)a6 reportingStorefront:(id)a7 requestTimestamp:(id)a8 daemonStartTime:(id)a9 tokenReturnedToClientDate:(id)a10 payloadDeliveryStartDate:(id)a11
{
  id v39 = a3;
  unint64_t v40 = a6;
  id v38 = a11;
  id v36 = a8;
  id v37 = a10;
  uint64_t v13 = sub_10019ABA0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v15);
  v20 = (char *)&v33 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  v23 = (char *)&v33 - v22;
  __chkstk_darwin(v21);
  v25 = (char *)&v33 - v24;
  if (a5)
  {
    uint64_t v34 = sub_10019B0B0();
    uint64_t v35 = v26;
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v35 = 0;
  }
  uint64_t v33 = sub_10019B0B0();
  uint64_t v28 = v27;
  sub_10019AB70();
  sub_10019AB70();
  sub_10019AB70();
  sub_10019AB70();
  id v29 = v39;
  id v30 = a4;
  LODWORD(v40) = sub_10007D224(v29, v30, v34, v35, v40, v33, v28, (uint64_t)v25, (uint64_t)v23, (uint64_t)v20, (uint64_t)v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v31 = *(void (**)(char *, uint64_t))(v14 + 8);
  v31(v17, v13);
  v31(v20, v13);
  v31(v23, v13);
  v31(v25, v13);
  return v40 & 1;
}

- (APAttributionRetryWorkerBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AttributionRetryWorkerBridge();
  return [(APAttributionRetryWorkerBridge *)&v3 init];
}

@end