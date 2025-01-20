@interface NSPPrivacyProxyObliviousHTTPConfig
+ (Class)obliviousTargetsType;
- (BOOL)hasObliviousHTTPType;
- (BOOL)hasTransparencyInternalProof;
- (BOOL)hasTransparencyKeyBundle;
- (BOOL)hasTransparencyProof;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)obliviousHTTPConfig;
- (NSData)transparencyInternalProof;
- (NSData)transparencyKeyBundle;
- (NSData)transparencyProof;
- (NSMutableArray)obliviousTargets;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)obliviousHTTPTypeAsString:(int)a3;
- (id)obliviousTargetsAtIndex:(unint64_t)a3;
- (int)StringAsObliviousHTTPType:(id)a3;
- (int)obliviousHTTPType;
- (unint64_t)hash;
- (unint64_t)obliviousTargetsCount;
- (void)addObliviousTargets:(id)a3;
- (void)clearObliviousTargets;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasObliviousHTTPType:(BOOL)a3;
- (void)setObliviousHTTPConfig:(id)a3;
- (void)setObliviousHTTPType:(int)a3;
- (void)setObliviousTargets:(id)a3;
- (void)setTransparencyInternalProof:(id)a3;
- (void)setTransparencyKeyBundle:(id)a3;
- (void)setTransparencyProof:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyObliviousHTTPConfig

- (void)clearObliviousTargets
{
}

- (void)addObliviousTargets:(id)a3
{
  id v4 = a3;
  obliviousTargets = self->_obliviousTargets;
  id v8 = v4;
  if (!obliviousTargets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_obliviousTargets;
    self->_obliviousTargets = v6;

    id v4 = v8;
    obliviousTargets = self->_obliviousTargets;
  }
  [(NSMutableArray *)obliviousTargets addObject:v4];
}

- (unint64_t)obliviousTargetsCount
{
  return [(NSMutableArray *)self->_obliviousTargets count];
}

- (id)obliviousTargetsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_obliviousTargets objectAtIndex:a3];
}

+ (Class)obliviousTargetsType
{
  return (Class)objc_opt_class();
}

- (int)obliviousHTTPType
{
  if (*(unsigned char *)&self->_has) {
    return self->_obliviousHTTPType;
  }
  else {
    return 0;
  }
}

- (void)setObliviousHTTPType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_obliviousHTTPType = a3;
}

- (void)setHasObliviousHTTPType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasObliviousHTTPType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)obliviousHTTPTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5A3B6B0[a3];
  }
  return v3;
}

- (int)StringAsObliviousHTTPType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CHUNKED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONTEXT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasTransparencyKeyBundle
{
  return self->_transparencyKeyBundle != 0;
}

- (BOOL)hasTransparencyProof
{
  return self->_transparencyProof != 0;
}

