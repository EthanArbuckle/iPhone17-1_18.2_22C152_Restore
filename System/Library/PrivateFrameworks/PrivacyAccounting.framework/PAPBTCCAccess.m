@interface PAPBTCCAccess
- (BOOL)hasAccess;
- (BOOL)hasTccService;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)tccService;
- (PAPBAccess)access;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAccess:(id)a3;
- (void)setTccService:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PAPBTCCAccess

- (BOOL)hasAccess
{
  return self->_access != 0;
}

- (BOOL)hasTccService
{
  return self->_tccService != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PAPBTCCAccess;
  v4 = [(PAPBTCCAccess *)&v8 description];
  v5 = [(PAPBTCCAccess *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  access = self->_access;
  if (access)
  {
    v5 = [(PAPBAccess *)access dictionaryRepresentation];
    [v3 setObject:v5 forKeyedSubscript:@"access"];
  }
  tccService = self->_tccService;
  if (tccService) {
    [v3 setObject:tccService forKeyedSubscript:@"tccService"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PAPBTCCAccessReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_access)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tccService)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PAPBAccess *)self->_access copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_tccService copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((access = self->_access, !((unint64_t)access | v4[1])) || -[PAPBAccess isEqual:](access, "isEqual:")))
  {
    tccService = self->_tccService;
    if ((unint64_t)tccService | v4[2]) {
      char v7 = -[NSString isEqual:](tccService, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PAPBAccess *)self->_access hash];
  return [(NSString *)self->_tccService hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  access = self->_access;
  uint64_t v6 = v4[1];
  char v7 = v4;
  if (access)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PAPBAccess mergeFrom:](access, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PAPBTCCAccess setAccess:](self, "setAccess:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[2]) {
    -[PAPBTCCAccess setTccService:](self, "setTccService:");
  }

  MEMORY[0x1F41817F8]();
}

- (PAPBAccess)access
{
  return self->_access;
}

- (void)setAccess:(id)a3
{
}

- (NSString)tccService
{
  return self->_tccService;
}

- (void)setTccService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccService, 0);

  objc_storeStrong((id *)&self->_access, 0);
}

@end