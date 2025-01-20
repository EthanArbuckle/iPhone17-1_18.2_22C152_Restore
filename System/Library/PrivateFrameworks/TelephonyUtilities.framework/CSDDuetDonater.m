@interface CSDDuetDonater
- (CSDDuetDonater)init;
- (CSDDuetDonater)initWithQueue:(id)a3;
- (void)dealloc;
- (void)reportingController:(id)a3 addedActivatedLink:(id)a4;
- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5;
@end

@implementation CSDDuetDonater

- (CSDDuetDonater)initWithQueue:(id)a3
{
  return (CSDDuetDonater *)sub_1002748F8(a3);
}

- (void)dealloc
{
  v2 = self;
  sub_100274BDC();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDDuetDonater_silenceUnknownCallersEnabledObserver);
}

- (void)reportingController:(id)a3 addedActivatedLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100274E88();
}

- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1002751FC((uint64_t)v9, v8);
}

- (CSDDuetDonater)init
{
}

@end