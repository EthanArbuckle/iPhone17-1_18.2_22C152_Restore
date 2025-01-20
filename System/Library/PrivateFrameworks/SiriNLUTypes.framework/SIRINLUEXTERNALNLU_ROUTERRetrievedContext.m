@interface SIRINLUEXTERNALNLU_ROUTERRetrievedContext
- (BOOL)hasType;
- (BOOL)hasTypedValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALNLU_ROUTERTypedValue)typedValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setTypedValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLU_ROUTERRetrievedContext

- (void).cxx_destruct
{
}

- (void)setTypedValue:(id)a3
{
}

- (SIRINLUEXTERNALNLU_ROUTERTypedValue)typedValue
{
  return self->_typedValue;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[6])
  {
    self->_type = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  typedValue = self->_typedValue;
  uint64_t v7 = *((void *)v5 + 2);
  if (typedValue)
  {
    if (v7) {
      -[SIRINLUEXTERNALNLU_ROUTERTypedValue mergeFrom:](typedValue, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[SIRINLUEXTERNALNLU_ROUTERRetrievedContext setTypedValue:](self, "setTypedValue:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_type;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(SIRINLUEXTERNALNLU_ROUTERTypedValue *)self->_typedValue hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_type != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  typedValue = self->_typedValue;
  if ((unint64_t)typedValue | *((void *)v4 + 2)) {
    char v6 = -[SIRINLUEXTERNALNLU_ROUTERTypedValue isEqual:](typedValue, "isEqual:");
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
    *(_DWORD *)(v5 + 8) = self->_type;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  id v7 = [(SIRINLUEXTERNALNLU_ROUTERTypedValue *)self->_typedValue copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_type;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_typedValue)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, "setTypedValue:");
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
  if (self->_typedValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERRetrievedContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int type = self->_type;
    if (type)
    {
      if (type == 50)
      {
        id v5 = @"CONTEXT_TYPE_OTHER";
      }
      else if (type == 1)
      {
        id v5 = @"CONTEXT_TYPE_APP_IN_FOCUS_BUNDLE_ID";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
        id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v5 = @"CONTEXT_TYPE_UNKNOWN";
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  typedValue = self->_typedValue;
  if (typedValue)
  {
    id v7 = [(SIRINLUEXTERNALNLU_ROUTERTypedValue *)typedValue dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"typed_value"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERRetrievedContext;
  id v4 = [(SIRINLUEXTERNALNLU_ROUTERRetrievedContext *)&v8 description];
  id v5 = [(SIRINLUEXTERNALNLU_ROUTERRetrievedContext *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasTypedValue
{
  return self->_typedValue != 0;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CONTEXT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONTEXT_TYPE_APP_IN_FOCUS_BUNDLE_ID"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONTEXT_TYPE_OTHER"])
  {
    int v4 = 50;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 50)
    {
      int v4 = @"CONTEXT_TYPE_OTHER";
    }
    else if (a3 == 1)
    {
      int v4 = @"CONTEXT_TYPE_APP_IN_FOCUS_BUNDLE_ID";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"CONTEXT_TYPE_UNKNOWN";
  }
  return v4;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int type = a3;
}

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 0;
  }
}

@end