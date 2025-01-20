@interface VoicemailMessageWrapper
- (BOOL)isDeleted;
- (BOOL)isUnread;
- (NSDate)date;
- (NSString)description;
- (NSString)senderDestinationID;
- (NSString)vmIdentifier;
- (NSURL)dataURL;
- (_TtC18PhoneIntentHandler23VoicemailMessageWrapper)init;
- (double)duration;
@end

@implementation VoicemailMessageWrapper

- (NSString)vmIdentifier
{
  uint64_t v3 = sub_100032640();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_100032660();
  sub_100032630();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  NSString v8 = sub_100032790();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (NSDate)date
{
  uint64_t v3 = sub_100032610();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_100032670();

  v8.super.isa = sub_1000325F0().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSDate *)v8.super.isa;
}

- (double)duration
{
  v2 = self;
  sub_1000326C0();
  double v4 = v3;

  return v4;
}

- (NSString)senderDestinationID
{
  v2 = self;
  sub_1000326A0();

  NSString v3 = sub_100032790();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isDeleted
{
  id v1 = a1;
  sub_100032680();
  int v2 = (unsigned __int16)sub_100032740();
  unsigned __int16 v3 = sub_100032740();

  return v2 == v3;
}

- (BOOL)isUnread
{
  int v2 = self;
  char v3 = sub_1000326B0();

  return (v3 & 1) == 0;
}

- (NSURL)dataURL
{
  uint64_t v3 = sub_1000325E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_10002AD20((uint64_t)v6);

  sub_1000325C0(v8);
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSURL *)v10;
}

- (NSString)description
{
  int v2 = self;
  sub_10002AF80();

  NSString v3 = sub_100032790();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC18PhoneIntentHandler23VoicemailMessageWrapper)init
{
  result = (_TtC18PhoneIntentHandler23VoicemailMessageWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end