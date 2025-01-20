@interface ICRealtimeCollaborationSelectionController
- (ICNoteEditorViewController)editorController;
- (ICRealtimeCollaborationController)realtimeCollaborationController;
- (ICRealtimeCollaborationSelectionController)init;
- (ICRealtimeCollaborationSelectionController)initWithEditorController:(id)a3 realtimeCollaborationController:(id)a4;
- (void)editorDidChangeSelection:(id)a3;
- (void)noteDidPerformMerge:(id)a3;
- (void)realtimeCollaborationControllerDidChangeSelectionState:(id)a3;
- (void)realtimeCollaborationControllerGroupActivityDidChange:(id)a3;
- (void)showSelectionForParticipant:(id)a3;
- (void)tableAttachmentProviderDidMergeTable:(id)a3;
- (void)tableScrollViewBoundsDidChange:(id)a3;
- (void)textViewLayoutDidChange:(id)a3;
@end

@implementation ICRealtimeCollaborationSelectionController

- (ICNoteEditorViewController)editorController
{
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();

  return (ICNoteEditorViewController *)Strong;
}

- (ICRealtimeCollaborationController)realtimeCollaborationController
{
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();

  return (ICRealtimeCollaborationController *)Strong;
}

- (ICRealtimeCollaborationSelectionController)initWithEditorController:(id)a3 realtimeCollaborationController:(id)a4
{
  return (ICRealtimeCollaborationSelectionController *)RealtimeCollaborationSelectionController.init(editorController:realtimeCollaborationController:)(a3, (char *)a4);
}

- (void)showSelectionForParticipant:(id)a3
{
  id v4 = a3;
  v5 = self;
  RealtimeCollaborationSelectionController.showSelection(for:)((CKShareParticipant)v4);
}

- (void)realtimeCollaborationControllerGroupActivityDidChange:(id)a3
{
}

- (void)editorDidChangeSelection:(id)a3
{
  uint64_t v4 = sub_10002F214(&qword_1006A0DB8);
  __chkstk_darwin(v4 - 8);
  v6 = (uint64_t *)((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = type metadata accessor for Notification();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  v12 = self;
  sub_100265B18(v6);
  RealtimeCollaborationController.postLocalSelection(_:asDelta:)((unint64_t)v6, 1);

  sub_10002B754((uint64_t)v6, &qword_1006A0DB8);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)textViewLayoutDidChange:(id)a3
{
}

- (void)tableScrollViewBoundsDidChange:(id)a3
{
}

- (void)noteDidPerformMerge:(id)a3
{
}

- (void)tableAttachmentProviderDidMergeTable:(id)a3
{
}

- (ICRealtimeCollaborationSelectionController)init
{
  result = (ICRealtimeCollaborationSelectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  swift_unknownObjectUnownedDestroy();
  v3 = (char *)self + OBJC_IVAR___ICRealtimeCollaborationSelectionController__groupSession;
  uint64_t v4 = sub_10002F214(&qword_1006A0D38);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)realtimeCollaborationControllerDidChangeSelectionState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s11MobileNotes40RealtimeCollaborationSelectionControllerC08realtimedf9DidChangeE5StateyyAA0cdF0CF_0();
}

@end