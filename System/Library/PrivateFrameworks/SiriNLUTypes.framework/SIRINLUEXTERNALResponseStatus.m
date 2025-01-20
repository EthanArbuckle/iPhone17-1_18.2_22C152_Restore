@interface SIRINLUEXTERNALResponseStatus
- (BOOL)hasCode;
- (BOOL)hasDescriptionA;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)descriptionA;
- (id)codeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCode:(id)a3;
- (int)code;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int)a3;
- (void)setDescriptionA:(id)a3;
- (void)setHasCode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALResponseStatus

- (void).cxx_destruct
{
}

- (void)setDescriptionA:(id)a3
{
}

- (NSString)descriptionA
{
  return self->_descriptionA;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[6])
  {
    self->_code = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    v5 = v4;
    -[SIRINLUEXTERNALResponseStatus setDescriptionA:](self, "setDescriptionA:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_code;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_descriptionA hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_code != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  descriptionA = self->_descriptionA;
  if ((unint64_t)descriptionA | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](descriptionA, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_code;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_descriptionA copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_code;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_descriptionA)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, "setDescriptionA:");
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
  if (self->_descriptionA)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALResponseStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int code = self->_code;
    if (code <= 299)
    {
      if (code)
      {
        if (code == 100)
        {
          id v5 = @"INPUT";
        }
        else if (code == 101)
        {
          id v5 = @"EMPTY_NLU_REQUEST";
        }
        else
        {
LABEL_16:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_code);
          id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        id v5 = @"SUCCESS";
      }
    }
    else
    {
      switch(code)
      {
        case 300:
          id v5 = @"PROCESSING";
          break;
        case 301:
          id v5 = @"INTERNAL_ERROR";
          break;
        case 302:
          id v5 = @"INITIALISATION_ERROR";
          break;
        case 303:
          id v5 = @"FEATURE_EXTRACTION_ERROR";
          break;
        default:
          if (code != 500) {
            goto LABEL_16;
          }
          id v5 = @"COMMUNICATION";
          break;
      }
    }
    [v3 setObject:v5 forKey:@"code"];
  }
  descriptionA = self->_descriptionA;
  if (descriptionA) {
    [v3 setObject:descriptionA forKey:@"description_a"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALResponseStatus;
  id v4 = [(SIRINLUEXTERNALResponseStatus *)&v8 description];
  id v5 = [(SIRINLUEXTERNALResponseStatus *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasDescriptionA
{
  return self->_descriptionA != 0;
}

- (int)StringAsCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INPUT"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"EMPTY_NLU_REQUEST"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"PROCESSING"])
  {
    int v4 = 300;
  }
  else if ([v3 isEqualToString:@"INTERNAL_ERROR"])
  {
    int v4 = 301;
  }
  else if ([v3 isEqualToString:@"INITIALISATION_ERROR"])
  {
    int v4 = 302;
  }
  else if ([v3 isEqualToString:@"FEATURE_EXTRACTION_ERROR"])
  {
    int v4 = 303;
  }
  else if ([v3 isEqualToString:@"COMMUNICATION"])
  {
    int v4 = 500;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)codeAsString:(int)a3
{
  if (a3 <= 299)
  {
    if (a3)
    {
      if (a3 == 100)
      {
        int v4 = @"INPUT";
      }
      else if (a3 == 101)
      {
        int v4 = @"EMPTY_NLU_REQUEST";
      }
      else
      {
LABEL_31:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      int v4 = @"SUCCESS";
    }
  }
  else
  {
    switch(a3)
    {
      case 300:
        int v4 = @"PROCESSING";
        break;
      case 301:
        int v4 = @"INTERNAL_ERROR";
        break;
      case 302:
        int v4 = @"INITIALISATION_ERROR";
        break;
      case 303:
        int v4 = @"FEATURE_EXTRACTION_ERROR";
        break;
      default:
        if (a3 != 500) {
          goto LABEL_31;
        }
        int v4 = @"COMMUNICATION";
        break;
    }
  }
  return v4;
}

- (BOOL)hasCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int code = a3;
}

- (int)code
{
  if (*(unsigned char *)&self->_has) {
    return self->_code;
  }
  else {
    return 0;
  }
}

@end