@interface ICNoteEditorBaseViewController
- (ICRealtimeCollaborationController)realtimeCollaborationController;
@end

@implementation ICNoteEditorBaseViewController

- (ICRealtimeCollaborationController)realtimeCollaborationController
{
  uint64_t v2 = qword_10069AEB8;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  if (byte_1006CDE48 == 1 && (sub_100015B04() & 1) != 0)
  {
    v4 = (void *)sub_1003342C4();
  }
  else
  {

    v4 = 0;
  }

  return (ICRealtimeCollaborationController *)v4;
}

@end