@interface NBObjCURLHasher
- (NBObjCURLHasher)init;
- (id)hashForURL:(id)a3 maxLength:(int64_t)a4;
@end

@implementation NBObjCURLHasher

- (id)hashForURL:(id)a3 maxLength:(int64_t)a4
{
  uint64_t v6 = sub_1B0059468();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B00593F8();
  v10 = self;
  unint64_t v11 = sub_1B00593D8();
  uint64_t v13 = _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(v11, v12, a4);
  unint64_t v15 = v14;

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v16 = (void *)sub_1B00594C8();
  sub_1B005540C(v13, v15);

  return v16;
}

- (NBObjCURLHasher)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR___NBObjCURLHasher_urlHasher;
  type metadata accessor for URLHasher();
  v5 = (objc_class *)swift_allocObject();
  type metadata accessor for StringHasher();
  *((void *)v5 + 2) = swift_allocObject();
  *(Class *)((char *)&self->super.isa + v4) = v5;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(NBObjCURLHasher *)&v7 init];
}

- (void).cxx_destruct
{
}

@end