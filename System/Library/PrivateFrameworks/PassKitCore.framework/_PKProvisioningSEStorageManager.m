@interface _PKProvisioningSEStorageManager
- (_PKProvisioningSEStorageManager)init;
- (_PKProvisioningSEStorageManager)initWithWebService:(id)a3;
- (void)currentSnapshotWithCompletion:(id)a3;
- (void)debugReservationDescriptionsWithCompletion:(id)a3;
- (void)deleteExpiredReservationsWithCompletion:(id)a3;
- (void)deleteWithReservation:(id)a3 completion:(id)a4;
- (void)performDebugSECleanupWithCompletion:(id)a3;
- (void)reserveStorageFor:(id)a3 metadata:(id)a4 completion:(id)a5;
@end

@implementation _PKProvisioningSEStorageManager

- (_PKProvisioningSEStorageManager)init
{
  if (PKRunningInPassd())
  {
    return [(_PKProvisioningSEStorageManager *)self initWithWebService:0];
  }
  else
  {
    id v4 = objc_msgSend(self, sel_sharedService);
    v5 = [(_PKProvisioningSEStorageManager *)self initWithWebService:v4];

    return v5;
  }
}

- (_PKProvisioningSEStorageManager)initWithWebService:(id)a3
{
  uint64_t v5 = OBJC_IVAR____PKProvisioningSEStorageManager_secureElement;
  id v6 = objc_allocWithZone((Class)PKSecureElement);
  id v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____PKProvisioningSEStorageManager_webService) = (Class)a3;
  id v9 = v7;

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for ProvisioningSEStorageManager();
  v10 = [(_PKProvisioningSEStorageManager *)&v12 init];

  return v10;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKProvisioningSEStorageManager_webService);
}

- (void)reserveStorageFor:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  uint64_t v8 = sub_1915EF280();
  if (a4) {
    a4 = (id)sub_1915EEF00();
  }
  _Block_copy(v7);
  id v9 = self;
  sub_190F5EB64(v8, (uint64_t)a4, v9, v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)deleteWithReservation:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (*)(void))_Block_copy(a4);
  sub_1915EEBB0();
  uint64_t v6 = sub_1915EF280();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    uint64_t v5 = (void (*)(void))sub_190F622C8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = self;
  ProvisioningSEStorageManager.delete(reservation:completion:)(v6, v5, v7);
  sub_190EF6480((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)currentSnapshotWithCompletion:(id)a3
{
}

- (void)deleteExpiredReservationsWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_190F5F0A0(1, 2, (char *)v5, (void (**)(void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)debugReservationDescriptionsWithCompletion:(id)a3
{
}

- (void)performDebugSECleanupWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_190F5FB5C(0, 0, (char *)v6, (void (*)(uint64_t))sub_190F5FF28, v5);

  swift_release();
}

@end