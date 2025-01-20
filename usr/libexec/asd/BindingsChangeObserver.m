@interface BindingsChangeObserver
+ (_TtC3asd22BindingsChangeObserver)shared;
- (_TtC3asd22BindingsChangeObserver)init;
- (void)registerObservers;
@end

@implementation BindingsChangeObserver

+ (_TtC3asd22BindingsChangeObserver)shared
{
  id v2 = static BindingsChangeObserver.shared.getter();

  return (_TtC3asd22BindingsChangeObserver *)v2;
}

- (void)registerObservers
{
  id v2 = self;
  BindingsChangeObserver.registerObservers()();
}

- (_TtC3asd22BindingsChangeObserver)init
{
}

- (void).cxx_destruct
{
  sub_10002EB9C((uint64_t)self + OBJC_IVAR____TtC3asd22BindingsChangeObserver_contactsManager);
  v3 = (char *)self + OBJC_IVAR____TtC3asd22BindingsChangeObserver_xpcStreamListener;

  sub_10002EB9C((uint64_t)v3);
}

@end