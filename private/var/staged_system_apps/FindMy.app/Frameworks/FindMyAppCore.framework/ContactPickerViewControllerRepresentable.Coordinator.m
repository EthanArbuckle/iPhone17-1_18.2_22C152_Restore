@interface ContactPickerViewControllerRepresentable.Coordinator
- (_TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator)init;
- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4;
- (id)searchController:(id)a3 tintColorForRecipient:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4;
- (void)searchController:(id)a3 didAddRecipient:(id)a4;
- (void)searchController:(id)a3 didEndDisplayingRowForRecipient:(id)a4;
- (void)searchController:(id)a3 didRemoveRecipient:(id)a4;
- (void)searchController:(id)a3 willDisplayRowForRecipient:(id)a4;
@end

@implementation ContactPickerViewControllerRepresentable.Coordinator

- (_TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator)init
{
  sub_C06E8();
  sub_C06D8();
  sub_C06B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (_TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator_logger;
  uint64_t v4 = sub_BF658();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4
{
  sub_C06E8();
  sub_C06D8();
  sub_C06B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_C05A8();
  id v6 = a3;
  v7 = self;
  id v8 = sub_FC50();
  swift_release();

  swift_bridgeObjectRelease();

  return v8;
}

- (void)searchController:(id)a3 didAddRecipient:(id)a4
{
}

- (void)searchController:(id)a3 didRemoveRecipient:(id)a4
{
}

- (void)searchController:(id)a3 willDisplayRowForRecipient:(id)a4
{
}

- (void)searchController:(id)a3 didEndDisplayingRowForRecipient:(id)a4
{
}

- (id)searchController:(id)a3 tintColorForRecipient:(id)a4
{
  sub_C06E8();
  sub_C06D8();
  sub_C06B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_C06D8();
  sub_C06B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v10 = [self systemGrayColor];
  swift_release();

  swift_release();

  return v10;
}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4
{
  sub_C06E8();
  sub_C06D8();
  sub_C06B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_FD2C(v7);
  swift_release();
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
}

@end