@interface TPPBPolicyProhibits
- (BOOL)hasCandidateCategory;
- (BOOL)hasExplanation;
- (BOOL)hasPolicyVersion;
- (BOOL)hasSponsorCategory;
- (BOOL)hasSponsorId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)candidateCategory;
- (NSString)explanation;
- (NSString)sponsorCategory;
- (NSString)sponsorId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)policyVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCandidateCategory:(id)a3;
- (void)setExplanation:(id)a3;
- (void)setHasPolicyVersion:(BOOL)a3;
- (void)setPolicyVersion:(unint64_t)a3;
- (void)setSponsorCategory:(id)a3;
- (void)setSponsorId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyProhibits

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sponsorId, 0);
  objc_storeStrong((id *)&self->_sponsorCategory, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_candidateCategory, 0);
}

- (void)setExplanation:(id)a3
{
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setCandidateCategory:(id)a3
{
}

- (NSString)candidateCategory
{
  return self->_candidateCategory;
}

- (void)setSponsorCategory:(id)a3
{
}

- (NSString)sponsorCategory
{
  return self->_sponsorCategory;
}

- (void)setSponsorId:(id)a3
{
}

- (NSString)sponsorId
{
  return self->_sponsorId;
}

- (unint64_t)policyVersion
{
  return self->_policyVersion;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[6])
  {
    self->_policyVersion = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  v5 = v4;
  if (v4[5])
  {
    -[TPPBPolicyProhibits setSponsorId:](self, "setSponsorId:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[TPPBPolicyProhibits setSponsorCategory:](self, "setSponsorCategory:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[TPPBPolicyProhibits setCandidateCategory:](self, "setCandidateCategory:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[TPPBPolicyProhibits setExplanation:](self, "setExplanation:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_policyVersion;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_sponsorId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_sponsorCategory hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_candidateCategory hash];
  return v6 ^ [(NSString *)self->_explanation hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_policyVersion != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  sponsorId = self->_sponsorId;
  if ((unint64_t)sponsorId | *((void *)v4 + 5) && !-[NSString isEqual:](sponsorId, "isEqual:")) {
    goto LABEL_15;
  }
  sponsorCategory = self->_sponsorCategory;
  if ((unint64_t)sponsorCategory | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sponsorCategory, "isEqual:")) {
      goto LABEL_15;
    }
  }
  candidateCategory = self->_candidateCategory;
  if ((unint64_t)candidateCategory | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](candidateCategory, "isEqual:")) {
      goto LABEL_15;
    }
  }
  explanation = self->_explanation;
  if ((unint64_t)explanation | *((void *)v4 + 3)) {
    char v9 = -[NSString isEqual:](explanation, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  NSUInteger v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_policyVersion;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_sponsorId copyWithZone:a3];
  v8 = (void *)v6[5];
  v6[5] = v7;

  uint64_t v9 = [(NSString *)self->_sponsorCategory copyWithZone:a3];
  v10 = (void *)v6[4];
  v6[4] = v9;

  uint64_t v11 = [(NSString *)self->_candidateCategory copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  uint64_t v13 = [(NSString *)self->_explanation copyWithZone:a3];
  v14 = (void *)v6[3];
  v6[3] = v13;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_policyVersion;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_sponsorId)
  {
    objc_msgSend(v4, "setSponsorId:");
    id v4 = v5;
  }
  if (self->_sponsorCategory)
  {
    objc_msgSend(v5, "setSponsorCategory:");
    id v4 = v5;
  }
  if (self->_candidateCategory)
  {
    objc_msgSend(v5, "setCandidateCategory:");
    id v4 = v5;
  }
  if (self->_explanation)
  {
    objc_msgSend(v5, "setExplanation:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_sponsorId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sponsorCategory)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_candidateCategory)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_explanation)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyProhibitsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_policyVersion];
    [v3 setObject:v4 forKey:@"policy_version"];
  }
  sponsorId = self->_sponsorId;
  if (sponsorId) {
    [v3 setObject:sponsorId forKey:@"sponsor_id"];
  }
  sponsorCategory = self->_sponsorCategory;
  if (sponsorCategory) {
    [v3 setObject:sponsorCategory forKey:@"sponsor_category"];
  }
  candidateCategory = self->_candidateCategory;
  if (candidateCategory) {
    [v3 setObject:candidateCategory forKey:@"candidate_category"];
  }
  explanation = self->_explanation;
  if (explanation) {
    [v3 setObject:explanation forKey:@"explanation"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBPolicyProhibits;
  id v4 = [(TPPBPolicyProhibits *)&v8 description];
  id v5 = [(TPPBPolicyProhibits *)self dictionaryRepresentation];
  NSUInteger v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasExplanation
{
  return self->_explanation != 0;
}

- (BOOL)hasCandidateCategory
{
  return self->_candidateCategory != 0;
}

- (BOOL)hasSponsorCategory
{
  return self->_sponsorCategory != 0;
}

- (BOOL)hasSponsorId
{
  return self->_sponsorId != 0;
}

- (BOOL)hasPolicyVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasPolicyVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setPolicyVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_policyVersion = a3;
}

@end