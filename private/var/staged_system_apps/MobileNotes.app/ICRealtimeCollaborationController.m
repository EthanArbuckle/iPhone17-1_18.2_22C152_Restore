@interface ICRealtimeCollaborationController
+ (BOOL)isRealtimeCollaborationEnabled;
+ (BOOL)isRealtimeCollaborationEnabledForNote:(id)a3;
- (BOOL)hasActiveSession;
- (ICRealtimeCollaborationController)init;
- (ICRealtimeCollaborationController)initWithId:(int64_t)a3 cloudConfiguration:(id)a4 noteContext:(id)a5;
- (ICRealtimeCollaborationDelegate)delegate;
- (NSString)currentNoteIdentifier;
- (NSString)description;
- (void)configurePaperKitAttachmentViewIfNecessary:(id)a3;
- (void)dealloc;
- (void)removePaperKitMessengerForAttachmentIfNecessary:(id)a3 layoutManager:(id)a4;
- (void)removePaperKitMessengerForAttachmentIfNecessary:(id)a3 textLayoutManager:(id)a4;
- (void)removePaperKitMessengerForViewIfNecessary:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShowsCursors:(BOOL)a3 forPaperKitAttachment:(id)a4 layoutManager:(id)a5;
- (void)setShowsCursors:(BOOL)a3 forPaperKitAttachment:(id)a4 textLayoutManager:(id)a5;
- (void)updatePaperKitMessengerForAttachment:(id)a3 layoutManager:(id)a4;
- (void)updatePaperKitMessengerForAttachment:(id)a3 textLayoutManager:(id)a4;
@end

@implementation ICRealtimeCollaborationController

+ (BOOL)isRealtimeCollaborationEnabled
{
  if (qword_10069AEB8 != -1) {
    swift_once();
  }
  return byte_1006CDE48;
}

+ (BOOL)isRealtimeCollaborationEnabledForNote:(id)a3
{
  id v3 = a3;
  char v4 = _s11MobileNotes31RealtimeCollaborationControllerC02iscD7Enabled3forSbSo6ICNoteC_tFZ_0(v3);

  return v4 & 1;
}

- (ICRealtimeCollaborationDelegate)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (ICRealtimeCollaborationDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasActiveSession
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICRealtimeCollaborationController_activeSession);
  swift_beginAccess();
  return *v2 != 0;
}

- (NSString)currentNoteIdentifier
{
  uint64_t v3 = type metadata accessor for EditNoteActivity();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___ICRealtimeCollaborationController_stateMachine;
  swift_beginAccess();
  uint64_t v8 = type metadata accessor for FastSyncStateMachine();
  NSString v9 = 0;
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8))
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
    v10 = self;
    EditNoteActivity.noteID.getter();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  return (NSString *)v9;
}

- (ICRealtimeCollaborationController)initWithId:(int64_t)a3 cloudConfiguration:(id)a4 noteContext:(id)a5
{
  return (ICRealtimeCollaborationController *)RealtimeCollaborationController.init(id:cloudConfiguration:noteContext:)(a3, a4, a5);
}

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICRealtimeCollaborationController_watchForContextChangesTask))
  {
    ObjectType = (objc_class *)swift_getObjectType();
    uint64_t v4 = self;
    swift_retain();
    Task.cancel()();
    swift_release();
    v5.receiver = v4;
    v5.super_class = ObjectType;
    [(ICRealtimeCollaborationController *)&v5 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  sub_10015E5E8((uint64_t)self + OBJC_IVAR___ICRealtimeCollaborationController_delegate);
  swift_release();
  swift_release();
  sub_10002B754((uint64_t)self + OBJC_IVAR___ICRealtimeCollaborationController_stateMachine, &qword_1006A2F28);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICRealtimeCollaborationController_selectionDocument);
}

- (void)updatePaperKitMessengerForAttachment:(id)a3 layoutManager:(id)a4
{
}

- (void)removePaperKitMessengerForAttachmentIfNecessary:(id)a3 layoutManager:(id)a4
{
}

- (void)setShowsCursors:(BOOL)a3 forPaperKitAttachment:(id)a4 layoutManager:(id)a5
{
}

- (void)updatePaperKitMessengerForAttachment:(id)a3 textLayoutManager:(id)a4
{
}

- (void)removePaperKitMessengerForAttachmentIfNecessary:(id)a3 textLayoutManager:(id)a4
{
}

- (void)setShowsCursors:(BOOL)a3 forPaperKitAttachment:(id)a4 textLayoutManager:(id)a5
{
}

- (void)removePaperKitMessengerForViewIfNecessary:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  RealtimeCollaborationController.removePaperKitMessengerIfNecessary(for:)((UIView)v4);
}

- (void)configurePaperKitAttachmentViewIfNecessary:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  RealtimeCollaborationController.configurePaperKitAttachmentViewIfNecessary(_:)((UIView)v4);
}

- (NSString)description
{
  v2 = self;
  RealtimeCollaborationController.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (ICRealtimeCollaborationController)init
{
  result = (ICRealtimeCollaborationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end