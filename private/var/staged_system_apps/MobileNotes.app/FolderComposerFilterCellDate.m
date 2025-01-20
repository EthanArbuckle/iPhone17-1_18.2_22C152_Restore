@interface FolderComposerFilterCellDate
- (_TtC11MobileNotes28FolderComposerFilterCellDate)initWithCoder:(id)a3;
- (_TtC11MobileNotes28FolderComposerFilterCellDate)initWithFrame:(CGRect)a3;
@end

@implementation FolderComposerFilterCellDate

- (_TtC11MobileNotes28FolderComposerFilterCellDate)initWithFrame:(CGRect)a3
{
  return (_TtC11MobileNotes28FolderComposerFilterCellDate *)sub_100400C08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MobileNotes28FolderComposerFilterCellDate)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes28FolderComposerFilterCellDate *)sub_100400D38(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellDate____lazy_storage___menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellDate____lazy_storage___menuActionOff));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellDate____lazy_storage___menuActionToday));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellDate____lazy_storage___menuActionYesterday));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellDate____lazy_storage___menuActionLastSevenDays));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellDate____lazy_storage___menuActionLastThirtyDays));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellDate____lazy_storage___menuActionLastThreeMonths));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellDate____lazy_storage___menuActionLastTwelveMonths));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellDate____lazy_storage___customMenu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellDate____lazy_storage___menuActionRelativeRange));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellDate____lazy_storage___menuActionSpecificRange));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellDate____lazy_storage___menuActionSpecificDate));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellDate____lazy_storage___menuActionBeforeDate));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes28FolderComposerFilterCellDate____lazy_storage___menuActionAfterDate);
}

@end