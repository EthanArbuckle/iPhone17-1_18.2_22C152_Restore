@interface APPCDiagnosticMetricsHelper
- (APPCDiagnosticMetricsHelper)init;
- (APPCDiagnosticMetricsHelper)initWithContextIdentifier:(id)a3 promotedContentIdentifier:(id)a4 primitiveCreator:(id)a5 notificationOwner:(id)a6 metricEventsTracking:(id)a7;
- (unint64_t)networkType;
- (void)loadFailedWithReason:(id)a3 code:(int64_t)a4;
- (void)mediaPlaybackFailedWithReason:(id)a3;
- (void)registerHandlerForAllMetricsWithClosure:(id)a3;
- (void)removeHandler;
- (void)setNetworkType:(unint64_t)a3;
- (void)templateMetricWithName:(id)a3 argument:(id)a4;
@end

@implementation APPCDiagnosticMetricsHelper

- (void)setNetworkType:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR___APPCDiagnosticMetricsHelper_networkType);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (unint64_t)networkType
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___APPCDiagnosticMetricsHelper_networkType);
  swift_beginAccess();
  return *v2;
}

- (APPCDiagnosticMetricsHelper)initWithContextIdentifier:(id)a3 promotedContentIdentifier:(id)a4 primitiveCreator:(id)a5 notificationOwner:(id)a6 metricEventsTracking:(id)a7
{
  uint64_t v11 = sub_1B5CB33C0();
  uint64_t v13 = v12;
  uint64_t v14 = sub_1B5CB33C0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCDiagnosticMetricsHelper_networkType) = 0;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___APPCDiagnosticMetricsHelper_contextIdentifier);
  uint64_t *v15 = v11;
  v15[1] = v13;
  v16 = (uint64_t *)((char *)self + OBJC_IVAR___APPCDiagnosticMetricsHelper_promotedContentIdentifier);
  uint64_t *v16 = v14;
  v16[1] = v17;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCDiagnosticMetricsHelper_primitiveCreator) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCDiagnosticMetricsHelper_notificationOwner) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCDiagnosticMetricsHelper_metricEventsTracking) = (Class)a7;
  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for DiagnosticMetricsHelper();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return [(APPCDiagnosticMetricsHelper *)&v19 init];
}

- (void)registerHandlerForAllMetricsWithClosure:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1B5C3A2D8((uint64_t)sub_1B5C379B4, v5);

  swift_release();
}

- (void)removeHandler
{
  v2 = self;
  sub_1B5C3A4A4();
}

- (void)loadFailedWithReason:(id)a3 code:(int64_t)a4
{
  uint64_t v6 = sub_1B5CB33C0();
  uint64_t v8 = v7;
  v9 = self;
  sub_1B5C3A5CC(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)templateMetricWithName:(id)a3 argument:(id)a4
{
  sub_1B5CB33C0();
  sub_1B5CB33C0();
  uint64_t v5 = self;
  sub_1B5C3A7FC();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)mediaPlaybackFailedWithReason:(id)a3
{
  sub_1B5CB33C0();
  v4 = self;
  sub_1B5C3A9AC();

  swift_bridgeObjectRelease();
}

- (APPCDiagnosticMetricsHelper)init
{
  result = (APPCDiagnosticMetricsHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end