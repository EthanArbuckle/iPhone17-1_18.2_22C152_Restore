@interface PAPBLocationAccess
- (BOOL)hasAccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PAPBAccess)access;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAccess:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PAPBLocationAccess

- (BOOL)hasAccess
{
  return self->_access != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PAPBLocationAccess;
  v4 = [(PAPBLocationAccess *)&v8 description];
  v5 = [(PAPBLocationAccess *)self dictionaryRepresentation];
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

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PAPBLocationAccessReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_access) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PAPBAccess *)self->_access copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    access = self->_access;
    if ((unint64_t)access | v4[1]) {
      char v6 = -[PAPBAccess isEqual:](access, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(PAPBAccess *)self->_access hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  access = self->_access;
  uint64_t v6 = v4[1];
  if (access)
  {
    if (v6) {
      -[PAPBAccess mergeFrom:](access, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PAPBLocationAccess setAccess:](self, "setAccess:");
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

- (void).cxx_destruct
{
}

@end