@interface AEAClientConnection
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC15assessmentagent19AEAClientConnection)init;
- (void)dealloc;
- (void)endPublications:(id)a3;
- (void)publishAssessmentState:(id)a3 withCompletion:(id)a4;
@end

@implementation AEAClientConnection

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15assessmentagent19AEAClientConnection_publicationListener);
  v3 = self;
  [v2 invalidate];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AEAClientConnection();
  [(AEAClientConnection *)&v4 dealloc];
}

- (void).cxx_destruct
{
  sub_10000C9D4((uint64_t)self + OBJC_IVAR____TtC15assessmentagent19AEAClientConnection_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15assessmentagent19AEAClientConnection_publicationListener));
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15assessmentagent19AEAClientConnection_lifecycleEventHandlingProxy);
}

- (_TtC15assessmentagent19AEAClientConnection)init
{
  result = (_TtC15assessmentagent19AEAClientConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = sub_10000C68C(v7);

  return v9 & 1;
}

- (void)publishAssessmentState:(id)a3 withCompletion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  unsigned __int8 v9 = self;
  sub_10000B0DC(v8, (uint64_t)sub_10000CBB4, v7);

  swift_release();
}

- (void)endPublications:(id)a3
{
  objc_super v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_10000B5A0((uint64_t)sub_10000C56C, v5);

  swift_release();
}

@end