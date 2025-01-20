@interface NGMPBInnerMessage
- (BOOL)hasCounter;
- (BOOL)hasDebugInfo;
- (BOOL)hasKtGossipData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)debugInfo;
- (NSData)ktGossipData;
- (NSData)message;
- (id)attributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)counter;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCounter:(unsigned int)a3;
- (void)setDebugInfo:(id)a3;
- (void)setHasCounter:(BOOL)a3;
- (void)setKtGossipData:(id)a3;
- (void)setMessage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NGMPBInnerMessage

- (id)attributes
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NGMPBInnerMessage *)self hasKtGossipData])
  {
    v4 = [(NGMPBInnerMessage *)self ktGossipData];
    [v3 setObject:v4 forKeyedSubscript:NGMEncryptedAttributeKTGossipData];
  }
  return v3;
}

- (void)setCounter:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_counter = a3;
}

- (void)setHasCounter:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCounter
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasKtGossipData
{
  return self->_ktGossipData != 0;
}

- (BOOL)hasDebugInfo
{
  return self->_debugInfo != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NGMPBInnerMessage;
  v4 = [(NGMPBInnerMessage *)&v8 description];
  v5 = [(NGMPBInnerMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  message = self->_message;
  if (message) {
    [v3 setObject:message forKey:@"message"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_counter];
    [v4 setObject:v6 forKey:@"counter"];
  }
  ktGossipData = self->_ktGossipData;
  if (ktGossipData) {
    [v4 setObject:ktGossipData forKey:@"ktGossipData"];
  }
  debugInfo = self->_debugInfo;
  if (debugInfo) {
    [v4 setObject:debugInfo forKey:@"debugInfo"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBInnerMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_message) {
    -[NGMPBInnerMessage writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteDataField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_ktGossipData) {
    PBDataWriterWriteDataField();
  }
  v5 = v6;
  if (self->_debugInfo)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setMessage:self->_message];
  id v4 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_counter;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  if (self->_ktGossipData)
  {
    objc_msgSend(v5, "setKtGossipData:");
    id v4 = v5;
  }
  if (self->_debugInfo)
  {
    objc_msgSend(v5, "setDebugInfo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_message copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_counter;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v8 = [(NSData *)self->_ktGossipData copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSData *)self->_debugInfo copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  message = self->_message;
  if ((unint64_t)message | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](message, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_counter != *((_DWORD *)v4 + 2)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  ktGossipData = self->_ktGossipData;
  if ((unint64_t)ktGossipData | *((void *)v4 + 3)
    && !-[NSData isEqual:](ktGossipData, "isEqual:"))
  {
    goto LABEL_13;
  }
  debugInfo = self->_debugInfo;
  if ((unint64_t)debugInfo | *((void *)v4 + 2)) {
    char v8 = -[NSData isEqual:](debugInfo, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_message hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_counter;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSData *)self->_ktGossipData hash];
  return v5 ^ v6 ^ [(NSData *)self->_debugInfo hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[NGMPBInnerMessage setMessage:](self, "setMessage:");
    uint64_t v4 = v5;
  }
  if (v4[10])
  {
    self->_counter = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[NGMPBInnerMessage setKtGossipData:](self, "setKtGossipData:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NGMPBInnerMessage setDebugInfo:](self, "setDebugInfo:");
    uint64_t v4 = v5;
  }
}

- (NSData)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (unsigned)counter
{
  return self->_counter;
}

- (NSData)ktGossipData
{
  return self->_ktGossipData;
}

- (void)setKtGossipData:(id)a3
{
}

- (NSData)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_ktGossipData, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NGMPBInnerMessage writeTo:]", "NGMPBInnerMessage.m", 126, "nil != self->_message");
}

@end