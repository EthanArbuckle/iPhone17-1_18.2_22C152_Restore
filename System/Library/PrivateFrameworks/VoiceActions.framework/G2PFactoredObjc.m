@interface G2PFactoredObjc
- (G2PFactoredObjc)init;
- (id)getPhrasePronounciationWithPhrase:(id)a3 wordSep:(id)a4 prefixWithPhrase:(BOOL)a5;
- (id)getPronounciationWithWord:(id)a3;
- (void)setup;
@end

@implementation G2PFactoredObjc

- (void)setup
{
  v3 = *(uint64_t (**)(void))(type metadata accessor for G2PFactored() + 80);
  v5 = self;
  uint64_t v4 = v3();
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)v5->super.isa) + 0x68))(v4);
}

- (id)getPhrasePronounciationWithPhrase:(id)a3 wordSep:(id)a4 prefixWithPhrase:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = sub_2614D53A8();
  unint64_t v9 = v8;
  uint64_t v10 = sub_2614D53A8();
  uint64_t v12 = v11;
  v13 = self;
  sub_26147E2F0(v7, v9, v10, v12, v5);
  uint64_t v15 = v14;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
    v16 = (void *)sub_2614D5378();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (id)getPronounciationWithWord:(id)a3
{
  uint64_t v4 = sub_2614D53A8();
  uint64_t v6 = v5;
  uint64_t v7 = (void *)MEMORY[0x263F8EED0];
  unint64_t v8 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x60);
  unint64_t v9 = self;
  uint64_t v10 = (void *)v8();
  uint64_t v11 = v10;
  if (v10)
  {
    (*(void (**)(uint64_t, uint64_t))((*v7 & *v10) + 0x58))(v4, v6);

    swift_bridgeObjectRelease();
    uint64_t v11 = (void *)sub_2614D5378();
  }
  else
  {
  }
  swift_bridgeObjectRelease();
  return v11;
}

- (G2PFactoredObjc)init
{
  v2 = self;
  sub_2614D50B8();
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR___G2PFactoredObjc_g2p) = 0;

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for G2P();
  return [(G2PFactoredObjc *)&v4 init];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___G2PFactoredObjc_logger;
  uint64_t v4 = sub_2614D50C8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___G2PFactoredObjc_g2p);
}

@end