@interface CodableModelIdentity
+ (BOOL)supportsSecureCoding;
- (_TtC16MusicApplication20CodableModelIdentity)init;
- (_TtC16MusicApplication20CodableModelIdentity)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CodableModelIdentity

- (_TtC16MusicApplication20CodableModelIdentity)initWithCoder:(id)a3
{
  sub_31D50(a3);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_31FCC(v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC16MusicApplication20CodableModelIdentity)init
{
  result = (_TtC16MusicApplication20CodableModelIdentity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end