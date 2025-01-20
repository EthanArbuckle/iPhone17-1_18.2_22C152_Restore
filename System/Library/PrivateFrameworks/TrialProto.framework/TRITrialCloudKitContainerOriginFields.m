@interface TRITrialCloudKitContainerOriginFields
- (BOOL)hasCkContainer;
- (BOOL)hasCkEnvironment;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)ckContainerAsString:(int)a3;
- (id)ckEnvironmentAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCkContainer:(id)a3;
- (int)StringAsCkEnvironment:(id)a3;
- (int)ckContainer;
- (int)ckEnvironment;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCkContainer:(int)a3;
- (void)setCkEnvironment:(int)a3;
- (void)setHasCkContainer:(BOOL)a3;
- (void)setHasCkEnvironment:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRITrialCloudKitContainerOriginFields

- (int)ckEnvironment
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_ckEnvironment;
  }
  else {
    return 0;
  }
}

- (void)setCkEnvironment:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_ckEnvironment = a3;
}

- (void)setHasCkEnvironment:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCkEnvironment
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)ckEnvironmentAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E576B8B0[a3];
  }
  return v3;
}

- (int)StringAsCkEnvironment:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ENVIRONMENT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UAT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PROD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DEVELOPMENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"INTERNAL_TESTING"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)ckContainer
{
  if (*(unsigned char *)&self->_has) {
    return self->_ckContainer;
  }
  else {
    return 0;
  }
}

- (void)setCkContainer:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ckContainer = a3;
}

- (void)setHasCkContainer:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCkContainer
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)ckContainerAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E576B8D8[a3];
  }
  return v3;
}

- (int)StringAsCkContainer:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CONTAINER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYSTEM_DEFAULT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"APPLE_DEVELOPER_PROGRAM"])
  {
    int v4 = 2;
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
  v8.super_class = (Class)TRITrialCloudKitContainerOriginFields;
  int v4 = [(TRITrialCloudKitContainerOriginFields *)&v8 description];
  v5 = [(TRITrialCloudKitContainerOriginFields *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t ckEnvironment = self->_ckEnvironment;
    if (ckEnvironment >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_ckEnvironment);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E576B8B0[ckEnvironment];
    }
    [v3 setObject:v6 forKey:@"ck_environment"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t ckContainer = self->_ckContainer;
    if (ckContainer >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_ckContainer);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E576B8D8[ckContainer];
    }
    [v3 setObject:v8 forKey:@"ck_container"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TRITrialCloudKitContainerOriginFieldsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_ckEnvironment;
    *((unsigned char *)v4 + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[2] = self->_ckContainer;
    *((unsigned char *)v4 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_ckEnvironment;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)result + 2) = self->_ckContainer;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_ckEnvironment != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_ckContainer != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_ckEnvironment;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_ckContainer;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t ckEnvironment = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if (v5)
  {
    self->_uint64_t ckContainer = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end