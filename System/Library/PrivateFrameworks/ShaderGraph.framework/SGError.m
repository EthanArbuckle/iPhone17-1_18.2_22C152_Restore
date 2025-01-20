@interface SGError
+ (BOOL)supportsSecureCoding;
- (_TtC11ShaderGraph7SGError)initWithCoder:(id)a3;
- (_TtC11ShaderGraph7SGError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
@end

@implementation SGError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11ShaderGraph7SGError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (a5) {
    a5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v12 = (void *)MEMORY[0x261183E60](v9, v11);
  swift_bridgeObjectRelease();
  if (a5)
  {
    v13.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v13.super.isa = 0;
  }
  v16.receiver = self;
  v16.super_class = ObjectType;
  v14 = [(SGError *)&v16 initWithDomain:v12 code:a4 userInfo:v13.super.isa];

  return v14;
}

- (_TtC11ShaderGraph7SGError)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(SGError *)&v5 initWithCoder:a3];
}

@end