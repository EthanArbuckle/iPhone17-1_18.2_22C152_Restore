@interface ICSidecarServiceMenuItem
- (ICSidecarServiceMenuItem)init;
- (ICSidecarServiceMenuItem)initWithType:(id)a3 data:(id)a4;
- (NSData)data;
- (NSString)type;
@end

@implementation ICSidecarServiceMenuItem

- (NSString)type
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_20C162A80();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSData)data
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICSidecarServiceMenuItem_data);
  unint64_t v3 = *(void *)&self->type[OBJC_IVAR___ICSidecarServiceMenuItem_data];
  sub_20BFCD780(v2, v3);
  v4 = (void *)sub_20C15F5F0();
  sub_20BFCD6EC(v2, v3);

  return (NSData *)v4;
}

- (ICSidecarServiceMenuItem)initWithType:(id)a3 data:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = sub_20C162AC0();
  uint64_t v9 = v8;
  id v10 = a4;
  uint64_t v11 = sub_20C15F600();
  uint64_t v13 = v12;

  v14 = (uint64_t *)((char *)self + OBJC_IVAR___ICSidecarServiceMenuItem_type);
  uint64_t *v14 = v7;
  v14[1] = v9;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___ICSidecarServiceMenuItem_data);
  uint64_t *v15 = v11;
  v15[1] = v13;
  v17.receiver = self;
  v17.super_class = ObjectType;
  return [(ICSidecarServiceMenuItem *)&v17 init];
}

- (ICSidecarServiceMenuItem)init
{
  result = (ICSidecarServiceMenuItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICSidecarServiceMenuItem_data);
  unint64_t v4 = *(void *)&self->type[OBJC_IVAR___ICSidecarServiceMenuItem_data];

  sub_20BFCD6EC(v3, v4);
}

@end