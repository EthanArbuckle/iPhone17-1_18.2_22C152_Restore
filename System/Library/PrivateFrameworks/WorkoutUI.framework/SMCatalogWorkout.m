@interface SMCatalogWorkout
- (BOOL)isGuidedRun;
- (BOOL)isGuidedVideo;
- (BOOL)isGuidedWalk;
- (BOOL)isPartOfAStack;
- (NSArray)musicTracks;
- (NSDateComponents)dateReleased;
- (NSNumber)mediaTypeRawValue;
- (NSSet)artwork;
- (NSSet)mediaMoments;
- (NSString)identifier;
- (NSString)location;
- (NSString)musicPlaylistIdentifier;
- (NSString)summary;
- (NSString)title;
- (NSURL)musicPlaylistURL;
- (NSURL)streamingURL;
- (SMCatalogWorkout)init;
- (SMContributor)narrator;
- (double)duration;
@end

@implementation SMCatalogWorkout

- (BOOL)isPartOfAStack
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SMCatalogWorkout_isPartOfAStack);
}

- (NSDateComponents)dateReleased
{
  return (NSDateComponents *)sub_261A6064C(self, (uint64_t)a2, MEMORY[0x263F063B0], MEMORY[0x263F695A8], MEMORY[0x263F06388]);
}

- (NSString)identifier
{
  return (NSString *)sub_261A5FA08(self, (uint64_t)a2, MEMORY[0x263F69598]);
}

- (NSString)title
{
  return (NSString *)sub_261A5FA08(self, (uint64_t)a2, MEMORY[0x263F695C0]);
}

- (SMContributor)narrator
{
  v2 = self;
  v3 = (void *)sub_261A5FAF4();

  return (SMContributor *)v3;
}

- (NSString)location
{
  return (NSString *)sub_261A60D50(self, (uint64_t)a2, MEMORY[0x263F695D8]);
}

- (NSSet)artwork
{
  return (NSSet *)sub_261A60E4C(self, (uint64_t)a2, (void (*)(void))sub_261A602C8, (void (*)(void))type metadata accessor for ArtworkBridge, &qword_26A9453E8, (void (*)(uint64_t))type metadata accessor for ArtworkBridge);
}

- (NSURL)streamingURL
{
  return (NSURL *)sub_261A6064C(self, (uint64_t)a2, MEMORY[0x263F06EA8], MEMORY[0x263F695B0], MEMORY[0x263F06E88]);
}

- (double)duration
{
  v2 = self;
  sub_261B8B458();
  double v4 = v3;

  return v4;
}

- (NSString)summary
{
  return (NSString *)sub_261A60D50(self, (uint64_t)a2, MEMORY[0x263F695D0]);
}

- (NSArray)musicTracks
{
  v2 = self;
  sub_261A608B0();

  type metadata accessor for MusicTrackBridge();
  double v3 = (void *)sub_261B8F2C8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSURL)musicPlaylistURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9453E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_261B8B408();

  uint64_t v7 = sub_261B8ABF8();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_261B8ABD8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (NSString)musicPlaylistIdentifier
{
  return (NSString *)sub_261A60D50(self, (uint64_t)a2, MEMORY[0x263F695B8]);
}

- (NSSet)mediaMoments
{
  return (NSSet *)sub_261A60E4C(self, (uint64_t)a2, (void (*)(void))sub_261A60EEC, (void (*)(void))type metadata accessor for MediaMomentBridge, &qword_26A9453D8, (void (*)(uint64_t))type metadata accessor for MediaMomentBridge);
}

- (BOOL)isGuidedWalk
{
  return sub_261A61258(self);
}

- (BOOL)isGuidedRun
{
  return sub_261A61258(self);
}

- (BOOL)isGuidedVideo
{
  return sub_261A61258(self);
}

- (NSNumber)mediaTypeRawValue
{
  v2 = self;
  id v3 = sub_261A613E8();

  return (NSNumber *)v3;
}

- (SMCatalogWorkout)init
{
  result = (SMCatalogWorkout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___SMCatalogWorkout_workout;
  uint64_t v3 = sub_261B8B488();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end