@interface PlaylistCovers.ArtworkToken
- (_TtCO9MusicCore14PlaylistCovers12ArtworkToken)init;
- (id)copyWithZone:(void *)a3;
- (id)stringRepresentation;
@end

@implementation PlaylistCovers.ArtworkToken

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  PlaylistCovers.ArtworkToken.copy(with:)(v6);

  sub_10000BADC(v6, v6[3]);
  v4 = (void *)sub_100485910();
  sub_10000BB88((uint64_t)v6);
  return v4;
}

- (id)stringRepresentation
{
  v2 = self;
  object = PlaylistCovers.ArtworkToken.stringRepresentation()().value._object;

  if (object)
  {
    NSString v4 = sub_100483DD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }

  return v4;
}

- (_TtCO9MusicCore14PlaylistCovers12ArtworkToken)init
{
  result = (_TtCO9MusicCore14PlaylistCovers12ArtworkToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->coverRepresentation[OBJC_IVAR____TtCO9MusicCore14PlaylistCovers12ArtworkToken_coverRepresentation];
  v3 = *(void **)&self->coverRepresentation[OBJC_IVAR____TtCO9MusicCore14PlaylistCovers12ArtworkToken_coverRepresentation
                                          + 8];
  NSString v4 = *(void **)&self->coverRepresentation[OBJC_IVAR____TtCO9MusicCore14PlaylistCovers12ArtworkToken_coverRepresentation
                                          + 16];
  v5 = *(void **)&self->coverRepresentation[OBJC_IVAR____TtCO9MusicCore14PlaylistCovers12ArtworkToken_coverRepresentation
                                          + 24];
  v6 = *(void **)&self->coverRepresentation[OBJC_IVAR____TtCO9MusicCore14PlaylistCovers12ArtworkToken_coverRepresentation
                                          + 32];
  objc_release(*(id *)&self->coverRepresentation[OBJC_IVAR____TtCO9MusicCore14PlaylistCovers12ArtworkToken_coverRepresentation
                                               + 40]);

  swift_bridgeObjectRelease();
}

@end