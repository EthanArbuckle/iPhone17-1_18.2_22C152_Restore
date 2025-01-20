@interface _MRTransactionPacketProtobuf
+ (void)initialize;
- (BOOL)hasIdentifier;
- (BOOL)hasKey;
- (BOOL)hasPacketData;
- (BOOL)hasTotalLength;
- (BOOL)hasTotalWritePosition;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)packetData;
- (NSString)identifier;
- (_MRTransactionKeyProtobuf)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDictionaryRepresentation;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)totalLength;
- (unint64_t)totalWritePosition;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTotalLength:(BOOL)a3;
- (void)setHasTotalWritePosition:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)setPacketData:(id)a3;
- (void)setTotalLength:(unint64_t)a3;
- (void)setTotalWritePosition:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRTransactionPacketProtobuf

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasPacketData
{
  return self->_packetData != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setTotalLength:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_totalLength = a3;
}

- (void)setHasTotalLength:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTotalLength
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTotalWritePosition:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_totalWritePosition = a3;
}

- (void)setHasTotalWritePosition:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalWritePosition
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRTransactionPacketProtobuf;
  v4 = [(_MRTransactionPacketProtobuf *)&v8 description];
  v5 = [(_MRTransactionPacketProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  key = self->_key;
  if (key)
  {
    v5 = [(_MRTransactionKeyProtobuf *)key dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"key"];
  }
  packetData = self->_packetData;
  if (packetData) {
    [v3 setObject:packetData forKey:@"packetData"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:self->_totalLength];
    [v3 setObject:v9 forKey:@"totalLength"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = [NSNumber numberWithUnsignedLongLong:self->_totalWritePosition];
    [v3 setObject:v10 forKey:@"totalWritePosition"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRTransactionPacketProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_packetData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v6;
  }
  if (self->_packetData)
  {
    objc_msgSend(v6, "setPacketData:");
    id v4 = v6;
  }
  if (self->_identifier)
  {
    objc_msgSend(v6, "setIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_totalLength;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_totalWritePosition;
    *((unsigned char *)v4 + 48) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRTransactionKeyProtobuf *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSData *)self->_packetData copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_identifier copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_totalLength;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_totalWritePosition;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 4))
  {
    if (!-[_MRTransactionKeyProtobuf isEqual:](key, "isEqual:")) {
      goto LABEL_17;
    }
  }
  packetData = self->_packetData;
  if ((unint64_t)packetData | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](packetData, "isEqual:")) {
      goto LABEL_17;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_totalLength != *((void *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  BOOL v8 = (*((unsigned char *)v4 + 48) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_totalWritePosition != *((void *)v4 + 2)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_MRTransactionKeyProtobuf *)self->_key hash];
  uint64_t v4 = [(NSData *)self->_packetData hash];
  NSUInteger v5 = [(NSString *)self->_identifier hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v6 = 2654435761u * self->_totalLength;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v7 = 2654435761u * self->_totalWritePosition;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  key = self->_key;
  uint64_t v6 = v4[4];
  BOOL v8 = v4;
  if (key)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRTransactionKeyProtobuf mergeFrom:](key, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRTransactionPacketProtobuf setKey:](self, "setKey:");
  }
  uint64_t v4 = v8;
LABEL_7:
  if (v4[5])
  {
    -[_MRTransactionPacketProtobuf setPacketData:](self, "setPacketData:");
    uint64_t v4 = v8;
  }
  if (v4[3])
  {
    -[_MRTransactionPacketProtobuf setIdentifier:](self, "setIdentifier:");
    uint64_t v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 48);
  if (v7)
  {
    self->_totalLength = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 48);
  }
  if ((v7 & 2) != 0)
  {
    self->_totalWritePosition = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }

  MEMORY[0x1F41817F8]();
}

- (_MRTransactionKeyProtobuf)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSData)packetData
{
  return self->_packetData;
}

- (void)setPacketData:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)totalLength
{
  return self->_totalLength;
}

- (unint64_t)totalWritePosition
{
  return self->_totalWritePosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetData, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (objc_class *)objc_opt_class();
    MRClassSwizzleMethod(v2, sel_dictionaryRepresentation, sel_customDictionaryRepresentation);
  }
}

- (id)customDictionaryRepresentation
{
  unint64_t v3 = [(_MRTransactionPacketProtobuf *)self customDictionaryRepresentation];
  uint64_t v4 = (void *)[v3 mutableCopy];

  NSUInteger v5 = [(_MRTransactionPacketProtobuf *)self packetData];

  if (v5)
  {
    uint64_t v6 = [(_MRTransactionPacketProtobuf *)self packetData];
    StringRepresentation = (void *)MRDataCreateStringRepresentation(v6);

    [v4 setObject:StringRepresentation forKey:@"packetData"];
  }

  return v4;
}

@end