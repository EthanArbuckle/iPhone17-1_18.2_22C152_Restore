@interface RawUnifiedStream
- (_TtC13SiriAnalytics16RawUnifiedStream)initWithPrivateStreamIdentifier:(id)a3 storeConfig:(id)a4;
- (_TtC13SiriAnalytics16RawUnifiedStream)initWithPrivateStreamIdentifier:(id)a3 storeConfig:(id)a4 eventDataClass:(Class)a5;
- (_TtC13SiriAnalytics16RawUnifiedStream)initWithPublicStream:(int64_t)a3;
- (_TtC13SiriAnalytics16RawUnifiedStream)initWithRestrictedStreamIdentifier:(id)a3;
- (_TtC13SiriAnalytics16RawUnifiedStream)initWithRestrictedStreamIdentifier:(id)a3 protectionClass:(unint64_t)a4;
- (_TtC13SiriAnalytics16RawUnifiedStream)initWithRestrictedStreamIdentifier:(id)a3 storeConfig:(id)a4;
- (_TtC13SiriAnalytics16RawUnifiedStream)initWithRestrictedStreamIdentifier:(id)a3 storeConfig:(id)a4 eventDataClass:(Class)a5;
- (_TtC13SiriAnalytics16RawUnifiedStream)initWithStreamIdentifier:(id)a3 storeConfig:(id)a4;
@end

@implementation RawUnifiedStream

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithPrivateStreamIdentifier:(id)a3 storeConfig:(id)a4 eventDataClass:(Class)a5
{
  sub_1A2C0D480();
  id v6 = a4;
  RawUnifiedStream.init(privateStreamIdentifier:storeConfig:eventDataClass:)();
}

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithStreamIdentifier:(id)a3 storeConfig:(id)a4
{
  sub_1A2C0D480();
  id v5 = a4;
  RawUnifiedStream.init(streamIdentifier:storeConfig:)();
}

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithPublicStream:(int64_t)a3
{
}

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithRestrictedStreamIdentifier:(id)a3
{
}

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithRestrictedStreamIdentifier:(id)a3 protectionClass:(unint64_t)a4
{
}

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithRestrictedStreamIdentifier:(id)a3 storeConfig:(id)a4
{
  sub_1A2C0D480();
  id v5 = a4;
  RawUnifiedStream.init(restrictedStreamIdentifier:storeConfig:)();
}

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithRestrictedStreamIdentifier:(id)a3 storeConfig:(id)a4 eventDataClass:(Class)a5
{
  sub_1A2C0D480();
  id v6 = a4;
  RawUnifiedStream.init(restrictedStreamIdentifier:storeConfig:eventDataClass:)();
}

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithPrivateStreamIdentifier:(id)a3 storeConfig:(id)a4
{
  sub_1A2C0D480();
  id v5 = a4;
  RawUnifiedStream.init(privateStreamIdentifier:storeConfig:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13SiriAnalytics16RawUnifiedStream____lazy_storage___source));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC13SiriAnalytics16RawUnifiedStream____lazy_storage___pruner);
  sub_1A2B52120(v3);
}

@end