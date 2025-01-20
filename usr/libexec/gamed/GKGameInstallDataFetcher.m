@interface GKGameInstallDataFetcher
+ (id)createAndReturnError:(id *)a3;
- (GKGameInstallDataFetcher)init;
- (void)fetchGameInstallInfoFor:(NSArray *)a3 completionHandler:(id)a4;
@end

@implementation GKGameInstallDataFetcher

+ (id)createAndReturnError:(id *)a3
{
  sub_1001C19A0();

  return v3;
}

- (void)fetchGameInstallInfoFor:(NSArray *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;

  sub_10000D83C((uint64_t)&unk_100327D00, (uint64_t)v7);
}

- (GKGameInstallDataFetcher)init
{
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR___GKGameInstallDataFetcher_appInstallHistoryFetcher;

  sub_100016C38((uint64_t)v3);
}

@end