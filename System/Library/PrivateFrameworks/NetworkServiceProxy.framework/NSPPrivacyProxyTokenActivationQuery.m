@interface NSPPrivacyProxyTokenActivationQuery
+ (Class)auxiliaryAuthArrayType;
- (BOOL)hasAuthInfo;
- (BOOL)hasBaaParameters;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)authInfo;
- (NSMutableArray)auxiliaryAuthArrays;
- (NSPPrivacyProxyBAAValidation)baaParameters;
- (NSPPrivacyProxyTokenInfo)tokenInfo;
- (id)authTypeAsString:(int)a3;
- (id)auxiliaryAuthArrayAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAuthType:(id)a3;
- (int)authType;
- (unint64_t)auxiliaryAuthArraysCount;
- (unint64_t)hash;
- (void)addAuxiliaryAuthArray:(id)a3;
- (void)clearAuxiliaryAuthArrays;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthInfo:(id)a3;
- (void)setAuthType:(int)a3;
- (void)setAuxiliaryAuthArrays:(id)a3;
- (void)setBaaParameters:(id)a3;
- (void)setTokenInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyTokenActivationQuery

- (id)authTypeAsString:(int)a3
{
  if a3 < 5 && ((0x17u >> a3))
  {
    v3 = off_1E5A3B3E8[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsAuthType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BAA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ANISETTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TOKEN"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasBaaParameters
{
  return self->_baaParameters != 0;
}

- (BOOL)hasAuthInfo
{
  return self->_authInfo != 0;
}

- (void)clearAuxiliaryAuthArrays
{
}

- (void)addAuxiliaryAuthArray:(id)a3
{
  id v4 = a3;
  auxiliaryAuthArrays = self->_auxiliaryAuthArrays;
  id v8 = v4;
  if (!auxiliaryAuthArrays)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_auxiliaryAuthArrays;
    self->_auxiliaryAuthArrays = v6;

    id v4 = v8;
    auxiliaryAuthArrays = self->_auxiliaryAuthArrays;
  }
  [(NSMutableArray *)auxiliaryAuthArrays addObject:v4];
}

- (unint64_t)auxiliaryAuthArraysCount
{
  return [(NSMutableArray *)self->_auxiliaryAuthArrays count];
}

- (id)auxiliaryAuthArrayAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_auxiliaryAuthArrays objectAtIndex:a3];
}

