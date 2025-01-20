@interface FCCKPLocale
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addEnabledKeyboards:(uint64_t)a1;
- (unint64_t)hash;
- (void)setLanguageCode:(uint64_t)a1;
- (void)setRegionCode:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPLocale

- (void)setRegionCode:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setLanguageCode:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_enabledKeyboards, 0);
  objc_storeStrong((id *)&self->_activeKeyboard, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_languageCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_regionCode) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_enabledKeyboards;
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

  if (self->_activeKeyboard) {
    PBDataWriterWriteStringField();
  }
}

- (uint64_t)addEnabledKeyboards:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 16);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v6;

      v5 = *(void **)(a1 + 16);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPLocale;
  id v4 = [(FCCKPLocale *)&v8 description];
  v5 = [(FCCKPLocale *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  languageCode = self->_languageCode;
  if (languageCode) {
    [v3 setObject:languageCode forKey:@"languageCode"];
  }
  regionCode = self->_regionCode;
  if (regionCode) {
    [v4 setObject:regionCode forKey:@"regionCode"];
  }
  enabledKeyboards = self->_enabledKeyboards;
  if (enabledKeyboards) {
    [v4 setObject:enabledKeyboards forKey:@"enabledKeyboards"];
  }
  activeKeyboard = self->_activeKeyboard;
  if (activeKeyboard) {
    [v4 setObject:activeKeyboard forKey:@"activeKeyboard"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPLocaleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_languageCode copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_regionCode copyWithZone:a3];
  id v9 = (void *)v5[4];
  v5[4] = v8;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v10 = self->_enabledKeyboards;
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
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v14), "copyWithZone:", a3, (void)v19);
        -[FCCKPLocale addEnabledKeyboards:]((uint64_t)v5, v15);

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSString *)self->_activeKeyboard copyWithZone:a3];
  v17 = (void *)v5[1];
  v5[1] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((languageCode = self->_languageCode, !((unint64_t)languageCode | v4[3]))
     || -[NSString isEqual:](languageCode, "isEqual:"))
    && ((regionCode = self->_regionCode, !((unint64_t)regionCode | v4[4]))
     || -[NSString isEqual:](regionCode, "isEqual:"))
    && ((enabledKeyboards = self->_enabledKeyboards, !((unint64_t)enabledKeyboards | v4[2]))
     || -[NSMutableArray isEqual:](enabledKeyboards, "isEqual:")))
  {
    activeKeyboard = self->_activeKeyboard;
    if ((unint64_t)activeKeyboard | v4[1]) {
      char v9 = -[NSString isEqual:](activeKeyboard, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_languageCode hash];
  NSUInteger v4 = [(NSString *)self->_regionCode hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_enabledKeyboards hash];
  return v4 ^ v5 ^ [(NSString *)self->_activeKeyboard hash];
}

@end