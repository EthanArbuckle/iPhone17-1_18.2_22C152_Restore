@interface PBFPosterPair
- (NSString)description;
- (NSString)localizedTitle;
- (NSUUID)configurationUUID;
- (PBFPosterPair)init;
- (PBFPosterPair)initWithConfiguration:(id)a3 associatedConfiguration:(id)a4;
- (void)setLocalizedTitle:(id)a3;
@end

@implementation PBFPosterPair

- (PBFPosterPair)initWithConfiguration:(id)a3 associatedConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_1D3359648(v5, a4);
  v8 = v7;

  return v8;
}

- (NSString)localizedTitle
{
  if (*(void *)&self->id[OBJC_IVAR___PBFPosterPair_localizedTitle])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1D3372258();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setLocalizedTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1D3372288();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___PBFPosterPair_localizedTitle);
  *id v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (NSUUID)configurationUUID
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD6F910);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = self;
  PosterPair.configurationUUID.getter((uint64_t)v5);

  uint64_t v7 = sub_1D3371F48();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1D3371F08();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)v9;
}

- (NSString)description
{
  v2 = self;
  PosterPair.description.getter();

  uint64_t v3 = (void *)sub_1D3372258();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PBFPosterPair)init
{
  result = (PBFPosterPair *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBFPosterPair_observers);
}

@end