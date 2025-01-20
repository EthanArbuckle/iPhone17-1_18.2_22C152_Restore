@interface FolderComposerFilterCellDatePicker
- (_TtC11MobileNotes34FolderComposerFilterCellDatePicker)initWithCoder:(id)a3;
- (_TtC11MobileNotes34FolderComposerFilterCellDatePicker)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)dateSelectionChanged:(id)a3;
- (void)prepareForReuse;
@end

@implementation FolderComposerFilterCellDatePicker

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10033DDAC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10033EC0C();
}

- (void)dateSelectionChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10033ED74(v4);
}

- (_TtC11MobileNotes34FolderComposerFilterCellDatePicker)initWithFrame:(CGRect)a3
{
  return (_TtC11MobileNotes34FolderComposerFilterCellDatePicker *)sub_10033F2B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MobileNotes34FolderComposerFilterCellDatePicker)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes34FolderComposerFilterCellDatePicker *)sub_10033F400(a3);
}

- (void).cxx_destruct
{
  sub_10002E70C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellDatePicker_dateSelectionChanged));
  sub_10033F718((uint64_t)self + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellDatePicker_date);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellDatePicker____lazy_storage___datePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellDatePicker_inlineStackViewLeadingAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellDatePicker____lazy_storage___compactStackView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes34FolderComposerFilterCellDatePicker____lazy_storage___inlineLabel);
}

@end