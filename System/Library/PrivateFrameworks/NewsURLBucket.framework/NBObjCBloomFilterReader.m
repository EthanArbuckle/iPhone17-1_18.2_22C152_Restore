@interface NBObjCBloomFilterReader
- (BOOL)maybeContainsString:(id)a3;
- (NBObjCBloomFilterReader)init;
- (NBObjCBloomFilterReader)initWithData:(id)a3 hashFunctionCount:(int64_t)a4;
@end

@implementation NBObjCBloomFilterReader

- (NBObjCBloomFilterReader)initWithData:(id)a3 hashFunctionCount:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = sub_1B00594D8();
  uint64_t v8 = v7;

  return (NBObjCBloomFilterReader *)ObjCBloomFilterReader.init(data:hashFunctionCount:)(v6, v8, a4);
}

- (BOOL)maybeContainsString:(id)a3
{
  uint64_t v4 = sub_1B0059558();
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)&self->bloomFilterReader[OBJC_IVAR___NBObjCBloomFilterReader_bloomFilterReader + 16];
  uint64_t v8 = *(void *)&self->bloomFilterReader[OBJC_IVAR___NBObjCBloomFilterReader_bloomFilterReader + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR___NBObjCBloomFilterReader_bloomFilterReader), v7);
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8);
  v10 = self;
  LOBYTE(v4) = v9(v4, v6, v7, v8);

  swift_bridgeObjectRelease();
  return (v4 & 1) == 0;
}

- (NBObjCBloomFilterReader)init
{
  result = (NBObjCBloomFilterReader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end