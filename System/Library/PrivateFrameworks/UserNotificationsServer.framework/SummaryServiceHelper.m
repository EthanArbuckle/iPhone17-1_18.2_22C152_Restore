@interface SummaryServiceHelper
- (void)summaryServiceDidReceiveGroupSummaries:(id)a3;
@end

@implementation SummaryServiceHelper

- (void)summaryServiceDidReceiveGroupSummaries:(id)a3
{
  sub_2228CEC40(0, &qword_267F838E0);
  uint64_t v4 = sub_2228D8358();
  uint64_t v5 = MEMORY[0x223CA0D10](self->adapter);
  if (v5)
  {
    id v6 = (id)v5;
    swift_retain();
    sub_2228CD7F0(v4);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

@end