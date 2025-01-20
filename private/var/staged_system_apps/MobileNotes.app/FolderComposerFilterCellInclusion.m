@interface FolderComposerFilterCellInclusion
- (_TtC11MobileNotes33FolderComposerFilterCellInclusion)initWithCoder:(id)a3;
- (_TtC11MobileNotes33FolderComposerFilterCellInclusion)initWithFrame:(CGRect)a3;
@end

@implementation FolderComposerFilterCellInclusion

- (_TtC11MobileNotes33FolderComposerFilterCellInclusion)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes33FolderComposerFilterCellInclusion____lazy_storage___menu) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes33FolderComposerFilterCellInclusion____lazy_storage___menuActionOff) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes33FolderComposerFilterCellInclusion____lazy_storage___menuActionInclude) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes33FolderComposerFilterCellInclusion____lazy_storage___menuActionExclude) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FolderComposerFilterCellInclusion();
  return -[FolderComposerFilterCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes33FolderComposerFilterCellInclusion)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes33FolderComposerFilterCellInclusion *)sub_1004A2E74(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes33FolderComposerFilterCellInclusion____lazy_storage___menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes33FolderComposerFilterCellInclusion____lazy_storage___menuActionOff));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes33FolderComposerFilterCellInclusion____lazy_storage___menuActionInclude));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes33FolderComposerFilterCellInclusion____lazy_storage___menuActionExclude);
}

@end