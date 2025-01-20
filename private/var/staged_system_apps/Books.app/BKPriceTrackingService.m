@interface BKPriceTrackingService
- (BKPriceTrackingService)init;
- (id)addWeakStateChangeObserver;
- (id)cardListString;
- (id)featureEnabled;
- (id)notificationsEnabled;
- (id)removeWeakStateChangeObserver;
- (id)setNotificationsEnabled;
@end

@implementation BKPriceTrackingService

- (BKPriceTrackingService)init
{
  return (BKPriceTrackingService *)PriceTrackingService.init()();
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->_bridge[OBJC_IVAR___BKPriceTrackingService__bridge + 8];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  v4 = *(void **)&self->_bridge[OBJC_IVAR___BKPriceTrackingService__addToWTRDelegate + 8];
  swift_bridgeObjectRelease();

  v5 = *(void **)&self->_bridge[OBJC_IVAR___BKPriceTrackingService__stateChanges + 8];
  swift_bridgeObjectRelease();

  swift_release();
}

- (id)featureEnabled
{
  return sub_100694B24(self, (uint64_t)a2, (uint64_t)&unk_100A6AA08, (uint64_t)sub_1006DBF2C, (uint64_t)&unk_100A6AA20);
}

- (id)addWeakStateChangeObserver
{
  return sub_100694B24(self, (uint64_t)a2, (uint64_t)&unk_100A6A9B8, (uint64_t)sub_1006DBF28, (uint64_t)&unk_100A6A9D0);
}

- (id)removeWeakStateChangeObserver
{
  return sub_100694B24(self, (uint64_t)a2, (uint64_t)&unk_100A6A968, (uint64_t)sub_1006DBF24, (uint64_t)&unk_100A6A980);
}

- (id)cardListString
{
  return sub_100694B24(self, (uint64_t)a2, (uint64_t)&unk_100A6A918, (uint64_t)sub_1006DBF20, (uint64_t)&unk_100A6A930);
}

- (id)notificationsEnabled
{
  return sub_100694B24(self, (uint64_t)a2, (uint64_t)&unk_100A6A8C8, (uint64_t)sub_1006DBF1C, (uint64_t)&unk_100A6A8E0);
}

- (id)setNotificationsEnabled
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v7[4] = sub_1006DBF18;
  v7[5] = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_1006D8558;
  v7[3] = &unk_100A6A890;
  v4 = _Block_copy(v7);
  v5 = self;
  swift_release();

  return v4;
}

@end