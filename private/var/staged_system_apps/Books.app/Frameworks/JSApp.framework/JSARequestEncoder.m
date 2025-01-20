@interface JSARequestEncoder
- (JSARequestEncoder)initWithTokenService:(id)a3 bag:(id)a4;
- (JSARequestEncoder)initWithTokenService:(id)a3 bag:(id)a4 cookiesToSuppress:(id)a5;
- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4;
@end

@implementation JSARequestEncoder

- (JSARequestEncoder)initWithTokenService:(id)a3 bag:(id)a4 cookiesToSuppress:(id)a5
{
  *(void *)&self->AMSMediaRequestEncoder_opaque[OBJC_IVAR___JSARequestEncoder_cookiesToSuppress] = sub_86A30();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for RequestEncoder();
  return [(JSARequestEncoder *)&v9 initWithTokenService:a3 bag:a4];
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  uint64_t v6 = sub_85CA0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_85C90();
  if (a4)
  {
    v10 = self;
    swift_unknownObjectRetain();
    sub_86DC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v11 = self;
  }
  sub_4C7A4((uint64_t)v9, (uint64_t)v15);
  v13 = v12;

  sub_4C364((uint64_t)v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (JSARequestEncoder)initWithTokenService:(id)a3 bag:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  result = (JSARequestEncoder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end