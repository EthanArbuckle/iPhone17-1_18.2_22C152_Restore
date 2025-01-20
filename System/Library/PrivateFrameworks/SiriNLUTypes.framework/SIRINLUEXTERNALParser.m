@interface SIRINLUEXTERNALParser
- (BOOL)hasAlgorithm;
- (BOOL)hasParserId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)algorithmAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)parserIdAsString:(int)a3;
- (int)StringAsAlgorithm:(id)a3;
- (int)StringAsParserId:(id)a3;
- (int)algorithm;
- (int)parserId;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlgorithm:(int)a3;
- (void)setHasAlgorithm:(BOOL)a3;
- (void)setHasParserId:(BOOL)a3;
- (void)setParserId:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALParser

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_algorithm = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_parserId = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_algorithm;
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
  uint64_t v3 = 2654435761 * self->_parserId;
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
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_algorithm != *((_DWORD *)v4 + 2)) {
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
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_parserId != *((_DWORD *)v4 + 3)) {
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
    *((_DWORD *)result + 2) = self->_algorithm;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_parserId;
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
    v4[2] = self->_algorithm;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = self->_parserId;
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
  return SIRINLUEXTERNALParserReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t algorithm = self->_algorithm;
    if (algorithm >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_algorithm);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = off_1E6578C30[algorithm];
    }
    [v3 setObject:v6 forKey:@"algorithm"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t parserId = self->_parserId;
    if (parserId >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_parserId);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E6578C48[parserId];
    }
    [v3 setObject:v8 forKey:@"parser_id"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALParser;
  id v4 = [(SIRINLUEXTERNALParser *)&v8 description];
  BOOL v5 = [(SIRINLUEXTERNALParser *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsParserId:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PARSER_IDENTIFIER_UNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_OVERRIDES"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_SNLC"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_NLV4"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_CATI"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_SHORTCUTS_EXACT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_UAAP"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_PSC"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_LVC"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PARSER_IDENTIFIER_SSU"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)parserIdAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578C48[a3];
  }
  return v3;
}

- (BOOL)hasParserId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasParserId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setParserId:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t parserId = a3;
}

- (int)parserId
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_parserId;
  }
  else {
    return 0;
  }
}

- (int)StringAsAlgorithm:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ALGORITHM_TYPE_UNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ALGORITHM_TYPE_RULE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ALGORITHM_TYPE_MODEL"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)algorithmAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578C30[a3];
  }
  return v3;
}

- (BOOL)hasAlgorithm
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAlgorithm:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAlgorithm:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t algorithm = a3;
}

- (int)algorithm
{
  if (*(unsigned char *)&self->_has) {
    return self->_algorithm;
  }
  else {
    return 0;
  }
}

@end