@interface pet2word_uecuevsnd9_10000Input
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation pet2word_uecuevsnd9_10000Input

- (NSSet)featureNames
{
  sub_26111E2F4((uint64_t)&unk_270D2FF68);
  swift_arrayDestroy();
  v2 = (void *)sub_26111EE48();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  if (sub_26111EBF8() == 0xD000000000000011 && v4 == 0x80000002611226C0 || (sub_26111F408() & 1) != 0)
  {
    uint64_t v5 = *(void *)self->subject_embedding;
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