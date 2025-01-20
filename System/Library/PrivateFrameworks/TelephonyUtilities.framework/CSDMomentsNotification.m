@interface CSDMomentsNotification
- (CSDMomentsNotification)init;
- (CSDMomentsNotification)initWithStreamToken:(unint64_t)a3 requesterID:(id)a4;
- (NSString)requesterID;
- (unint64_t)streamToken;
@end

@implementation CSDMomentsNotification

- (unint64_t)streamToken
{
  return sub_1002D082C();
}

- (NSString)requesterID
{
  sub_1002D0888();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (CSDMomentsNotification)initWithStreamToken:(unint64_t)a3 requesterID:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (CSDMomentsNotification *)sub_1002D08C4(a3, v5, v6);
}

- (CSDMomentsNotification)init
{
}

- (void).cxx_destruct
{
}

@end