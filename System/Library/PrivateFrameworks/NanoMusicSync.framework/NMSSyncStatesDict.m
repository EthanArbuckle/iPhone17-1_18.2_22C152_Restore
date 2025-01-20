@interface NMSSyncStatesDict
+ (id)assetTypeForMediaType:(unint64_t)a3;
+ (unint64_t)mediaTypeForAssetType:(id)a3;
- (NMSSyncStatesDict)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)syncStateDictionaryRepresentation;
- (id)waitingSubstateDictionaryRepresentation;
- (unint64_t)syncStateForMediaType:(unint64_t)a3;
- (unint64_t)waitingSubstateForMediaType:(unint64_t)a3;
- (void)setSyncState:(unint64_t)a3 forMediaType:(unint64_t)a4;
- (void)setSyncStateForAllMediaTypes:(unint64_t)a3;
- (void)setWaitingSubstate:(unint64_t)a3 forMediaType:(unint64_t)a4;
- (void)setWaitingSubstateForAllMediaTypes:(unint64_t)a3;
@end

@implementation NMSSyncStatesDict

- (NMSSyncStatesDict)init
{
  v8.receiver = self;
  v8.super_class = (Class)NMSSyncStatesDict;
  v2 = [(NMSSyncStatesDict *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
    syncStatesDict = v2->_syncStatesDict;
    v2->_syncStatesDict = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
    waitingSubstatesDict = v2->_waitingSubstatesDict;
    v2->_waitingSubstatesDict = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)setSyncState:(unint64_t)a3 forMediaType:(unint64_t)a4
{
  id v8 = [(id)objc_opt_class() assetTypeForMediaType:a4];
  if (a3 != 3) {
    [(NMSSyncStatesDict *)self setWaitingSubstate:0 forMediaType:a4];
  }
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)self->_syncStatesDict setObject:v7 forKeyedSubscript:v8];
}

- (void)setSyncStateForAllMediaTypes:(unint64_t)a3
{
  for (uint64_t i = 1; i != 4; ++i)
    [(NMSSyncStatesDict *)self setSyncState:a3 forMediaType:i];
}

- (void)setWaitingSubstate:(unint64_t)a3 forMediaType:(unint64_t)a4
{
  id v7 = [(id)objc_opt_class() assetTypeForMediaType:a4];
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)self->_waitingSubstatesDict setObject:v6 forKeyedSubscript:v7];
}

- (void)setWaitingSubstateForAllMediaTypes:(unint64_t)a3
{
  for (uint64_t i = 1; i != 4; ++i)
    [(NMSSyncStatesDict *)self setWaitingSubstate:a3 forMediaType:i];
}

- (unint64_t)syncStateForMediaType:(unint64_t)a3
{
  v4 = [(id)objc_opt_class() assetTypeForMediaType:a3];
  uint64_t v5 = [(NSMutableDictionary *)self->_syncStatesDict objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5) {
    unint64_t v7 = [v5 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)waitingSubstateForMediaType:(unint64_t)a3
{
  v4 = [(id)objc_opt_class() assetTypeForMediaType:a3];
  uint64_t v5 = [(NSMutableDictionary *)self->_waitingSubstatesDict objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5) {
    unint64_t v7 = [v5 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)syncStateDictionaryRepresentation
{
  v2 = (void *)[(NSMutableDictionary *)self->_syncStatesDict copy];

  return v2;
}

- (id)waitingSubstateDictionaryRepresentation
{
  v2 = (void *)[(NSMutableDictionary *)self->_waitingSubstatesDict copy];

  return v2;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"SyncStates: %@, WaitingSubstates: %@", self->_syncStatesDict, self->_waitingSubstatesDict];
}

+ (id)assetTypeForMediaType:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_264634B78[a3];
  }
}

+ (unint64_t)mediaTypeForAssetType:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    if ([v3 isEqualToString:@"Music"])
    {
      unint64_t v4 = 1;
    }
    else if ([v3 isEqualToString:@"Podcast"])
    {
      unint64_t v4 = 2;
    }
    else if ([v3 isEqualToString:@"Audiobook"])
    {
      unint64_t v4 = 3;
    }
    else
    {
      unint64_t v4 = 0;
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_syncStatesDict mutableCopyWithZone:a3];
    unint64_t v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(NSMutableDictionary *)self->_waitingSubstatesDict mutableCopyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingSubstatesDict, 0);

  objc_storeStrong((id *)&self->_syncStatesDict, 0);
}

@end