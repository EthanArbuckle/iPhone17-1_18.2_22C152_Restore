@interface PBBProtoSendLanguageAndLocale
+ (Class)appleLanguagesType;
- (BOOL)hasAppleLocale;
- (BOOL)hasArchivedPreferences;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)archivedPreferences;
- (NSMutableArray)appleLanguages;
- (NSString)appleLocale;
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
- (void)setArchivedPreferences:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoSendLanguageAndLocale

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

- (BOOL)hasArchivedPreferences
{
  return self->_archivedPreferences != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoSendLanguageAndLocale;
  id v4 = [(PBBProtoSendLanguageAndLocale *)&v8 description];
  v5 = [(PBBProtoSendLanguageAndLocale *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  appleLanguages = self->_appleLanguages;
  if (appleLanguages) {
    [v3 setObject:appleLanguages forKey:@"appleLanguages"];
  }
  appleLocale = self->_appleLocale;
  if (appleLocale) {
    [v4 setObject:appleLocale forKey:@"appleLocale"];
  }
  archivedPreferences = self->_archivedPreferences;
  if (archivedPreferences) {
    [v4 setObject:archivedPreferences forKey:@"archivedPreferences"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoSendLanguageAndLocaleReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_appleLanguages;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_appleLocale) {
    PBDataWriterWriteStringField();
  }
  if (self->_archivedPreferences) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(PBBProtoSendLanguageAndLocale *)self appleLanguagesCount])
  {
    [v9 clearAppleLanguages];
    unint64_t v4 = [(PBBProtoSendLanguageAndLocale *)self appleLanguagesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PBBProtoSendLanguageAndLocale *)self appleLanguagesAtIndex:i];
        [v9 addAppleLanguages:v7];
      }
    }
  }
  if (self->_appleLocale) {
    objc_msgSend(v9, "setAppleLocale:");
  }
  uint64_t v8 = v9;
  if (self->_archivedPreferences)
  {
    objc_msgSend(v9, "setArchivedPreferences:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = self->_appleLanguages;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (void)v17);
        [v5 addAppleLanguages:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSString *)self->_appleLocale copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  uint64_t v14 = [(NSData *)self->_archivedPreferences copyWithZone:a3];
  uint64_t v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((appleLanguages = self->_appleLanguages, !((unint64_t)appleLanguages | v4[1]))
     || -[NSMutableArray isEqual:](appleLanguages, "isEqual:"))
    && ((appleLocale = self->_appleLocale, !((unint64_t)appleLocale | v4[2]))
     || -[NSString isEqual:](appleLocale, "isEqual:")))
  {
    archivedPreferences = self->_archivedPreferences;
    if ((unint64_t)archivedPreferences | v4[3]) {
      char v8 = -[NSData isEqual:](archivedPreferences, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_appleLanguages hash];
  NSUInteger v4 = [(NSString *)self->_appleLocale hash] ^ v3;
  return v4 ^ [(NSData *)self->_archivedPreferences hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  NSUInteger v4 = (id *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[1];
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
        -[PBBProtoSendLanguageAndLocale addAppleLanguages:](self, "addAppleLanguages:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[2]) {
    -[PBBProtoSendLanguageAndLocale setAppleLocale:](self, "setAppleLocale:");
  }
  if (v4[3]) {
    -[PBBProtoSendLanguageAndLocale setArchivedPreferences:](self, "setArchivedPreferences:");
  }
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

- (NSData)archivedPreferences
{
  return self->_archivedPreferences;
}

- (void)setArchivedPreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedPreferences, 0);
  objc_storeStrong((id *)&self->_appleLocale, 0);
  objc_storeStrong((id *)&self->_appleLanguages, 0);
}

@end