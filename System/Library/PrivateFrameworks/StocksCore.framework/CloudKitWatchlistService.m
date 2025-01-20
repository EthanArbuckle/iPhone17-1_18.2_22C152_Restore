@interface CloudKitWatchlistService
- (void)watchlistManager:(id)a3 didChangeInWatchlist:(id)a4;
- (void)watchlistManager:(id)a3 didChangeInWatchlistOrder:(id)a4;
@end

@implementation CloudKitWatchlistService

- (void)watchlistManager:(id)a3 didChangeInWatchlist:(id)a4
{
  sub_1AFD8F6AC(0, (unint64_t *)&unk_1EB816AC0);
  uint64_t v5 = sub_1AFFCAC88();
  id v6 = a3;
  sub_1AFFC8E48();
  sub_1AFD8E160(v5);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)watchlistManager:(id)a3 didChangeInWatchlistOrder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_1AFFC8E48();
  sub_1AFD8E370(v6);

  swift_release();
}

@end