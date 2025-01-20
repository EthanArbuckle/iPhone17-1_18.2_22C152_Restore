@interface SiriSuggestionsIntelligence.DeviceListDelegate
- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligenceP33_5C99411072011048FFC9A949C6515F9C18DeviceListDelegate)init;
- (void)deviceListModified:(id)a3;
@end

@implementation SiriSuggestionsIntelligence.DeviceListDelegate

- (void)deviceListModified:(id)a3
{
  if (a3)
  {
    sub_25DB91534(0, &qword_26B3786D8);
    unint64_t v4 = sub_25DC16450();
  }
  else
  {
    unint64_t v4 = 0;
  }
  v5 = self;
  sub_25DB8D598(v4);

  swift_bridgeObjectRelease();
}

- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligenceP33_5C99411072011048FFC9A949C6515F9C18DeviceListDelegate)init
{
}

- (void).cxx_destruct
{
}

@end