@interface aa_verifier_rdr_125141826Input
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation aa_verifier_rdr_125141826Input

- (NSSet)featureNames
{
  swift_retain();
  sub_26142A908((uint64_t)&unk_270D561E0);
  swift_arrayDestroy();
  swift_release();
  v2 = (void *)sub_2614D5898();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_2614D53A8();
  uint64_t v5 = v4;
  swift_retain();
  id v6 = sub_261435B68(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end