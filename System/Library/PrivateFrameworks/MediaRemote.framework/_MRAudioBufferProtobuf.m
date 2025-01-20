@interface _MRAudioBufferProtobuf
+ (Class)packetDescriptionsType;
- (BOOL)hasContents;
- (BOOL)hasFormatSettings;
- (BOOL)hasMaximumPacketSize;
- (BOOL)hasPacketCapacity;
- (BOOL)hasPacketCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)contents;
- (NSMutableArray)packetDescriptions;
- (_MRAudioFormatSettingsProtobuf)formatSettings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)packetDescriptionsAtIndex:(unint64_t)a3;
- (int64_t)maximumPacketSize;
- (int64_t)packetCapacity;
- (int64_t)packetCount;
- (unint64_t)hash;
- (unint64_t)packetDescriptionsCount;
- (void)addPacketDescriptions:(id)a3;
- (void)clearPacketDescriptions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContents:(id)a3;
- (void)setFormatSettings:(id)a3;
- (void)setHasMaximumPacketSize:(BOOL)a3;
- (void)setHasPacketCapacity:(BOOL)a3;
- (void)setHasPacketCount:(BOOL)a3;
- (void)setMaximumPacketSize:(int64_t)a3;
- (void)setPacketCapacity:(int64_t)a3;
- (void)setPacketCount:(int64_t)a3;
- (void)setPacketDescriptions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRAudioBufferProtobuf

- (BOOL)hasFormatSettings
{
  return self->_formatSettings != 0;
}

- (void)setPacketCapacity:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_packetCapacity = a3;
}

- (void)setHasPacketCapacity:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPacketCapacity
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMaximumPacketSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maximumPacketSize = a3;
}

- (void)setHasMaximumPacketSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaximumPacketSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPacketCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_packetCount = a3;
}

- (void)setHasPacketCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPacketCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasContents
{
  return self->_contents != 0;
}

- (void)clearPacketDescriptions
{
}

- (void)addPacketDescriptions:(id)a3
{
  id v4 = a3;
  packetDescriptions = self->_packetDescriptions;
  id v8 = v4;
  if (!packetDescriptions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_packetDescriptions;
    self->_packetDescriptions = v6;

    id v4 = v8;
    packetDescriptions = self->_packetDescriptions;
  }
  [(NSMutableArray *)packetDescriptions addObject:v4];
}

- (unint64_t)packetDescriptionsCount
{
  return [(NSMutableArray *)self->_packetDescriptions count];
}

- (id)packetDescriptionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_packetDescriptions objectAtIndex:a3];
}

