@interface EventStoreManager
- (_TtC8AppStore17EventStoreManager)init;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
@end

@implementation EventStoreManager

- (_TtC8AppStore17EventStoreManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC8AppStore17EventStoreManager_eventStore;
  id v5 = objc_allocWithZone((Class)EKEventStore);
  v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)[v5 init];

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return [(EventStoreManager *)&v8 init];
}

- (void).cxx_destruct
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v5 = (_TtC8AppStore17EventStoreManager *)a3;
  objc_super v8 = self;
  v6 = (_TtC8AppStore17EventStoreManager *)[(EventStoreManager *)v5 presentingViewController];
  if (v6)
  {
    v7 = v6;
    [(EventStoreManager *)v6 dismissViewControllerAnimated:1 completion:0];

    id v5 = v8;
    objc_super v8 = v7;
  }
}

@end