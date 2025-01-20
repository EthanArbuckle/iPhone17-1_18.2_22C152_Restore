@interface SFProximityHandoffInvocations.NearbySharingInteractionViewUpdate
+ (BOOL)supportsSecureCoding;
- (_TtCO7Sharing29SFProximityHandoffInvocations34NearbySharingInteractionViewUpdate)initWithCoder:(id)a3;
- (id)init;
@end

@implementation SFProximityHandoffInvocations.NearbySharingInteractionViewUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtCO7Sharing29SFProximityHandoffInvocations34NearbySharingInteractionViewUpdate)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtCO7Sharing29SFProximityHandoffInvocations34NearbySharingInteractionViewUpdate *)sub_1A55B2384(v3);

  return v4;
}

- (id)init
{
  v2.receiver = a1;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

@end