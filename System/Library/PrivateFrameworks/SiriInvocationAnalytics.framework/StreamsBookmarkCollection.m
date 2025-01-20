@interface StreamsBookmarkCollection
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC23SiriInvocationAnalytics25StreamsBookmarkCollection)init;
- (_TtC23SiriInvocationAnalytics25StreamsBookmarkCollection)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation StreamsBookmarkCollection

+ (BOOL)supportsSecureCoding
{
  return static StreamsBookmarkCollection.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_12_5();
  StreamsBookmarkCollection.encode(with:)((NSCoder)v6);
}

- (_TtC23SiriInvocationAnalytics25StreamsBookmarkCollection)initWithCoder:(id)a3
{
  return (_TtC23SiriInvocationAnalytics25StreamsBookmarkCollection *)StreamsBookmarkCollection.init(coder:)(a3);
}

- (_TtC23SiriInvocationAnalytics25StreamsBookmarkCollection)init
{
}

- (void).cxx_destruct
{
}

@end