@interface PersistenceAdaptor.ClientStateObserver
- (_TtCC7Message18PersistenceAdaptor19ClientStateObserver)init;
- (void)dealloc;
@end

@implementation PersistenceAdaptor.ClientStateObserver

- (void)dealloc
{
  v2 = self;
  sub_1A80EC544();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC7Message18PersistenceAdaptor19ClientStateObserver_queue));
  sub_1A80E9C14();
  sub_1A80CA1D8((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC7Message18PersistenceAdaptor19ClientStateObserver_mailboxPersistence));
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC7Message18PersistenceAdaptor19ClientStateObserver_observerQueue));
}

- (_TtCC7Message18PersistenceAdaptor19ClientStateObserver)init
{
  return (_TtCC7Message18PersistenceAdaptor19ClientStateObserver *)sub_1A80EE1E8();
}

@end