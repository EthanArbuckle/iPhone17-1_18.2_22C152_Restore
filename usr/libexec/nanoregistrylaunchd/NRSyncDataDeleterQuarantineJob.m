@interface NRSyncDataDeleterQuarantineJob
- (NSArray)items;
- (NSUUID)pairingStoreUUID;
- (void)setItems:(id)a3;
- (void)setPairingStoreUUID:(id)a3;
@end

@implementation NRSyncDataDeleterQuarantineJob

- (NSUUID)pairingStoreUUID
{
  return self->_pairingStoreUUID;
}

- (void)setPairingStoreUUID:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_pairingStoreUUID, 0);
}

@end