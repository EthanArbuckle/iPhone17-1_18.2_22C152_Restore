@interface CSDFaceTimeUnknownReporter
- (CSDFaceTimeUnknownReporter)init;
- (CSDFaceTimeUnknownReporter)initWithQueue:(id)a3 chManager:(id)a4;
- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5;
@end

@implementation CSDFaceTimeUnknownReporter

- (CSDFaceTimeUnknownReporter)initWithQueue:(id)a3 chManager:(id)a4
{
  return (CSDFaceTimeUnknownReporter *)sub_1002087FC(a3, a4);
}

- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1002093A0((uint64_t)v9, v8);
}

- (CSDFaceTimeUnknownReporter)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDFaceTimeUnknownReporter_idsService);
}

@end