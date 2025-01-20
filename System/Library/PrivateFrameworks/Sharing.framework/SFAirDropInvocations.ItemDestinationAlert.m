@interface SFAirDropInvocations.ItemDestinationAlert
+ (BOOL)supportsSecureCoding;
- (_TtCO7Sharing20SFAirDropInvocations20ItemDestinationAlert)init;
- (_TtCO7Sharing20SFAirDropInvocations20ItemDestinationAlert)initWithCoder:(id)a3;
@end

@implementation SFAirDropInvocations.ItemDestinationAlert

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtCO7Sharing20SFAirDropInvocations20ItemDestinationAlert)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SFXPCInvocation *)&v3 init];
}

- (_TtCO7Sharing20SFAirDropInvocations20ItemDestinationAlert)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtCO7Sharing20SFAirDropInvocations20ItemDestinationAlert *)sub_1A55B2384(v3);

  return v4;
}

@end