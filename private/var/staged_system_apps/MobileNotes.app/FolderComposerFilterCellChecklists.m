@interface FolderComposerFilterCellChecklists
- (_TtC11MobileNotes34FolderComposerFilterCellChecklists)initWithCoder:(id)a3;
- (_TtC11MobileNotes34FolderComposerFilterCellChecklists)initWithFrame:(CGRect)a3;
@end

@implementation FolderComposerFilterCellChecklists

- (_TtC11MobileNotes34FolderComposerFilterCellChecklists)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellChecklists____lazy_storage___menu) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellChecklists____lazy_storage___menuActionOff) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellChecklists____lazy_storage___menuActionAny) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellChecklists____lazy_storage___menuActionIncomplete) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellChecklists____lazy_storage___menuActionComplete) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellChecklists____lazy_storage___menuActionNone) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FolderComposerFilterCellChecklists();
  return -[FolderComposerFilterCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes34FolderComposerFilterCellChecklists)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes34FolderComposerFilterCellChecklists *)sub_100425914(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellChecklists____lazy_storage___menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellChecklists____lazy_storage___menuActionOff));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellChecklists____lazy_storage___menuActionAny));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellChecklists____lazy_storage___menuActionIncomplete));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellChecklists____lazy_storage___menuActionComplete));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellChecklists____lazy_storage___menuActionNone);
}

@end