@interface face2word_p2qsq24gi2_10000Output
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation face2word_p2qsq24gi2_10000Output

- (NSSet)featureNames
{
  v2 = *(void **)self->provider;
  swift_retain();
  id v3 = objc_msgSend(v2, sel_featureNames);
  sub_26111EE58();
  swift_release();

  v4 = (void *)sub_26111EE48();
  swift_bridgeObjectRelease();

  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  sub_26111EBF8();
  v4 = *(void **)self->provider;
  swift_retain();
  v5 = (void *)sub_26111EBC8();
  id v6 = objc_msgSend(v4, sel_featureValueForName_, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end