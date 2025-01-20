@interface PBBProtoWarrantySentinel
+ (Class)appleLanguagesType;
- (BOOL)hasAppleLocale;
- (BOOL)hasDeviceName;
- (BOOL)hasRemoveSentinel;
- (BOOL)hasSentinelExists;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)removeSentinel;
- (BOOL)sentinelExists;
- (NSMutableArray)appleLanguages;
- (NSString)appleLocale;
- (NSString)deviceName;
- (id)appleLanguagesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)appleLanguagesCount;
- (unint64_t)hash;
- (void)addAppleLanguages:(id)a3;
- (void)clearAppleLanguages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppleLanguages:(id)a3;
- (void)setAppleLocale:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setHasRemoveSentinel:(BOOL)a3;
- (void)setHasSentinelExists:(BOOL)a3;
- (void)setRemoveSentinel:(BOOL)a3;
- (void)setSentinelExists:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoWarrantySentinel

- (void)setSentinelExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sentinelExists = a3;
}

- (void)setHasSentinelExists:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSentinelExists
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRemoveSentinel:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_removeSentinel = a3;
}

- (void)setHasRemoveSentinel:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRemoveSentinel
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearAppleLanguages
{
}

- (void)addAppleLanguages:(id)a3
{
  id v4 = a3;
  appleLanguages = self->_appleLanguages;
  id v8 = v4;
  if (!appleLanguages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_appleLanguages;
    self->_appleLanguages = v6;

    id v4 = v8;
    appleLanguages = self->_appleLanguages;
  }
  [(NSMutableArray *)appleLanguages addObject:v4];
}

- (unint64_t)appleLanguagesCount
{
  return [(NSMutableArray *)self->_appleLanguages count];
}

- (id)appleLanguagesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_appleLanguages objectAtIndex:a3];
}

+ (Class)appleLanguagesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAppleLocale
{
  return self->_appleLocale != 0;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoWarrantySentinel;
  id v4 = [(PBBProtoWarrantySentinel *)&v8 description];
  v5 = [(PBBProtoWarrantySentinel *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_sentinelExists];
    [v3 setObject:v5 forKey:@"sentinelExists"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithBool:self->_removeSentinel];
    [v3 setObject:v6 forKey:@"removeSentinel"];
  }
  appleLanguages = self->_appleLanguages;
  if (appleLanguages) {
    [v3 setObject:appleLanguages forKey:@"appleLanguages"];
  }
  appleLocale = self->_appleLocale;
  if (appleLocale) {
    [v3 setObject:appleLocale forKey:@"appleLocale"];
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"deviceName"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoWarrantySentinelReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_appleLanguages;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_appleLocale) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceName) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[33] = self->_sentinelExists;
    v4[36] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[32] = self->_removeSentinel;
    v4[36] |= 1u;
  }
  id v11 = v4;
  if ([(PBBProtoWarrantySentinel *)self appleLanguagesCount])
  {
    [v11 clearAppleLanguages];
    unint64_t v6 = [(PBBProtoWarrantySentinel *)self appleLanguagesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PBBProtoWarrantySentinel *)self appleLanguagesAtIndex:i];
        [v11 addAppleLanguages:v9];
      }
    }
  }
  if (self->_appleLocale) {
    objc_msgSend(v11, "setAppleLocale:");
  }
  v10 = v11;
  if (self->_deviceName)
  {
    objc_msgSend(v11, "setDeviceName:");
    v10 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[33] = self->_sentinelExists;
    v5[36] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[32] = self->_removeSentinel;
    v5[36] |= 1u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_appleLanguages;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
        [v6 addAppleLanguages:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_appleLocale copyWithZone:a3];
  v15 = (void *)v6[2];
  v6[2] = v14;

  uint64_t v16 = [(NSString *)self->_deviceName copyWithZone:a3];
  v17 = (void *)v6[3];
  v6[3] = v16;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0) {
      goto LABEL_24;
    }
    if (self->_sentinelExists)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 36))
    {
      if (self->_removeSentinel)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_24;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_18;
      }
    }
LABEL_24:
    char v8 = 0;
    goto LABEL_25;
  }
  if (*((unsigned char *)v4 + 36)) {
    goto LABEL_24;
  }
LABEL_18:
  appleLanguages = self->_appleLanguages;
  if ((unint64_t)appleLanguages | *((void *)v4 + 1)
    && !-[NSMutableArray isEqual:](appleLanguages, "isEqual:"))
  {
    goto LABEL_24;
  }
  appleLocale = self->_appleLocale;
  if ((unint64_t)appleLocale | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](appleLocale, "isEqual:")) {
      goto LABEL_24;
    }
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 3)) {
    char v8 = -[NSString isEqual:](deviceName, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_sentinelExists;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_removeSentinel;
LABEL_6:
  uint64_t v5 = v4 ^ v3 ^ [(NSMutableArray *)self->_appleLanguages hash];
  NSUInteger v6 = [(NSString *)self->_appleLocale hash];
  return v5 ^ v6 ^ [(NSString *)self->_deviceName hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 36);
  if ((v6 & 2) != 0)
  {
    self->_sentinelExists = *((unsigned char *)v4 + 33);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 36);
  }
  if (v6)
  {
    self->_removeSentinel = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[PBBProtoWarrantySentinel addAppleLanguages:](self, "addAppleLanguages:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (v5[2]) {
    -[PBBProtoWarrantySentinel setAppleLocale:](self, "setAppleLocale:");
  }
  if (v5[3]) {
    -[PBBProtoWarrantySentinel setDeviceName:](self, "setDeviceName:");
  }
}

- (BOOL)sentinelExists
{
  return self->_sentinelExists;
}

- (BOOL)removeSentinel
{
  return self->_removeSentinel;
}

- (NSMutableArray)appleLanguages
{
  return self->_appleLanguages;
}

- (void)setAppleLanguages:(id)a3
{
}

- (NSString)appleLocale
{
  return self->_appleLocale;
}

- (void)setAppleLocale:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_appleLocale, 0);
  objc_storeStrong((id *)&self->_appleLanguages, 0);
}

@end