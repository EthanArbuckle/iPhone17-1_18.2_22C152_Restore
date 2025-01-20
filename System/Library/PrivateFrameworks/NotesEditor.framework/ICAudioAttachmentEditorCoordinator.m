@interface ICAudioAttachmentEditorCoordinator
- (BOOL)isShowingInspector;
- (BOOL)isShowingMiniPlayer;
- (ICAudioAttachmentEditorCoordinator)init;
- (ICAudioAttachmentEditorCoordinator)initWithNoteEditorViewController:(id)a3;
- (ICNoteEditorViewController)noteEditorViewController;
- (UITextView)textView;
- (id)makeCancelAction;
- (id)makeDeleteActionFor:(id)a3;
- (id)makeDeleteAlertControllerFor:(id)a3;
- (void)appendTo:(id)a3;
- (void)attachmentViewDidMoveToWindow:(id)a3;
- (void)attachmentWasUndeleted:(id)a3;
- (void)attachmentWillBeDeleted:(id)a3;
- (void)audioControllerDidPlay:(id)a3;
- (void)closeMiniPlayerFor:(id)a3;
- (void)delete:(id)a3;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)exportCallRecordingForDataCollectionForAttachment:(id)a3;
- (void)playFromBeginning:(id)a3;
- (void)presentCallRecordingExportViewForAttachment:(id)a3;
- (void)presentExportViewForAttachment:(id)a3;
- (void)presentRecordingViewControllerForAttachment:(id)a3;
- (void)presentReportAConcernFor:(id)a3 withPositiveFeedback:(BOOL)a4;
- (void)presentSharingViewForAttachment:(id)a3 fromSourceView:(id)a4;
- (void)presentSummaryFor:(id)a3;
- (void)presentTranscriptFor:(id)a3;
- (void)rename:(id)a3;
- (void)scrollTo:(id)a3;
- (void)setIsShowingInspector:(BOOL)a3;
- (void)teardown;
- (void)textViewDidScroll:(id)a3;
- (void)viewWasDismissed;
@end

@implementation ICAudioAttachmentEditorCoordinator

- (ICNoteEditorViewController)noteEditorViewController
{
  return (ICNoteEditorViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR___ICAudioAttachmentEditorCoordinator_noteEditorViewController));
}

- (ICAudioAttachmentEditorCoordinator)initWithNoteEditorViewController:(id)a3
{
  return (ICAudioAttachmentEditorCoordinator *)AudioAttachmentEditorCoordinator.init(noteEditorViewController:)(a3);
}

- (void)presentRecordingViewControllerForAttachment:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_20C09AE94(a3);
}

- (void)attachmentViewDidMoveToWindow:(id)a3
{
}

- (void)attachmentWillBeDeleted:(id)a3
{
}

- (void)attachmentWasUndeleted:(id)a3
{
}

- (void)audioControllerDidPlay:(id)a3
{
  uint64_t v4 = sub_20C15F200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  v8 = self;
  sub_20C09BB64();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)isShowingInspector
{
  v2 = (BOOL *)self + OBJC_IVAR___ICAudioAttachmentEditorCoordinator_isShowingInspector;
  swift_beginAccess();
  return *v2;
}

- (void)setIsShowingInspector:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___ICAudioAttachmentEditorCoordinator_isShowingInspector;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)isShowingMiniPlayer
{
  v2 = self;
  unsigned __int8 v3 = sub_20C09C978();

  return v3 & 1;
}

- (void)textViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_20C09CB68();
}

- (void)teardown
{
  v2 = self;
  sub_20C09D310();
}

- (ICAudioAttachmentEditorCoordinator)init
{
  result = (ICAudioAttachmentEditorCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_20BFCEDFC((uint64_t)self + OBJC_IVAR___ICAudioAttachmentEditorCoordinator_temporaryExportURLToRemove, &qword_26AD808A0);
  swift_release();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (UITextView)textView
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICAudioAttachmentEditorCoordinator_noteEditorViewController);
  unsigned __int8 v3 = self;
  id v4 = objc_msgSend(v2, sel_textView);

  return (UITextView *)v4;
}

