@interface CrashReportListener.ObserverProxy
- (_TtCC17PreviewsOSSupport19CrashReportListener13ObserverProxy)init;
- (void)willWriteDiagnosticLog:(id)a3 logId:(id)a4 logInfo:(id)a5;
@end

@implementation CrashReportListener.ObserverProxy

- (void)willWriteDiagnosticLog:(id)a3 logId:(id)a4 logInfo:(id)a5
{
  uint64_t v6 = sub_232E33368();
  uint64_t v8 = v7;
  uint64_t v9 = sub_232E33318();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))((char *)&self->super.isa
                                                         + OBJC_IVAR____TtCC17PreviewsOSSupport19CrashReportListener13ObserverProxy_diagnosticsLogHandler);
  v11 = self;
  swift_retain();
  v10(v6, v8, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtCC17PreviewsOSSupport19CrashReportListener13ObserverProxy)init
{
  result = (_TtCC17PreviewsOSSupport19CrashReportListener13ObserverProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end