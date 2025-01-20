@interface _MRLanguageOptionGroupProtobuf
+ (Class)languageOptionsType;
- (BOOL)allowEmptySelection;
- (BOOL)hasAllowEmptySelection;
- (BOOL)hasDefaultLanguageOption;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)languageOptions;
- (_MRLanguageOptionProtobuf)defaultLanguageOption;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)languageOptionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)languageOptionsCount;
- (void)addLanguageOptions:(id)a3;
- (void)clearLanguageOptions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowEmptySelection:(BOOL)a3;
- (void)setDefaultLanguageOption:(id)a3;
- (void)setHasAllowEmptySelection:(BOOL)a3;
- (void)setLanguageOptions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRLanguageOptionGroupProtobuf

- (void)setAllowEmptySelection:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_allowEmptySelection = a3;
}

- (void)setHasAllowEmptySelection:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllowEmptySelection
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDefaultLanguageOption
{
  return self->_defaultLanguageOption != 0;
}

- (void)clearLanguageOptions
{
}

- (void)addLanguageOptions:(id)a3
{
  id v4 = a3;
  languageOptions = self->_languageOptions;
  id v8 = v4;
  if (!languageOptions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_languageOptions;
    self->_languageOptions = v6;

    id v4 = v8;
    languageOptions = self->_languageOptions;
  }
  [(NSMutableArray *)languageOptions addObject:v4];
}

- (unint64_t)languageOptionsCount
{
  return [(NSMutableArray *)self->_languageOptions count];
}

- (id)languageOptionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_languageOptions objectAtIndex:a3];
}

+ (Class)languageOptionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRLanguageOptionGroupProtobuf;
  id v4 = [(_MRLanguageOptionGroupProtobuf *)&v8 description];
  v5 = [(_MRLanguageOptionGroupProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithBool:self->_allowEmptySelection];
    [v3 setObject:v4 forKey:@"allowEmptySelection"];
  }
  defaultLanguageOption = self->_defaultLanguageOption;
  if (defaultLanguageOption)
  {
    v6 = [(_MRLanguageOptionProtobuf *)defaultLanguageOption dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"defaultLanguageOption"];
  }
  if ([(NSMutableArray *)self->_languageOptions count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_languageOptions, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_languageOptions;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"languageOptions"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRLanguageOptionGroupProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_defaultLanguageOption) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_languageOptions;
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
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_allowEmptySelection;
    v4[28] |= 1u;
  }
  id v9 = v4;
  if (self->_defaultLanguageOption) {
    objc_msgSend(v4, "setDefaultLanguageOption:");
  }
  if ([(_MRLanguageOptionGroupProtobuf *)self languageOptionsCount])
  {
    [v9 clearLanguageOptions];
    unint64_t v5 = [(_MRLanguageOptionGroupProtobuf *)self languageOptionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(_MRLanguageOptionGroupProtobuf *)self languageOptionsAtIndex:i];
        [v9 addLanguageOptions:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_allowEmptySelection;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v7 = [(_MRLanguageOptionProtobuf *)self->_defaultLanguageOption copyWithZone:a3];
  uint64_t v8 = (void *)v6[1];
  v6[1] = v7;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = self->_languageOptions;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "copyWithZone:", a3, (void)v16);
        [v6 addLanguageOptions:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_allowEmptySelection)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_10;
      }
    }
LABEL_14:
    char v7 = 0;
    goto LABEL_15;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_14;
  }
LABEL_10:
  defaultLanguageOption = self->_defaultLanguageOption;
  if ((unint64_t)defaultLanguageOption | *((void *)v4 + 1)
    && !-[_MRLanguageOptionProtobuf isEqual:](defaultLanguageOption, "isEqual:"))
  {
    goto LABEL_14;
  }
  languageOptions = self->_languageOptions;
  if ((unint64_t)languageOptions | *((void *)v4 + 2)) {
    char v7 = -[NSMutableArray isEqual:](languageOptions, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_allowEmptySelection;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_MRLanguageOptionProtobuf *)self->_defaultLanguageOption hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_languageOptions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3;
  id v5 = v4;
  if (v4[28])
  {
    self->_allowEmptySelection = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  defaultLanguageOption = self->_defaultLanguageOption;
  uint64_t v7 = *((void *)v5 + 1);
  if (defaultLanguageOption)
  {
    if (v7) {
      -[_MRLanguageOptionProtobuf mergeFrom:](defaultLanguageOption, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[_MRLanguageOptionGroupProtobuf setDefaultLanguageOption:](self, "setDefaultLanguageOption:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v5 + 2);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[_MRLanguageOptionGroupProtobuf addLanguageOptions:](self, "addLanguageOptions:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)allowEmptySelection
{
  return self->_allowEmptySelection;
}

- (_MRLanguageOptionProtobuf)defaultLanguageOption
{
  return self->_defaultLanguageOption;
}

- (void)setDefaultLanguageOption:(id)a3
{
}

- (NSMutableArray)languageOptions
{
  return self->_languageOptions;
}

- (void)setLanguageOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageOptions, 0);

  objc_storeStrong((id *)&self->_defaultLanguageOption, 0);
}

@end