@interface PKAppIntentUtilities
+ (void)associateSearchableItem:(id)a3 withEntityForPass:(id)a4;
+ (void)associateSearchableItem:(id)a3 withEntityForTransaction:(id)a4;
- (PKAppIntentUtilities)init;
@end

@implementation PKAppIntentUtilities

+ (void)associateSearchableItem:(id)a3 withEntityForPass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  _s11PassKitCore18AppIntentUtilitiesC9associate14searchableItem013withEntityForA0ySo012CSSearchableI0C_So6PKPassCtFZ_0(v5, v6);
}

+ (void)associateSearchableItem:(id)a3 withEntityForTransaction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  _s11PassKitCore18AppIntentUtilitiesC9associate14searchableItem24withEntityForTransactionySo012CSSearchableI0C_So09PKPaymentM0CtFZ_0(v5, v6);
}

- (PKAppIntentUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppIntentUtilities();
  return [(PKAppIntentUtilities *)&v3 init];
}

@end