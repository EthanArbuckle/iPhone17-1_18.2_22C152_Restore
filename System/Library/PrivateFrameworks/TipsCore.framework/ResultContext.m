@interface ResultContext
+ (BOOL)supportsSecureCoding;
- (NSString)debugDescription;
- (NSString)description;
- (_TtC8TipsCore13ResultContext)init;
- (_TtC8TipsCore13ResultContext)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ResultContext

- (NSString)description
{
  return (NSString *)sub_19C970338(self, (uint64_t)a2, (void (*)(void))ResultContext.description.getter);
}

- (NSString)debugDescription
{
  return (NSString *)sub_19C970338(self, (uint64_t)a2, (void (*)(void))ResultContext.debugDescription.getter);
}

- (_TtC8TipsCore13ResultContext)init
{
  result = (_TtC8TipsCore13ResultContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData);
  unint64_t v4 = *(void *)&self->resultId[OBJC_IVAR____TtC8TipsCore13ResultContext_contextData];
  sub_19C9452BC(v3, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ResultContext.encode(with:)((NSCoder)v4);
}

- (_TtC8TipsCore13ResultContext)initWithCoder:(id)a3
{
  return (_TtC8TipsCore13ResultContext *)ResultContext.init(coder:)(a3);
}

@end