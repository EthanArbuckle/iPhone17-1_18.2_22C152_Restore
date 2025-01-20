@interface NRPBMigrationRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBMigrationRequest

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBMigrationRequest;
  v3 = [(NRPBMigrationRequest *)&v7 description];
  v4 = [(NRPBMigrationRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithBool:self->_shouldCancel];
    [v3 setObject:v4 forKey:@"shouldCancel"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005EDE4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)result + 8) = self->_shouldCancel;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_4;
  }
  BOOL v5 = (v4[12] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0)
    {
LABEL_4:
      BOOL v5 = 0;
      goto LABEL_5;
    }
    if (self->_shouldCancel)
    {
      if (!v4[8]) {
        goto LABEL_4;
      }
    }
    else if (v4[8])
    {
      goto LABEL_4;
    }
    BOOL v5 = 1;
  }
LABEL_5:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_shouldCancel;
  }
  else {
    return 0;
  }
}

@end