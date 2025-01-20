@interface _MRLanguageOptionProtobuf
+ (Class)characteristicsType;
- (BOOL)hasDisplayName;
- (BOOL)hasIdentifier;
- (BOOL)hasLanguageTag;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)characteristics;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)languageTag;
- (id)characteristicsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)type;
- (unint64_t)characteristicsCount;
- (unint64_t)hash;
- (void)addCharacteristics:(id)a3;
- (void)clearCharacteristics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCharacteristics:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLanguageTag:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRLanguageOptionProtobuf

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLanguageTag
{
  return self->_languageTag != 0;
}

- (void)clearCharacteristics
{
}

- (void)addCharacteristics:(id)a3
{
  id v4 = a3;
  characteristics = self->_characteristics;
  id v8 = v4;
  if (!characteristics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_characteristics;
    self->_characteristics = v6;

    id v4 = v8;
    characteristics = self->_characteristics;
  }
  [(NSMutableArray *)characteristics addObject:v4];
}

- (unint64_t)characteristicsCount
{
  return [(NSMutableArray *)self->_characteristics count];
}

- (id)characteristicsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_characteristics objectAtIndex:a3];
}

+ (Class)characteristicsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRLanguageOptionProtobuf;
  id v4 = [(_MRLanguageOptionProtobuf *)&v8 description];
  v5 = [(_MRLanguageOptionProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithInt:self->_type];
    [v3 setObject:v4 forKey:@"type"];
  }
  languageTag = self->_languageTag;
  if (languageTag) {
    [v3 setObject:languageTag forKey:@"languageTag"];
  }
  characteristics = self->_characteristics;
  if (characteristics) {
    [v3 setObject:characteristics forKey:@"characteristics"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v3 setObject:displayName forKey:@"displayName"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRLanguageOptionProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_languageTag) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_characteristics;
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

  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[10] = self->_type;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  id v10 = v4;
  if (self->_languageTag) {
    objc_msgSend(v4, "setLanguageTag:");
  }
  if ([(_MRLanguageOptionProtobuf *)self characteristicsCount])
  {
    [v10 clearCharacteristics];
    unint64_t v5 = [(_MRLanguageOptionProtobuf *)self characteristicsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(_MRLanguageOptionProtobuf *)self characteristicsAtIndex:i];
        [v10 addCharacteristics:v8];
      }
    }
  }
  if (self->_displayName) {
    objc_msgSend(v10, "setDisplayName:");
  }
  uint64_t v9 = v10;
  if (self->_identifier)
  {
    objc_msgSend(v10, "setIdentifier:");
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_type;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_languageTag copyWithZone:a3];
  uint64_t v8 = (void *)v6[4];
  v6[4] = v7;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = self->_characteristics;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v13), "copyWithZone:", a3, (void)v20);
        [v6 addCharacteristics:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(NSString *)self->_displayName copyWithZone:a3];
  v16 = (void *)v6[2];
  v6[2] = v15;

  uint64_t v17 = [(NSString *)self->_identifier copyWithZone:a3];
  v18 = (void *)v6[3];
  v6[3] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_type != *((_DWORD *)v4 + 10)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  languageTag = self->_languageTag;
  if ((unint64_t)languageTag | *((void *)v4 + 4)
    && !-[NSString isEqual:](languageTag, "isEqual:"))
  {
    goto LABEL_15;
  }
  characteristics = self->_characteristics;
  if ((unint64_t)characteristics | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](characteristics, "isEqual:")) {
      goto LABEL_15;
    }
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_15;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3)) {
    char v9 = -[NSString isEqual:](identifier, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_languageTag hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_characteristics hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_displayName hash];
  return v6 ^ [(NSString *)self->_identifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (id *)a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 44))
  {
    self->_type = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[4]) {
    -[_MRLanguageOptionProtobuf setLanguageTag:](self, "setLanguageTag:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5[1];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        -[_MRLanguageOptionProtobuf addCharacteristics:](self, "addCharacteristics:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (v5[2]) {
    -[_MRLanguageOptionProtobuf setDisplayName:](self, "setDisplayName:");
  }
  if (v5[3]) {
    -[_MRLanguageOptionProtobuf setIdentifier:](self, "setIdentifier:");
  }
}

- (int)type
{
  return self->_type;
}

- (NSString)languageTag
{
  return self->_languageTag;
}

- (void)setLanguageTag:(id)a3
{
}

- (NSMutableArray)characteristics
{
  return self->_characteristics;
}

- (void)setCharacteristics:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageTag, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_characteristics, 0);
}

@end