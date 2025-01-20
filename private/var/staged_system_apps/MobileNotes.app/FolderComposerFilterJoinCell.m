@interface FolderComposerFilterJoinCell
- (_TtC11MobileNotes28FolderComposerFilterJoinCell)initWithCoder:(id)a3;
- (_TtC11MobileNotes28FolderComposerFilterJoinCell)initWithFrame:(CGRect)a3;
@end

@implementation FolderComposerFilterJoinCell

- (_TtC11MobileNotes28FolderComposerFilterJoinCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterJoinCell_filterSelection) = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterJoinCell_joinOperatorChanged);
  void *v9 = 0;
  v9[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterJoinCell____lazy_storage___allAction) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterJoinCell____lazy_storage___anyAction) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[FolderComposerJoinCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes28FolderComposerFilterJoinCell)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes28FolderComposerFilterJoinCell *)sub_10045E4AC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterJoinCell_filterSelection));
  sub_10002E70C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterJoinCell_joinOperatorChanged));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterJoinCell____lazy_storage___allAction));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterJoinCell____lazy_storage___anyAction);
}

@end