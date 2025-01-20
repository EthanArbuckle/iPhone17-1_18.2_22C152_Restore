@interface StreamBookmark
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (_TtC28SiriPrivateLearningAnalytics14StreamBookmark)init;
- (_TtC28SiriPrivateLearningAnalytics14StreamBookmark)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation StreamBookmark

+ (BOOL)supportsSecureCoding
{
  return byte_1EA699210;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EA699210 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D2F6C274(v4);
}

- (_TtC28SiriPrivateLearningAnalytics14StreamBookmark)initWithCoder:(id)a3
{
  return (_TtC28SiriPrivateLearningAnalytics14StreamBookmark *)StreamBookmark.init(coder:)(a3);
}

- (NSString)debugDescription
{
  v2 = self;
  sub_1D2F6CDF4();

  v3 = (void *)_sSS28SiriPrivateLearningAnalyticsE10toNSObjectSo0F0CyF_0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC28SiriPrivateLearningAnalytics14StreamBookmark)init
{
  result = (_TtC28SiriPrivateLearningAnalytics14StreamBookmark *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end