@interface CRLCollaborationParticipant
- (BOOL)hasUnifiedContact;
- (BOOL)isActive;
- (BOOL)isDocumentOwner;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFollowable;
- (BOOL)isSelf;
- (BOOL)isViewOnly;
- (CKShareParticipant)ckShareParticipant;
- (CNContact)cnContact;
- (NSArray)presences;
- (NSPersonNameComponents)nameComponents;
- (NSSet)isFollowedBy;
- (NSString)description;
- (NSString)displayName;
- (NSString)personName;
- (NSString)shortDisplayName;
- (NSUUID)id;
- (_TtC8Freeform23CRLCollaboratorPresence)latestPresence;
- (_TtC8Freeform23CRLCollaboratorPresence)localPresence;
- (_TtC8Freeform23CRLCollaboratorPresence)oldestPresence;
- (_TtC8Freeform27CRLCollaborationParticipant)init;
- (_TtC8Freeform27CRLCollaborationParticipant)initWithCkShareParticipant:(id)a3 isFollowable:(BOOL)a4;
- (_TtC8Freeform27CRLCollaborationParticipant)isFollowing;
- (id)collaboratorColorForType:(int64_t)a3;
- (id)collaboratorColorName;
- (id)contact;
- (id)presenceWith:(id)a3;
- (int64_t)collaboratorColorIndex;
- (void)populateContactIfNeeded;
- (void)removePresenceWith:(id)a3;
- (void)setCnContact:(id)a3;
- (void)setHasUnifiedContact:(BOOL)a3;
- (void)setIsDocumentOwner:(BOOL)a3;
- (void)setIsFollowable:(BOOL)a3;
- (void)setIsFollowedBy:(id)a3;
- (void)setIsFollowing:(id)a3;
- (void)setIsViewOnly:(BOOL)a3;
- (void)setPresences:(id)a3;
- (void)updateCachedCollaboratorColors;
@end

@implementation CRLCollaborationParticipant

- (CKShareParticipant)ckShareParticipant
{
  return (CKShareParticipant *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_ckShareParticipant));
}

- (CNContact)cnContact
{
  return (CNContact *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_cnContact));
}

- (void)setCnContact:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_cnContact);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_cnContact) = (Class)a3;
  id v3 = a3;
}

- (BOOL)hasUnifiedContact
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_hasUnifiedContact);
}

- (void)setHasUnifiedContact:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_hasUnifiedContact) = a3;
}

- (_TtC8Freeform27CRLCollaborationParticipant)isFollowing
{
  return (_TtC8Freeform27CRLCollaborationParticipant *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                               + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_isFollowing));
}

- (void)setIsFollowing:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1006FEDD8(a3);
}

- (NSSet)isFollowedBy
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  type metadata accessor for CRLCollaborationParticipant(0);
  sub_10070AC18((unint64_t *)&unk_10167C500, (void (*)(uint64_t))type metadata accessor for CRLCollaborationParticipant);
  v4.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v4.super.isa;
}

- (void)setIsFollowedBy:(id)a3
{
  type metadata accessor for CRLCollaborationParticipant(0);
  sub_10070AC18((unint64_t *)&unk_10167C500, (void (*)(uint64_t))type metadata accessor for CRLCollaborationParticipant);
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getKeyPath();
  swift_getKeyPath();
  NSSet v4 = self;
  static Published.subscript.setter();
}

- (BOOL)isFollowable
{
  return sub_1006FF510(self);
}

- (void)setIsFollowable:(BOOL)a3
{
}

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (NSArray)presences
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  type metadata accessor for CRLCollaboratorPresence();
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (void)setPresences:(id)a3
{
  type metadata accessor for CRLCollaboratorPresence();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getKeyPath();
  swift_getKeyPath();
  NSArray v4 = self;
  static Published.subscript.setter();
  sub_1006FF3DC();
}

- (BOOL)isViewOnly
{
  return sub_1006FF510(self);
}

- (void)setIsViewOnly:(BOOL)a3
{
}

- (BOOL)isDocumentOwner
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_isDocumentOwner);
}

- (void)setIsDocumentOwner:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_isDocumentOwner) = a3;
}

- (_TtC8Freeform27CRLCollaborationParticipant)initWithCkShareParticipant:(id)a3 isFollowable:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = (_TtC8Freeform27CRLCollaborationParticipant *)sub_10070B68C(v5, v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    BOOL v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  BOOL v6 = sub_1006FF804((uint64_t)v8);

  sub_100522F00((uint64_t)v8, &qword_101672BF0);
  return v6;
}

