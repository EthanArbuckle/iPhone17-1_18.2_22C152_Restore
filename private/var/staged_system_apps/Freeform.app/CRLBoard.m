@interface CRLBoard
+ (NSString)defaultBoardTitle;
- (BOOL)applyReorderingWithReorderedScenes:(id)a3;
- (BOOL)containsObject:(id)a3;
- (BOOL)crl_isEqualValue:(id)a3;
- (BOOL)deleteSceneWith:(id)a3;
- (BOOL)hasItemsNeedingDownload;
- (BOOL)hasUnsupportedItems;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInBoard;
- (BOOL)isSupported;
- (BOOL)isTransactableEqualValue:(id)a3;
- (BOOL)makeUnsupported;
- (BOOL)needsToShowFidelityAlertWithVersionFidelityAlertWasShown:(unint64_t)a3;
- (BOOL)setSceneName:(id)a3 :(id)a4;
- (BOOL)setSceneSavedRect:(id)a3 :(CGRect)a4;
- (BOOL)shouldEnsureParentsOfCreatedObjects;
- (NSArray)infosToDisplayForInteractiveCanvas;
- (NSArray)orderedItemUUIDs;
- (NSArray)sceneInfos;
- (NSDictionary)alternateItems;
- (NSDictionary)items;
- (NSString)boardIdentifierStringRepresentation;
- (NSString)description;
- (NSString)title;
- (NSUUID)id;
- (_TtC8Freeform17CRLBoardDataStore)store;
- (_TtC8Freeform20CRLRootContainerItem)alternateRootContainer;
- (_TtC8Freeform20CRLRootContainerItem)rootContainer;
- (_TtC8Freeform21CRLEditingCoordinator)hack_editingCoordinator;
- (_TtC8Freeform8CRLBoard)init;
- (_TtC8Freeform8CRLBoard)parentBoard;
- (double)lastSaveChangesTime;
- (id)createSceneWithSceneID:(id)a3 savedRect:(CGRect)a4;
- (id)getBoardItemForUUID:(id)a3;
- (id)getContainerItemForUUID:(id)a3;
- (id)getReferencedAssetIDsWithIncludeChildren:(BOOL)a3;
- (id)getSceneName:(id)a3;
- (id)getSceneWith:(id)a3;
- (id)modelEnumeratorWithFlags:(unint64_t)a3;
- (id)parentMapOfItemsFrom:(id)a3;
- (id)resolveAncestorsFor:(id)a3 ignoringIds:(id)a4;
- (id)resolveToSiblingsWithUuids:(id)a3;
- (id)searchableItemAttributeSet:(id)a3;
- (int64_t)getScenesCount;
- (int64_t)hash;
- (unint64_t)resolvedMinRequiredVersion;
- (unint64_t)resolvedMinRequiredVersionForGoodEnoughFidelity;
- (void)asyncSavePendingChangesWithCompletionHandler:(id)a3;
- (void)enterRealTimeSyncSessionWithGloballyScopedOwnerName:(id)a3 localParticipantUUID:(id)a4;
- (void)exitRealTimeSyncSession;
- (void)fixUp;
- (void)hasUnsyncedChangesWithCompletionHandler:(id)a3;
- (void)savePendingChanges;
- (void)setAlternateRootContainer:(id)a3;
- (void)setHack_editingCoordinator:(id)a3;
- (void)setLastSaveChangesTime:(double)a3;
- (void)setRootContainer:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CRLBoard

- (id)searchableItemAttributeSet:(id)a3
{
  if (a3) {
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  id v6 = sub_10081E038(v4);

  swift_bridgeObjectRelease();

  return v6;
}

- (double)lastSaveChangesTime
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_lastSaveChangesTime);
}

- (void)setLastSaveChangesTime:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_lastSaveChangesTime) = a3;
}

- (_TtC8Freeform17CRLBoardDataStore)store
{
  return (_TtC8Freeform17CRLBoardDataStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR____TtC8Freeform8CRLBoard_store));
}

- (_TtC8Freeform20CRLRootContainerItem)rootContainer
{
  return (_TtC8Freeform20CRLRootContainerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                        + OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer));
}

- (void)setRootContainer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform20CRLRootContainerItem)alternateRootContainer
{
  return (_TtC8Freeform20CRLRootContainerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                        + OBJC_IVAR____TtC8Freeform8CRLBoard_alternateRootContainer));
}

