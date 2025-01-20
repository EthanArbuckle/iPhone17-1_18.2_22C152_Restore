@interface TRITrialAssetPurgeFields
+ (int)assetPurgeFieldsPurgeabilityLevelFromPurgeabilityLevel:(int)a3;
- (BOOL)hasPurgeabilityLevel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)purgeabilityLevelAsString:(int)a3;
- (int)StringAsPurgeabilityLevel:(id)a3;
- (int)purgeabilityLevel;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPurgeabilityLevel:(BOOL)a3;
- (void)setPurgeabilityLevel:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRITrialAssetPurgeFields

- (int)purgeabilityLevel
{
  if (*(unsigned char *)&self->_has) {
    return self->_purgeabilityLevel;
  }
  else {
    return 0;
  }
}

- (void)setPurgeabilityLevel:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_purgeabilityLevel = a3;
}

- (void)setHasPurgeabilityLevel:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPurgeabilityLevel
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)purgeabilityLevelAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E576BFD0[a3];
  }
  return v3;
}

- (int)StringAsPurgeabilityLevel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PURGEABILITY_LEVEL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOW_DISK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CRITICAL_LOW_DISK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SOFTWARE_UPGRADE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NEVER"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRITrialAssetPurgeFields;
  int v4 = [(TRITrialAssetPurgeFields *)&v8 description];
  v5 = [(TRITrialAssetPurgeFields *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t purgeabilityLevel = self->_purgeabilityLevel;
    if (purgeabilityLevel >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_purgeabilityLevel);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E576BFD0[purgeabilityLevel];
    }
    [v3 setObject:v5 forKey:@"purgeability_level"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TRITrialAssetPurgeFieldsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_purgeabilityLevel;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_purgeabilityLevel;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_purgeabilityLevel == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_purgeabilityLevel;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_uint64_t purgeabilityLevel = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

+ (int)assetPurgeFieldsPurgeabilityLevelFromPurgeabilityLevel:(int)a3
{
  if (a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

@end