@interface NLPOIEntryImpl
- (BOOL)hasCategory;
- (BOOL)hasDomain;
- (BOOL)hasName;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)category;
- (NSString)domain;
- (NSString)name;
- (float)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDomain:(id)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLPOIEntryImpl

- (void)dealloc
{
  [(NLPOIEntryImpl *)self setName:0];
  [(NLPOIEntryImpl *)self setDomain:0];
  [(NLPOIEntryImpl *)self setCategory:0];
  v3.receiver = self;
  v3.super_class = (Class)NLPOIEntryImpl;
  [(NLPOIEntryImpl *)&v3 dealloc];
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (void)setScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NLPOIEntryImpl;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NLPOIEntryImpl description](&v3, sel_description), -[NLPOIEntryImpl dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  domain = self->_domain;
  if (domain) {
    [v5 setObject:domain forKey:@"domain"];
  }
  category = self->_category;
  if (category) {
    [v5 setObject:category forKey:@"category"];
  }
  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v4 = self->_score;
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v4), @"score");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NLPOIEntryImplReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_category) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has)
  {
    v3.n128_u32[0] = LODWORD(self->_score);
    MEMORY[0x1F41471D8](a3, 4, v3);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_name) {
    objc_msgSend(a3, "setName:");
  }
  if (self->_domain) {
    objc_msgSend(a3, "setDomain:");
  }
  if (self->_category) {
    objc_msgSend(a3, "setCategory:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 8) = LODWORD(self->_score);
    *((unsigned char *)a3 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 24) = [(NSString *)self->_name copyWithZone:a3];
  *(void *)(v5 + 16) = [(NSString *)self->_domain copyWithZone:a3];

  *(void *)(v5 + 8) = [(NSString *)self->_category copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(float *)(v5 + 32) = self->_score;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    name = self->_name;
    if (!((unint64_t)name | *((void *)a3 + 3)) || (int v5 = -[NSString isEqual:](name, "isEqual:")) != 0)
    {
      domain = self->_domain;
      if (!((unint64_t)domain | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](domain, "isEqual:")) != 0)
      {
        category = self->_category;
        if (!((unint64_t)category | *((void *)a3 + 1))
          || (int v5 = -[NSString isEqual:](category, "isEqual:")) != 0)
        {
          LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 1) == 0;
          if (*(unsigned char *)&self->_has) {
            LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 1) != 0 && self->_score == *((float *)a3 + 8);
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_domain hash];
  NSUInteger v5 = [(NSString *)self->_category hash];
  if (*(unsigned char *)&self->_has)
  {
    float score = self->_score;
    double v8 = score;
    if (score < 0.0) {
      double v8 = -score;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[NLPOIEntryImpl setName:](self, "setName:");
  }
  if (*((void *)a3 + 2)) {
    -[NLPOIEntryImpl setDomain:](self, "setDomain:");
  }
  if (*((void *)a3 + 1)) {
    -[NLPOIEntryImpl setCategory:](self, "setCategory:");
  }
  if (*((unsigned char *)a3 + 36))
  {
    self->_float score = *((float *)a3 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (float)score
{
  return self->_score;
}

@end