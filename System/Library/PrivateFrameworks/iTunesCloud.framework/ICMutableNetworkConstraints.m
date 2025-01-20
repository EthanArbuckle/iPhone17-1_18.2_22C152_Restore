@interface ICMutableNetworkConstraints
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setShouldAllowData:(BOOL)a3 forNetworkType:(int64_t)a4;
- (void)setShouldAllowDataForAllNetworkTypes:(BOOL)a3;
- (void)setShouldAllowDataForCellularNetworkTypes:(BOOL)a3;
- (void)setShouldAllowDataForWiFiNetworkTypes:(BOOL)a3;
- (void)setSizeLimit:(id)a3 forNetworkType:(int64_t)a4;
@end

@implementation ICMutableNetworkConstraints

- (void)setSizeLimit:(id)a3 forNetworkType:(int64_t)a4
{
  id v6 = a3;
  networkTypeToSizeLimit = self->super._networkTypeToSizeLimit;
  id v11 = v6;
  if (v6)
  {
    if (!networkTypeToSizeLimit)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v9 = self->super._networkTypeToSizeLimit;
      self->super._networkTypeToSizeLimit = v8;

      networkTypeToSizeLimit = self->super._networkTypeToSizeLimit;
    }
    v10 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)networkTypeToSizeLimit setObject:v11 forKey:v10];
  }
  else
  {
    v10 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)networkTypeToSizeLimit removeObjectForKey:v10];
  }
}

- (void)setShouldAllowDataForWiFiNetworkTypes:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(NSMutableDictionary *)self->super._networkTypeToSizeLimit allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((unint64_t)((int)[v11 intValue] - 1000) <= 0x3E7) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(NSMutableDictionary *)self->super._networkTypeToSizeLimit removeObjectsForKeys:v5];
  self->super._wiFiDataAllowedFallbackValue = a3;
}

- (void)setShouldAllowDataForCellularNetworkTypes:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(NSMutableDictionary *)self->super._networkTypeToSizeLimit allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((unint64_t)((int)[v11 intValue] - 1) <= 0x1F2) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(NSMutableDictionary *)self->super._networkTypeToSizeLimit removeObjectsForKeys:v5];
  self->super._cellularDataAllowedFallbackValue = a3;
}

- (void)setShouldAllowData:(BOOL)a3 forNetworkType:(int64_t)a4
{
  BOOL v5 = a3;
  networkTypeToDataAllowed = self->super._networkTypeToDataAllowed;
  if (!networkTypeToDataAllowed)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = self->super._networkTypeToDataAllowed;
    self->super._networkTypeToDataAllowed = v8;

    networkTypeToDataAllowed = self->super._networkTypeToDataAllowed;
  }
  id v11 = [NSNumber numberWithBool:v5];
  v10 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)networkTypeToDataAllowed setObject:v11 forKey:v10];
}

- (void)setShouldAllowDataForAllNetworkTypes:(BOOL)a3
{
  self->super._dataAllowedFallbackValue = a3;
  self->super._cellularDataAllowedFallbackValue = a3;
  self->super._wiFiDataAllowedFallbackValue = a3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(ICNetworkConstraints *)self _copyWithClass:v5 zone:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(ICNetworkConstraints *)self _copyWithClass:v5 zone:a3];
}

@end