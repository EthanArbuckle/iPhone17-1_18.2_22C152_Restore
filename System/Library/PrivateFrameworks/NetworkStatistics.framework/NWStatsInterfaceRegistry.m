@interface NWStatsInterfaceRegistry
+ (id)sharedInstance;
- (BOOL)isTrackingInterfaceIndex:(unsigned int)a3;
- (BOOL)machOUUIDBelongsToVPNProvider:(id)a3;
- (NWStatsInterfaceRegistry)init;
- (id)getState;
- (void)addInterfaceIndexToRegistry:(unsigned int)a3;
- (void)addVPNBytesForInterfaceIndex:(unsigned int)a3 fromSnapshot:(id)a4;
- (void)subtractVPNBytesForVPNProviderAppUUID:(id)a3 fromSnapshot:(id)a4;
@end

@implementation NWStatsInterfaceRegistry

- (BOOL)isTrackingInterfaceIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  neQueriedInterfaceIndexes = self->_neQueriedInterfaceIndexes;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  if ([(NSMutableSet *)neQueriedInterfaceIndexes containsObject:v6])
  {
    interfaceByteAccumulators = self->_interfaceByteAccumulators;
    v8 = [NSNumber numberWithUnsignedInt:v3];
    v9 = [(NSMutableDictionary *)interfaceByteAccumulators objectForKeyedSubscript:v8];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)machOUUIDBelongsToVPNProvider:(id)a3
{
  machOUUIDLookups = self->_machOUUIDLookups;
  if (!machOUUIDLookups) {
    return 0;
  }
  v4 = [(NSMutableDictionary *)machOUUIDLookups objectForKeyedSubscript:a3];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)addInterfaceIndexToRegistry:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  *(void *)uu = 0;
  uint64_t v18 = 0;
  neQueriedInterfaceIndexes = self->_neQueriedInterfaceIndexes;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  LOBYTE(neQueriedInterfaceIndexes) = [(NSMutableSet *)neQueriedInterfaceIndexes containsObject:v6];

  if ((neQueriedInterfaceIndexes & 1) == 0)
  {
    *(void *)v15 = 0;
    uint64_t v16 = 0;
    if (if_indextoname(v3, v15)) {
      ne_session_map_interface_to_provider_uuid();
    }
    memset(v14, 0, sizeof(v14));
    uuid_unparse(uu, v14);
    if (!uuid_is_null(uu))
    {
      v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:uu];
      v8 = [NSNumber numberWithUnsignedInt:v3];
      [(NSMutableDictionary *)self->_machOUUIDLookups setObject:v8 forKeyedSubscript:v7];

      v9 = objc_alloc_init(VPNInterfaceByteCountAccumulator);
      interfaceByteAccumulators = self->_interfaceByteAccumulators;
      v11 = [NSNumber numberWithUnsignedInt:v3];
      [(NSMutableDictionary *)interfaceByteAccumulators setObject:v9 forKeyedSubscript:v11];
    }
    v12 = self->_neQueriedInterfaceIndexes;
    v13 = [NSNumber numberWithUnsignedInt:v3];
    [(NSMutableSet *)v12 addObject:v13];
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__NWStatsInterfaceRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __42__NWStatsInterfaceRegistry_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (id)getState
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 addObject:@"NWStatsInterfaceRegistry:"];
  v4 = (void *)[[NSString alloc] initWithFormat:@"Queried interface indexes - %@", self->_neQueriedInterfaceIndexes];
  [v3 addObject:v4];

  BOOL v5 = (void *)[[NSString alloc] initWithFormat:@"Looked up machO UUIDs - %@", self->_machOUUIDLookups];
  [v3 addObject:v5];

  v6 = (void *)[[NSString alloc] initWithFormat:@"Accumulated interface bytes - %@", self->_interfaceByteAccumulators];
  [v3 addObject:v6];

  return v3;
}

- (NWStatsInterfaceRegistry)init
{
  v10.receiver = self;
  v10.super_class = (Class)NWStatsInterfaceRegistry;
  v2 = [(NWStatsInterfaceRegistry *)&v10 init];
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    neQueriedInterfaceIndexes = v2->_neQueriedInterfaceIndexes;
    v2->_neQueriedInterfaceIndexes = v3;

    BOOL v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    machOUUIDLookups = v2->_machOUUIDLookups;
    v2->_machOUUIDLookups = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    interfaceByteAccumulators = v2->_interfaceByteAccumulators;
    v2->_interfaceByteAccumulators = v7;
  }
  return v2;
}

- (void)addVPNBytesForInterfaceIndex:(unsigned int)a3 fromSnapshot:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v11 = v6;
    id v6 = (id)[(NWStatsInterfaceRegistry *)self isTrackingInterfaceIndex:v4];
    id v7 = v11;
    if (v6)
    {
      interfaceByteAccumulators = self->_interfaceByteAccumulators;
      v9 = [NSNumber numberWithUnsignedInt:v4];
      objc_super v10 = [(NSMutableDictionary *)interfaceByteAccumulators objectForKeyedSubscript:v9];
      [v10 addBytesToAttributeToVPNProviderFromSnapshot:v11];

      id v7 = v11;
    }
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (void)subtractVPNBytesForVPNProviderAppUUID:(id)a3 fromSnapshot:(id)a4
{
  if (a3 && a4)
  {
    machOUUIDLookups = self->_machOUUIDLookups;
    interfaceByteAccumulators = self->_interfaceByteAccumulators;
    id v7 = a4;
    id v9 = [(NSMutableDictionary *)machOUUIDLookups objectForKeyedSubscript:a3];
    v8 = [(NSMutableDictionary *)interfaceByteAccumulators objectForKeyedSubscript:v9];
    [v8 subtractBytesAttributedToVPNProviderFromSnapshot:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceByteAccumulators, 0);
  objc_storeStrong((id *)&self->_machOUUIDLookups, 0);
  objc_storeStrong((id *)&self->_neQueriedInterfaceIndexes, 0);
}

@end