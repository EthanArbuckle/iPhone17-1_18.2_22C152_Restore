@interface RMSPairingRecordStore
+ (id)sharedRecordStore;
- (RMSPairingRecordStore)init;
- (id)allPairingRecords;
- (id)pairedServiceNetworkNames;
- (id)pairingRecordForServiceWithNetworkName:(id)a3;
- (void)_synchronizePreferences;
- (void)removePairingRecordForServiceWithNetworkName:(id)a3;
- (void)savePairingRecord:(id)a3 forServiceWithNetworkName:(id)a4;
@end

@implementation RMSPairingRecordStore

+ (id)sharedRecordStore
{
  if (sharedRecordStore_onceToken != -1) {
    dispatch_once(&sharedRecordStore_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedRecordStore_sharedRecordStore;
  return v2;
}

uint64_t __42__RMSPairingRecordStore_sharedRecordStore__block_invoke()
{
  sharedRecordStore_sharedRecordStore = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (RMSPairingRecordStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)RMSPairingRecordStore;
  v2 = [(RMSPairingRecordStore *)&v9 init];
  if (v2)
  {
    CFPreferencesAppSynchronize(@"com.apple.RemoteMediaServices");
    v3 = (void *)CFPreferencesCopyAppValue(@"PairingRecordStore", @"com.apple.RemoteMediaServices");
    uint64_t v4 = [v3 mutableCopy];
    pairingRecords = v2->_pairingRecords;
    v2->_pairingRecords = (NSMutableDictionary *)v4;

    if (!v2->_pairingRecords)
    {
      uint64_t v6 = objc_opt_new();
      v7 = v2->_pairingRecords;
      v2->_pairingRecords = (NSMutableDictionary *)v6;
    }
  }
  return v2;
}

- (id)allPairingRecords
{
  v2 = (void *)[(NSMutableDictionary *)self->_pairingRecords copy];
  return v2;
}

- (id)pairedServiceNetworkNames
{
  return (id)[(NSMutableDictionary *)self->_pairingRecords allKeys];
}

- (id)pairingRecordForServiceWithNetworkName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_pairingRecords objectForKeyedSubscript:a3];
}

- (void)savePairingRecord:(id)a3 forServiceWithNetworkName:(id)a4
{
  [(NSMutableDictionary *)self->_pairingRecords setObject:a3 forKeyedSubscript:a4];
  [(RMSPairingRecordStore *)self _synchronizePreferences];
}

- (void)removePairingRecordForServiceWithNetworkName:(id)a3
{
  [(NSMutableDictionary *)self->_pairingRecords removeObjectForKey:a3];
  [(RMSPairingRecordStore *)self _synchronizePreferences];
}

- (void)_synchronizePreferences
{
  CFPreferencesSetAppValue(@"PairingRecordStore", self->_pairingRecords, @"com.apple.RemoteMediaServices");
  CFPreferencesAppSynchronize(@"com.apple.RemoteMediaServices");
}

- (void).cxx_destruct
{
}

@end