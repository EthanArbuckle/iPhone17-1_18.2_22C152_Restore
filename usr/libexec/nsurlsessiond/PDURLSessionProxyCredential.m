@interface PDURLSessionProxyCredential
- (BOOL)hasArchiveList;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)archiveList;
- (id)_actualCredential;
- (id)_initWithActualCredential:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArchiveList:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyCredential

- (id)_actualCredential
{
  uint64_t v3 = objc_opt_class();
  v4 = [(PDURLSessionProxyCredential *)self archiveList];
  v5 = +[NSKeyedUnarchiver _nsurlsessionproxy_secureUnarchiveObjectOfClass:v3 withData:v4];

  return v5;
}

- (id)_initWithActualCredential:(id)a3
{
  id v4 = a3;
  v5 = [(PDURLSessionProxyCredential *)self init];
  if (v5)
  {
    v6 = +[NSKeyedArchiver _nsurlsessionproxy_secureArchivedDataWithRootObject:v4];
    [(PDURLSessionProxyCredential *)v5 setArchiveList:v6];
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (void)setArchiveList:(id)a3
{
}

- (NSData)archiveList
{
  return self->_archiveList;
}

- (unsigned)version
{
  return self->_version;
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
    v5 = v4;
    -[PDURLSessionProxyCredential setArchiveList:](self, "setArchiveList:");
    id v4 = v5;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_version;
  }
  else {
    uint64_t v2 = 0;
  }
  return (unint64_t)[(NSData *)self->_archiveList hash] ^ v2;
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
  archiveList = self->_archiveList;
  if ((unint64_t)archiveList | *((void *)v4 + 1)) {
    unsigned __int8 v6 = -[NSData isEqual:](archiveList, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_10:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  unsigned __int8 v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_version;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  id v7 = [(NSData *)self->_archiveList copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_version;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  if (self->_archiveList)
  {
    v5 = v4;
    [v4 setArchiveList:];
    id v4 = v5;
  }
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
  if (self->_archiveList)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004C878((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  archiveList = self->_archiveList;
  if (archiveList) {
    [v3 setObject:archiveList forKey:@"archiveList"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyCredential;
  uint64_t v3 = [(PDURLSessionProxyCredential *)&v7 description];
  id v4 = [(PDURLSessionProxyCredential *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasArchiveList
{
  return self->_archiveList != 0;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

@end