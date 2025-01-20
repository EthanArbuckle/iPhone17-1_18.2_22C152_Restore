@interface WidgetConfigurationParameterDataSource
- (_TtC28WidgetConfigurationExtension38WidgetConfigurationParameterDataSource)init;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)parameterAttributesDidChange:(id)a3;
@end

@implementation WidgetConfigurationParameterDataSource

- (_TtC28WidgetConfigurationExtension38WidgetConfigurationParameterDataSource)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28WidgetConfigurationExtension38WidgetConfigurationParameterDataSource_action));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtC28WidgetConfigurationExtension38WidgetConfigurationParameterDataSource___observationRegistrar;
  uint64_t v4 = sub_10001C650();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  uint64_t v6 = sub_10001CB10();
  unint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_10000C79C(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)parameterAttributesDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000CB44(v4);
}

@end