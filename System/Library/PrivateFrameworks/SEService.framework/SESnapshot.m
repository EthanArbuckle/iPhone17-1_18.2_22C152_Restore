@interface SESnapshot
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (NSString)description;
- (_TtC9SEService10SESnapshot)init;
- (_TtC9SEService10SESnapshot)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SESnapshot

- (NSString)description
{
  return (NSString *)sub_21475EA9C(self, (uint64_t)a2, (void (*)(void))SESnapshot.description.getter);
}

- (NSString)debugDescription
{
  return (NSString *)sub_21475EA9C(self, (uint64_t)a2, (void (*)(void))SESnapshot.debugDescription.getter);
}

+ (BOOL)supportsSecureCoding
{
  return byte_26781D4E0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26781D4E0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SESnapshot.encode(with:)((NSCoder)v4);
}

- (_TtC9SEService10SESnapshot)initWithCoder:(id)a3
{
  return (_TtC9SEService10SESnapshot *)SESnapshot.init(coder:)(a3);
}

- (_TtC9SEService10SESnapshot)init
{
  result = (_TtC9SEService10SESnapshot *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SEService10SESnapshot_uuid;
  uint64_t v4 = sub_2147ACD88();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21472C730((uint64_t)self + OBJC_IVAR____TtC9SEService10SESnapshot_memoryCalculator, &qword_26781D560);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService10SESnapshot_deviceCapability);
}

@end