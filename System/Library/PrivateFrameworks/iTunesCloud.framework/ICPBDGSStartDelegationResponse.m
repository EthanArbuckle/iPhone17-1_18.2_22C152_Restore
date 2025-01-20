@interface ICPBDGSStartDelegationResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addPlayerInfoContextToken:(uint64_t)a1;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation ICPBDGSStartDelegationResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerUserAgent, 0);
  objc_storeStrong((id *)&self->_playerInfoContextTokens, 0);
  objc_storeStrong((id *)&self->_playerDeviceGUID, 0);

  objc_storeStrong((id *)&self->_playerAnisetteMID, 0);
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_playerAnisetteMID hash];
  uint64_t v4 = [(NSData *)self->_playerDeviceGUID hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_playerInfoContextTokens hash];
  return v4 ^ v5 ^ [(NSString *)self->_playerUserAgent hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((playerAnisetteMID = self->_playerAnisetteMID, !((unint64_t)playerAnisetteMID | v4[1]))
     || -[NSData isEqual:](playerAnisetteMID, "isEqual:"))
    && ((playerDeviceGUID = self->_playerDeviceGUID, !((unint64_t)playerDeviceGUID | v4[2]))
     || -[NSData isEqual:](playerDeviceGUID, "isEqual:"))
    && ((playerInfoContextTokens = self->_playerInfoContextTokens, !((unint64_t)playerInfoContextTokens | v4[3]))
     || -[NSMutableArray isEqual:](playerInfoContextTokens, "isEqual:")))
  {
    playerUserAgent = self->_playerUserAgent;
    if ((unint64_t)playerUserAgent | v4[4]) {
      char v9 = -[NSString isEqual:](playerUserAgent, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_playerAnisetteMID copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_playerDeviceGUID copyWithZone:a3];
  char v9 = (void *)v5[2];
  v5[2] = v8;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v10 = self->_playerInfoContextTokens;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v14), "copyWithZone:", a3, (void)v19);
        -[ICPBDGSStartDelegationResponse addPlayerInfoContextToken:]((uint64_t)v5, v15);

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSString *)self->_playerUserAgent copyWithZone:a3];
  v17 = (void *)v5[4];
  v5[4] = v16;

  return v5;
}

- (uint64_t)addPlayerInfoContextToken:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 24);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      uint64_t v5 = *(void **)(a1 + 24);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_playerAnisetteMID) {
    PBDataWriterWriteDataField();
  }
  if (self->_playerDeviceGUID) {
    PBDataWriterWriteDataField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_playerInfoContextTokens;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_playerUserAgent) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICPBDGSStartDelegationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  playerAnisetteMID = self->_playerAnisetteMID;
  if (playerAnisetteMID) {
    [v3 setObject:playerAnisetteMID forKey:@"playerAnisetteMID"];
  }
  playerDeviceGUID = self->_playerDeviceGUID;
  if (playerDeviceGUID) {
    [v4 setObject:playerDeviceGUID forKey:@"playerDeviceGUID"];
  }
  if ([(NSMutableArray *)self->_playerInfoContextTokens count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_playerInfoContextTokens, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = self->_playerInfoContextTokens;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"playerInfoContextToken"];
  }
  playerUserAgent = self->_playerUserAgent;
  if (playerUserAgent) {
    [v4 setObject:playerUserAgent forKey:@"playerUserAgent"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICPBDGSStartDelegationResponse;
  id v4 = [(ICPBDGSStartDelegationResponse *)&v8 description];
  uint64_t v5 = [(ICPBDGSStartDelegationResponse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end