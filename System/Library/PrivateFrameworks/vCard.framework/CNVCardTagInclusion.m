@interface CNVCardTagInclusion
+ (id)policyWithTags:(id)a3;
- (_TtC5vCard19CNVCardTagInclusion)init;
@end

@implementation CNVCardTagInclusion

+ (id)policyWithTags:(id)a3
{
  if (a3)
  {
    sub_1DC1B4938();
    id v3 = objc_allocWithZone((Class)type metadata accessor for CNVCardTagInclusionRestrictedPolicy());
    uint64_t v4 = swift_bridgeObjectRetain();
    id v5 = sub_1DC1B31C4(v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CNVCardTagInclusionPermissivePolicy()), sel_init);
  }
  return v5;
}

- (_TtC5vCard19CNVCardTagInclusion)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNVCardTagInclusion();
  return [(CNVCardTagInclusion *)&v3 init];
}

@end