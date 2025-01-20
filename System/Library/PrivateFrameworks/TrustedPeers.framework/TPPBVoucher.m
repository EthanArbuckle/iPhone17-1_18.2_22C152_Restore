@interface TPPBVoucher
- (BOOL)hasBeneficiary;
- (BOOL)hasReason;
- (BOOL)hasSponsor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)beneficiary;
- (NSString)sponsor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)reasonAsString:(int)a3;
- (int)StringAsReason:(id)a3;
- (int)reason;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBeneficiary:(id)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)setSponsor:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBVoucher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sponsor, 0);
  objc_storeStrong((id *)&self->_beneficiary, 0);
}

- (void)setSponsor:(id)a3
{
}

- (NSString)sponsor
{
  return self->_sponsor;
}

- (void)setBeneficiary:(id)a3
{
}

- (NSString)beneficiary
{
  return self->_beneficiary;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[8])
  {
    self->_reason = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[TPPBVoucher setBeneficiary:](self, "setBeneficiary:");
    v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[TPPBVoucher setSponsor:](self, "setSponsor:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_reason;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_beneficiary hash] ^ v3;
  return v4 ^ [(NSString *)self->_sponsor hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_reason != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  beneficiary = self->_beneficiary;
  if ((unint64_t)beneficiary | *((void *)v4 + 1)
    && !-[NSString isEqual:](beneficiary, "isEqual:"))
  {
    goto LABEL_11;
  }
  sponsor = self->_sponsor;
  if ((unint64_t)sponsor | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](sponsor, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_reason;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_beneficiary copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSString *)self->_sponsor copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_reason;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_beneficiary)
  {
    objc_msgSend(v4, "setBeneficiary:");
    id v4 = v5;
  }
  if (self->_sponsor)
  {
    objc_msgSend(v5, "setSponsor:");
    id v4 = v5;
  }
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
  if (self->_beneficiary)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sponsor)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBVoucherReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t reason = self->_reason;
    if (reason >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_reason);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = off_2640ECA40[reason];
    }
    [v3 setObject:v5 forKey:@"reason"];
  }
  beneficiary = self->_beneficiary;
  if (beneficiary) {
    [v3 setObject:beneficiary forKey:@"beneficiary"];
  }
  sponsor = self->_sponsor;
  if (sponsor) {
    [v3 setObject:sponsor forKey:@"sponsor"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBVoucher;
  id v4 = [(TPPBVoucher *)&v8 description];
  id v5 = [(TPPBVoucher *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSponsor
{
  return self->_sponsor != 0;
}

- (BOOL)hasBeneficiary
{
  return self->_beneficiary != 0;
}

- (int)StringAsReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESTORE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SAME_DEVICE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SOS_UPGRADE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SECURE_CHANNEL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RECOVERY_KEY"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)reasonAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_2640ECA40[a3];
  }
  return v3;
}

- (BOOL)hasReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t reason = a3;
}

- (int)reason
{
  if (*(unsigned char *)&self->_has) {
    return self->_reason;
  }
  else {
    return 0;
  }
}

@end