@interface BundledNotificationDelaySamePropensitiesOutput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation BundledNotificationDelaySamePropensitiesOutput

- (NSSet)featureNames
{
  v2 = *(void **)self->provider;
  swift_retain();
  id v3 = objc_msgSend(v2, sel_featureNames);
  sub_22A59A998();
  swift_release();

  v4 = (void *)sub_22A59A988();
  swift_bridgeObjectRelease();
  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  sub_22A59A768();
  v4 = *(void **)self->provider;
  swift_retain();
  v5 = (void *)sub_22A59A738();
  id v6 = objc_msgSend(v4, sel_featureValueForName_, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end