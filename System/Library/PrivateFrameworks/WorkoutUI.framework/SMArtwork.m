@interface SMArtwork
- (BOOL)isEqual:(id)a3;
- (NSString)backgroundColor;
- (NSString)template;
- (NSString)textColor;
- (SMArtwork)init;
- (int64_t)hash;
@end

@implementation SMArtwork

- (NSString)backgroundColor
{
  return (NSString *)sub_2619FBBF8(self, (uint64_t)a2, MEMORY[0x263F6B0F0]);
}

- (NSString)template
{
  return (NSString *)sub_2619FBBF8(self, (uint64_t)a2, MEMORY[0x263F6B0F8]);
}

- (NSString)textColor
{
  return (NSString *)sub_2619FBBF8(self, (uint64_t)a2, MEMORY[0x263F6B100]);
}

- (SMArtwork)init
{
  result = (SMArtwork *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___SMArtwork_artwork;
  uint64_t v3 = sub_261B8B788();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

- (int64_t)hash
{
  sub_261B8FCF8();
  sub_261B8B788();
  sub_2619FC1E8();
  uint64_t v3 = self;
  sub_261B8F028();
  sub_261B8B748();
  sub_261B8F188();
  swift_bridgeObjectRelease();
  sub_261B8B768();
  sub_261B8F188();
  swift_bridgeObjectRelease();
  sub_261B8B778();
  sub_261B8F188();
  swift_bridgeObjectRelease();
  int64_t v4 = sub_261B8FCD8();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    int64_t v4 = self;
    swift_unknownObjectRetain();
    sub_261B8F7B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  sub_2619FC2D4((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_2619FC33C((uint64_t)v9);
    goto LABEL_8;
  }
  type metadata accessor for ArtworkBridge();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    char v6 = 0;
    goto LABEL_9;
  }
  char v6 = sub_2619FC47C((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_2619FC33C((uint64_t)v11);
  return v6 & 1;
}

@end