@interface FolderComposerFilterCellShared
- (_TtC11MobileNotes30FolderComposerFilterCellShared)initWithCoder:(id)a3;
- (_TtC11MobileNotes30FolderComposerFilterCellShared)initWithFrame:(CGRect)a3;
@end

@implementation FolderComposerFilterCellShared

- (_TtC11MobileNotes30FolderComposerFilterCellShared)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterCellShared____lazy_storage___menu) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterCellShared____lazy_storage___menuActionOff) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterCellShared____lazy_storage___menuActionAnyone) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterCellShared____lazy_storage___menuActionSpecificUsers) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterCellShared____lazy_storage___menuActionNotShared) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FolderComposerFilterCellShared();
  return -[FolderComposerFilterCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes30FolderComposerFilterCellShared)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes30FolderComposerFilterCellShared *)sub_1003DEF74(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterCellShared____lazy_storage___menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterCellShared____lazy_storage___menuActionOff));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterCellShared____lazy_storage___menuActionAnyone));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterCellShared____lazy_storage___menuActionSpecificUsers));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes30FolderComposerFilterCellShared____lazy_storage___menuActionNotShared);
}

@end