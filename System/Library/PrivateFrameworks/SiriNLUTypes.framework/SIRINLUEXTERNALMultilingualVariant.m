@interface SIRINLUEXTERNALMultilingualVariant
- (BOOL)hasLanguageVariantName;
- (BOOL)hasLanguageVariantScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)languageVariantName;
- (double)languageVariantScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLanguageVariantScore:(BOOL)a3;
- (void)setLanguageVariantName:(id)a3;
- (void)setLanguageVariantScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALMultilingualVariant

- (void).cxx_destruct
{
}

- (double)languageVariantScore
{
  return self->_languageVariantScore;
}

- (void)setLanguageVariantName:(id)a3
{
}

- (NSString)languageVariantName
{
  return self->_languageVariantName;
}

- (void)mergeFrom:(id)a3
{
  v4 = (double *)a3;
  if (*((void *)v4 + 2))
  {
    v5 = v4;
    -[SIRINLUEXTERNALMultilingualVariant setLanguageVariantName:](self, "setLanguageVariantName:");
    v4 = v5;
  }
  if ((_BYTE)v4[3])
  {
    self->_languageVariantScore = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_languageVariantName hash];
  if (*(unsigned char *)&self->_has)
  {
    double languageVariantScore = self->_languageVariantScore;
    double v6 = -languageVariantScore;
    if (languageVariantScore >= 0.0) {
      double v6 = self->_languageVariantScore;
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
  languageVariantName = self->_languageVariantName;
  if ((unint64_t)languageVariantName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](languageVariantName, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_languageVariantScore == *((double *)v4 + 1))
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
  uint64_t v6 = [(NSString *)self->_languageVariantName copyWithZone:a3];
  long double v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_languageVariantScore;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_languageVariantName)
  {
    id v5 = v4;
    objc_msgSend(v4, "setLanguageVariantName:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_languageVariantScore;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_languageVariantName)
  {
    PBDataWriterWriteStringField();
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
  return SIRINLUEXTERNALMultilingualVariantReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  languageVariantName = self->_languageVariantName;
  if (languageVariantName) {
    [v3 setObject:languageVariantName forKey:@"language_variant_name"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = [NSNumber numberWithDouble:self->_languageVariantScore];
    [v4 setObject:v6 forKey:@"language_variant_score"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALMultilingualVariant;
  id v4 = [(SIRINLUEXTERNALMultilingualVariant *)&v8 description];
  id v5 = [(SIRINLUEXTERNALMultilingualVariant *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasLanguageVariantScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasLanguageVariantScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setLanguageVariantScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double languageVariantScore = a3;
}

- (BOOL)hasLanguageVariantName
{
  return self->_languageVariantName != 0;
}

@end