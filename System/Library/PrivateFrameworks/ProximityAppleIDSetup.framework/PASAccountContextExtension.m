@interface PASAccountContextExtension
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC21ProximityAppleIDSetup26PASAccountContextExtension)init;
- (_TtC21ProximityAppleIDSetup26PASAccountContextExtension)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PASAccountContextExtension

- (NSString)description
{
  v2 = self;
  PASAccountContextExtension.description.getter();

  v3 = (void *)sub_22CC9EB98();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22CC9F038();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = PASAccountContextExtension.isEqual(_:)((uint64_t)v8);

  sub_22CB9811C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = PASAccountContextExtension.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return static PASAccountContextExtension.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static PASAccountContextExtension.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PASAccountContextExtension.encode(with:)((NSCoder)v4);
}

- (_TtC21ProximityAppleIDSetup26PASAccountContextExtension)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC21ProximityAppleIDSetup26PASAccountContextExtension *)sub_22CBC2C18(v3);

  return v4;
}

- (_TtC21ProximityAppleIDSetup26PASAccountContextExtension)init
{
  result = (_TtC21ProximityAppleIDSetup26PASAccountContextExtension *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityAppleIDSetup26PASAccountContextExtension_flowStepAllSetContext));
}

@end