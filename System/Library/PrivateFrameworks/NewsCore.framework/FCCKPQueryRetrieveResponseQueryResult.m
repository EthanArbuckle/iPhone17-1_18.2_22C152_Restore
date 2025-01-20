@interface FCCKPQueryRetrieveResponseQueryResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPQueryRetrieveResponseQueryResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPQueryRetrieveResponseQueryResult;
  v4 = [(FCCKPQueryRetrieveResponseQueryResult *)&v8 description];
  v5 = [(FCCKPQueryRetrieveResponseQueryResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  identifier = self->_identifier;
  if (identifier)
  {
    v5 = [(FCCKPRecordIdentifier *)identifier dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"identifier"];
  }
  etag = self->_etag;
  if (etag) {
    [v3 setObject:etag forKey:@"etag"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithInt:self->_type];
    [v3 setObject:v7 forKey:@"type"];
  }
  record = self->_record;
  if (record)
  {
    v9 = [(FCCKPRecord *)record dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"record"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPQueryRetrieveResponseQueryResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_record)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(FCCKPRecordIdentifier *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_etag copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  id v10 = [(FCCKPRecord *)self->_record copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 2))
  {
    if (!-[FCCKPRecordIdentifier isEqual:](identifier, "isEqual:")) {
      goto LABEL_13;
    }
  }
  etag = self->_etag;
  if ((unint64_t)etag | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](etag, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  record = self->_record;
  if ((unint64_t)record | *((void *)v4 + 3)) {
    char v8 = -[FCCKPRecord isEqual:](record, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FCCKPRecordIdentifier *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_etag hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_type;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(FCCKPRecord *)self->_record hash];
}

@end