@interface VCUserDefaults
- (_TtC12VoiceControlP33_B83C1536E71AFC7DD8A14C611F75D0B914VCUserDefaults)initWithSuiteName:(id)a3;
- (id)objectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation VCUserDefaults

- (_TtC12VoiceControlP33_B83C1536E71AFC7DD8A14C611F75D0B914VCUserDefaults)initWithSuiteName:(id)a3
{
  if (a3)
  {
    v3 = (void *)sub_26151A018();
  }
  else
  {
    v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC12VoiceControlP33_B83C1536E71AFC7DD8A14C611F75D0B914VCUserDefaults *)sub_261512EB0(v3, v4);
}

- (id)objectForKey:(id)a3
{
  sub_26151A018();
  uint64_t v4 = self;
  v5 = (void *)sub_26151A008();
  v15.receiver = v4;
  v15.super_class = (Class)type metadata accessor for VCUserDefaults();
  id v6 = [(VCUserDefaults *)&v15 objectForKey:v5];

  if (v6)
  {
    sub_26151A098();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_261519034((uint64_t)v14, (uint64_t)v16);

  swift_bridgeObjectRelease();
  uint64_t v7 = v17;
  if (v17)
  {
    v8 = __swift_project_boxed_opaque_existential_0(v16, v17);
    uint64_t v9 = *(void *)(v7 - 8);
    MEMORY[0x270FA5388](v8, v8);
    v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    v12 = (void *)sub_26151A108();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    uint64_t v7 = self;
    swift_unknownObjectRetain();
    sub_26151A098();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a4;
    uint64_t v9 = self;
  }
  sub_26151A018();

  sub_261513220((uint64_t)v10);
  swift_bridgeObjectRelease();
  sub_261519E84((uint64_t)v10, &qword_26A9203F0);
}

- (void).cxx_destruct
{
}

@end