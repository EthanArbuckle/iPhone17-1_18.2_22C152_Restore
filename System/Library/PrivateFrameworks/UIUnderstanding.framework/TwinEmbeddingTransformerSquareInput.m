@interface TwinEmbeddingTransformerSquareInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation TwinEmbeddingTransformerSquareInput

- (NSSet)featureNames
{
  swift_retain();
  sub_260622DDC((uint64_t)&unk_270C84360);
  swift_arrayDestroy();
  swift_release();
  v2 = (void *)sub_2606559D8();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_2606557B8();
  uint64_t v5 = v4;
  swift_retain();
  id v6 = sub_2605F0D6C(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end