@interface WheelchairStatusObserver
- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4;
@end

@implementation WheelchairStatusObserver

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  swift_getObjectType();
  sub_2261F08B8();
  id v5 = a3;
  swift_retain();
  sub_226298E70();

  swift_release();
}

@end