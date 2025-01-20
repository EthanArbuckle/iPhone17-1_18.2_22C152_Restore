@interface PBBProtoOfflineTerms
+ (Class)appleLanguagesType;
- (BOOL)hasCountryCode;
- (BOOL)hasLanguageCode;
- (BOOL)hasLicense;
- (BOOL)hasMultiterms;
- (BOOL)hasWarranty;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)license;
- (NSData)multiterms;
- (NSData)warranty;
- (NSMutableArray)appleLanguages;
- (NSString)countryCode;
- (NSString)languageCode;
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
- (void)setCountryCode:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLicense:(id)a3;
- (void)setMultiterms:(id)a3;
- (void)setWarranty:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoOfflineTerms

- (BOOL)hasLicense
{
  return self->_license != 0;
}

- (BOOL)hasMultiterms
{
  return self->_multiterms != 0;
}

- (BOOL)hasWarranty
{
  return self->_warranty != 0;
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
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

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoOfflineTerms;
  id v4 = [(PBBProtoOfflineTerms *)&v8 description];
  v5 = [(PBBProtoOfflineTerms *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  license = self->_license;
  if (license) {
    [v3 setObject:license forKey:@"license"];
  }
  multiterms = self->_multiterms;
  if (multiterms) {
    [v4 setObject:multiterms forKey:@"multiterms"];
  }
  warranty = self->_warranty;
  if (warranty) {
    [v4 setObject:warranty forKey:@"warranty"];
  }
  languageCode = self->_languageCode;
  if (languageCode) {
    [v4 setObject:languageCode forKey:@"languageCode"];
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    [v4 setObject:countryCode forKey:@"countryCode"];
  }
  appleLanguages = self->_appleLanguages;
  if (appleLanguages) {
    [v4 setObject:appleLanguages forKey:@"appleLanguages"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoOfflineTermsReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_license) {
    PBDataWriterWriteDataField();
  }
  if (self->_multiterms) {
    PBDataWriterWriteDataField();
  }
  if (self->_warranty) {
    PBDataWriterWriteDataField();
  }
  if (self->_languageCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
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
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_license) {
    objc_msgSend(v8, "setLicense:");
  }
  if (self->_multiterms) {
    objc_msgSend(v8, "setMultiterms:");
  }
  if (self->_warranty) {
    objc_msgSend(v8, "setWarranty:");
  }
  if (self->_languageCode) {
    objc_msgSend(v8, "setLanguageCode:");
  }
  if (self->_countryCode) {
    objc_msgSend(v8, "setCountryCode:");
  }
  if ([(PBBProtoOfflineTerms *)self appleLanguagesCount])
  {
    [v8 clearAppleLanguages];
    unint64_t v4 = [(PBBProtoOfflineTerms *)self appleLanguagesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PBBProtoOfflineTerms *)self appleLanguagesAtIndex:i];
        [v8 addAppleLanguages:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_license copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSData *)self->_multiterms copyWithZone:a3];
  uint64_t v9 = (void *)v5[5];
  v5[5] = v8;

  uint64_t v10 = [(NSData *)self->_warranty copyWithZone:a3];
  long long v11 = (void *)v5[6];
  v5[6] = v10;

  uint64_t v12 = [(NSString *)self->_languageCode copyWithZone:a3];
  long long v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(NSString *)self->_countryCode copyWithZone:a3];
  uint64_t v15 = (void *)v5[2];
  v5[2] = v14;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = self->_appleLanguages;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (void)v23);
        [v5 addAppleLanguages:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((license = self->_license, !((unint64_t)license | v4[4]))
     || -[NSData isEqual:](license, "isEqual:"))
    && ((multiterms = self->_multiterms, !((unint64_t)multiterms | v4[5]))
     || -[NSData isEqual:](multiterms, "isEqual:"))
    && ((warranty = self->_warranty, !((unint64_t)warranty | v4[6]))
     || -[NSData isEqual:](warranty, "isEqual:"))
    && ((languageCode = self->_languageCode, !((unint64_t)languageCode | v4[3]))
     || -[NSString isEqual:](languageCode, "isEqual:"))
    && ((countryCode = self->_countryCode, !((unint64_t)countryCode | v4[2]))
     || -[NSString isEqual:](countryCode, "isEqual:")))
  {
    appleLanguages = self->_appleLanguages;
    if ((unint64_t)appleLanguages | v4[1]) {
      char v11 = -[NSMutableArray isEqual:](appleLanguages, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_license hash];
  uint64_t v4 = [(NSData *)self->_multiterms hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_warranty hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_languageCode hash];
  NSUInteger v7 = [(NSString *)self->_countryCode hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_appleLanguages hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[PBBProtoOfflineTerms setLicense:](self, "setLicense:");
  }
  if (*((void *)v4 + 5)) {
    -[PBBProtoOfflineTerms setMultiterms:](self, "setMultiterms:");
  }
  if (*((void *)v4 + 6)) {
    -[PBBProtoOfflineTerms setWarranty:](self, "setWarranty:");
  }
  if (*((void *)v4 + 3)) {
    -[PBBProtoOfflineTerms setLanguageCode:](self, "setLanguageCode:");
  }
  if (*((void *)v4 + 2)) {
    -[PBBProtoOfflineTerms setCountryCode:](self, "setCountryCode:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[PBBProtoOfflineTerms addAppleLanguages:](self, "addAppleLanguages:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSData)license
{
  return self->_license;
}

- (void)setLicense:(id)a3
{
}

- (NSData)multiterms
{
  return self->_multiterms;
}

- (void)setMultiterms:(id)a3
{
}

- (NSData)warranty
{
  return self->_warranty;
}

- (void)setWarranty:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSMutableArray)appleLanguages
{
  return self->_appleLanguages;
}

- (void)setAppleLanguages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warranty, 0);
  objc_storeStrong((id *)&self->_multiterms, 0);
  objc_storeStrong((id *)&self->_license, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_appleLanguages, 0);
}

@end