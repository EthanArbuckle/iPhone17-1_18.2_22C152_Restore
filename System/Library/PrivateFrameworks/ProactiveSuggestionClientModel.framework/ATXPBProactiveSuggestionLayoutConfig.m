@interface ATXPBProactiveSuggestionLayoutConfig
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)applicableLayoutTypeAsString:(__CFString *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)StringAsApplicableLayoutType:(uint64_t)a1;
- (uint64_t)applicableLayoutType;
- (uint64_t)hasApplicableLayoutType;
- (uint64_t)setApplicableLayoutType:(uint64_t)result;
- (uint64_t)setHasApplicableLayoutType:(uint64_t)result;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBProactiveSuggestionLayoutConfig

- (uint64_t)applicableLayoutType
{
  if (result)
  {
    if (*(unsigned char *)(result + 12)) {
      return *(unsigned int *)(result + 8);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setApplicableLayoutType:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 12) |= 1u;
    *(_DWORD *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasApplicableLayoutType:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 12) = *(unsigned char *)(result + 12) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasApplicableLayoutType
{
  if (result) {
    return *(unsigned char *)(result + 12) & 1;
  }
  return result;
}

- (__CFString)applicableLayoutTypeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5F00A30[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsApplicableLayoutType:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Unknown"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"_1Row1Column"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"_1Row2Columns"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"_2Rows2Columns"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"_2Rows4Columns"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"_1Row4Columns"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"_4Rows4Columns"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"_4Rows8Columns"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"Max"])
    {
      uint64_t v6 = 8;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBProactiveSuggestionLayoutConfig;
  v4 = [(ATXPBProactiveSuggestionLayoutConfig *)&v8 description];
  id v5 = [(ATXPBProactiveSuggestionLayoutConfig *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t applicableLayoutType = self->_applicableLayoutType;
    if (applicableLayoutType >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_applicableLayoutType);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = off_1E5F00A30[applicableLayoutType];
    }
    [v3 setObject:v5 forKey:@"applicableLayoutType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBProactiveSuggestionLayoutConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && (*(unsigned char *)(a1 + 12) & 1) != 0)
  {
    v3[2] = *(_DWORD *)(a1 + 8);
    *((unsigned char *)v3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_applicableLayoutType;
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
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_applicableLayoutType == *((_DWORD *)v4 + 2))
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
    return 2654435761 * self->_applicableLayoutType;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && (v3[3] & 1) != 0)
  {
    *(_DWORD *)(a1 + 8) = v3[2];
    *(unsigned char *)(a1 + 12) |= 1u;
  }
}

@end