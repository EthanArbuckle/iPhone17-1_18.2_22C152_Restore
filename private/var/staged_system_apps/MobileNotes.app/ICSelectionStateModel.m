@interface ICSelectionStateModel
+ (id)dataRepresentationForSelectionStateModels:(id)a3;
+ (id)modelWithData:(id)a3;
+ (id)modelsWithData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ICItemIdentifier)selectedNoteBrowseContainerItemID;
- (ICSearchResult)currentSelectedSearchResult;
- (ICTagSelection)tagSelection;
- (NSDictionary)currentFirstVisibleObjectIDForContainerObjectID;
- (NSManagedObjectID)focusedNoteObjectID;
- (NSManagedObjectID)selectedInvitationObjectID;
- (NSManagedObjectID)selectedNoteObjectID;
- (NSManagedObjectID)selectedObjectID;
- (NSString)description;
- (_TtC11MobileNotes21ICSelectionStateModel)init;
- (id)dataRepresentation;
- (void)setCurrentFirstVisibleObjectIDForContainerObjectID:(id)a3;
- (void)setCurrentSelectedSearchResult:(id)a3;
- (void)setFocusedNoteObjectID:(id)a3;
- (void)setSelectedNoteObjectID:(id)a3;
@end

@implementation ICSelectionStateModel

- (_TtC11MobileNotes21ICSelectionStateModel)init
{
  return (_TtC11MobileNotes21ICSelectionStateModel *)sub_10001014C();
}

- (ICSearchResult)currentSelectedSearchResult
{
  return (ICSearchResult *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentSelectedSearchResult));
}

- (void)setCurrentSelectedSearchResult:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentSelectedSearchResult);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentSelectedSearchResult) = (Class)a3;
  id v3 = a3;
}

- (NSDictionary)currentFirstVisibleObjectIDForContainerObjectID
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentFirstVisibleObjectIDForContainerObjectID);
  swift_beginAccess();
  if (*v2)
  {
    sub_100031418(0, (unint64_t *)&qword_10069E810);
    sub_1001A3EEC();
    swift_bridgeObjectRetain();
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.isa = 0;
  }

  return (NSDictionary *)v3.super.isa;
}

- (void)setCurrentFirstVisibleObjectIDForContainerObjectID:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    sub_100031418(0, (unint64_t *)&qword_10069E810);
    sub_1001A3EEC();
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentFirstVisibleObjectIDForContainerObjectID);
  swift_beginAccess();
  uint64_t *v5 = v3;
  swift_bridgeObjectRelease();
}

- (NSManagedObjectID)focusedNoteObjectID
{
  return (NSManagedObjectID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_focusedNoteObjectID));
}

- (void)setFocusedNoteObjectID:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_focusedNoteObjectID);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_focusedNoteObjectID) = (Class)a3;
  id v3 = a3;
}

- (ICTagSelection)tagSelection
{
  v2 = self;
  id v3 = sub_10002E7D4();

  return (ICTagSelection *)v3;
}

- (ICItemIdentifier)selectedNoteBrowseContainerItemID
{
  v2 = self;
  id v3 = sub_10002EA78();

  return (ICItemIdentifier *)v3;
}

- (NSManagedObjectID)selectedNoteObjectID
{
  v2 = self;
  id v3 = (void *)sub_10002ECBC();

  return (NSManagedObjectID *)v3;
}

- (NSManagedObjectID)selectedInvitationObjectID
{
  v2 = self;
  id v3 = sub_100008000();

  return (NSManagedObjectID *)v3;
}

- (NSManagedObjectID)selectedObjectID
{
  v2 = self;
  id v3 = (void *)sub_10002ECBC();
  if (!v3) {
    id v3 = sub_100008000();
  }

  return (NSManagedObjectID *)v3;
}

- (void)setSelectedNoteObjectID:(id)a3
{
  uint64_t v5 = sub_10002F214(&qword_10069D7F8);
  __chkstk_darwin(v5 - 8);
  v7 = (_TtC11MobileNotes21ICSelectionStateModel **)((char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v8 = a3;
  v13 = self;
  if (objc_msgSend(v8, "ic_isNoteType"))
  {
    void *v7 = v8;
    v7[1] = 0;
    uint64_t v9 = type metadata accessor for ICSelectionStateModel.ObjectSelection(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 0, 1, v9);
    v10 = (char *)v13 + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_objectSelection;
    swift_beginAccess();
    id v11 = v8;
    sub_10002B660((uint64_t)v7, (uint64_t)v10, &qword_10069D7F8);
    swift_endAccess();
  }
  else
  {

    v12 = v13;
  }
}

- (id)dataRepresentation
{
  swift_getObjectType();
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  id v3 = self;
  JSONEncoder.init()();
  sub_1001A046C(&qword_10069D9B8, (void (*)(uint64_t))type metadata accessor for ICSelectionStateModel);
  uint64_t v4 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v6 = v5;

  swift_release();
  v7.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10017253C(v4, v6);

  return v7.super.isa;
}

+ (id)modelWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;

  swift_getObjCClassMetadata();
  NSData v7 = (void *)sub_1001987EC();
  sub_10017253C(v4, v6);

  return v7;
}

+ (id)dataRepresentationForSelectionStateModels:(id)a3
{
  swift_getObjCClassMetadata();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  sub_10002F214((uint64_t *)&unk_1006A2AA0);
  sub_1001A400C();
  uint64_t v3 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v5 = v4;
  swift_bridgeObjectRelease();
  swift_release();
  v6.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10017253C(v3, v5);

  return v6.super.isa;
}

+ (id)modelsWithData:(id)a3
{
  swift_getObjCClassMetadata();
  if (a3)
  {
    id v4 = a3;
    a3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;
  }
  else
  {
    unint64_t v6 = 0xF000000000000000;
  }
  uint64_t v7 = sub_1001A35A8((uint64_t)a3, v6);
  sub_1001A3F54((uint64_t)a3, v6);
  if (v7)
  {
    v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v8.super.isa = 0;
  }

  return v8.super.isa;
}

- (NSString)description
{
  v2 = self;
  sub_10019A72C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  swift_getObjectType();
  if (a3)
  {
    unint64_t v5 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    unint64_t v6 = self;
  }
  sub_10002F034((uint64_t)v12, (uint64_t)v10, &qword_10069B4D0);
  if (!v11)
  {
    sub_10002B754((uint64_t)v10, &qword_10069B4D0);
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    char v7 = 0;
    goto LABEL_9;
  }
  char v7 = sub_1001A36E0((uint64_t)self, (uint64_t)v9);

LABEL_9:
  sub_10002B754((uint64_t)v12, &qword_10069B4D0);
  return v7 & 1;
}

- (void).cxx_destruct
{
  sub_10002B754((uint64_t)self + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_objectSelection, &qword_10069D7F8);
  sub_10002B754((uint64_t)self + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_containerSelection, &qword_10069D7F0);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentActivityStreamSelection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentSelectedSearchResult));
  sub_10002B754((uint64_t)self + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_focusedNoteObjectIDURL, &qword_10069B310);
  swift_bridgeObjectRelease();
  NSString v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_focusedNoteObjectID);
}

@end