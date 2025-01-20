@interface PlayMediaAppSelectionOutput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation PlayMediaAppSelectionOutput

- (NSSet)featureNames
{
  v2 = *(void **)self->provider;
  swift_retain();
  id v3 = objc_msgSend(v2, sel_featureNames);
  sub_2380E4C78();
  swift_release();

  v4 = (void *)sub_2380E4C68();
  swift_bridgeObjectRelease();
  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  sub_2380E4938();
  v4 = *(void **)self->provider;
  swift_retain();
  v5 = (void *)sub_2380E4918();
  id v6 = objc_msgSend(v4, sel_featureValueForName_, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end