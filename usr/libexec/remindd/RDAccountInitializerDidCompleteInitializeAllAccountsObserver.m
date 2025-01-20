@interface RDAccountInitializerDidCompleteInitializeAllAccountsObserver
- (RDAccountInitializerDidCompleteInitializeAllAccountsObserver)init;
- (RDAccountInitializerDidCompleteInitializeAllAccountsObserver)initWithHandler:(id)a3 queue:(id)a4;
- (void)didCompleteInitializeAllAccounts:(id)a3;
- (void)observe;
- (void)unobserve;
@end

@implementation RDAccountInitializerDidCompleteInitializeAllAccountsObserver

- (RDAccountInitializerDidCompleteInitializeAllAccountsObserver)initWithHandler:(id)a3 queue:(id)a4
{
  v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (void (**)())((char *)self + OBJC_IVAR___RDAccountInitializerDidCompleteInitializeAllAccountsObserver_handler);
  *v8 = sub_10041FE58;
  v8[1] = (void (*)())v7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___RDAccountInitializerDidCompleteInitializeAllAccountsObserver_queue) = (Class)a4;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RDAccountInitializer.DidCompleteInitializeAllAccountsObserver();
  id v9 = a4;
  return [(RDAccountInitializerDidCompleteInitializeAllAccountsObserver *)&v11 init];
}

- (void)observe
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  id v6 = v5;
  if (qword_100907568 != -1)
  {
    swift_once();
    id v5 = v6;
  }
  [v5 addObserver:v4 selector:"didCompleteInitializeAllAccounts:" name:qword_100942250 object:0];
}

- (void)unobserve
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  id v6 = v5;
  if (qword_100907568 != -1)
  {
    swift_once();
    id v5 = v6;
  }
  [v5 removeObserver:v4 name:qword_100942250 object:0];
}

- (void)didCompleteInitializeAllAccounts:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10041A4D0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (RDAccountInitializerDidCompleteInitializeAllAccountsObserver)init
{
  result = (RDAccountInitializerDidCompleteInitializeAllAccountsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___RDAccountInitializerDidCompleteInitializeAllAccountsObserver_queue);
}

@end