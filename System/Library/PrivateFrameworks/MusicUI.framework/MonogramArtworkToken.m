@interface MonogramArtworkToken
- (_TtC7MusicUI20MonogramArtworkToken)init;
- (id)copyWithZone:(void *)a3;
- (id)stringRepresentation;
@end

@implementation MonogramArtworkToken

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_229D8D8E0(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_22A171950();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  return v4;
}

- (id)stringRepresentation
{
  v2 = self;
  sub_229D8DA34();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_22A1707A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_TtC7MusicUI20MonogramArtworkToken)init
{
}

- (void).cxx_destruct
{
}

@end