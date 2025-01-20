@interface RawPayload
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (_TtC12PoirotBlocks10RawPayload)init;
- (_TtC12PoirotBlocks10RawPayload)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation RawPayload

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  id v6 = a3;
  uint64_t v7 = sub_259F67F70();
  uint64_t v9 = v8;

  v10 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(_DWORD *)&v10[OBJC_IVAR____TtC12PoirotBlocks10RawPayload_dataVersion] = 1;
  v11 = (uint64_t *)&v10[OBJC_IVAR____TtC12PoirotBlocks10RawPayload_data];
  uint64_t *v11 = v7;
  v11[1] = v9;
  v14.receiver = v10;
  v14.super_class = ObjCClassMetadata;
  id v12 = objc_msgSendSuper2(&v14, sel_init);
  return v12;
}

- (id)serialize
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PoirotBlocks10RawPayload_data);
  unint64_t v3 = *(unint64_t *)((char *)&self->super.__validators + OBJC_IVAR____TtC12PoirotBlocks10RawPayload_data);
  sub_259F21710(v2, v3);
  v4 = (void *)sub_259F67F50();
  sub_259F21768(v2, v3);
  return v4;
}

- (_TtC12PoirotBlocks10RawPayload)init
{
  result = (_TtC12PoirotBlocks10RawPayload *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12PoirotBlocks10RawPayload)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  result = (_TtC12PoirotBlocks10RawPayload *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end