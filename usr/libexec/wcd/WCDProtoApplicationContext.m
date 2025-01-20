@interface WCDProtoApplicationContext
- (BOOL)hasClientData;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)clientData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientData:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WCDProtoApplicationContext

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasClientData
{
  return self->_clientData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)WCDProtoApplicationContext;
  v3 = [(WCDProtoApplicationContext *)&v7 description];
  v4 = [(WCDProtoApplicationContext *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  clientData = self->_clientData;
  if (clientData) {
    [v3 setObject:clientData forKey:@"clientData"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WCDProtoApplicationContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_clientData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_version;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  if (self->_clientData)
  {
    id v5 = v4;
    [v4 setClientData:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_version;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  id v7 = [(NSData *)self->_clientData copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_version != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  clientData = self->_clientData;
  if ((unint64_t)clientData | *((void *)v4 + 1)) {
    unsigned __int8 v6 = -[NSData isEqual:](clientData, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_version;
  }
  else {
    uint64_t v2 = 0;
  }
  return (unint64_t)[(NSData *)self->_clientData hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[5])
  {
    self->_version = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[WCDProtoApplicationContext setClientData:](self, "setClientData:");
    id v4 = v5;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)clientData
{
  return self->_clientData;
}

- (void)setClientData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end