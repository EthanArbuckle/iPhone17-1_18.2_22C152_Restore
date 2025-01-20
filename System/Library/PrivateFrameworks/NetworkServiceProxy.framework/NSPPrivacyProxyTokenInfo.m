@interface NSPPrivacyProxyTokenInfo
+ (Class)tokenRequestListType;
+ (Class)unactivatedTokenListType;
- (BOOL)hasVendor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)tokenKeyID;
- (NSMutableArray)tokenRequestLists;
- (NSMutableArray)unactivatedTokenLists;
- (NSString)proxyURL;
- (NSString)vendor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tokenRequestListAtIndex:(unint64_t)a3;
- (id)unactivatedTokenListAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)tokenRequestListsCount;
- (unint64_t)unactivatedTokenListsCount;
- (void)addTokenRequestList:(id)a3;
- (void)addUnactivatedTokenList:(id)a3;
- (void)clearTokenRequestLists;
- (void)clearUnactivatedTokenLists;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setProxyURL:(id)a3;
- (void)setTokenKeyID:(id)a3;
- (void)setTokenRequestLists:(id)a3;
- (void)setUnactivatedTokenLists:(id)a3;
- (void)setVendor:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyTokenInfo

- (void)clearUnactivatedTokenLists
{
}

- (void)addUnactivatedTokenList:(id)a3
{
  id v4 = a3;
  unactivatedTokenLists = self->_unactivatedTokenLists;
  id v8 = v4;
  if (!unactivatedTokenLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_unactivatedTokenLists;
    self->_unactivatedTokenLists = v6;

    id v4 = v8;
    unactivatedTokenLists = self->_unactivatedTokenLists;
  }
  [(NSMutableArray *)unactivatedTokenLists addObject:v4];
}

- (unint64_t)unactivatedTokenListsCount
{
  return [(NSMutableArray *)self->_unactivatedTokenLists count];
}

- (id)unactivatedTokenListAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_unactivatedTokenLists objectAtIndex:a3];
}

+ (Class)unactivatedTokenListType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasVendor
{
  return self->_vendor != 0;
}

- (void)clearTokenRequestLists
{
}

- (void)addTokenRequestList:(id)a3
{
  id v4 = a3;
  tokenRequestLists = self->_tokenRequestLists;
  id v8 = v4;
  if (!tokenRequestLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_tokenRequestLists;
    self->_tokenRequestLists = v6;

    id v4 = v8;
    tokenRequestLists = self->_tokenRequestLists;
  }
  [(NSMutableArray *)tokenRequestLists addObject:v4];
}

- (unint64_t)tokenRequestListsCount
{
  return [(NSMutableArray *)self->_tokenRequestLists count];
}

- (id)tokenRequestListAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tokenRequestLists objectAtIndex:a3];
}

