@interface OCRAddressModelInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation OCRAddressModelInput

- (NSSet)featureNames
{
  sub_1DCFEC2D4((uint64_t)&unk_1F3835D90);
  swift_arrayDestroy();
  v2 = (void *)sub_1DD0487C8();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  if (sub_1DD048408() == 120 && v4 == 0xE100000000000000 || (sub_1DD048FA8() & 1) != 0)
  {
    uint64_t v5 = *(void *)self->x;
    v6 = self;
    swift_retain();
    id v7 = objc_msgSend(v6, sel_featureValueWithMultiArray_, v5);
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