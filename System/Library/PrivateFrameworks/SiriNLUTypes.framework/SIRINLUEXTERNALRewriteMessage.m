@interface SIRINLUEXTERNALRewriteMessage
- (BOOL)hasRewriteType;
- (BOOL)hasRewrittenUtterance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)rewrittenUtterance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rewriteTypeAsString:(int)a3;
- (int)StringAsRewriteType:(id)a3;
- (int)rewriteType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRewriteType:(BOOL)a3;
- (void)setRewriteType:(int)a3;
- (void)setRewrittenUtterance:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALRewriteMessage

- (void).cxx_destruct
{
}

- (void)setRewrittenUtterance:(id)a3
{
}

- (NSString)rewrittenUtterance
{
  return self->_rewrittenUtterance;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[6])
  {
    self->_rewriteType = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    v5 = v4;
    -[SIRINLUEXTERNALRewriteMessage setRewrittenUtterance:](self, "setRewrittenUtterance:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_rewriteType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_rewrittenUtterance hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_rewriteType != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  rewrittenUtterance = self->_rewrittenUtterance;
  if ((unint64_t)rewrittenUtterance | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](rewrittenUtterance, "isEqual:");
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
    *(_DWORD *)(v5 + 8) = self->_rewriteType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_rewrittenUtterance copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_rewriteType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_rewrittenUtterance)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, "setRewrittenUtterance:");
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
  if (self->_rewrittenUtterance)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALRewriteMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t rewriteType = self->_rewriteType;
    if (rewriteType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_rewriteType);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = off_1E6578DC8[rewriteType];
    }
    [v3 setObject:v5 forKey:@"rewrite_type"];
  }
  rewrittenUtterance = self->_rewrittenUtterance;
  if (rewrittenUtterance) {
    [v3 setObject:rewrittenUtterance forKey:@"rewritten_utterance"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALRewriteMessage;
  id v4 = [(SIRINLUEXTERNALRewriteMessage *)&v8 description];
  id v5 = [(SIRINLUEXTERNALRewriteMessage *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRewrittenUtterance
{
  return self->_rewrittenUtterance != 0;
}

- (int)StringAsRewriteType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"REWRITE_TYPE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REWRITE_TYPE_AER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REWRITE_TYPE_CBR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REWRITE_TYPE_MRR"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)rewriteTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578DC8[a3];
  }
  return v3;
}

- (BOOL)hasRewriteType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRewriteType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRewriteType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t rewriteType = a3;
}

- (int)rewriteType
{
  if (*(unsigned char *)&self->_has) {
    return self->_rewriteType;
  }
  else {
    return 0;
  }
}

@end