- (void)setAlternateRootContainer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_alternateRootContainer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_alternateRootContainer) = (Class)a3;
  id v3 = a3;
}

- (NSString)boardIdentifierStringRepresentation
{
  return (NSString *)sub_100D149C4(self, (uint64_t)a2, (void (*)(void))sub_100CFC9A4);
}

- (NSDictionary)items
{
  return (NSDictionary *)sub_100CFCC20();
}

- (NSDictionary)alternateItems
{
  return (NSDictionary *)sub_100CFCC20();
}

- (NSArray)infosToDisplayForInteractiveCanvas
{
  v2 = self;
  sub_100CFCD4C();

  sub_1005057FC(&qword_101673060);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (NSArray)orderedItemUUIDs
{
  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer);
  uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItemUUIDs];
  id v4 = self;
  v5 = v2;
  if (!v3) {
    sub_100846AB0();
  }
  swift_bridgeObjectRetain();

  type metadata accessor for UUID();
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (BOOL)isEqual:(id)a3
{
  return sub_100CFD920(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_100CFD0B8);
}

- (BOOL)crl_isEqualValue:(id)a3
{
  return sub_100CFD920(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_100CFD518);
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = sub_100CFD9E4();

  return v3;
}

- (BOOL)makeUnsupported
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_makeUnsupported);
}

- (NSUUID)id
{
  uint64_t v3 = type metadata accessor for CRLBoardCRDTData(0);
  __chkstk_darwin(v3 - 8, v4);
  NSArray v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_data)
      + OBJC_IVAR____TtC8Freeform12CRLBoardData_crdtData;
  swift_beginAccess();
  sub_100D1E720((uint64_t)v12, (uint64_t)v6, type metadata accessor for CRLBoardCRDTData);
  v13 = self;
  swift_retain();
  sub_1005057FC(&qword_101674550);
  CRRegister.wrappedValue.getter();
  sub_100D1A69C((uint64_t)v6, type metadata accessor for CRLBoardCRDTData);

  swift_release();
  v14.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  return (NSUUID *)v14.super.isa;
}

- (NSString)title
{
  uint64_t v3 = type metadata accessor for CRLBoardCRDTData(0);
  __chkstk_darwin(v3, v4);
  NSArray v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_data)
     + OBJC_IVAR____TtC8Freeform12CRLBoardData_crdtData;
  swift_beginAccess();
  sub_100D1E720((uint64_t)v7, (uint64_t)v6, type metadata accessor for CRLBoardCRDTData);
  uint64_t v8 = self;
  sub_1005057FC(&qword_101674450);
  CRRegister.wrappedValue.getter();
  sub_100D1A69C((uint64_t)v6, type metadata accessor for CRLBoardCRDTData);

  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

- (void)setTitle:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_100CFE010(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform21CRLEditingCoordinator)hack_editingCoordinator
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC8Freeform21CRLEditingCoordinator *)Strong;
}

- (void)setHack_editingCoordinator:(id)a3
{
}

- (void)enterRealTimeSyncSessionWithGloballyScopedOwnerName:(id)a3 localParticipantUUID:(id)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  NSString v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = self;
  sub_100D03E8C(v10, v12, (uint64_t)v9);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)exitRealTimeSyncSession
{
  v2 = self;
  sub_100D04B30();
}

- (BOOL)isInBoard
{
  return 1;
}

- (BOOL)isTransactableEqualValue:(id)a3
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
  char v6 = sub_100CFD518((uint64_t)v8);

  sub_100522F00((uint64_t)v8, &qword_101672BF0);
  return v6 & 1;
}

- (id)getReferencedAssetIDsWithIncludeChildren:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100D07DDC(a3);

  type metadata accessor for UUID();
  sub_100D15428((unint64_t *)&qword_1016770E0, (void (*)(uint64_t))&type metadata accessor for UUID);
  v5.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (id)modelEnumeratorWithFlags:(unint64_t)a3
{
  id v3 = [objc_allocWithZone((Class)CRLDocumentModelEnumerator) initWithRootModelObject:*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer) flags:a3 filter:0];

  return v3;
}

