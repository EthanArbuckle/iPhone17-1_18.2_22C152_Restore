@interface TPSSearchQueryManager
+ (TPSSearchQueryManager)shared;
- (TPSSearchQueryManager)init;
- (void)cancelQueryWithIdentifier:(id)a3;
- (void)performQuery:(id)a3 completion:(id)a4;
@end

@implementation TPSSearchQueryManager

+ (TPSSearchQueryManager)shared
{
  if (qword_1E94143B0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E94149E8;
  return (TPSSearchQueryManager *)v2;
}

- (TPSSearchQueryManager)init
{
  return (TPSSearchQueryManager *)SearchQueryManager.init()();
}

- (void)performQuery:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (char *)a3;
  v9 = self;
  sub_19C962948(v8, (uint64_t)sub_19C965A44, v7);

  swift_release();
}

- (void)cancelQueryWithIdentifier:(id)a3
{
  uint64_t v4 = sub_19C9768B0();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_19C963CB4(v4, v6);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end