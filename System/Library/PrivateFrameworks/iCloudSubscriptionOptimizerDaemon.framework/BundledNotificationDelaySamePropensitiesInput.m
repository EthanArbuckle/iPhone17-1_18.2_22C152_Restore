@interface BundledNotificationDelaySamePropensitiesInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation BundledNotificationDelaySamePropensitiesInput

- (NSSet)featureNames
{
  sub_22A598C84((uint64_t)&unk_26DE21870);
  swift_arrayDestroy();
  v2 = (void *)sub_22A59A988();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  if (sub_22A59A768() == 0x694D74657366666FLL && v4 == 0xEA0000000000736ELL || (sub_22A59AC18() & 1) != 0)
  {
    double v5 = *(double *)self->offsetMins;
    v6 = self;
    swift_retain();
    id v7 = objc_msgSend(v6, sel_featureValueWithDouble_, v5);
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