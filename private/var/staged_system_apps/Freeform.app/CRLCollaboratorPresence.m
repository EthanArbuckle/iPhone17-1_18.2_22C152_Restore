@interface CRLCollaboratorPresence
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (NSDate)joinTime;
- (NSDate)lastCursorUpdateTime;
- (NSString)description;
- (NSString)displayName;
- (NSString)shortDisplayName;
- (NSUUID)presenceUUID;
- (_TtC8Freeform23CRLCollaboratorPresence)init;
- (_TtC8Freeform23CRLCollaboratorPresence)initWithOwner:(id)a3 presenceUUID:(id)a4 joinTime:(id)a5 isLocal:(BOOL)a6;
- (_TtC8Freeform27CRLCollaborationParticipant)owner;
- (id)collaboratorColorForType:(int64_t)a3;
- (id)collaboratorColorName;
- (int64_t)collaboratorColorIndex;
- (int64_t)hash;
- (void)setCollaboratorColorIndex:(int64_t)a3;
- (void)setLastCursorUpdateTime:(id)a3;
- (void)setOwner:(id)a3;
@end

@implementation CRLCollaboratorPresence

- (NSUUID)presenceUUID
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (NSDate)joinTime
{
  v2.super.isa = Date._bridgeToObjectiveC()().super.isa;

  return (NSDate *)v2.super.isa;
}

- (NSDate)lastCursorUpdateTime
{
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (char *)self + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_lastCursorUpdateTime;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v8, v3);
  v9.super.isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return (NSDate *)v9.super.isa;
}

- (void)setLastCursorUpdateTime:(id)a3
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  NSDate v9 = (char *)self + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_lastCursorUpdateTime;
  swift_beginAccess();
  v10 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v11 = self;
  v10(v9, v8, v4);
  swift_endAccess();
}

- (_TtC8Freeform27CRLCollaborationParticipant)owner
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC8Freeform27CRLCollaborationParticipant *)Strong;
}

- (void)setOwner:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)sub_10060236C();
}

- (NSString)shortDisplayName
{
  return (NSString *)sub_10060236C();
}

- (_TtC8Freeform23CRLCollaboratorPresence)initWithOwner:(id)a3 presenceUUID:(id)a4 joinTime:(id)a5 isLocal:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = type metadata accessor for Date();
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for UUID();
  __chkstk_darwin(v12 - 8, v13);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  id v16 = a3;
  v17 = (_TtC8Freeform23CRLCollaboratorPresence *)sub_100602C18((uint64_t)v16, (uint64_t)v15, (uint64_t)v11, v6);

  return v17;
}

- (NSString)description
{
  NSDate v2 = self;
  sub_100602544();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_100602684((uint64_t)v8);

  sub_100522F00((uint64_t)v8, &qword_101672BF0);
  return v6 & 1;
}

- (int64_t)hash
{
  NSDate v2 = self;
  int64_t v3 = UUID.hashValue.getter();

  return v3;
}

- (BOOL)isLocal
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_isLocalParticipant);
}

- (int64_t)collaboratorColorIndex
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_collaboratorColorIndex);
}

- (void)setCollaboratorColorIndex:(int64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_collaboratorColorIndex);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_collaboratorColorIndex) = (Class)a3;
  if (v3 != a3)
  {
    id Strong = (id)swift_unknownObjectWeakLoadStrong();
    uint64_t v5 = self;
    [Strong updateCachedCollaboratorColors];
  }
}

- (id)collaboratorColorForType:(int64_t)a3
{
  id v3 = sub_100874B04(a3, *(unint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_collaboratorColorIndex));

  return v3;
}

- (id)collaboratorColorName
{
  sub_100874DE8(*(unint64_t *)((char *)&self->super.isa
                                    + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_collaboratorColorIndex));
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

- (_TtC8Freeform23CRLCollaboratorPresence)init
{
  result = (_TtC8Freeform23CRLCollaboratorPresence *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_presenceUUID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_joinTime;
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_lastCursorUpdateTime, v6);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end