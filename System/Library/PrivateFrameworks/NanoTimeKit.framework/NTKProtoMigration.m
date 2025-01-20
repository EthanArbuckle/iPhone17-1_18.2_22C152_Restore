@interface NTKProtoMigration
- (BOOL)hasFrom;
- (BOOL)hasTo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)from;
- (NSString)to;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFrom:(id)a3;
- (void)setTo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTKProtoMigration

- (BOOL)hasFrom
{
  return self->_from != 0;
}

- (BOOL)hasTo
{
  return self->_to != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTKProtoMigration;
  v4 = [(NTKProtoMigration *)&v8 description];
  v5 = [(NTKProtoMigration *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  from = self->_from;
  if (from) {
    [v3 setObject:from forKey:@"from"];
  }
  to = self->_to;
  if (to) {
    [v4 setObject:to forKey:@"to"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTKProtoMigrationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_from)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_to)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_from)
  {
    objc_msgSend(v4, "setFrom:");
    id v4 = v5;
  }
  if (self->_to)
  {
    objc_msgSend(v5, "setTo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_from copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_to copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((from = self->_from, !((unint64_t)from | v4[1])) || -[NSString isEqual:](from, "isEqual:")))
  {
    to = self->_to;
    if ((unint64_t)to | v4[2]) {
      char v7 = -[NSString isEqual:](to, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_from hash];
  return [(NSString *)self->_to hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[NTKProtoMigration setFrom:](self, "setFrom:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[NTKProtoMigration setTo:](self, "setTo:");
    id v4 = v5;
  }
}

- (NSString)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
}

- (NSString)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
}

@end