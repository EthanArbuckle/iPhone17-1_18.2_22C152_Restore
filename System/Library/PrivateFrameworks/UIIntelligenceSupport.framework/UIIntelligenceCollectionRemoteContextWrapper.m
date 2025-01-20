@interface UIIntelligenceCollectionRemoteContextWrapper
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper)init;
- (_TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIIntelligenceCollectionRemoteContextWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  UIIntelligenceCollectionRemoteContextWrapper.encode(with:)((NSCoder)v4);
}

- (_TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper)initWithCoder:(id)a3
{
  return (_TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper *)UIIntelligenceCollectionRemoteContextWrapper.init(coder:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_260532BA0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = UIIntelligenceCollectionRemoteContextWrapper.isEqual(_:)((uint64_t)v8);

  sub_2604B7410((uint64_t)v8);
  return v6 & 1;
}

- (_TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper)init
{
  result = (_TtC21UIIntelligenceSupport44UIIntelligenceCollectionRemoteContextWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end