@interface CSDMessagingLinkSyncCheckInMessage
+ (Class)generateDescriptorInfosType;
+ (Class)generatorDescriptorsType;
- (BOOL)hasShouldCheckAllGenerators;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldCheckAllGenerators;
- (NSMutableArray)generateDescriptorInfos;
- (NSMutableArray)generatorDescriptors;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)generateDescriptorInfosAtIndex:(unint64_t)a3;
- (id)generatorDescriptorsAtIndex:(unint64_t)a3;
- (unint64_t)generateDescriptorInfosCount;
- (unint64_t)generatorDescriptorsCount;
- (unint64_t)hash;
- (unsigned)version;
- (void)addGenerateDescriptorInfos:(id)a3;
- (void)addGeneratorDescriptors:(id)a3;
- (void)clearGenerateDescriptorInfos;
- (void)clearGeneratorDescriptors;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGenerateDescriptorInfos:(id)a3;
- (void)setGeneratorDescriptors:(id)a3;
- (void)setHasShouldCheckAllGenerators:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setShouldCheckAllGenerators:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingLinkSyncCheckInMessage

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setShouldCheckAllGenerators:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shouldCheckAllGenerators = a3;
}

- (void)setHasShouldCheckAllGenerators:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldCheckAllGenerators
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearGeneratorDescriptors
{
}

- (void)addGeneratorDescriptors:(id)a3
{
  id v4 = a3;
  generatorDescriptors = self->_generatorDescriptors;
  id v8 = v4;
  if (!generatorDescriptors)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_generatorDescriptors;
    self->_generatorDescriptors = v6;

    id v4 = v8;
    generatorDescriptors = self->_generatorDescriptors;
  }
  [(NSMutableArray *)generatorDescriptors addObject:v4];
}

- (unint64_t)generatorDescriptorsCount
{
  return (unint64_t)[(NSMutableArray *)self->_generatorDescriptors count];
}

- (id)generatorDescriptorsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_generatorDescriptors objectAtIndex:a3];
}

+ (Class)generatorDescriptorsType
{
  return (Class)objc_opt_class();
}

- (void)clearGenerateDescriptorInfos
{
}

- (void)addGenerateDescriptorInfos:(id)a3
{
  id v4 = a3;
  generateDescriptorInfos = self->_generateDescriptorInfos;
  id v8 = v4;
  if (!generateDescriptorInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_generateDescriptorInfos;
    self->_generateDescriptorInfos = v6;

    id v4 = v8;
    generateDescriptorInfos = self->_generateDescriptorInfos;
  }
  [(NSMutableArray *)generateDescriptorInfos addObject:v4];
}

- (unint64_t)generateDescriptorInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_generateDescriptorInfos count];
}

- (id)generateDescriptorInfosAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_generateDescriptorInfos objectAtIndex:a3];
}

+ (Class)generateDescriptorInfosType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingLinkSyncCheckInMessage;
  char v3 = [(CSDMessagingLinkSyncCheckInMessage *)&v7 description];
  id v4 = [(CSDMessagingLinkSyncCheckInMessage *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = +[NSNumber numberWithBool:self->_shouldCheckAllGenerators];
    [v3 setObject:v6 forKey:@"shouldCheckAllGenerators"];
  }
  if ([(NSMutableArray *)self->_generatorDescriptors count])
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_generatorDescriptors, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = self->_generatorDescriptors;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"generatorDescriptors"];
  }
  if ([(NSMutableArray *)self->_generateDescriptorInfos count])
  {
    id v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_generateDescriptorInfos, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = self->_generateDescriptorInfos;
    id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)j), "dictionaryRepresentation", (void)v22);
          [v14 addObject:v20];
        }
        id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"generateDescriptorInfos"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001C5960((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = self->_generatorDescriptors;
  id v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = self->_generateDescriptorInfos;
  v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[6] = self->_version;
    *((unsigned char *)v4 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 28) = self->_shouldCheckAllGenerators;
    *((unsigned char *)v4 + 32) |= 2u;
  }
  id v14 = v4;
  if ([(CSDMessagingLinkSyncCheckInMessage *)self generatorDescriptorsCount])
  {
    [v14 clearGeneratorDescriptors];
    unint64_t v6 = [(CSDMessagingLinkSyncCheckInMessage *)self generatorDescriptorsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CSDMessagingLinkSyncCheckInMessage *)self generatorDescriptorsAtIndex:i];
        [v14 addGeneratorDescriptors:v9];
      }
    }
  }
  if ([(CSDMessagingLinkSyncCheckInMessage *)self generateDescriptorInfosCount])
  {
    [v14 clearGenerateDescriptorInfos];
    unint64_t v10 = [(CSDMessagingLinkSyncCheckInMessage *)self generateDescriptorInfosCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        v13 = [(CSDMessagingLinkSyncCheckInMessage *)self generateDescriptorInfosAtIndex:j];
        [v14 addGenerateDescriptorInfos:v13];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 6) = self->_version;
    *((unsigned char *)v5 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 28) = self->_shouldCheckAllGenerators;
    *((unsigned char *)v5 + 32) |= 2u;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = self->_generatorDescriptors;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [v6 addGeneratorDescriptors:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = self->_generateDescriptorInfos;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)j), "copyWithZone:", a3, (void)v21);
        [v6 addGenerateDescriptorInfos:v19];
      }
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) != 0)
    {
      if (self->_shouldCheckAllGenerators)
      {
        if (!*((unsigned char *)v4 + 28)) {
          goto LABEL_19;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_15;
      }
    }
LABEL_19:
    unsigned __int8 v7 = 0;
    goto LABEL_20;
  }
  if ((*((unsigned char *)v4 + 32) & 2) != 0) {
    goto LABEL_19;
  }
LABEL_15:
  generatorDescriptors = self->_generatorDescriptors;
  if ((unint64_t)generatorDescriptors | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](generatorDescriptors, "isEqual:"))
  {
    goto LABEL_19;
  }
  generateDescriptorInfos = self->_generateDescriptorInfos;
  if ((unint64_t)generateDescriptorInfos | *((void *)v4 + 1)) {
    unsigned __int8 v7 = -[NSMutableArray isEqual:](generateDescriptorInfos, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_version;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_shouldCheckAllGenerators;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ (unint64_t)[(NSMutableArray *)self->_generatorDescriptors hash];
  return v5 ^ (unint64_t)[(NSMutableArray *)self->_generateDescriptorInfos hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (id *)v4;
  char v6 = *((unsigned char *)v4 + 32);
  if (v6)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 32);
  }
  if ((v6 & 2) != 0)
  {
    self->_shouldCheckAllGenerators = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 2);
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(CSDMessagingLinkSyncCheckInMessage *)self addGeneratorDescriptors:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v5[1];
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[CSDMessagingLinkSyncCheckInMessage addGenerateDescriptorInfos:](self, "addGenerateDescriptorInfos:", *(void *)(*((void *)&v17 + 1) + 8 * (void)j), (void)v17);
      }
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (unsigned)version
{
  return self->_version;
}

- (BOOL)shouldCheckAllGenerators
{
  return self->_shouldCheckAllGenerators;
}

- (NSMutableArray)generatorDescriptors
{
  return self->_generatorDescriptors;
}

- (void)setGeneratorDescriptors:(id)a3
{
}

- (NSMutableArray)generateDescriptorInfos
{
  return self->_generateDescriptorInfos;
}

- (void)setGenerateDescriptorInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatorDescriptors, 0);

  objc_storeStrong((id *)&self->_generateDescriptorInfos, 0);
}

@end