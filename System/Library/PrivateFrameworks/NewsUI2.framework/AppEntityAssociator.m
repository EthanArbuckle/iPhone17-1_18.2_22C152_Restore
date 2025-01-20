@interface AppEntityAssociator
- (AppEntityAssociator)init;
- (void)associateAppEntityFromHeadline:(id)a3 with:(id)a4;
@end

@implementation AppEntityAssociator

- (AppEntityAssociator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppEntityAssociator();
  return [(AppEntityAssociator *)&v3 init];
}

- (void)associateAppEntityFromHeadline:(id)a3 with:(id)a4
{
  sub_1DEC8DD60(0);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1DFDE8C60();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain_n();
  id v13 = a4;
  v14 = self;
  sub_1DFDE8C50();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_1DF2EF8BC((uint64_t)v8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    sub_1DF2EF918();
    sub_1DFDFEB70();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  swift_unknownObjectRelease();
}

@end