+ (Class)packetDescriptionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRAudioBufferProtobuf;
  id v4 = [(_MRAudioBufferProtobuf *)&v8 description];
  v5 = [(_MRAudioBufferProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  formatSettings = self->_formatSettings;
  if (formatSettings)
  {
    v5 = [(_MRAudioFormatSettingsProtobuf *)formatSettings dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"formatSettings"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v17 = [NSNumber numberWithLongLong:self->_packetCapacity];
    [v3 setObject:v17 forKey:@"packetCapacity"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  v18 = [NSNumber numberWithLongLong:self->_maximumPacketSize];
  [v3 setObject:v18 forKey:@"maximumPacketSize"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    v7 = [NSNumber numberWithLongLong:self->_packetCount];
    [v3 setObject:v7 forKey:@"packetCount"];
  }
LABEL_7:
  contents = self->_contents;
  if (contents) {
    [v3 setObject:contents forKey:@"contents"];
  }
  if ([(NSMutableArray *)self->_packetDescriptions count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_packetDescriptions, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v10 = self->_packetDescriptions;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"packetDescriptions"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAudioBufferProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_formatSettings) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt64Field();
LABEL_7:
  if (self->_contents) {
    PBDataWriterWriteDataField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_packetDescriptions;
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_formatSettings)
  {
    objc_msgSend(v4, "setFormatSettings:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_packetCapacity;
    *((unsigned char *)v4 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 1) = self->_maximumPacketSize;
  *((unsigned char *)v4 + 56) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((void *)v4 + 3) = self->_packetCount;
    *((unsigned char *)v4 + 56) |= 4u;
  }
LABEL_7:
  if (self->_contents) {
    objc_msgSend(v10, "setContents:");
  }
  if ([(_MRAudioBufferProtobuf *)self packetDescriptionsCount])
  {
    [v10 clearPacketDescriptions];
    unint64_t v6 = [(_MRAudioBufferProtobuf *)self packetDescriptionsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(_MRAudioBufferProtobuf *)self packetDescriptionsAtIndex:i];
        [v10 addPacketDescriptions:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRAudioFormatSettingsProtobuf *)self->_formatSettings copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_packetCapacity;
    *(unsigned char *)(v5 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 8) = self->_maximumPacketSize;
  *(unsigned char *)(v5 + 56) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(void *)(v5 + 24) = self->_packetCount;
    *(unsigned char *)(v5 + 56) |= 4u;
  }
LABEL_5:
  uint64_t v9 = [(NSData *)self->_contents copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v11 = self->_packetDescriptions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addPacketDescriptions:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  formatSettings = self->_formatSettings;
  if ((unint64_t)formatSettings | *((void *)v4 + 5))
  {
    if (!-[_MRAudioFormatSettingsProtobuf isEqual:](formatSettings, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_packetCapacity != *((void *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_23:
    char v8 = 0;
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_maximumPacketSize != *((void *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_packetCount != *((void *)v4 + 3)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_23;
  }
  contents = self->_contents;
  if ((unint64_t)contents | *((void *)v4 + 4) && !-[NSData isEqual:](contents, "isEqual:")) {
    goto LABEL_23;
  }
  packetDescriptions = self->_packetDescriptions;
  if ((unint64_t)packetDescriptions | *((void *)v4 + 6)) {
    char v8 = -[NSMutableArray isEqual:](packetDescriptions, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_MRAudioFormatSettingsProtobuf *)self->_formatSettings hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  uint64_t v4 = 2654435761 * self->_packetCapacity;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_maximumPacketSize;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_packetCount;
LABEL_8:
  uint64_t v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSData *)self->_contents hash];
  return v7 ^ [(NSMutableArray *)self->_packetDescriptions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  formatSettings = self->_formatSettings;
  uint64_t v6 = *((void *)v4 + 5);
  if (formatSettings)
  {
    if (v6) {
      -[_MRAudioFormatSettingsProtobuf mergeFrom:](formatSettings, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRAudioBufferProtobuf setFormatSettings:](self, "setFormatSettings:");
  }
  char v7 = *((unsigned char *)v4 + 56);
  if ((v7 & 2) != 0)
  {
    self->_packetCapacity = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 56);
    if ((v7 & 1) == 0)
    {
LABEL_8:
      if ((v7 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 1) == 0)
  {
    goto LABEL_8;
  }
  self->_maximumPacketSize = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
LABEL_9:
    self->_packetCount = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_10:
  if (*((void *)v4 + 4)) {
    -[_MRAudioBufferProtobuf setContents:](self, "setContents:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v4 + 6);
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
        -[_MRAudioBufferProtobuf addPacketDescriptions:](self, "addPacketDescriptions:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (_MRAudioFormatSettingsProtobuf)formatSettings
{
  return self->_formatSettings;
}

- (void)setFormatSettings:(id)a3
{
}

- (int64_t)packetCapacity
{
  return self->_packetCapacity;
}

- (int64_t)maximumPacketSize
{
  return self->_maximumPacketSize;
}

- (int64_t)packetCount
{
  return self->_packetCount;
}

- (NSData)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
}

- (NSMutableArray)packetDescriptions
{
  return self->_packetDescriptions;
}

- (void)setPacketDescriptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetDescriptions, 0);
  objc_storeStrong((id *)&self->_formatSettings, 0);

  objc_storeStrong((id *)&self->_contents, 0);
}

@end