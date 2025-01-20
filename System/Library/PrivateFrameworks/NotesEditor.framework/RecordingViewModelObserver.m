@interface RecordingViewModelObserver
- (_TtC11NotesEditorP33_D66587D3EBED3DBE956B5FD4952F818A26RecordingViewModelObserver)init;
- (void)viewModelDidUpdate:(id)a3;
@end

@implementation RecordingViewModelObserver

- (void)viewModelDidUpdate:(id)a3
{
  uint64_t v4 = sub_20C15F200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  v8 = self;
  sub_20C0660BC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC11NotesEditorP33_D66587D3EBED3DBE956B5FD4952F818A26RecordingViewModelObserver)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC11NotesEditorP33_D66587D3EBED3DBE956B5FD4952F818A26RecordingViewModelObserver_isShowingPlaceholder) = 0;
  v3 = (char *)self
     + OBJC_IVAR____TtC11NotesEditorP33_D66587D3EBED3DBE956B5FD4952F818A26RecordingViewModelObserver_delegate;
  uint64_t v4 = (objc_class *)type metadata accessor for RecordingViewModelObserver();
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(RecordingViewModelObserver *)&v6 init];
}

- (void).cxx_destruct
{
}

@end