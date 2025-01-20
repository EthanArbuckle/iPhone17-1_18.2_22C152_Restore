@interface ClassificationXPCRequest
+ (BOOL)supportsSecureCoding;
- (_TtC4Sage24ClassificationXPCRequest)init;
- (_TtC4Sage24ClassificationXPCRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ClassificationXPCRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC4Sage24ClassificationXPCRequest)initWithCoder:(id)a3
{
  return (_TtC4Sage24ClassificationXPCRequest *)ClassificationXPCRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25B95477C(v4);
}

- (_TtC4Sage24ClassificationXPCRequest)init
{
}

- (void).cxx_destruct
{
  sub_25B952848((uint64_t)self + OBJC_IVAR____TtC4Sage24ClassificationXPCRequest_request, (void (*)(void))type metadata accessor for ClassificationXPCRequest.Request);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end