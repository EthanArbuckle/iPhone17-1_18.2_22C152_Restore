@interface StreamBookmarkCollection
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC28SiriPrivateLearningAnalytics24StreamBookmarkCollection)init;
- (_TtC28SiriPrivateLearningAnalytics24StreamBookmarkCollection)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation StreamBookmarkCollection

+ (BOOL)supportsSecureCoding
{
  return byte_1EA699211;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EA699211 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  type metadata accessor for StreamBookmark();
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_1D3001DA8();
  id v8 = (id)_sSS28SiriPrivateLearningAnalyticsE10toNSObjectSo0F0CyF_0();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);
}

- (_TtC28SiriPrivateLearningAnalytics24StreamBookmarkCollection)initWithCoder:(id)a3
{
  return (_TtC28SiriPrivateLearningAnalytics24StreamBookmarkCollection *)StreamBookmarkCollection.init(coder:)(a3);
}

- (_TtC28SiriPrivateLearningAnalytics24StreamBookmarkCollection)init
{
  result = (_TtC28SiriPrivateLearningAnalytics24StreamBookmarkCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end