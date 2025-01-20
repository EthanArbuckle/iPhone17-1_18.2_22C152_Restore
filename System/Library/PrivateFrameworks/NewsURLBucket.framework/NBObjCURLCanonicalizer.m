@interface NBObjCURLCanonicalizer
- (NBObjCURLCanonicalizer)init;
- (id)canonicalizedURLForURL:(id)a3;
@end

@implementation NBObjCURLCanonicalizer

- (id)canonicalizedURLForURL:(id)a3
{
  uint64_t v4 = sub_1B0059468();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  v10 = (char *)&v15 - v9;
  sub_1B00593F8();
  v11 = self;
  URLCanonicalizer.canonicalizedURL(for:)((uint64_t)v8, (uint64_t)v10);

  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v13 = (void *)sub_1B00593E8();
  v12(v10, v4);

  return v13;
}

- (NBObjCURLCanonicalizer)init
{
  return (NBObjCURLCanonicalizer *)sub_1B005732C((char *)self, (uint64_t)a2, &OBJC_IVAR___NBObjCURLCanonicalizer_urlCanonicalizer, (void (*)(void))type metadata accessor for URLCanonicalizer);
}

- (void).cxx_destruct
{
}

@end