@interface FitnessSettingsProvider
- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4;
@end

@implementation FitnessSettingsProvider

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  uint64_t v5 = type metadata accessor for AccountFitnessSettingsChanged();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  id v9 = a3;
  swift_retain();
  AccountFitnessSettingsChanged.init()();
  sub_10028EE20();
  dispatch thunk of EventHubProtocol.publish<A>(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  swift_release();
}

@end