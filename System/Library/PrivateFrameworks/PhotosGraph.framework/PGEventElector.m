@interface PGEventElector
+ (id)memoryUniqueIdentifiersToElectWithGraph:(id)a3 electionMode:(id)a4 error:(id *)a5;
- (PGEventElector)init;
@end

@implementation PGEventElector

+ (id)memoryUniqueIdentifiersToElectWithGraph:(id)a3 electionMode:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1D1EBDE60();
  uint64_t v8 = v7;
  id v9 = a3;
  swift_bridgeObjectRetain();
  unsigned __int8 v10 = sub_1D1876CB0(v6, v8);
  uint64_t v11 = sub_1D1876ED8((uint64_t)v9, v10);
  uint64_t v12 = sub_1D18775B0(v9, v10);
  sub_1D192E228(v12, v11);
  swift_bridgeObjectRelease();

  v13 = (void *)sub_1D1EBE420();
  swift_bridgeObjectRelease();
  return v13;
}

- (PGEventElector)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EventElector();
  return [(PGEventElector *)&v3 init];
}

@end