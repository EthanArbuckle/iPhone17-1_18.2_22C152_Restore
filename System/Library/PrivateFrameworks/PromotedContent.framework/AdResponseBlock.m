@interface AdResponseBlock
- (_TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock)init;
- (id)requesterID;
- (void)connectionSeveredWithError:(id)a3;
- (void)contentResponses:(id)a3;
@end

@implementation AdResponseBlock

- (void)contentResponses:(id)a3
{
  if (a3)
  {
    sub_1B5BF7D3C(0, (unint64_t *)&unk_1EB8516D0);
    unint64_t v4 = sub_1B5CB34C0();
  }
  else
  {
    unint64_t v4 = 0;
  }
  v5 = self;
  sub_1B5C6BF94(v4);

  swift_bridgeObjectRelease();
}

- (void)connectionSeveredWithError:(id)a3
{
  id v5 = a3;
  unint64_t v4 = self;
  sub_1B5C6D000();
}

- (id)requesterID
{
  v2 = (void *)sub_1B5CB30C0();
  return v2;
}

- (_TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock)init
{
  result = (_TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B5C16CE8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock_completion));
  v3 = (char *)self
     + OBJC_IVAR____TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock_requestIdentifier;
  uint64_t v4 = sub_1B5CB3100();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock_context));
  swift_bridgeObjectRelease();
  id v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15PromotedContentP33_E3331A4917F70526BBCA8EA71ED6884515AdResponseBlock_responseLock);
}

@end