- (BOOL)isSupported
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_makeUnsupported)) {
    return 0;
  }
  id v3 = self;
  unint64_t v4 = sub_100D08894();
  unint64_t v5 = sub_1002094A4();

  return v5 >= v4;
}

- (BOOL)hasUnsupportedItems
{
  v2 = self;
  char v3 = sub_100D08044();

  return v3 & 1;
}

- (BOOL)hasItemsNeedingDownload
{
  v2 = self;
  char v3 = sub_100D0846C();

  return v3 & 1;
}

- (unint64_t)resolvedMinRequiredVersion
{
  v2 = self;
  unint64_t v3 = sub_100D08894();

  return v3;
}

- (unint64_t)resolvedMinRequiredVersionForGoodEnoughFidelity
{
  v2 = self;
  unint64_t v3 = sub_100D08BEC();

  return v3;
}

- (BOOL)needsToShowFidelityAlertWithVersionFidelityAlertWasShown:(unint64_t)a3
{
  unint64_t v4 = self;
  unint64_t v5 = sub_1002094A4();
  unint64_t v6 = sub_100D08BEC();

  return v5 < v6 && v5 != a3;
}

- (NSArray)sceneInfos
{
  uint64_t v3 = sub_1005057FC((uint64_t *)&unk_101683E40);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_data)
     + OBJC_IVAR____TtC8Freeform12CRLBoardData_crdtData;
  swift_beginAccess();
  uint64_t v9 = type metadata accessor for CRLBoardCRDTData(0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, &v8[*(int *)(v9 + 36)], v3);
  uint64_t v10 = self;
  sub_1005C2550((uint64_t)v7, (uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  type metadata accessor for CRLSceneInfo();
  v11.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v11.super.isa;
}

- (id)createSceneWithSceneID:(id)a3 savedRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v15);
  v17 = (char *)&v22 - v16;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = self;
  sub_100D09F14((uint64_t)v13, (uint64_t)v17, x, y, width, height);

  v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v19(v13, v9);
  v20.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  v19(v17, v9);

  return v20.super.isa;
}

- (id)getSceneWith:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = self;
  id v10 = sub_100D0A33C((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);

  return v10;
}

- (BOOL)deleteSceneWith:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  swift_beginAccess();
  type metadata accessor for CRLBoardCRDTData(0);
  uint64_t v9 = self;
  swift_retain();
  BOOL v10 = sub_10066AA50();
  swift_endAccess();

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v10;
}

- (BOOL)setSceneName:(id)a3 :(id)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = self;
  swift_retain();
  LOBYTE(v10) = sub_101049F14((uint64_t)v9, v10, v12);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v10 & 1;
}

- (id)getSceneName:(id)a3
{
  uint64_t v4 = type metadata accessor for CRLBoardScenesCRDTData(0);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_data)
      + OBJC_IVAR____TtC8Freeform12CRLBoardData_crdtData;
  swift_beginAccess();
  uint64_t v14 = type metadata accessor for CRLBoardCRDTData(0);
  sub_100D1E720((uint64_t)&v13[*(int *)(v14 + 36)], (uint64_t)v7, type metadata accessor for CRLBoardScenesCRDTData);
  uint64_t v15 = self;
  swift_retain();
  sub_1005057FC((uint64_t *)&unk_101699FC0);
  CRDictionary.subscript.getter();
  uint64_t v16 = v19[2];
  sub_100D1A69C((uint64_t)v7, type metadata accessor for CRLBoardScenesCRDTData);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  if (v16)
  {
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v17 = 0;
  }

  return v17;
}

- (BOOL)setSceneSavedRect:(id)a3 :(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  swift_beginAccess();
  type metadata accessor for CRLBoardCRDTData(0);
  uint64_t v14 = self;
  swift_retain();
  v15.n128_f64[0] = x;
  v16.n128_f64[0] = y;
  v17.n128_f64[0] = width;
  v18.n128_f64[0] = height;
  char v19 = sub_10066AD54((uint64_t)v13, v15, v16, v17, v18);
  swift_endAccess();

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  return v19 & 1;
}

