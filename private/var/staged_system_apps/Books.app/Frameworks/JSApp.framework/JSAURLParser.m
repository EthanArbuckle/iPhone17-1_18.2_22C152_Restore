@interface JSAURLParser
+ (id)sharedParser;
- (JSAURLParser)init;
- (id)processCampaignAttributedURL:(id)a3;
- (void)isCommerceUIURLWithCallback:(id)a3 :(id)a4;
- (void)typeForURL:(NSURL *)a3 completion:(id)a4;
@end

@implementation JSAURLParser

- (void)typeForURL:(NSURL *)a3 completion:(id)a4
{
  uint64_t v7 = sub_2D920(&qword_CCEA0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_86B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_CCA48;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_CCFC0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_59BFC((uint64_t)v9, (uint64_t)&unk_CCFD0, (uint64_t)v14);
  swift_release();
}

- (JSAURLParser)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(JSAURLParser *)&v3 init];
}

+ (id)sharedParser
{
  if (qword_CC438 != -1) {
    swift_once();
  }
  v0 = (void *)qword_CC9E8;

  return v0;
}

- (void)isCommerceUIURLWithCallback:(id)a3 :(id)a4
{
  uint64_t v6 = sub_2D920(&qword_CCEA0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_86860();
  uint64_t v11 = v10;
  uint64_t v12 = sub_86B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = v9;
  v13[6] = v11;
  v13[7] = a4;
  id v14 = a4;
  v15 = self;
  id v16 = v14;
  swift_bridgeObjectRetain();
  sub_43B10((uint64_t)v8, (uint64_t)&unk_CCA38, (uint64_t)v13);
  swift_release();
  sub_33054((uint64_t)v8, &qword_CCEA0);

  swift_bridgeObjectRelease();
}

- (id)processCampaignAttributedURL:(id)a3
{
  uint64_t v4 = sub_86860();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  _s5JSApp9URLParserC28processCampaignAttributedURLySo7JSValueCSSF_0(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();

  return v9;
}

@end