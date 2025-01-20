@interface CRLCommandSetMovieVolume
- (BOOL)supportsSimultaneousExecutionWithOtherCommands;
- (NSUUID)id;
- (_TtC8Freeform24CRLCommandSetMovieVolume)init;
- (_TtC8Freeform24CRLCommandSetMovieVolume)initWithId:(id)a3 volume:(float)a4;
- (_TtC8Freeform24CRLCommandSetMovieVolume)initWithMovieItem:(id)a3 volume:(float)a4;
- (float)volume;
@end

@implementation CRLCommandSetMovieVolume

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (float)volume
{
  return *(float *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCommandSetMovieVolume_volume);
}

- (_TtC8Freeform24CRLCommandSetMovieVolume)initWithId:(id)a3 volume:(float)a4
{
  return (_TtC8Freeform24CRLCommandSetMovieVolume *)sub_1009F777C((char *)self, a4, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8Freeform24CRLCommandSetMovieVolume_id, &OBJC_IVAR____TtC8Freeform24CRLCommandSetMovieVolume_volume, type metadata accessor for CRLCommandSetMovieVolume);
}

- (_TtC8Freeform24CRLCommandSetMovieVolume)initWithMovieItem:(id)a3 volume:(float)a4
{
  return (_TtC8Freeform24CRLCommandSetMovieVolume *)sub_1009F78D4(self, a4, (uint64_t)a2, (char *)a3, (SEL *)&selRef_initWithId_volume_);
}

- (BOOL)supportsSimultaneousExecutionWithOtherCommands
{
  return 1;
}

- (_TtC8Freeform24CRLCommandSetMovieVolume)init
{
  result = (_TtC8Freeform24CRLCommandSetMovieVolume *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end