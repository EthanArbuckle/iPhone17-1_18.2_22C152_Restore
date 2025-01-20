@interface PKProtobufPaymentMethod
- (BOOL)hasDisplayName;
- (BOOL)hasNetwork;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)displayName;
- (NSString)network;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setNetwork:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentMethod

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasNetwork
{
  return self->_network != 0;
}

- (void)setType:(unsigned int)a3
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

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentMethod;
  v4 = [(PKProtobufPaymentMethod *)&v8 description];
  v5 = [(PKProtobufPaymentMethod *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  displayName = self->_displayName;
  if (displayName) {
    [v3 setObject:displayName forKey:@"displayName"];
  }
  network = self->_network;
  if (network) {
    [v4 setObject:network forKey:@"network"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_type];
    [v4 setObject:v7 forKey:@"type"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentMethodReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_network)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_displayName)
  {
    objc_msgSend(v4, "setDisplayName:");
    id v4 = v5;
  }
  if (self->_network)
  {
    objc_msgSend(v5, "setNetwork:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_type;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_displayName copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_network copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_type;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_10;
    }
  }
  network = self->_network;
  if ((unint64_t)network | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](network, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_type == *((_DWORD *)v4 + 6))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_displayName hash];
  NSUInteger v4 = [(NSString *)self->_network hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_type;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unsigned int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[PKProtobufPaymentMethod setDisplayName:](self, "setDisplayName:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[PKProtobufPaymentMethod setNetwork:](self, "setNetwork:");
    NSUInteger v4 = v5;
  }
  if (v4[7])
  {
    self->_type = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (unsigned)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end