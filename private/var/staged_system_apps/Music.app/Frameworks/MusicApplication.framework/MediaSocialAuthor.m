@interface MediaSocialAuthor
- (_TtC16MusicApplication17MediaSocialAuthor)init;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
@end

@implementation MediaSocialAuthor

- (_TtC16MusicApplication17MediaSocialAuthor)init
{
  return (_TtC16MusicApplication17MediaSocialAuthor *)sub_526A4C();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_526B08(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_AB8630();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  v2 = self;
  id v3 = sub_526CD0();

  return (int64_t)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication17MediaSocialAuthor_lookupItemArtworkInfo);
}

@end