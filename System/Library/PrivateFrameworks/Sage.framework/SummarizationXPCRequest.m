@interface SummarizationXPCRequest
+ (BOOL)supportsSecureCoding;
- (_TtC4Sage23SummarizationXPCRequest)init;
- (_TtC4Sage23SummarizationXPCRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SummarizationXPCRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC4Sage23SummarizationXPCRequest)initWithCoder:(id)a3
{
  return (_TtC4Sage23SummarizationXPCRequest *)SummarizationXPCRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25B9AD924(v4);
}

- (_TtC4Sage23SummarizationXPCRequest)init
{
}

- (void).cxx_destruct
{
  sub_25B9AA1A8((uint64_t)self + OBJC_IVAR____TtC4Sage23SummarizationXPCRequest_request, (void (*)(void))type metadata accessor for SummarizationXPCRequest.Request);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end