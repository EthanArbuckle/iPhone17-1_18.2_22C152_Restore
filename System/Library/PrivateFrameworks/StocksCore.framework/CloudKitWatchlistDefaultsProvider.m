@interface CloudKitWatchlistDefaultsProvider
- (void)fetchWatchlistDefaultsWithCompletion:(id)a3;
@end

@implementation CloudKitWatchlistDefaultsProvider

- (void)fetchWatchlistDefaultsWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  sub_1AFFC8E48();
  sub_1AFD8BC0C((uint64_t)sub_1AFD8F634, v4);
  swift_release();

  swift_release();
}

@end