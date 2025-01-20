@interface FRArticleNotificationFeedPersonalizerFactory
- (FRArticleNotificationFeedPersonalizerFactory)init;
- (FRArticleNotificationFeedPersonalizerFactory)initWithTranslationProvider:(id)a3;
- (id)newFeedPersonalizerWithAggregateStore:(id)a3 appConfigurationManager:(id)a4 todayPrivateData:(id)a5;
@end

@implementation FRArticleNotificationFeedPersonalizerFactory

- (FRArticleNotificationFeedPersonalizerFactory)initWithTranslationProvider:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FRArticleNotificationFeedPersonalizerFactory_translationProvider) = (Class)a3;
  v7.receiver = self;
  v7.super_class = ObjectType;
  swift_unknownObjectRetain();
  return [(FRArticleNotificationFeedPersonalizerFactory *)&v7 init];
}

- (id)newFeedPersonalizerWithAggregateStore:(id)a3 appConfigurationManager:(id)a4 todayPrivateData:(id)a5
{
  id v6 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  objc_super v7 = self;
  v8 = (void *)sub_100008DBC(v6);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v8;
}

- (FRArticleNotificationFeedPersonalizerFactory)init
{
  result = (FRArticleNotificationFeedPersonalizerFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end