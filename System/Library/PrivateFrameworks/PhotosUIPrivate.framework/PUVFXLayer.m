@interface PUVFXLayer
- (_TtC15PhotosUIPrivate10PUVFXLayer)init;
- (_TtC15PhotosUIPrivate10PUVFXLayer)initWithCoder:(id)a3;
- (_TtC15PhotosUIPrivate10PUVFXLayer)initWithLayer:(id)a3;
- (id)actionForKey:(id)a3;
- (void)layoutSublayers;
@end

@implementation PUVFXLayer

- (id)actionForKey:(id)a3
{
  uint64_t v4 = sub_1AEF96DE0();
  uint64_t v6 = v5;
  v7 = self;
  id v8 = sub_1AEB6A334(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)layoutSublayers
{
  v2 = self;
  sub_1AEB6A4F0();
}

- (_TtC15PhotosUIPrivate10PUVFXLayer)init
{
  return (_TtC15PhotosUIPrivate10PUVFXLayer *)PUVFXLayer.init()();
}

- (_TtC15PhotosUIPrivate10PUVFXLayer)initWithLayer:(id)a3
{
  return (_TtC15PhotosUIPrivate10PUVFXLayer *)sub_1AEB6E828((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t *))PUVFXLayer.init(layer:));
}

- (_TtC15PhotosUIPrivate10PUVFXLayer)initWithCoder:(id)a3
{
  return (_TtC15PhotosUIPrivate10PUVFXLayer *)PUVFXLayer.init(coder:)(a3);
}

@end