@interface ElementMindNetSquareInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation ElementMindNetSquareInput

- (NSSet)featureNames
{
  sub_260622DDC((uint64_t)&unk_270C84088);
  swift_arrayDestroy();
  v2 = (void *)sub_2606559D8();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  if (sub_2606557B8() == 0x6567616D69 && v4 == 0xE500000000000000 || (sub_260655FE8() & 1) != 0)
  {
    uint64_t v5 = *(void *)self->image;
    v6 = self;
    swift_retain();
    id v7 = objc_msgSend(v6, sel_featureValueWithPixelBuffer_, v5);
    swift_release();
  }
  else
  {
    id v7 = 0;
  }
  swift_bridgeObjectRelease();

  return v7;
}

@end