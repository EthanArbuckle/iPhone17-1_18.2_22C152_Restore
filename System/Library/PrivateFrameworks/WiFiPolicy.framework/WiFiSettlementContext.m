@interface WiFiSettlementContext
+ (BOOL)networkQualifiesForSettlement:(id)a3;
- (BOOL)compareWithScanResults:(id)a3;
- (NSArray)strongestNetworks;
- (NSDate)creationDate;
- (NSSet)strongestBSSIDs;
- (WiFiSettlementContext)initWithNetworks:(id)a3 maxCount:(unint64_t)a4;
- (unint64_t)maxCount;
- (void)_updateStrongestNetworks:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setMaxCount:(unint64_t)a3;
- (void)setStrongestBSSIDs:(id)a3;
- (void)setStrongestNetworks:(id)a3;
@end

@implementation WiFiSettlementContext

+ (BOOL)networkQualifiesForSettlement:(id)a3
{
  id v3 = a3;
  v4 = [v3 scanProperties];
  v5 = [v4 objectForKey:@"CARPLAY_NETWORK"];

  if (v5
    || ([v3 scanProperties],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 objectForKey:@"APPLE_DEVICE_IE"],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    BOOL v9 = 0;
  }
  else
  {
    v8 = [v3 BSSID];
    BOOL v9 = v8 != 0;
  }
  return v9;
}

BOOL __50__WiFiSettlementContext__updateStrongestNetworks___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WiFiSettlementContext networkQualifiesForSettlement:a2];
}

uint64_t __50__WiFiSettlementContext__updateStrongestNetworks___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 BSSID];
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (BOOL)compareWithScanResults:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (+[WiFiSettlementContext networkQualifiesForSettlement:](WiFiSettlementContext, "networkQualifiesForSettlement:", v10, (void)v16))
          {
            v11 = [(WiFiSettlementContext *)self strongestBSSIDs];
            v12 = [v10 BSSID];
            char v13 = [v11 containsObject:v12];

            if (v13)
            {
              BOOL v14 = 1;
              goto LABEL_13;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 0;
LABEL_13:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (NSSet)strongestBSSIDs
{
  return self->_strongestBSSIDs;
}

- (void)_updateStrongestNetworks:(id)a3
{
  id v4 = [a3 allObjects];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_3];
  id v12 = [v4 filteredArrayUsingPredicate:v5];

  objc_msgSend(v12, "networksSortedBySignalStrengthWithMaxCount:", -[WiFiSettlementContext maxCount](self, "maxCount"));
  uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  strongestNetworks = self->_strongestNetworks;
  self->_strongestNetworks = v6;

  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v9 = [(NSArray *)self->_strongestNetworks mapObjectsUsingBlock:&__block_literal_global_6];
  v10 = [v8 setWithArray:v9];
  strongestBSSIDs = self->_strongestBSSIDs;
  self->_strongestBSSIDs = v10;
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (WiFiSettlementContext)initWithNetworks:(id)a3 maxCount:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WiFiSettlementContext;
  uint64_t v7 = [(WiFiSettlementContext *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v7->_creationDate;
    v7->_creationDate = (NSDate *)v8;

    v7->_maxCount = a4;
    [(WiFiSettlementContext *)v7 _updateStrongestNetworks:v6];
  }

  return v7;
}

- (void)setCreationDate:(id)a3
{
}

- (NSArray)strongestNetworks
{
  return self->_strongestNetworks;
}

- (void)setStrongestNetworks:(id)a3
{
}

- (void)setStrongestBSSIDs:(id)a3
{
}

- (void)setMaxCount:(unint64_t)a3
{
  self->_maxCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongestBSSIDs, 0);
  objc_storeStrong((id *)&self->_strongestNetworks, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end