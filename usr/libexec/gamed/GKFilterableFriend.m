@interface GKFilterableFriend
- (BOOL)friendBiDirectional;
- (BOOL)friendPlayedWith;
- (NSString)playerID;
- (_TtC14GameDaemonCore18GKFilterableFriend)init;
- (_TtC14GameDaemonCore18GKFilterableFriend)initWithCacheObject:(id)a3;
- (_TtC14GameDaemonCore18GKFilterableFriend)initWithPlayerID:(id)a3 friendBiDirectional:(BOOL)a4 friendPlayedWith:(BOOL)a5;
@end

@implementation GKFilterableFriend

- (NSString)playerID
{
  sub_100162BB4();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)friendBiDirectional
{
  return sub_100162C18() & 1;
}

- (BOOL)friendPlayedWith
{
  return sub_100162C50() & 1;
}

- (_TtC14GameDaemonCore18GKFilterableFriend)initWithPlayerID:(id)a3 friendBiDirectional:(BOOL)a4 friendPlayedWith:(BOOL)a5
{
  return (_TtC14GameDaemonCore18GKFilterableFriend *)sub_100162CAC();
}

- (_TtC14GameDaemonCore18GKFilterableFriend)initWithCacheObject:(id)a3
{
  return (_TtC14GameDaemonCore18GKFilterableFriend *)sub_100162D6C(a3);
}

- (_TtC14GameDaemonCore18GKFilterableFriend)init
{
}

- (void).cxx_destruct
{
}

@end