- (BOOL)applyReorderingWithReorderedScenes:(id)a3
{
  type metadata accessor for CRLSceneInfo();
  uint64_t v4 = (double *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  char v6 = sub_100D0AF90(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (int64_t)getScenesCount
{
  uint64_t v3 = sub_1005057FC((uint64_t *)&unk_101683E40);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_data)
     + OBJC_IVAR____TtC8Freeform12CRLBoardData_crdtData;
  swift_beginAccess();
  uint64_t v9 = type metadata accessor for CRLBoardCRDTData(0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, &v8[*(int *)(v9 + 36)], v3);
  uint64_t v10 = self;
  int64_t v11 = CROrderedSet.count.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return v11;
}

- (_TtC8Freeform8CRLBoard)init
{
  result = (_TtC8Freeform8CRLBoard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform8CRLBoard_realTimeSessionInfo, (uint64_t *)&unk_10169A1A0);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_unknownObjectWeakDestroy();
}

- (id)getBoardItemForUUID:(id)a3
{
  return sub_100D0C264(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for CRLBoardItem);
}

- (id)getContainerItemForUUID:(id)a3
{
  return sub_100D0C264(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for CRLContainerItem);
}

- (void)fixUp
{
  v2 = self;
  sub_100D0D028();
}

- (BOOL)shouldEnsureParentsOfCreatedObjects
{
  return 1;
}

- (id)resolveAncestorsFor:(id)a3 ignoringIds:(id)a4
{
  type metadata accessor for UUID();
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = self;
  sub_100D0E0C8(v5, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for CRLBoardItem(0);
  sub_100D15428((unint64_t *)&qword_101676C20, (void (*)(uint64_t))type metadata accessor for CRLBoardItem);
  v8.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (id)resolveToSiblingsWithUuids:(id)a3
{
  type metadata accessor for UUID();
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v7 = [(CRLBoard *)v5 parentMapOfItemsFrom:isa];

  type metadata accessor for CRLBoardItem(0);
  sub_1005057FC(&qword_101676C80);
  sub_100D15428((unint64_t *)&qword_101676C20, (void (*)(uint64_t))type metadata accessor for CRLBoardItem);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100D0F5C0(v8, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9.super.Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (id)parentMapOfItemsFrom:(id)a3
{
  type metadata accessor for UUID();
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  sub_100D100B4(v4);

  swift_bridgeObjectRelease();
  type metadata accessor for CRLBoardItem(0);
  sub_1005057FC(&qword_101676C80);
  sub_100D15428((unint64_t *)&qword_101676C20, (void (*)(uint64_t))type metadata accessor for CRLBoardItem);
  v6.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (void)hasUnsyncedChangesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSSet v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10169A078;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10169A080;
  v13[5] = v12;
  uint64_t v14 = self;
  sub_100E6DE90((uint64_t)v8, (uint64_t)&unk_10169A088, (uint64_t)v13);
  swift_release();
}

- (void)savePendingChanges
{
  v2 = self;
  sub_100D12064(0, 0);
}

- (void)asyncSavePendingChangesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSSet v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10169A050;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10169FAB0;
  v13[5] = v12;
  uint64_t v14 = self;
  sub_100E6DE90((uint64_t)v8, (uint64_t)&unk_10169A060, (uint64_t)v13);
  swift_release();
}

- (_TtC8Freeform8CRLBoard)parentBoard
{
  return (_TtC8Freeform8CRLBoard *)0;
}

- (BOOL)containsObject:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  NSSet v9 = self;
  uint64_t v11 = sub_100CFBB94((uint64_t)v8);
  if (v11)
  {
    uint64_t v12 = v10;
    uint64_t v13 = (uint64_t *)((char *)v9 + OBJC_IVAR____TtC8Freeform8CRLBoard_fixupData);
    swift_beginAccess();
    uint64_t v14 = *v13;
    uint64_t v15 = type metadata accessor for CRLTransactableHashableWrapper();
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v17 = sub_101031240(v11, v15, ObjectType, v12);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    LOBYTE(v15) = sub_1006E4038(v17, v14);

    swift_release();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    LOBYTE(v11) = v15 ^ 1;
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v11 & 1;
}

- (NSString)description
{
  return (NSString *)sub_100D149C4(self, (uint64_t)a2, (void (*)(void))sub_100D15470);
}

+ (NSString)defaultBoardTitle
{
  id v2 = [self mainBundle];
  NSString v3 = String._bridgeToObjectiveC()();
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [v2 localizedStringForKey:v3 value:v4 table:0];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

@end