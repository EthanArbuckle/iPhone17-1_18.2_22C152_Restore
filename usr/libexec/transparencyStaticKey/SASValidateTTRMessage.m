@interface SASValidateTTRMessage
+ (id)validateWithMessage:(id)a3 error:(id *)a4;
- (_TtC21transparencyStaticKey21SASValidateTTRMessage)init;
@end

@implementation SASValidateTTRMessage

+ (id)validateWithMessage:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  uint64_t v8 = sub_100068024(v5, v7);
  unint64_t v10 = v9;
  sub_100060FC0(v5, v7);
  v11.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100060FC0(v8, v10);

  return v11.super.isa;
}

- (_TtC21transparencyStaticKey21SASValidateTTRMessage)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SASValidateTTRMessage *)&v3 init];
}

@end