+ (Class)tokenRequestListType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyTokenInfo;
  id v4 = [(NSPPrivacyProxyTokenInfo *)&v8 description];
  v5 = [(NSPPrivacyProxyTokenInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  proxyURL = self->_proxyURL;
  if (proxyURL) {
    [v3 setObject:proxyURL forKey:@"proxyURL"];
  }
  tokenKeyID = self->_tokenKeyID;
  if (tokenKeyID) {
    [v4 setObject:tokenKeyID forKey:@"tokenKeyID"];
  }
  unactivatedTokenLists = self->_unactivatedTokenLists;
  if (unactivatedTokenLists) {
    [v4 setObject:unactivatedTokenLists forKey:@"unactivatedTokenList"];
  }
  vendor = self->_vendor;
  if (vendor) {
    [v4 setObject:vendor forKey:@"vendor"];
  }
  tokenRequestLists = self->_tokenRequestLists;
  if (tokenRequestLists) {
    [v4 setObject:tokenRequestLists forKey:@"tokenRequestList"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyTokenInfoReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_proxyURL) {
    __assert_rtn("-[NSPPrivacyProxyTokenInfo writeTo:]", "NSPPrivacyProxyTokenInfo.m", 187, "nil != self->_proxyURL");
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_tokenKeyID) {
    __assert_rtn("-[NSPPrivacyProxyTokenInfo writeTo:]", "NSPPrivacyProxyTokenInfo.m", 192, "nil != self->_tokenKeyID");
  }
  PBDataWriterWriteDataField();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = self->_unactivatedTokenLists;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteDataField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  if (self->_vendor) {
    PBDataWriterWriteStringField();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_tokenRequestLists;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteDataField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  [v12 setProxyURL:self->_proxyURL];
  [v12 setTokenKeyID:self->_tokenKeyID];
  if ([(NSPPrivacyProxyTokenInfo *)self unactivatedTokenListsCount])
  {
    [v12 clearUnactivatedTokenLists];
    unint64_t v4 = [(NSPPrivacyProxyTokenInfo *)self unactivatedTokenListsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NSPPrivacyProxyTokenInfo *)self unactivatedTokenListAtIndex:i];
        [v12 addUnactivatedTokenList:v7];
      }
    }
  }
  if (self->_vendor) {
    objc_msgSend(v12, "setVendor:");
  }
  if ([(NSPPrivacyProxyTokenInfo *)self tokenRequestListsCount])
  {
    [v12 clearTokenRequestLists];
    unint64_t v8 = [(NSPPrivacyProxyTokenInfo *)self tokenRequestListsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(NSPPrivacyProxyTokenInfo *)self tokenRequestListAtIndex:j];
        [v12 addTokenRequestList:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_proxyURL copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_tokenKeyID copyWithZone:a3];
  unint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v10 = self->_unactivatedTokenLists;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v14) copyWithZone:a3];
        [v5 addUnactivatedTokenList:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSString *)self->_vendor copyWithZone:a3];
  long long v17 = (void *)v5[5];
  v5[5] = v16;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v18 = self->_tokenRequestLists;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (void)v25);
        [v5 addTokenRequestList:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((proxyURL = self->_proxyURL, !((unint64_t)proxyURL | v4[1]))
     || -[NSString isEqual:](proxyURL, "isEqual:"))
    && ((tokenKeyID = self->_tokenKeyID, !((unint64_t)tokenKeyID | v4[2]))
     || -[NSData isEqual:](tokenKeyID, "isEqual:"))
    && ((unactivatedTokenLists = self->_unactivatedTokenLists, !((unint64_t)unactivatedTokenLists | v4[4]))
     || -[NSMutableArray isEqual:](unactivatedTokenLists, "isEqual:"))
    && ((vendor = self->_vendor, !((unint64_t)vendor | v4[5]))
     || -[NSString isEqual:](vendor, "isEqual:")))
  {
    tokenRequestLists = self->_tokenRequestLists;
    if ((unint64_t)tokenRequestLists | v4[3]) {
      char v10 = -[NSMutableArray isEqual:](tokenRequestLists, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_proxyURL hash];
  uint64_t v4 = [(NSData *)self->_tokenKeyID hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_unactivatedTokenLists hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_vendor hash];
  return v6 ^ [(NSMutableArray *)self->_tokenRequestLists hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[NSPPrivacyProxyTokenInfo setProxyURL:](self, "setProxyURL:");
  }
  if (*((void *)v4 + 2)) {
    -[NSPPrivacyProxyTokenInfo setTokenKeyID:](self, "setTokenKeyID:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NSPPrivacyProxyTokenInfo *)self addUnactivatedTokenList:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 5)) {
    -[NSPPrivacyProxyTokenInfo setVendor:](self, "setVendor:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NSPPrivacyProxyTokenInfo addTokenRequestList:](self, "addTokenRequestList:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSString)proxyURL
{
  return self->_proxyURL;
}

- (void)setProxyURL:(id)a3
{
}

- (NSData)tokenKeyID
{
  return self->_tokenKeyID;
}

- (void)setTokenKeyID:(id)a3
{
}

- (NSMutableArray)unactivatedTokenLists
{
  return self->_unactivatedTokenLists;
}

- (void)setUnactivatedTokenLists:(id)a3
{
}

- (NSString)vendor
{
  return self->_vendor;
}

- (void)setVendor:(id)a3
{
}

- (NSMutableArray)tokenRequestLists
{
  return self->_tokenRequestLists;
}

- (void)setTokenRequestLists:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_unactivatedTokenLists, 0);
  objc_storeStrong((id *)&self->_tokenRequestLists, 0);
  objc_storeStrong((id *)&self->_tokenKeyID, 0);
  objc_storeStrong((id *)&self->_proxyURL, 0);
}

@end