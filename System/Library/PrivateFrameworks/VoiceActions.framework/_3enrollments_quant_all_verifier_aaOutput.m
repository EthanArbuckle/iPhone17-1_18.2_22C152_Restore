@interface _3enrollments_quant_all_verifier_aaOutput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation _3enrollments_quant_all_verifier_aaOutput

- (NSSet)featureNames
{
  v2 = *(void **)self->provider;
  swift_retain();
  id v3 = objc_msgSend(v2, sel_featureNames);
  sub_2614D58A8();
  swift_release();

  v4 = (void *)sub_2614D5898();
  swift_bridgeObjectRelease();
  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  sub_2614D53A8();
  v4 = *(void **)self->provider;
  swift_retain();
  v5 = (void *)sub_2614D5378();
  id v6 = objc_msgSend(v4, sel_featureValueForName_, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end