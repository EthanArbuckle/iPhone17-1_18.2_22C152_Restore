@interface LIDDisambiguationView.Coordinator
- (_TtCV17SequoiaTranslator21LIDDisambiguationView11Coordinator)init;
- (void)cancelConfirmation;
- (void)lidConfirmedWithLocale:(id)a3;
@end

@implementation LIDDisambiguationView.Coordinator

- (void)cancelConfirmation
{
  uint64_t v3 = sub_100007620((uint64_t *)&unk_1002F4110);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))((char *)&self->super.isa
                                     + OBJC_IVAR____TtCV17SequoiaTranslator21LIDDisambiguationView11Coordinator_onDismiss);
  uint64_t v7 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  v8 = self;
  v6(v5);
  sub_1000CA304((uint64_t)v5);
}

- (void)lidConfirmedWithLocale:(id)a3
{
  uint64_t v4 = sub_100007620((uint64_t *)&unk_1002F4110);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Locale();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = *(void (**)(char *))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV17SequoiaTranslator21LIDDisambiguationView11Coordinator_onDismiss);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  v12 = self;
  v11(v6);
  sub_1000CA304((uint64_t)v6);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtCV17SequoiaTranslator21LIDDisambiguationView11Coordinator)init
{
  result = (_TtCV17SequoiaTranslator21LIDDisambiguationView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end