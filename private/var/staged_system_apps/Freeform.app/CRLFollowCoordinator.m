@interface CRLFollowCoordinator
+ (BOOL)localUserIsFollowable;
- (BOOL)isFollowing;
- (NSArray)crlaxCurrentICCs;
- (NSSet)participantsFollowingLocalParticipant;
- (NSUUID)expectingViewportFromUUID;
- (_TtC8Freeform20CRLFollowCoordinator)init;
- (_TtC8Freeform27CRLCollaborationParticipant)followingParticipant;
- (_TtC8Freeform27CRLCollaborationParticipant)localParticipant;
- (_TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator)accessibilityExperienceCoordinator;
- (unint64_t)latestViewportUpdateTimestamp;
- (void)addInteractiveCanvasController:(id)a3;
- (void)addUIDelegate:(id)a3;
- (void)canvasDidScrollWhileHostingWithNotification:(void *)a3;
- (void)canvasDidZoomOrScrollWhileFollowingNotification:(id)a3;
- (void)canvasUpdateScrollWhileHostingWithNotification:(id)a3;
- (void)canvasUpdateZoomWhileHostingWithNotification:(id)a3;
- (void)crlaxEndFollowingForCanvasScrollIfNeeded;
- (void)crlaxNotifyFollowFeatureOfBenignScrollViewDidScrollEvent;
- (void)dealloc;
- (void)deviceDidRotateWhileFollowingNotification:(id)a3;
- (void)didProcessViewportUpdates;
- (void)endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:(BOOL)a3;
- (void)groupSessionPresenceWasAddedWithNotification:(id)a3;
- (void)localParticipantWantsToStartFollowingCollaborator:(id)a3;
- (void)localParticipantWantsToStartFollowingCollaborator:(id)a3 isRefollow:(BOOL)a4;
- (void)removeInteractiveCanvasController:(id)a3;
- (void)removeUIDelegate:(id)a3;
- (void)selectionPathDidChangeWithNotification:(id)a3;
- (void)sendUpdateIfNeeded;
- (void)setAccessibilityExperienceCoordinator:(id)a3;
- (void)setExpectingViewportForOneTimeScrollFrom:(id)a3;
- (void)setExpectingViewportFromUUID:(id)a3;
- (void)setFollowingParticipant:(id)a3;
- (void)setLatestViewportUpdateTimestamp:(unint64_t)a3;
- (void)willProcessViewportUpdates;
@end

@implementation CRLFollowCoordinator

- (BOOL)isFollowing
{
  v2 = self;
  char v3 = sub_1007E9F6C();

  return v3 & 1;
}

- (_TtC8Freeform27CRLCollaborationParticipant)followingParticipant
{
  swift_getKeyPath();
  swift_getKeyPath();
  char v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();

  return (_TtC8Freeform27CRLCollaborationParticipant *)v5;
}

- (void)setFollowingParticipant:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a3;
  v6 = self;
  static Published.subscript.setter();
}

- (_TtC8Freeform27CRLCollaborationParticipant)localParticipant
{
  v2 = self;
  char v3 = sub_1007EA1E4();

  return (_TtC8Freeform27CRLCollaborationParticipant *)v3;
}

- (NSSet)participantsFollowingLocalParticipant
{
  v2 = self;
  sub_1007EA490();

  type metadata accessor for CRLCollaborationParticipant(0);
  sub_1007FB888((unint64_t *)&unk_10167C500, (void (*)(uint64_t))type metadata accessor for CRLCollaborationParticipant);
  v3.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v3.super.isa;
}

- (NSUUID)expectingViewportFromUUID
{
  uint64_t v3 = sub_1005057FC((uint64_t *)&unk_101674520);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_expectingViewportFromUUID;
  swift_beginAccess();
  sub_100522E9C((uint64_t)v7, (uint64_t)v6, (uint64_t *)&unk_101674520);
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }

  return (NSUUID *)isa;
}

- (void)setExpectingViewportFromUUID:(id)a3
{
  uint64_t v5 = sub_1005057FC((uint64_t *)&unk_101674520);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = (char *)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_expectingViewportFromUUID;
  swift_beginAccess();
  uint64_t v12 = self;
  sub_1006063BC((uint64_t)v8, (uint64_t)v11, (uint64_t *)&unk_101674520);
  swift_endAccess();
}

- (unint64_t)latestViewportUpdateTimestamp
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_latestViewportUpdateTimestamp);
}

- (void)setLatestViewportUpdateTimestamp:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_latestViewportUpdateTimestamp) = (Class)a3;
}

- (void)dealloc
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_followingParticipantsStartEndFollowTimer);
  uint64_t v4 = self;
  if (v3) {
    [v3 invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLFollowCoordinator();
  [(CRLFollowCoordinator *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_interactiveCanvasControllers));
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_viewportToSend, &qword_101681D50);
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_viewportToApply, &qword_101681D50);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator__followingParticipant;
  uint64_t v4 = sub_1005057FC(&qword_101681D88);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_unconfirmedFollowingParticipant));

  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_activeParticipantObserver, &qword_101681D68);
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_expectingViewportFromUUID, (uint64_t *)&unk_101674520);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_followingParticipantsStartEndFollowTimer));
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_latestViewportUpdateInBatch, &qword_101681D50);
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_crlaxFollowFeatureLastScrollTimestamp, &qword_101672EB0);
  objc_super v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator____lazy_storage___accessibilityExperienceCoordinator);
}

