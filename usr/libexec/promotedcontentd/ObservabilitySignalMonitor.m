@interface ObservabilitySignalMonitor
- (void)batchClosedWithBatchLifetime:(double)a3 eventsCount:(int64_t)a4;
- (void)batchDequeuedWithWaitingTime:(double)a3 queueLength:(int64_t)a4 batchID:(id)a5;
- (void)batchEnqueuedWithQueueLength:(int64_t)a3;
- (void)batchExpiredWithBatchID:(id)a3;
- (void)eventCreatedWithCreationDate:(id)a3;
- (void)eventSavedWithCreatedToSavedTimeInterval:(double)a3;
- (void)uploadFailureWithType:(int64_t)a3 code:(int64_t)a4 batchIDs:(id)a5;
- (void)uploadSuccess;
- (void)willUploadWithBatchCount:(int64_t)a3;
@end

@implementation ObservabilitySignalMonitor

- (void)batchClosedWithBatchLifetime:(double)a3 eventsCount:(int64_t)a4
{
  uint64_t v6 = type metadata accessor for ObservabilitySignal();
  __chkstk_darwin(v6);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(double *)v8 = a3;
  *((void *)v8 + 1) = a4;
  swift_storeEnumTagMultiPayload();
  swift_retain();
  sub_10016212C((uint64_t)v8);
  sub_1001396A8((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
  swift_release();
}

- (void)batchDequeuedWithWaitingTime:(double)a3 queueLength:(int64_t)a4 batchID:(id)a5
{
  uint64_t v7 = sub_10019B0B0();
  uint64_t v9 = v8;
  swift_retain();
  sub_100138440(a4, v7, v9, a3);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)batchEnqueuedWithQueueLength:(int64_t)a3
{
}

- (void)batchExpiredWithBatchID:(id)a3
{
  uint64_t v3 = sub_10019B0B0();
  v5 = v4;
  swift_retain();
  sub_1001387B0(v3, v5);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)eventCreatedWithCreationDate:(id)a3
{
  uint64_t v3 = type metadata accessor for ObservabilitySignal();
  __chkstk_darwin(v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10019ABA0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10019AB70();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v5, v9, v6);
  swift_storeEnumTagMultiPayload();
  swift_retain();
  sub_10016212C((uint64_t)v5);
  sub_1001396A8((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)eventSavedWithCreatedToSavedTimeInterval:(double)a3
{
  uint64_t v4 = type metadata accessor for ObservabilitySignal();
  __chkstk_darwin(v4);
  uint64_t v6 = (double *)((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v6 = a3;
  swift_storeEnumTagMultiPayload();
  swift_retain();
  sub_10016212C((uint64_t)v6);
  sub_1001396A8((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
  swift_release();
}

- (void)uploadFailureWithType:(int64_t)a3 code:(int64_t)a4 batchIDs:(id)a5
{
  uint64_t v7 = sub_10019B2B0();
  swift_retain();
  sub_100138D24(a3, a4, v7);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)uploadSuccess
{
  uint64_t v2 = type metadata accessor for ObservabilitySignal();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_storeEnumTagMultiPayload();
  swift_retain();
  sub_10016212C((uint64_t)v4);
  sub_1001396A8((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ObservabilitySignal);
  swift_release();
}

- (void)willUploadWithBatchCount:(int64_t)a3
{
}

@end