@interface NSSLegalDocumentsReqMsg
+ (Class)legacyPreferredLanguagesType;
+ (Class)preferredLanguagesType;
- (BOOL)addUrlToSAR;
- (BOOL)fetchBuiltinApps;
- (BOOL)hasAddUrlToSAR;
- (BOOL)hasFetchBuiltinApps;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)legacyPreferredLanguages;
- (NSMutableArray)preferredLanguages;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)legacyPreferredLanguagesAtIndex:(unint64_t)a3;
- (id)preferredLanguagesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)legacyPreferredLanguagesCount;
- (unint64_t)preferredLanguagesCount;
- (void)addLegacyPreferredLanguages:(id)a3;
- (void)addPreferredLanguages:(id)a3;
- (void)clearLegacyPreferredLanguages;
- (void)clearPreferredLanguages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddUrlToSAR:(BOOL)a3;
- (void)setFetchBuiltinApps:(BOOL)a3;
- (void)setHasAddUrlToSAR:(BOOL)a3;
- (void)setHasFetchBuiltinApps:(BOOL)a3;
- (void)setLegacyPreferredLanguages:(id)a3;
- (void)setPreferredLanguages:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSLegalDocumentsReqMsg

- (void)clearLegacyPreferredLanguages
{
}

- (void)addLegacyPreferredLanguages:(id)a3
{
  id v4 = a3;
  legacyPreferredLanguages = self->_legacyPreferredLanguages;
  id v8 = v4;
  if (!legacyPreferredLanguages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_legacyPreferredLanguages;
    self->_legacyPreferredLanguages = v6;

    id v4 = v8;
    legacyPreferredLanguages = self->_legacyPreferredLanguages;
  }
  [(NSMutableArray *)legacyPreferredLanguages addObject:v4];
}

- (unint64_t)legacyPreferredLanguagesCount
{
  return [(NSMutableArray *)self->_legacyPreferredLanguages count];
}

- (id)legacyPreferredLanguagesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_legacyPreferredLanguages objectAtIndex:a3];
}

+ (Class)legacyPreferredLanguagesType
{
  return (Class)objc_opt_class();
}

- (void)clearPreferredLanguages
{
}

- (void)addPreferredLanguages:(id)a3
{
  id v4 = a3;
  preferredLanguages = self->_preferredLanguages;
  id v8 = v4;
  if (!preferredLanguages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_preferredLanguages;
    self->_preferredLanguages = v6;

    id v4 = v8;
    preferredLanguages = self->_preferredLanguages;
  }
  [(NSMutableArray *)preferredLanguages addObject:v4];
}

- (unint64_t)preferredLanguagesCount
{
  return [(NSMutableArray *)self->_preferredLanguages count];
}

- (id)preferredLanguagesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_preferredLanguages objectAtIndex:a3];
}

+ (Class)preferredLanguagesType
{
  return (Class)objc_opt_class();
}

- (void)setAddUrlToSAR:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_addUrlToSAR = a3;
}

- (void)setHasAddUrlToSAR:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAddUrlToSAR
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFetchBuiltinApps:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fetchBuiltinApps = a3;
}

- (void)setHasFetchBuiltinApps:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFetchBuiltinApps
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSLegalDocumentsReqMsg;
  id v4 = [(NSSLegalDocumentsReqMsg *)&v8 description];
  v5 = [(NSSLegalDocumentsReqMsg *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  legacyPreferredLanguages = self->_legacyPreferredLanguages;
  if (legacyPreferredLanguages) {
    [v3 setObject:legacyPreferredLanguages forKey:@"legacyPreferredLanguages"];
  }
  preferredLanguages = self->_preferredLanguages;
  if (preferredLanguages) {
    [v4 setObject:preferredLanguages forKey:@"preferredLanguages"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_addUrlToSAR];
    [v4 setObject:v8 forKey:@"addUrlToSAR"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_fetchBuiltinApps];
    [v4 setObject:v9 forKey:@"fetchBuiltinApps"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSLegalDocumentsReqMsgReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = self->_legacyPreferredLanguages;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = self->_preferredLanguages;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v13 = a3;
  if ([(NSSLegalDocumentsReqMsg *)self legacyPreferredLanguagesCount])
  {
    [v13 clearLegacyPreferredLanguages];
    unint64_t v4 = [(NSSLegalDocumentsReqMsg *)self legacyPreferredLanguagesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NSSLegalDocumentsReqMsg *)self legacyPreferredLanguagesAtIndex:i];
        [v13 addLegacyPreferredLanguages:v7];
      }
    }
  }
  if ([(NSSLegalDocumentsReqMsg *)self preferredLanguagesCount])
  {
    [v13 clearPreferredLanguages];
    unint64_t v8 = [(NSSLegalDocumentsReqMsg *)self preferredLanguagesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NSSLegalDocumentsReqMsg *)self preferredLanguagesAtIndex:j];
        [v13 addPreferredLanguages:v11];
      }
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    v13[24] = self->_addUrlToSAR;
    v13[28] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v13[25] = self->_fetchBuiltinApps;
    v13[28] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = self->_legacyPreferredLanguages;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a3];
        [v5 addLegacyPreferredLanguages:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v12 = self->_preferredLanguages;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "copyWithZone:", a3, (void)v20);
        [v5 addPreferredLanguages:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }

  char has = (char)self->_has;
  if (has)
  {
    v5[24] = self->_addUrlToSAR;
    v5[28] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[25] = self->_fetchBuiltinApps;
    v5[28] |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  legacyPreferredLanguages = self->_legacyPreferredLanguages;
  if ((unint64_t)legacyPreferredLanguages | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](legacyPreferredLanguages, "isEqual:")) {
      goto LABEL_16;
    }
  }
  preferredLanguages = self->_preferredLanguages;
  if ((unint64_t)preferredLanguages | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](preferredLanguages, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0) {
      goto LABEL_16;
    }
    if (self->_addUrlToSAR)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) != 0)
    {
      if (self->_fetchBuiltinApps)
      {
        if (!*((unsigned char *)v4 + 25)) {
          goto LABEL_16;
        }
      }
      else if (*((unsigned char *)v4 + 25))
      {
        goto LABEL_16;
      }
      BOOL v7 = 1;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v7 = 0;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_legacyPreferredLanguages hash];
  uint64_t v4 = [(NSMutableArray *)self->_preferredLanguages hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_addUrlToSAR;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_fetchBuiltinApps;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NSSLegalDocumentsReqMsg *)self addLegacyPreferredLanguages:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = *((id *)v4 + 2);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NSSLegalDocumentsReqMsg addPreferredLanguages:](self, "addPreferredLanguages:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  char v15 = *((unsigned char *)v4 + 28);
  if (v15)
  {
    self->_addUrlToSAR = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
    char v15 = *((unsigned char *)v4 + 28);
  }
  if ((v15 & 2) != 0)
  {
    self->_fetchBuiltinApps = *((unsigned char *)v4 + 25);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSMutableArray)legacyPreferredLanguages
{
  return self->_legacyPreferredLanguages;
}

- (void)setLegacyPreferredLanguages:(id)a3
{
}

- (NSMutableArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (void)setPreferredLanguages:(id)a3
{
}

- (BOOL)addUrlToSAR
{
  return self->_addUrlToSAR;
}

- (BOOL)fetchBuiltinApps
{
  return self->_fetchBuiltinApps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_legacyPreferredLanguages, 0);
}

@end