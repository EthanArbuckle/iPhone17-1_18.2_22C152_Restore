@interface SleepDiffableTableViewAdaptor
- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5;
@end

@implementation SleepDiffableTableViewAdaptor

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  sub_1AD8CFF38();
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v8);
  v10 = (char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DD640();
  swift_retain();
  sub_1AD8CF8FC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

@end