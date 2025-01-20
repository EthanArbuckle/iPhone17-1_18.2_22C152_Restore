@interface FolderComposerFilterCellQuickNotes
- (_TtC11MobileNotes34FolderComposerFilterCellQuickNotes)initWithCoder:(id)a3;
- (_TtC11MobileNotes34FolderComposerFilterCellQuickNotes)initWithFrame:(CGRect)a3;
@end

@implementation FolderComposerFilterCellQuickNotes

- (_TtC11MobileNotes34FolderComposerFilterCellQuickNotes)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[FolderComposerFilterCellInclusion initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes34FolderComposerFilterCellQuickNotes)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(FolderComposerFilterCellInclusion *)&v5 initWithCoder:a3];
}

@end