@interface GKBulletinAttachment
+ (BOOL)supportsSecureCoding;
- (BOOL)hiddenFromDefaultExpandedView;
- (GKBulletinAttachment)init;
- (GKBulletinAttachment)initWithCoder:(id)a3;
- (GKBulletinAttachment)initWithIdentifier:(id)a3 url:(id)a4 hiddenFromDefaultExpandedView:(BOOL)a5;
- (NSString)identifier;
- (NSURL)url;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GKBulletinAttachment

- (NSString)identifier
{
  sub_1001C3F44();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSURL)url
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1001C4064((uint64_t)v6);
  URL._bridgeToObjectiveC()(v7);
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);

  return (NSURL *)v9;
}

- (BOOL)hiddenFromDefaultExpandedView
{
  return sub_1001C4100() & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKBulletinAttachment)initWithIdentifier:(id)a3 url:(id)a4 hiddenFromDefaultExpandedView:(BOOL)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = type metadata accessor for URL();
  __chkstk_darwin(v9 - 8, v10);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  return (GKBulletinAttachment *)sub_1001C4118(v6, v8, (uint64_t)v12, a5);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001C42C4(v4);
}

- (GKBulletinAttachment)initWithCoder:(id)a3
{
  return (GKBulletinAttachment *)sub_1001C442C(a3);
}

- (GKBulletinAttachment)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___GKBulletinAttachment_url;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end