- (BOOL)hasTransparencyInternalProof
{
  return self->_transparencyInternalProof != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyObliviousHTTPConfig;
  int v4 = [(NSPPrivacyProxyObliviousHTTPConfig *)&v8 description];
  v5 = [(NSPPrivacyProxyObliviousHTTPConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_obliviousTargets count])
  {
    int v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_obliviousTargets, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v5 = self->_obliviousTargets;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"obliviousTargets"];
  }
  obliviousHTTPConfig = self->_obliviousHTTPConfig;
  if (obliviousHTTPConfig) {
    [v3 setObject:obliviousHTTPConfig forKey:@"obliviousHTTPConfig"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t obliviousHTTPType = self->_obliviousHTTPType;
    if (obliviousHTTPType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_obliviousHTTPType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E5A3B6B0[obliviousHTTPType];
    }
    [v3 setObject:v13 forKey:@"obliviousHTTPType"];
  }
  transparencyKeyBundle = self->_transparencyKeyBundle;
  if (transparencyKeyBundle) {
    [v3 setObject:transparencyKeyBundle forKey:@"transparencyKeyBundle"];
  }
  transparencyProof = self->_transparencyProof;
  if (transparencyProof) {
    [v3 setObject:transparencyProof forKey:@"transparencyProof"];
  }
  transparencyInternalProof = self->_transparencyInternalProof;
  if (transparencyInternalProof) {
    [v3 setObject:transparencyInternalProof forKey:@"transparencyInternalProof"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyObliviousHTTPConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_obliviousTargets;
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

  if (!self->_obliviousHTTPConfig) {
    __assert_rtn("-[NSPPrivacyProxyObliviousHTTPConfig writeTo:]", "NSPPrivacyProxyObliviousHTTPConfig.m", 227, "nil != self->_obliviousHTTPConfig");
  }
  PBDataWriterWriteDataField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_transparencyKeyBundle) {
    PBDataWriterWriteDataField();
  }
  if (self->_transparencyProof) {
    PBDataWriterWriteDataField();
  }
  if (self->_transparencyInternalProof) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(NSPPrivacyProxyObliviousHTTPConfig *)self obliviousTargetsCount])
  {
    [v9 clearObliviousTargets];
    unint64_t v4 = [(NSPPrivacyProxyObliviousHTTPConfig *)self obliviousTargetsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NSPPrivacyProxyObliviousHTTPConfig *)self obliviousTargetsAtIndex:i];
        [v9 addObliviousTargets:v7];
      }
    }
  }
  [v9 setObliviousHTTPConfig:self->_obliviousHTTPConfig];
  uint64_t v8 = v9;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v9 + 4) = self->_obliviousHTTPType;
    *((unsigned char *)v9 + 56) |= 1u;
  }
  if (self->_transparencyKeyBundle)
  {
    objc_msgSend(v9, "setTransparencyKeyBundle:");
    uint64_t v8 = v9;
  }
  if (self->_transparencyProof)
  {
    objc_msgSend(v9, "setTransparencyProof:");
    uint64_t v8 = v9;
  }
  if (self->_transparencyInternalProof)
  {
    objc_msgSend(v9, "setTransparencyInternalProof:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = self->_obliviousTargets;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (void)v21);
        [(id)v5 addObliviousTargets:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSData *)self->_obliviousHTTPConfig copyWithZone:a3];
  long long v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_obliviousHTTPType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v14 = -[NSData copyWithZone:](self->_transparencyKeyBundle, "copyWithZone:", a3, (void)v21);
  uint64_t v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  uint64_t v16 = [(NSData *)self->_transparencyProof copyWithZone:a3];
  v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  uint64_t v18 = [(NSData *)self->_transparencyInternalProof copyWithZone:a3];
  long long v19 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  obliviousTargets = self->_obliviousTargets;
  if ((unint64_t)obliviousTargets | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](obliviousTargets, "isEqual:")) {
      goto LABEL_17;
    }
  }
  obliviousHTTPConfig = self->_obliviousHTTPConfig;
  if ((unint64_t)obliviousHTTPConfig | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](obliviousHTTPConfig, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_obliviousHTTPType != *((_DWORD *)v4 + 4)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  transparencyKeyBundle = self->_transparencyKeyBundle;
  if ((unint64_t)transparencyKeyBundle | *((void *)v4 + 5)
    && !-[NSData isEqual:](transparencyKeyBundle, "isEqual:"))
  {
    goto LABEL_17;
  }
  transparencyProof = self->_transparencyProof;
  if ((unint64_t)transparencyProof | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](transparencyProof, "isEqual:")) {
      goto LABEL_17;
    }
  }
  transparencyInternalProof = self->_transparencyInternalProof;
  if ((unint64_t)transparencyInternalProof | *((void *)v4 + 4)) {
    char v10 = -[NSData isEqual:](transparencyInternalProof, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_obliviousTargets hash];
  uint64_t v4 = [(NSData *)self->_obliviousHTTPConfig hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_obliviousHTTPType;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSData *)self->_transparencyKeyBundle hash];
  uint64_t v7 = [(NSData *)self->_transparencyProof hash];
  return v6 ^ v7 ^ [(NSData *)self->_transparencyInternalProof hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSPPrivacyProxyObliviousHTTPConfig addObliviousTargets:](self, "addObliviousTargets:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 1)) {
    -[NSPPrivacyProxyObliviousHTTPConfig setObliviousHTTPConfig:](self, "setObliviousHTTPConfig:");
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_uint64_t obliviousHTTPType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5)) {
    -[NSPPrivacyProxyObliviousHTTPConfig setTransparencyKeyBundle:](self, "setTransparencyKeyBundle:");
  }
  if (*((void *)v4 + 6)) {
    -[NSPPrivacyProxyObliviousHTTPConfig setTransparencyProof:](self, "setTransparencyProof:");
  }
  if (*((void *)v4 + 4)) {
    -[NSPPrivacyProxyObliviousHTTPConfig setTransparencyInternalProof:](self, "setTransparencyInternalProof:");
  }
}

- (NSMutableArray)obliviousTargets
{
  return self->_obliviousTargets;
}

- (void)setObliviousTargets:(id)a3
{
}

- (NSData)obliviousHTTPConfig
{
  return self->_obliviousHTTPConfig;
}

- (void)setObliviousHTTPConfig:(id)a3
{
}

- (NSData)transparencyKeyBundle
{
  return self->_transparencyKeyBundle;
}

- (void)setTransparencyKeyBundle:(id)a3
{
}

- (NSData)transparencyProof
{
  return self->_transparencyProof;
}

- (void)setTransparencyProof:(id)a3
{
}

- (NSData)transparencyInternalProof
{
  return self->_transparencyInternalProof;
}

- (void)setTransparencyInternalProof:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyProof, 0);
  objc_storeStrong((id *)&self->_transparencyKeyBundle, 0);
  objc_storeStrong((id *)&self->_transparencyInternalProof, 0);
  objc_storeStrong((id *)&self->_obliviousTargets, 0);
  objc_storeStrong((id *)&self->_obliviousHTTPConfig, 0);
}

@end