- (void)presentSharingViewForAttachment:(id)a3 fromSourceView:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD811C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_20C162DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_20C162DA0();
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  id v14 = v11;
  id v15 = v12;
  uint64_t v16 = sub_20C162D90();
  v17 = (void *)swift_allocObject();
  uint64_t v18 = MEMORY[0x263F8F500];
  v17[2] = v16;
  v17[3] = v18;
  v17[4] = v13;
  v17[5] = v14;
  v17[6] = a4;
  sub_20BF9DE48((uint64_t)v9, (uint64_t)&unk_2676BE088, (uint64_t)v17);

  swift_release();
}

- (void)presentCallRecordingExportViewForAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_20C09ED18(v4, 1, 0);
}

- (void)exportCallRecordingForDataCollectionForAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_20C09ED18(v4, 1, 1);
}

- (void)presentExportViewForAttachment:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD811C0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_20C162DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_20C162DA0();
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = v9;
  uint64_t v12 = sub_20C162D90();
  v13 = (void *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v10;
  v13[5] = v11;
  sub_20BF9DE48((uint64_t)v7, (uint64_t)&unk_2676BE080, (uint64_t)v13);

  swift_release();
}

- (void)viewWasDismissed
{
  v2 = self;
  AudioAttachmentEditorCoordinator.viewWasDismissed()();
}

- (void)playFromBeginning:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s11NotesEditor015AudioAttachmentB11CoordinatorC17playFromBeginningyySo12ICAttachmentCF_0(v4);
}

- (void)closeMiniPlayerFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = objc_msgSend(v4, sel_objectID);
  swift_beginAccess();
  sub_20C0A9C94(&v8, v6, (unint64_t *)&unk_26AD81220, 0x263EFF290, &qword_26AD81338);
  uint64_t v7 = v8;
  swift_endAccess();

  sub_20C09BEC8(0, v4);
}

- (void)scrollTo:(id)a3
{
  id v4 = (ICAudioAttachmentEditorCoordinator *)a3;
  id v9 = self;
  uint64_t v5 = [(ICAudioAttachmentEditorCoordinator *)v9 textView];
  if (v5)
  {
    id v6 = (ICAudioAttachmentEditorCoordinator *)v5;
    id v7 = [(ICAudioAttachmentEditorCoordinator *)v4 rangeInNote];
    -[ICAudioAttachmentEditorCoordinator ic_scrollRangeToVisible:animated:completionHandler:](v6, sel_ic_scrollRangeToVisible_animated_completionHandler_, v7, v8, 1, 0);

    id v4 = v9;
    id v9 = v6;
  }
}

- (void)rename:(id)a3
{
  uint64_t v5 = self;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICAudioAttachmentEditorCoordinator_noteEditorViewController);

  objc_msgSend(v5, sel_renameAttachment_presentingViewController_, a3, v6);
}

- (void)presentTranscriptFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  AudioAttachmentEditorCoordinator.presentTranscript(for:)(v4);
}

- (void)presentSummaryFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  AudioAttachmentEditorCoordinator.presentSummary(for:)(v4);
}

- (void)appendTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s11NotesEditor015AudioAttachmentB11CoordinatorC6append2toySo12ICAttachmentC_tF_0(v4);
}

- (void)presentReportAConcernFor:(id)a3 withPositiveFeedback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self;
  AudioAttachmentEditorCoordinator.presentReportAConcern(for:withPositiveFeedback:)(v6, v4);
}

- (void)delete:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(ICAudioAttachmentEditorCoordinator *)v5 makeDeleteAlertControllerFor:v4];
  id v7 = *(Class *)((char *)&v5->super.isa + OBJC_IVAR___ICAudioAttachmentEditorCoordinator_noteEditorViewController);
  id v8 = objc_msgSend(v7, sel_presentedViewController);
  if (!v8) {
    id v8 = v7;
  }
  id v9 = v8;
  objc_msgSend(v8, sel_presentViewController_animated_completion_, v6, 1, 0);
}

- (id)makeDeleteAlertControllerFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_20C0A53F4(v4);

  return v6;
}

- (id)makeDeleteActionFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_20C0ABF6C(v4);

  return v6;
}

- (id)makeCancelAction
{
  id v2 = sub_20C0AC100();

  return v2;
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s11NotesEditor015AudioAttachmentB11CoordinatorC26documentPickerWasCancelledyySo010UIDocumentG14ViewControllerCF_0();
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v5 = a3;
  id v6 = self;
  _s11NotesEditor015AudioAttachmentB11CoordinatorC26documentPickerWasCancelledyySo010UIDocumentG14ViewControllerCF_0();
}

@end