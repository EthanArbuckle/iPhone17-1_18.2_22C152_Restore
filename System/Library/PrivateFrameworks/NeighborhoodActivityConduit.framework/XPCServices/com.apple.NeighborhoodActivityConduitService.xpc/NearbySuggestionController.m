@interface NearbySuggestionController
- (_TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController)init;
- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 presentationContextChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)dealloc;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateContext:(id)a4;
@end

@implementation NearbySuggestionController

- (void)dealloc
{
  uint64_t v3 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = self;
  v9 = self;
  sub_1000A82D8((uint64_t)v6, (uint64_t)&unk_100117670, (uint64_t)v8);
  swift_release();
  v10 = (objc_class *)type metadata accessor for NearbySuggestionController();
  v11.receiver = v9;
  v11.super_class = v10;
  [(NearbySuggestionController *)&v11 dealloc];
}

- (void).cxx_destruct
{
  sub_10002BD04((uint64_t)self+ OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_suggestionXPCDelegate);
  sub_10002BD04((uint64_t)self + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_conversationManager));
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_1000154D8(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_suggestionState), *(void **)&self->suggestionXPCDelegate[OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_suggestionState]);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_irSession));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_suppressSuggestionTimer);
}

- (_TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController)init
{
  result = (_TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = self;
  sub_10002A85C(v9);
}

- (void)conversationManager:(id)a3 presentationContextChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10002ADDC(v7);
}

- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10002B294(v7);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  uint64_t v7 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v7 - 8, v8);
  id v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = qword_100116178;
  id v13 = a4;
  v14 = self;
  id v15 = v13;
  v16 = v14;
  id v18 = a3;
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_10011BF68;
  uint64_t v20 = sub_10002B7C4((unint64_t *)&unk_100117500, v17, (void (*)(uint64_t))type metadata accessor for NearbySuggestionActor);
  v21 = (void *)swift_allocObject();
  v21[2] = v19;
  v21[3] = v20;
  v21[4] = v15;
  v21[5] = v16;
  swift_retain();
  sub_1000A82D8((uint64_t)v10, (uint64_t)&unk_100117580, (uint64_t)v21);

  swift_release();
}

- (void)session:(id)a3 didUpdateContext:(id)a4
{
  uint64_t v6 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006C20(0, &qword_100117520);
  uint64_t v10 = sub_1000E2370();
  uint64_t v11 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  uint64_t v12 = qword_100116178;
  id v13 = self;
  id v14 = a3;
  swift_bridgeObjectRetain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_10011BF68;
  uint64_t v17 = sub_10002B7C4((unint64_t *)&unk_100117500, v15, (void (*)(uint64_t))type metadata accessor for NearbySuggestionActor);
  id v18 = (void *)swift_allocObject();
  v18[2] = v16;
  v18[3] = v17;
  v18[4] = v10;
  v18[5] = v13;
  swift_retain();
  sub_1000A82D8((uint64_t)v9, (uint64_t)&unk_100117530, (uint64_t)v18);

  swift_bridgeObjectRelease();
  swift_release();
}

@end