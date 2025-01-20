@interface SIComponentIdentifier
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (SIComponentIdentifier)init;
- (SIComponentIdentifier)initWithName:(int)a3 schemaUUID:(id)a4;
- (SIComponentIdentifier)initWithName:(int)a3 uuid:(id)a4;
- (int64_t)hash;
@end

@implementation SIComponentIdentifier

- (SIComponentIdentifier)initWithName:(int)a3 uuid:(id)a4
{
  uint64_t v5 = sub_1AE338228();
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AE3381F8();
  return (SIComponentIdentifier *)ComponentIdentifier.init(name:uuid:)(a3, (uint64_t)v7);
}

- (SIComponentIdentifier)initWithName:(int)a3 schemaUUID:(id)a4
{
  return (SIComponentIdentifier *)ComponentIdentifier.init(name:schemaUUID:)(a3, a4);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AE3385B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_1ADA76D34((uint64_t)v8);

  sub_1ADA776DC((uint64_t)v8, &qword_1EB576AA0);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_1ADA76E8C();

  return v3;
}

- (NSString)debugDescription
{
  v2 = self;
  sub_1ADA76FE8();

  int64_t v3 = (void *)sub_1AE338378();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (SIComponentIdentifier)init
{
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR___SIComponentIdentifier__uuid;
  sub_1AE338228();
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  sub_1ADA776DC((uint64_t)self + OBJC_IVAR___SIComponentIdentifier____lazy_storage___uuid, &qword_1EB576BE0);
}

@end