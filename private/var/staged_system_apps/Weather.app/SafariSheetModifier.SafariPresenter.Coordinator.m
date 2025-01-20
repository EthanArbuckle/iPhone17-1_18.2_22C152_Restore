@interface SafariSheetModifier.SafariPresenter.Coordinator
- (_TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator)initWithCoder:(id)a3;
- (_TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)safariViewControllerDidFinish:(id)a3;
@end

@implementation SafariSheetModifier.SafariPresenter.Coordinator

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10005DF18((uint64_t)a3);
}

- (_TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100409DD0();
}

- (void)safariViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10040A048();
}

- (_TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_10040A0C0();
}

- (void).cxx_destruct
{
  sub_1000F3400((uint64_t)self+ OBJC_IVAR____TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator_initialURL, &qword_100E749B0);
  swift_release();
  swift_release();
  id v3 = (char *)self
     + OBJC_IVAR____TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator_colorScheme;
  uint64_t v4 = type metadata accessor for ColorScheme();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator_safariViewController);
}

@end