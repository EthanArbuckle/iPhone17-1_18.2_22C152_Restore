@interface FolderComposerFilterCellTags
- (_TtC11MobileNotes28FolderComposerFilterCellTags)initWithCoder:(id)a3;
- (_TtC11MobileNotes28FolderComposerFilterCellTags)initWithFrame:(CGRect)a3;
@end

@implementation FolderComposerFilterCellTags

- (_TtC11MobileNotes28FolderComposerFilterCellTags)initWithFrame:(CGRect)a3
{
  return (_TtC11MobileNotes28FolderComposerFilterCellTags *)sub_1001634EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MobileNotes28FolderComposerFilterCellTags)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes28FolderComposerFilterCellTags *)sub_1001635C8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellTags____lazy_storage___menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellTags_previousCustomTagSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellTags____lazy_storage___menuActionOff));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellTags____lazy_storage___menuActionAnyTag));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellTags____lazy_storage___menuActionAnySelectedTag));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellTags____lazy_storage___menuActionAllSelectedTags));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellTags____lazy_storage___menuActionNoTags);
}

@end