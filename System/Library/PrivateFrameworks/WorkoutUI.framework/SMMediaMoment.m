@interface SMMediaMoment
- (SMArtwork)artwork;
- (SMMediaMoment)init;
- (double)duration;
- (double)startTime;
@end

@implementation SMMediaMoment

- (double)startTime
{
  v2 = self;
  sub_261B8B208();
  double v4 = v3;

  return v4;
}

- (double)duration
{
  v2 = self;
  sub_261B8B1F8();
  double v4 = v3;

  return v4;
}

- (SMArtwork)artwork
{
  uint64_t v3 = sub_261B8B788();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_261B8B1E8();
  v8 = (objc_class *)type metadata accessor for ArtworkBridge();
  id v9 = objc_allocWithZone(v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))((uint64_t)v9 + OBJC_IVAR___SMArtwork_artwork, v6, v3);
  v12.receiver = v9;
  v12.super_class = v8;
  v10 = [(SMMediaMoment *)&v12 init];
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (SMArtwork *)v10;
}

- (SMMediaMoment)init
{
  result = (SMMediaMoment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___SMMediaMoment_mediaMoment;
  uint64_t v3 = sub_261B8B218();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end