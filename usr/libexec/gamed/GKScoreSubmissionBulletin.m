@interface GKScoreSubmissionBulletin
+ (NSDateFormatter)timeFormatter;
+ (void)presentForScores:(id)a3;
- (GKScoreSubmissionBulletin)init;
- (GKScoreSubmissionBulletin)initWithCoder:(id)a3;
- (GKScoreSubmissionBulletin)initWithPushNotification:(id)a3;
- (GKScoreSubmissionBulletin)initWithScore:(id)a3;
@end

@implementation GKScoreSubmissionBulletin

- (GKScoreSubmissionBulletin)initWithScore:(id)a3
{
  return (GKScoreSubmissionBulletin *)sub_100165B8C(a3);
}

+ (NSDateFormatter)timeFormatter
{
  id v2 = sub_1001662C0();

  return (NSDateFormatter *)v2;
}

- (GKScoreSubmissionBulletin)initWithCoder:(id)a3
{
}

+ (void)presentForScores:(id)a3
{
  sub_100166774();
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1001663B0(v3);

  swift_bridgeObjectRelease();
}

- (GKScoreSubmissionBulletin)initWithPushNotification:(id)a3
{
  if (a3) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  sub_1001665A8();
}

- (GKScoreSubmissionBulletin)init
{
}

@end