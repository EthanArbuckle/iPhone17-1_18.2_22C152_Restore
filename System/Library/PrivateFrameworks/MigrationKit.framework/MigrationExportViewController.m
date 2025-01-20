@interface MigrationExportViewController
- (_TtC12MigrationKit29MigrationExportViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
@end

@implementation MigrationExportViewController

- (_TtC12MigrationKit29MigrationExportViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  sub_22C01E5F8();
  sub_22C01E5E8();
  sub_22C01E5B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (_TtC12MigrationKit29MigrationExportViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end