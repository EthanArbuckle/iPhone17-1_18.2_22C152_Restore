@interface NCSummaryServiceGateway
- (NCSummaryServiceGateway)init;
- (void)donateStateDump:(id)a3;
@end

@implementation NCSummaryServiceGateway

- (NCSummaryServiceGateway)init
{
  return (NCSummaryServiceGateway *)sub_1D7D6FB58();
}

- (void)donateStateDump:(id)a3
{
  uint64_t v4 = sub_1D7D7F720();
  v5 = self;
  sub_1D7D6FCBC(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end