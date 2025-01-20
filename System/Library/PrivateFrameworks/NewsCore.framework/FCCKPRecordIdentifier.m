@interface FCCKPRecordIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(uint64_t)a1;
- (void)setValue:(uint64_t)a1;
- (void)setZoneIdentifier:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPRecordIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_value, 0);
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
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)setZoneIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setValue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPRecordIdentifier;
  id v4 = [(FCCKPRecordIdentifier *)&v8 description];
  id v5 = [(FCCKPRecordIdentifier *)self dictionaryRepresentation];
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
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    v7 = [(FCCKPRecordZoneIdentifier *)zoneIdentifier dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"zoneIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRecordIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(FCCKPIdentifier *)self->_value copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(FCCKPRecordZoneIdentifier *)self->_zoneIdentifier copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((value = self->_value, !((unint64_t)value | v4[1])) || -[FCCKPIdentifier isEqual:](value, "isEqual:")))
  {
    zoneIdentifier = self->_zoneIdentifier;
    if ((unint64_t)zoneIdentifier | v4[2]) {
      char v7 = -[FCCKPRecordZoneIdentifier isEqual:](zoneIdentifier, "isEqual:");
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
  return [(FCCKPRecordZoneIdentifier *)self->_zoneIdentifier hash] ^ v3;
}

- (void)mergeFrom:(uint64_t)a1
{
  unint64_t v3 = a2;
  if (!a1) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)(a1 + 8);
  id v5 = (void *)v3[1];
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
    objc_storeStrong((id *)(a1 + 8), v5);
    goto LABEL_7;
  }
  id v6 = (void *)v3[2];
  if (*(void *)(a1 + 16))
  {
    if (!v6) {
      goto LABEL_14;
    }
    -[FCCKPRecordZoneIdentifier mergeFrom:](*(void *)(a1 + 16), v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_14;
    }
    objc_storeStrong((id *)(a1 + 16), v6);
  }
  unint64_t v3 = v7;
LABEL_14:
}

@end