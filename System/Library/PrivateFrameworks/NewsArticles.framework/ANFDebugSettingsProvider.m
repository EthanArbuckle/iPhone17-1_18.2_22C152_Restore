@interface ANFDebugSettingsProvider
- (BOOL)testingConditionEnabled;
- (BOOL)viewportDebuggingEnabled;
- (_TtC12NewsArticles24ANFDebugSettingsProvider)init;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setTestingConditionEnabled:(BOOL)a3;
- (void)setViewportDebuggingEnabled:(BOOL)a3;
@end

@implementation ANFDebugSettingsProvider

- (BOOL)viewportDebuggingEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles24ANFDebugSettingsProvider_viewportDebuggingEnabled);
}

- (void)setViewportDebuggingEnabled:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles24ANFDebugSettingsProvider_viewportDebuggingEnabled) = a3;
}

- (BOOL)testingConditionEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles24ANFDebugSettingsProvider_testingConditionEnabled);
}

- (void)setTestingConditionEnabled:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles24ANFDebugSettingsProvider_testingConditionEnabled) = a3;
}

- (_TtC12NewsArticles24ANFDebugSettingsProvider)init
{
  return (_TtC12NewsArticles24ANFDebugSettingsProvider *)sub_1BF5C013C();
}

- (void).cxx_destruct
{
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

@end