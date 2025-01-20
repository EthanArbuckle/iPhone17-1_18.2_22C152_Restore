@interface NRPBDevicePropertyDiffType
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setDiff:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation NRPBDevicePropertyDiffType

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NRPBDevicePropertyDiffType;
  v4 = [(NRPBDevicePropertyDiffType *)&v8 description];
  v5 = [(NRPBDevicePropertyDiffType *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t changeType = self->_changeType;
    if (changeType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_changeType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5B01D78[changeType];
    }
    [v3 setObject:v5 forKey:@"changeType"];
  }
  diff = self->_diff;
  if (diff)
  {
    v7 = [(NRPBDevicePropertyDiff *)diff dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"diff"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBDevicePropertyDiffTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_diff)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)setDiff:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_changeType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  id v7 = [(NRPBDevicePropertyDiff *)self->_diff copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

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
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_changeType != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  diff = self->_diff;
  if ((unint64_t)diff | *((void *)v4 + 2)) {
    char v6 = -[NRPBDevicePropertyDiff isEqual:](diff, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_changeType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NRPBDevicePropertyDiff *)self->_diff hash] ^ v2;
}

- (void).cxx_destruct
{
}

@end