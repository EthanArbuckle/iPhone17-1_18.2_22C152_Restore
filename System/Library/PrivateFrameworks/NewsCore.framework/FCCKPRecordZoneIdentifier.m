@interface FCCKPRecordZoneIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(uint64_t)a1;
- (void)setOwnerIdentifier:(uint64_t)a1;
- (void)setValue:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPRecordZoneIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_ownerIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)setValue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setOwnerIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPRecordZoneIdentifier;
  id v4 = [(FCCKPRecordZoneIdentifier *)&v8 description];
  id v5 = [(FCCKPRecordZoneIdentifier *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  value = self->_value;
  if (value)
  {
    id v5 = [(FCCKPIdentifier *)value dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"value"];
  }
  ownerIdentifier = self->_ownerIdentifier;
  if (ownerIdentifier)
  {
    v7 = [(FCCKPIdentifier *)ownerIdentifier dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"ownerIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRecordZoneIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(FCCKPIdentifier *)self->_value copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(FCCKPIdentifier *)self->_ownerIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((value = self->_value, !((unint64_t)value | v4[2])) || -[FCCKPIdentifier isEqual:](value, "isEqual:")))
  {
    ownerIdentifier = self->_ownerIdentifier;
    if ((unint64_t)ownerIdentifier | v4[1]) {
      char v7 = -[FCCKPIdentifier isEqual:](ownerIdentifier, "isEqual:");
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
  unint64_t v3 = [(FCCKPIdentifier *)self->_value hash];
  return [(FCCKPIdentifier *)self->_ownerIdentifier hash] ^ v3;
}

- (void)mergeFrom:(uint64_t)a1
{
  unint64_t v3 = a2;
  if (!a1) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)(a1 + 16);
  id v5 = (void *)v3[2];
  char v7 = v3;
  if (v4)
  {
    if (v5)
    {
      -[FCCKPIdentifier mergeFrom:](v4, v5);
LABEL_7:
      unint64_t v3 = v7;
    }
  }
  else if (v5)
  {
    objc_storeStrong((id *)(a1 + 16), v5);
    goto LABEL_7;
  }
  id v6 = (void *)v3[1];
  if (*(void *)(a1 + 8))
  {
    if (!v6) {
      goto LABEL_14;
    }
    -[FCCKPIdentifier mergeFrom:](*(void *)(a1 + 8), v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_14;
    }
    objc_storeStrong((id *)(a1 + 8), v6);
  }
  unint64_t v3 = v7;
LABEL_14:
}

@end