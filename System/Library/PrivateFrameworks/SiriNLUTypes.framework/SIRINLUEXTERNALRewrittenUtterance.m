@interface SIRINLUEXTERNALRewrittenUtterance
- (BOOL)hasRewrittenUtterance;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRICOMMONStringValue)rewrittenUtterance;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setRewrittenUtterance:(id)a3;
- (void)setScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALRewrittenUtterance

- (void).cxx_destruct
{
}

- (double)score
{
  return self->_score;
}

- (void)setRewrittenUtterance:(id)a3
{
}

- (SIRICOMMONStringValue)rewrittenUtterance
{
  return self->_rewrittenUtterance;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  rewrittenUtterance = self->_rewrittenUtterance;
  uint64_t v6 = *((void *)v4 + 2);
  if (rewrittenUtterance)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[SIRICOMMONStringValue mergeFrom:](rewrittenUtterance, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[SIRINLUEXTERNALRewrittenUtterance setRewrittenUtterance:](self, "setRewrittenUtterance:");
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 24))
  {
    self->_score = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRICOMMONStringValue *)self->_rewrittenUtterance hash];
  if (*(unsigned char *)&self->_has)
  {
    double score = self->_score;
    double v6 = -score;
    if (score >= 0.0) {
      double v6 = self->_score;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  rewrittenUtterance = self->_rewrittenUtterance;
  if ((unint64_t)rewrittenUtterance | *((void *)v4 + 2))
  {
    if (!-[SIRICOMMONStringValue isEqual:](rewrittenUtterance, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_score == *((double *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRICOMMONStringValue *)self->_rewrittenUtterance copyWithZone:a3];
  long double v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_score;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_rewrittenUtterance)
  {
    id v5 = v4;
    objc_msgSend(v4, "setRewrittenUtterance:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_score;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_rewrittenUtterance)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALRewrittenUtteranceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  rewrittenUtterance = self->_rewrittenUtterance;
  if (rewrittenUtterance)
  {
    id v5 = [(SIRICOMMONStringValue *)rewrittenUtterance dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"rewritten_utterance"];
  }
  if (*(unsigned char *)&self->_has)
  {
    id v6 = [NSNumber numberWithDouble:self->_score];
    [v3 setObject:v6 forKey:@"score"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALRewrittenUtterance;
  id v4 = [(SIRINLUEXTERNALRewrittenUtterance *)&v8 description];
  id v5 = [(SIRINLUEXTERNALRewrittenUtterance *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double score = a3;
}

- (BOOL)hasRewrittenUtterance
{
  return self->_rewrittenUtterance != 0;
}

@end