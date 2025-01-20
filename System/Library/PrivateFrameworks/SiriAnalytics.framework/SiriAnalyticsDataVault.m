@interface SiriAnalyticsDataVault
- (SiriAnalyticsDataVault)init;
- (id)vendAccessFor:(int64_t)a3 withEntitlements:(id)a4 auditToken:(id *)a5 readonly:(BOOL)a6 error:(id *)a7;
- (id)vendedResourceUrlFor:(int64_t)a3 error:(id *)a4;
- (void)migrate;
@end

@implementation SiriAnalyticsDataVault

- (void)migrate
{
  v2 = self;
  sub_1A2B9C480();
}

- (id)vendAccessFor:(int64_t)a3 withEntitlements:(id)a4 auditToken:(id *)a5 readonly:(BOOL)a6 error:(id *)a7
{
  unint64_t v10 = *(void *)a5->var0;
  unint64_t v11 = *(void *)&a5->var0[2];
  unint64_t v12 = *(void *)&a5->var0[4];
  unint64_t v13 = *(void *)&a5->var0[6];
  uint64_t v14 = sub_1A2C0D5E0();
  v15 = self;
  sub_1A2B9C7CC(a3, v14, v10, v11, v12, v13, a6);
  swift_bridgeObjectRelease();

  v16 = (void *)sub_1A2C0D470();
  swift_bridgeObjectRelease();
  return v16;
}

- (id)vendedResourceUrlFor:(int64_t)a3 error:(id *)a4
{
  uint64_t v6 = sub_1A2C0CCF0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = self;
  sub_1A2B9CBD4(a3);

  unint64_t v11 = (void *)sub_1A2C0CC80();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (SiriAnalyticsDataVault)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___SiriAnalyticsDataVault_containingDirectory;
  sub_1A2C0CCF0();
  OUTLINED_FUNCTION_14();
  v5 = *(void (**)(char *, uint64_t))(v4 + 8);
  v5(v2, v3);
}

@end