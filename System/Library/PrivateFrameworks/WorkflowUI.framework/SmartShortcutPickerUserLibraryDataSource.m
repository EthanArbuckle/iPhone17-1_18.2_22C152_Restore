@interface SmartShortcutPickerUserLibraryDataSource
- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6;
@end

@implementation SmartShortcutPickerUserLibraryDataSource

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  sub_22D9A6F3C(0, &qword_268593108);
  sub_22DA5A7B4(&qword_268594C70, &qword_268593108);
  sub_22DC92CF8();
  sub_22DC92CF8();
  sub_22DC92CF8();
  id v7 = a3;
  swift_retain();
  SmartShortcutPickerUserLibraryDataSource.databaseDidChange(_:modified:inserted:removed:)();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end