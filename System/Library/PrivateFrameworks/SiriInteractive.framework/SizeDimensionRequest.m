@interface SizeDimensionRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC15SiriInteractive20SizeDimensionRequest)init;
- (_TtC15SiriInteractive20SizeDimensionRequest)initWithCoder:(id)a3;
- (_TtC15SiriInteractive20SizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4;
- (_TtC15SiriInteractive20SizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4 type:(int64_t)a5;
- (_TtC15SiriInteractive20SizeDimensionRequest)initWithXPCDictionary:(id)a3;
- (double)maximum;
- (double)minimum;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation SizeDimensionRequest

- (double)minimum
{
  return SizeDimensionRequest.minimum.getter();
}

- (double)maximum
{
  return SizeDimensionRequest.maximum.getter();
}

- (int64_t)type
{
  return SizeDimensionRequest.type.getter();
}

- (_TtC15SiriInteractive20SizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4 type:(int64_t)a5
{
  return (_TtC15SiriInteractive20SizeDimensionRequest *)SizeDimensionRequest.init(minimum:maximum:type:)(a5, a3, a4);
}

- (_TtC15SiriInteractive20SizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4
{
  return (_TtC15SiriInteractive20SizeDimensionRequest *)SizeDimensionRequest.init(minimum:maximum:)();
}

- (int64_t)hash
{
  return sub_25C98D270();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_25C9B8410();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_25C98D358((uint64_t)v8);

  sub_25C98D484((uint64_t)v8);
  return v6;
}

- (NSString)description
{
  v2 = self;
  sub_25C98D5C4();

  v3 = (void *)sub_25C9B8140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_25C98D6EC(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_25C9B85E0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25C98D7DC(v4);
}

- (_TtC15SiriInteractive20SizeDimensionRequest)initWithCoder:(id)a3
{
  return (_TtC15SiriInteractive20SizeDimensionRequest *)SizeDimensionRequest.init(coder:)(a3);
}

- (_TtC15SiriInteractive20SizeDimensionRequest)initWithXPCDictionary:(id)a3
{
  return (_TtC15SiriInteractive20SizeDimensionRequest *)SizeDimensionRequest.init(xpcDictionary:)(a3);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_25C98DBD4(a3);
  swift_unknownObjectRelease();
}

- (_TtC15SiriInteractive20SizeDimensionRequest)init
{
}

@end