- (void)addInteractiveCanvasController:(id)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_interactiveCanvasControllers);
  id v5 = a3;
  uint64_t v6 = self;
  if (([v4 containsObject:v5] & 1) == 0) {
    [v4 addObject:v5];
  }
}

- (void)removeInteractiveCanvasController:(id)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_interactiveCanvasControllers);
  id v5 = a3;
  uint64_t v6 = self;
  if ([v4 containsObject:v5]) {
    [v4 removeObject:v5];
  }
}

- (void)addUIDelegate:(id)a3
{
  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_uiDelegates);
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  if (([v5 containsObject:a3] & 1) == 0) {
    [v5 addObject:a3];
  }
  swift_unknownObjectRelease();
}

- (void)removeUIDelegate:(id)a3
{
  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_uiDelegates);
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  if ([v5 containsObject:a3]) {
    [v5 removeObject:a3];
  }
  swift_unknownObjectRelease();
}

+ (BOOL)localUserIsFollowable
{
  return 1;
}

- (void)endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1007ECB48(a3);
}

- (void)localParticipantWantsToStartFollowingCollaborator:(id)a3 isRefollow:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = self;
  sub_1007EDEA4(v6, v4);
}

- (void)localParticipantWantsToStartFollowingCollaborator:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1007EDEA4(v4, 0);
}

- (void)selectionPathDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1007FB528();
}

- (void)deviceDidRotateWhileFollowingNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1007FB66C();
}

- (void)canvasDidZoomOrScrollWhileFollowingNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1007FB734();
}

- (void)canvasUpdateScrollWhileHostingWithNotification:(id)a3
{
}

- (void)canvasUpdateZoomWhileHostingWithNotification:(id)a3
{
}

- (void)canvasDidScrollWhileHostingWithNotification:(void *)a3
{
  if (*((unsigned char *)a1 + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_isFollowed) == 1)
  {
    id v4 = a3;
    id v5 = a1;
    sub_1007F1B7C(v4, 1);
  }
}

- (void)sendUpdateIfNeeded
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_isFollowed) == 1)
  {
    v2 = self;
    sub_1007F1ED0(0, 1);
  }
}

- (void)groupSessionPresenceWasAddedWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1007F4E24(v4);
}

- (void)willProcessViewportUpdates
{
  v2 = self;
  sub_1007F5524();
}

- (void)didProcessViewportUpdates
{
  v2 = self;
  sub_1007F58F4();
}

- (void)setExpectingViewportForOneTimeScrollFrom:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101681D50);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1005057FC((uint64_t *)&unk_101674520);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13, v14);
  v16 = (char *)&v23 - v15;
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 1, 1, v18);
  }
  sub_100522E9C((uint64_t)v16, (uint64_t)v12, (uint64_t *)&unk_101674520);
  v19 = (char *)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_expectingViewportFromUUID;
  swift_beginAccess();
  v20 = self;
  sub_1006063BC((uint64_t)v12, (uint64_t)v19, (uint64_t *)&unk_101674520);
  swift_endAccess();
  uint64_t v21 = type metadata accessor for CRLFollowViewportState();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v8, 1, 1, v21);
  uint64_t v22 = (uint64_t)v20 + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_viewportToApply;
  swift_beginAccess();
  sub_1006063BC((uint64_t)v8, v22, &qword_101681D50);
  swift_endAccess();

  sub_100522F00((uint64_t)v16, (uint64_t *)&unk_101674520);
}

- (void)crlaxNotifyFollowFeatureOfBenignScrollViewDidScrollEvent
{
  uint64_t v3 = sub_1005057FC(&qword_101672EB0);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  static Date.now.getter();
  uint64_t v8 = type metadata accessor for Date();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 0, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_crlaxFollowFeatureLastScrollTimestamp;
  swift_beginAccess();
  sub_1006063BC((uint64_t)v6, v9, &qword_101672EB0);
  swift_endAccess();
}

- (_TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator)accessibilityExperienceCoordinator
{
  v2 = self;
  id v3 = sub_1007F9FB0();

  return (_TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *)v3;
}

- (void)setAccessibilityExperienceCoordinator:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator____lazy_storage___accessibilityExperienceCoordinator);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator____lazy_storage___accessibilityExperienceCoordinator) = (Class)a3;
  id v3 = a3;
}

- (NSArray)crlaxCurrentICCs
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_interactiveCanvasControllers);
  id v3 = self;
  id v4 = [v2 allObjects];
  sub_10050BF48(0, &qword_101675990);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v5.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v5.super.isa;
}

- (void)crlaxEndFollowingForCanvasScrollIfNeeded
{
  v2 = self;
  sub_1007FA124();
}

- (_TtC8Freeform20CRLFollowCoordinator)init
{
  return (_TtC8Freeform20CRLFollowCoordinator *)sub_1007FA62C();
}

@end