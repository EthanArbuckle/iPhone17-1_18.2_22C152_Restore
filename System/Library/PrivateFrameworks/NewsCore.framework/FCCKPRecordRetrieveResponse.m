@interface FCCKPRecordRetrieveResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPRecordRetrieveResponse

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPRecordRetrieveResponse;
  v4 = [(FCCKPRecordRetrieveResponse *)&v8 description];
  v5 = [(FCCKPRecordRetrieveResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  record = self->_record;
  if (record)
  {
    v5 = [(FCCKPRecord *)record dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"record"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_clientVersionETagMatch];
    [v3 setObject:v6 forKey:@"clientVersionETagMatch"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRecordRetrieveResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_record)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(FCCKPRecord *)self->_record copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_clientVersionETagMatch;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  record = self->_record;
  if ((unint64_t)record | *((void *)v4 + 1))
  {
    if (!-[FCCKPRecord isEqual:](record, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_clientVersionETagMatch)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FCCKPRecord *)self->_record hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_clientVersionETagMatch;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

@end