@interface StreamsBookmark
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (_TtC23SiriInvocationAnalytics15StreamsBookmark)init;
- (_TtC23SiriInvocationAnalytics15StreamsBookmark)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation StreamsBookmark

+ (BOOL)supportsSecureCoding
{
  return static StreamsBookmark.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_12_5();
  StreamsBookmark.encode(with:)((NSCoder)v6);
}

- (_TtC23SiriInvocationAnalytics15StreamsBookmark)initWithCoder:(id)a3
{
  return (_TtC23SiriInvocationAnalytics15StreamsBookmark *)StreamsBookmark.init(coder:)(a3);
}

- (NSString)debugDescription
{
  v2 = self;
  StreamsBookmark.debugDescription.getter();

  v3 = (void *)sub_25CA45978();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC23SiriInvocationAnalytics15StreamsBookmark)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end