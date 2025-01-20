@interface PASFlowStepAllSetContext
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC21ProximityAppleIDSetup24PASFlowStepAllSetContext)init;
- (_TtC21ProximityAppleIDSetup24PASFlowStepAllSetContext)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PASFlowStepAllSetContext

- (NSString)description
{
  v2 = self;
  PASFlowStepAllSetContext.description.getter();

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
  char v6 = PASFlowStepAllSetContext.isEqual(_:)((uint64_t)v8);

  sub_22CB9811C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = PASFlowStepAllSetContext.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return static PASFlowStepAllSetContext.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static PASFlowStepAllSetContext.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PASFlowStepAllSetContext.encode(with:)((NSCoder)v4);
}

- (_TtC21ProximityAppleIDSetup24PASFlowStepAllSetContext)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC21ProximityAppleIDSetup24PASFlowStepAllSetContext *)sub_22CBCBAE8(v3);

  return v4;
}

- (_TtC21ProximityAppleIDSetup24PASFlowStepAllSetContext)init
{
  result = (_TtC21ProximityAppleIDSetup24PASFlowStepAllSetContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end