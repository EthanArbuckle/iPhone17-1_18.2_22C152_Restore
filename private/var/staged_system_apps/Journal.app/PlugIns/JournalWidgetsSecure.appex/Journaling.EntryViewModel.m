@interface Journaling.EntryViewModel
- (void)contextObjectsDidChangeWithNotification:(id)a3;
@end

@implementation Journaling.EntryViewModel

- (void)contextObjectsDidChangeWithNotification:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1000A8CDC(v3);

  swift_release();
}

@end