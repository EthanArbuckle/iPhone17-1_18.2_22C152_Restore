@interface ICAudioRecordingViewController
+ (BOOL)presentedViewControllerIsAudio:(id)a3;
+ (id)audioAttachmentInsideViewController:(id)a3;
+ (id)getHostingViewForAttachmentModel:(id)a3 delegate:(id)a4;
+ (void)containerViewDidResize:(id)a3;
- (ICAudioRecordingViewController)init;
@end

@implementation ICAudioRecordingViewController

+ (id)getHostingViewForAttachmentModel:(id)a3 delegate:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = _sSo30ICAudioRecordingViewControllerC11NotesEditorE010getHostingC018forAttachmentModel8delegateSo06UIViewD0CSo017ICAttachmentAudioK0C_So0abcD8Delegate_pSgtFZ_0(v5, (uint64_t)a4);

  swift_unknownObjectRelease();

  return v6;
}

+ (id)audioAttachmentInsideViewController:(id)a3
{
  id v3 = a3;
  id v4 = _sSo30ICAudioRecordingViewControllerC11NotesEditorE15audioAttachment6insideSo12ICAttachmentCSgSo06UIViewD0C_tFZ_0(v3);

  return v4;
}

+ (BOOL)presentedViewControllerIsAudio:(id)a3
{
  return swift_dynamicCastClass() != 0;
}

+ (void)containerViewDidResize:(id)a3
{
  id v3 = a3;
  _sSo30ICAudioRecordingViewControllerC11NotesEditorE09containerC9DidResizeyySo06UIViewD0CFZ_0(v3);
}

- (ICAudioRecordingViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICAudioRecordingViewController;
  return [(ICAudioRecordingViewController *)&v3 init];
}

@end