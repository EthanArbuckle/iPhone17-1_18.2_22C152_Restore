@interface DateBucketedGroup
- (_TtC10WorkflowUI17DateBucketedGroup)init;
- (void)databaseResultDidChange:(id)a3;
@end

@implementation DateBucketedGroup

- (void)databaseResultDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22D9E28FC();
}

- (_TtC10WorkflowUI17DateBucketedGroup)init
{
}

- (void).cxx_destruct
{
  sub_22D9ADBA0((uint64_t)self + OBJC_IVAR____TtC10WorkflowUI17DateBucketedGroup_delegate);

  swift_release();
  swift_bridgeObjectRelease();
}

@end