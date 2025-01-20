@interface FolderComposerFilterCellDateRangePicker
- (_TtC11MobileNotes39FolderComposerFilterCellDateRangePicker)initWithCoder:(id)a3;
- (_TtC11MobileNotes39FolderComposerFilterCellDateRangePicker)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation FolderComposerFilterCellDateRangePicker

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1003CF588();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC11MobileNotes39FolderComposerFilterCellDateRangePicker)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_amount;
  *(void *)v8 = 0;
  v8[8] = 1;
  uint64_t v9 = (char *)self + OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_rangeType;
  *(void *)uint64_t v9 = 0;
  v9[8] = 1;
  v10 = (Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_rangeSelectionChanged);
  v11 = (objc_class *)type metadata accessor for FolderComposerFilterCellDateRangePicker();
  void *v10 = 0;
  v10[1] = 0;
  v13.receiver = self;
  v13.super_class = v11;
  return -[FolderComposerFilterCellDateRangePicker initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes39FolderComposerFilterCellDateRangePicker)initWithCoder:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_amount;
  *(void *)uint64_t v5 = 0;
  v5[8] = 1;
  uint64_t v6 = (char *)self + OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_rangeType;
  *(void *)uint64_t v6 = 0;
  v6[8] = 1;
  v7 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_rangeSelectionChanged);
  v8 = (objc_class *)type metadata accessor for FolderComposerFilterCellDateRangePicker();
  void *v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return [(FolderComposerFilterCellDateRangePicker *)&v10 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_10002E70C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_rangeSelectionChanged));
}

@end