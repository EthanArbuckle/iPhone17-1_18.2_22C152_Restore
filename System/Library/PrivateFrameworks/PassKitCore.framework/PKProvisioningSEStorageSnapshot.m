@interface PKProvisioningSEStorageSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)appletTypePurpleTrustAirAccess;
+ (id)appletTypePurpleTrustAirAliro;
+ (id)appletTypePurpleTrustAirHome;
+ (void)getCurrentSnapshot:(id)a3;
- (BOOL)addAppletTypesToSnapshot:(id)a3;
- (BOOL)canFitAppletTypes:(id)a3;
- (PKProvisioningSEStorageSnapshot)init;
- (PKProvisioningSEStorageSnapshot)initWithCoder:(id)a3;
- (id)_initWithSnapshot:(id)a3;
- (id)appletTypesForAppletIDs:(id)a3;
- (int64_t)requiredStorageForAppletTypes:(id)a3;
- (int64_t)totalStorage;
- (int64_t)totalUsage;
- (int64_t)totalUsageOfAppletType:(id)a3;
- (int64_t)usageOfAppletType:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeAppletTypesFromSnapshot:(id)a3;
- (void)reset;
@end

@implementation PKProvisioningSEStorageSnapshot

+ (id)appletTypePurpleTrustAirHome
{
  return +[_PKProvisioningSEStorageSnapshot purpleTrustAirHomeAppletType];
}

- (PKProvisioningSEStorageSnapshot)init
{
  return 0;
}

- (id)_initWithSnapshot:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKProvisioningSEStorageSnapshot;
    v6 = [(PKProvisioningSEStorageSnapshot *)&v9 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_snapshot, a3);
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

+ (void)getCurrentSnapshot:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_PKProvisioningSEStorageManager);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PKProvisioningSEStorageSnapshot_getCurrentSnapshot___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v8 = v4;
  id v9 = v3;
  id v5 = v3;
  v6 = v4;
  [(_PKProvisioningSEStorageManager *)v6 deleteExpiredReservationsWithCompletion:v7];
}

void __54__PKProvisioningSEStorageSnapshot_getCurrentSnapshot___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__PKProvisioningSEStorageSnapshot_getCurrentSnapshot___block_invoke_2;
  v2[3] = &unk_1E56F6D58;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 currentSnapshotWithCompletion:v2];
}

void __54__PKProvisioningSEStorageSnapshot_getCurrentSnapshot___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[PKProvisioningSEStorageSnapshot alloc] _initWithSnapshot:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (int64_t)totalUsageOfAppletType:(id)a3
{
  return [(_PKProvisioningSEStorageSnapshot *)self->_snapshot totalUsageOfAppletType:a3];
}

- (int64_t)usageOfAppletType:(id)a3
{
  return [(_PKProvisioningSEStorageSnapshot *)self->_snapshot usageOfAppletType:a3];
}

- (int64_t)totalStorage
{
  return [(_PKProvisioningSEStorageSnapshot *)self->_snapshot totalStorage];
}

- (int64_t)totalUsage
{
  return [(_PKProvisioningSEStorageSnapshot *)self->_snapshot totalUsage];
}

- (BOOL)canFitAppletTypes:(id)a3
{
  return [(_PKProvisioningSEStorageSnapshot *)self->_snapshot canFitWithAppletTypes:a3];
}

- (BOOL)addAppletTypesToSnapshot:(id)a3
{
  return [(_PKProvisioningSEStorageSnapshot *)self->_snapshot addToSnapshotWithAppletTypes:a3];
}

- (void)removeAppletTypesFromSnapshot:(id)a3
{
}

- (id)appletTypesForAppletIDs:(id)a3
{
  return [(_PKProvisioningSEStorageSnapshot *)self->_snapshot appletTypesForAppletIDs:a3];
}

- (int64_t)requiredStorageForAppletTypes:(id)a3
{
  return [(_PKProvisioningSEStorageSnapshot *)self->_snapshot requiredStorageForAppletTypes:a3];
}

- (void)reset
{
}

+ (id)appletTypePurpleTrustAirAccess
{
  return +[_PKProvisioningSEStorageSnapshot purpleTrustAirAccessAppletType];
}

+ (id)appletTypePurpleTrustAirAliro
{
  return +[_PKProvisioningSEStorageSnapshot purpleTrustAirAliroAppletType];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKProvisioningSEStorageSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKProvisioningSEStorageSnapshot;
  id v5 = [(PKProvisioningSEStorageSnapshot *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snapshot"];
    snapshot = v5->_snapshot;
    v5->_snapshot = (_PKProvisioningSEStorageSnapshot *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end