- (NSString)description
{
  return (NSString *)sub_10070348C(self, (uint64_t)a2, (void (*)(void))sub_1006FFC9C);
}

- (void)removePresenceWith:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  sub_1007003EC((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (id)presenceWith:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getKeyPath();
  swift_getKeyPath();
  v9 = self;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  v13 = v8;
  uint64_t v10 = sub_100ED4F9C((uint64_t (*)(id *))sub_10070D250, (uint64_t)v12, v14);

  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);

  return v10;
}

- (BOOL)isActive
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = self;
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v4 != 0;
}

- (_TtC8Freeform23CRLCollaboratorPresence)latestPresence
{
  NSUUID v2 = self;
  id v3 = sub_1007008EC();

  return (_TtC8Freeform23CRLCollaboratorPresence *)v3;
}

- (_TtC8Freeform23CRLCollaboratorPresence)oldestPresence
{
  NSUUID v2 = self;
  id v3 = (void *)sub_100700C48();

  return (_TtC8Freeform23CRLCollaboratorPresence *)v3;
}

- (_TtC8Freeform23CRLCollaboratorPresence)localPresence
{
  NSUUID v2 = self;
  id v3 = sub_100700D84();

  return (_TtC8Freeform23CRLCollaboratorPresence *)v3;
}

- (void)populateContactIfNeeded
{
  NSUUID v2 = self;
  sub_100700F08();
}

- (id)contact
{
  NSUUID v2 = self;
  sub_100700F08();
  id v3 = objc_retainAutoreleaseReturnValue(*(id *)((char *)&v2->super.isa
                                               + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_cnContact));

  return v3;
}

- (BOOL)isSelf
{
  NSUUID v2 = self;
  char v3 = sub_100701290();

  return v3 & 1;
}

- (NSPersonNameComponents)nameComponents
{
  uint64_t v3 = sub_1005057FC(&qword_101687FD0);
  __chkstk_darwin(v3 - 8, v4);
  unint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  sub_1007014C4((uint64_t)v6);

  uint64_t v8 = type metadata accessor for PersonNameComponents();
  uint64_t v9 = *(void *)(v8 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    Class isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }

  return (NSPersonNameComponents *)isa;
}

- (NSString)personName
{
  NSUUID v2 = self;
  sub_100701D90();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)displayName
{
  return (NSString *)sub_10070348C(self, (uint64_t)a2, (void (*)(void))sub_100701F80);
}

- (NSString)shortDisplayName
{
  return (NSString *)sub_10070348C(self, (uint64_t)a2, (void (*)(void))sub_10070244C);
}

- (_TtC8Freeform27CRLCollaborationParticipant)init
{
  result = (_TtC8Freeform27CRLCollaborationParticipant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_ckShareParticipant));

  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant__isFollowedBy;
  uint64_t v4 = sub_1005057FC((uint64_t *)&unk_10167C4F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  NSString v5 = (char *)self + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant__isFollowable;
  uint64_t v6 = sub_1005057FC(&qword_10169FCE0);
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_id;
  uint64_t v9 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = (char *)self + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant__presences;
  uint64_t v11 = sub_1005057FC(&qword_10167C4E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v7((char *)self + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant__isViewOnly, v6);
  swift_bridgeObjectRelease();
  uint64_t v12 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_isFollowing);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_isFollowing) = 0;
  if (v12)
  {
    while (1)
    {
      v15 = v12;
      if (!swift_isUniquelyReferenced()) {
        break;
      }
      v13 = *(char **)&v15[OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_isFollowing];
      unint64_t v14 = v13;

      uint64_t v12 = v13;
      if (!v13) {
        goto LABEL_6;
      }
    }
    uint64_t v12 = v15;
  }
LABEL_6:
}

- (int64_t)collaboratorColorIndex
{
  NSUUID v2 = self;
  int64_t v3 = sub_100702C58();

  return v3;
}

- (id)collaboratorColorForType:(int64_t)a3
{
  uint64_t v4 = self;
  id v5 = sub_100702D74(a3);

  return v5;
}

- (void)updateCachedCollaboratorColors
{
  swift_beginAccess();
  int64_t v3 = self;
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_10070C28C(v4, (uint64_t)v3);

  swift_bridgeObjectRelease();
}

- (id)collaboratorColorName
{
  return sub_10070348C(self, (uint64_t)a2, (void (*)(void))sub_100703304);
}

@end