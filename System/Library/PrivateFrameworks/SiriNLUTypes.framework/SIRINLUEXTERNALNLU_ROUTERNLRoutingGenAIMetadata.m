@interface SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata
- (BOOL)hasPrescribedTool;
- (BOOL)hasQueryType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)prescribedToolAsString:(int)a3;
- (id)queryTypeAsString:(int)a3;
- (int)StringAsPrescribedTool:(id)a3;
- (int)StringAsQueryType:(id)a3;
- (int)prescribedTool;
- (int)queryType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPrescribedTool:(BOOL)a3;
- (void)setHasQueryType:(BOOL)a3;
- (void)setPrescribedTool:(int)a3;
- (void)setQueryType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_prescribedTool = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_queryType = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_prescribedTool;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_queryType;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_prescribedTool != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_queryType != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_prescribedTool;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_queryType;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_prescribedTool;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = self->_queryType;
    *((unsigned char *)v4 + 16) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t prescribedTool = self->_prescribedTool;
    if (prescribedTool >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_prescribedTool);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = off_1E6578AD8[prescribedTool];
    }
    [v3 setObject:v6 forKey:@"prescribed_tool"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t queryType = self->_queryType;
    if (queryType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_queryType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E6578B00[queryType];
    }
    [v3 setObject:v8 forKey:@"query_type"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata;
  id v4 = [(SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata *)&v8 description];
  BOOL v5 = [(SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsQueryType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"QUERY_TYPE_UNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"QUERY_TYPE_IMPLICIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"QUERY_TYPE_EXPLICIT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)queryTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578B00[a3];
  }
  return v3;
}

- (BOOL)hasQueryType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasQueryType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setQueryType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t queryType = a3;
}

- (int)queryType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_queryType;
  }
  else {
    return 0;
  }
}

- (int)StringAsPrescribedTool:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PRESCRIBED_TOOL_UNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PRESCRIBED_TOOL_GENERATE_RICH_CONTENT_TOOL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PRESCRIBED_TOOL_GENERATE_RICH_CONTENT_FROM_MEDIA_INTENT_TOOL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PRESCRIBED_TOOL_GENERATE_IMAGE_INTENT_TOOL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PRESCRIBED_TOOL_GENERATE_KNOWLEDGE_RESPONSE_INTENT_TOOL"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)prescribedToolAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578AD8[a3];
  }
  return v3;
}

- (BOOL)hasPrescribedTool
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasPrescribedTool:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setPrescribedTool:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t prescribedTool = a3;
}

- (int)prescribedTool
{
  if (*(unsigned char *)&self->_has) {
    return self->_prescribedTool;
  }
  else {
    return 0;
  }
}

@end