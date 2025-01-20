@interface FeedbackDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC9feedbackd14FeedbackDaemon)init;
@end

@implementation FeedbackDaemon

- (_TtC9feedbackd14FeedbackDaemon)init
{
  return (_TtC9feedbackd14FeedbackDaemon *)sub_10006DFC4();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100074174(v7);

  return v9 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end