@interface quant_enc_f32_wofeatsInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation quant_enc_f32_wofeatsInput

- (NSSet)featureNames
{
  sub_26142A908((uint64_t)&unk_270D560C8);
  swift_arrayDestroy();
  v2 = (void *)sub_2614D5898();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  if (sub_2614D53A8() == 0x61775F7475706E69 && v4 == 0xE900000000000076 || (sub_2614D5FB8() & 1) != 0)
  {
    v5 = (uint64_t (*)(uint64_t))*((void *)self->super.isa + 11);
    uint64_t v6 = swift_retain();
    v7 = (void *)v5(v6);
    id v8 = objc_msgSend(self, sel_featureValueWithMultiArray_, v7);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    id v8 = 0;
  }
  return v8;
}

@end