+ (Class)auxiliaryAuthArrayType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyTokenActivationQuery;
  id v4 = [(NSPPrivacyProxyTokenActivationQuery *)&v8 description];
  v5 = [(NSPPrivacyProxyTokenActivationQuery *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t authType = self->_authType;
  if authType < 5 && ((0x17u >> authType))
  {
    v5 = off_1E5A3B3E8[authType];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_authType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v3 setObject:v5 forKey:@"authType"];

  baaParameters = self->_baaParameters;
  if (baaParameters)
  {
    v7 = [(NSPPrivacyProxyBAAValidation *)baaParameters dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"baaParameters"];
  }
  tokenInfo = self->_tokenInfo;
  if (tokenInfo)
  {
    v9 = [(NSPPrivacyProxyTokenInfo *)tokenInfo dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"tokenInfo"];
  }
  authInfo = self->_authInfo;
  if (authInfo) {
    [v3 setObject:authInfo forKey:@"authInfo"];
  }
  if ([(NSMutableArray *)self->_auxiliaryAuthArrays count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_auxiliaryAuthArrays, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_auxiliaryAuthArrays;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"auxiliaryAuthArray"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyTokenActivationQueryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_baaParameters) {
    PBDataWriterWriteSubmessage();
  }
  if (!self->_tokenInfo) {
    __assert_rtn("-[NSPPrivacyProxyTokenActivationQuery writeTo:]", "NSPPrivacyProxyTokenActivationQuery.m", 222, "self->_tokenInfo != nil");
  }
  PBDataWriterWriteSubmessage();
  if (self->_authInfo) {
    PBDataWriterWriteDataField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_auxiliaryAuthArrays;
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[4] = self->_authType;
  uint64_t v9 = v4;
  if (self->_baaParameters)
  {
    objc_msgSend(v4, "setBaaParameters:");
    id v4 = v9;
  }
  [v4 setTokenInfo:self->_tokenInfo];
  if (self->_authInfo) {
    objc_msgSend(v9, "setAuthInfo:");
  }
  if ([(NSPPrivacyProxyTokenActivationQuery *)self auxiliaryAuthArraysCount])
  {
    [v9 clearAuxiliaryAuthArrays];
    unint64_t v5 = [(NSPPrivacyProxyTokenActivationQuery *)self auxiliaryAuthArraysCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NSPPrivacyProxyTokenActivationQuery *)self auxiliaryAuthArrayAtIndex:i];
        [v9 addAuxiliaryAuthArray:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_authType;
  id v6 = [(NSPPrivacyProxyBAAValidation *)self->_baaParameters copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  id v8 = [(NSPPrivacyProxyTokenInfo *)self->_tokenInfo copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSData *)self->_authInfo copyWithZone:a3];
  long long v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_auxiliaryAuthArrays;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [(id)v5 addAuxiliaryAuthArray:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_authType == *((_DWORD *)v4 + 4)
    && ((baaParameters = self->_baaParameters, !((unint64_t)baaParameters | v4[4]))
     || -[NSPPrivacyProxyBAAValidation isEqual:](baaParameters, "isEqual:"))
    && ((tokenInfo = self->_tokenInfo, !((unint64_t)tokenInfo | v4[5]))
     || -[NSPPrivacyProxyTokenInfo isEqual:](tokenInfo, "isEqual:"))
    && ((authInfo = self->_authInfo, !((unint64_t)authInfo | v4[1]))
     || -[NSData isEqual:](authInfo, "isEqual:")))
  {
    auxiliaryAuthArrays = self->_auxiliaryAuthArrays;
    if ((unint64_t)auxiliaryAuthArrays | v4[3]) {
      char v9 = -[NSMutableArray isEqual:](auxiliaryAuthArrays, "isEqual:");
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

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_authType;
  unint64_t v4 = [(NSPPrivacyProxyBAAValidation *)self->_baaParameters hash];
  unint64_t v5 = v4 ^ [(NSPPrivacyProxyTokenInfo *)self->_tokenInfo hash];
  uint64_t v6 = v5 ^ [(NSData *)self->_authInfo hash];
  return v6 ^ [(NSMutableArray *)self->_auxiliaryAuthArrays hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_uint64_t authType = *((_DWORD *)v4 + 4);
  baaParameters = self->_baaParameters;
  uint64_t v6 = *((void *)v4 + 4);
  if (baaParameters)
  {
    if (v6) {
      -[NSPPrivacyProxyBAAValidation mergeFrom:](baaParameters, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NSPPrivacyProxyTokenActivationQuery setBaaParameters:](self, "setBaaParameters:");
  }
  tokenInfo = self->_tokenInfo;
  uint64_t v8 = *((void *)v4 + 5);
  if (tokenInfo)
  {
    if (v8) {
      -[NSPPrivacyProxyTokenInfo mergeFrom:](tokenInfo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NSPPrivacyProxyTokenActivationQuery setTokenInfo:](self, "setTokenInfo:");
  }
  if (*((void *)v4 + 1)) {
    -[NSPPrivacyProxyTokenActivationQuery setAuthInfo:](self, "setAuthInfo:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v4 + 3);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[NSPPrivacyProxyTokenActivationQuery addAuxiliaryAuthArray:](self, "addAuxiliaryAuthArray:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (int)authType
{
  return self->_authType;
}

- (void)setAuthType:(int)a3
{
  self->_uint64_t authType = a3;
}

- (NSPPrivacyProxyBAAValidation)baaParameters
{
  return self->_baaParameters;
}

- (void)setBaaParameters:(id)a3
{
}

- (NSPPrivacyProxyTokenInfo)tokenInfo
{
  return self->_tokenInfo;
}

- (void)setTokenInfo:(id)a3
{
}

- (NSData)authInfo
{
  return self->_authInfo;
}

- (void)setAuthInfo:(id)a3
{
}

- (NSMutableArray)auxiliaryAuthArrays
{
  return self->_auxiliaryAuthArrays;
}

- (void)setAuxiliaryAuthArrays:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenInfo, 0);
  objc_storeStrong((id *)&self->_baaParameters, 0);
  objc_storeStrong((id *)&self->_auxiliaryAuthArrays, 0);
  objc_storeStrong((id *)&self->_authInfo, 0);
}

@end