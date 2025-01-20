@interface AppResultsViewFeedbackDelegate
- (_TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate)init;
- (void)lockupViewEngagedForAppIdentifier:(id)a3;
- (void)lockupViewForAppIdentifier:(id)a3 didChangeState:(id)a4;
- (void)lockupViewForAppIdentifier:(id)a3 didFailRequestWithError:(id)a4;
@end

@implementation AppResultsViewFeedbackDelegate

- (void)lockupViewForAppIdentifier:(id)a3 didFailRequestWithError:(id)a4
{
  if (a3) {
    sub_25C53F368();
  }
  id v6 = a4;
  v7 = self;
  sub_25C52F750();

  swift_bridgeObjectRelease();
}

- (void)lockupViewEngagedForAppIdentifier:(id)a3
{
  if (a3) {
    sub_25C53F368();
  }
  v4 = self;
  sub_25C52FB14();

  swift_bridgeObjectRelease();
}

- (void)lockupViewForAppIdentifier:(id)a3 didChangeState:(id)a4
{
  if (a3)
  {
    sub_25C53F368();
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  if (a4) {
LABEL_3:
  }
    sub_25C53F368();
LABEL_5:
  id v6 = self;
  sub_25C52FE2C();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C53162C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate_lockupViewEngagedHandler));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate_context);
}

@end