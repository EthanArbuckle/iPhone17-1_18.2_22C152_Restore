@interface IdentificationService
- (_TtC10StocksCore21IdentificationService)init;
- (void)userInfoDidChangeAdsUserID:(id)a3 fromCloud:(BOOL)a4;
- (void)userInfoDidChangeFeldsparID:(id)a3 fromCloud:(BOOL)a4;
@end

@implementation IdentificationService

- (_TtC10StocksCore21IdentificationService)init
{
  return (_TtC10StocksCore21IdentificationService *)sub_1AFE60BB0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10StocksCore21IdentificationService_sensitiveUserDefaults));

  sub_1AFE64200((uint64_t)self + OBJC_IVAR____TtC10StocksCore21IdentificationService_lockedObservers, (uint64_t (*)(void))sub_1AFE60EA8);
}

- (void)userInfoDidChangeFeldsparID:(id)a3 fromCloud:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1AFE63BD8(v5);
}

- (void)userInfoDidChangeAdsUserID:(id)a3 fromCloud:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1AFE63F08(v5);
}

@end