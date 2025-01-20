@interface FolderComposerFilterCellFolders
- (_TtC11MobileNotes31FolderComposerFilterCellFolders)initWithCoder:(id)a3;
- (_TtC11MobileNotes31FolderComposerFilterCellFolders)initWithFrame:(CGRect)a3;
@end

@implementation FolderComposerFilterCellFolders

- (_TtC11MobileNotes31FolderComposerFilterCellFolders)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes31FolderComposerFilterCellFolders____lazy_storage___menu) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes31FolderComposerFilterCellFolders____lazy_storage___menuActionOff) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes31FolderComposerFilterCellFolders____lazy_storage___menuActionInclude) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes31FolderComposerFilterCellFolders____lazy_storage___menuActionExclude) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FolderComposerFilterCellFolders();
  return -[FolderComposerFilterCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes31FolderComposerFilterCellFolders)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes31FolderComposerFilterCellFolders *)sub_100472094(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes31FolderComposerFilterCellFolders____lazy_storage___menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes31FolderComposerFilterCellFolders____lazy_storage___menuActionOff));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes31FolderComposerFilterCellFolders____lazy_storage___menuActionInclude));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes31FolderComposerFilterCellFolders____lazy_storage___menuActionExclude);
}

@end