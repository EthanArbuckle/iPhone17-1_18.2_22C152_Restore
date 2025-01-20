@interface APPBAdSpecification
+ (id)options;
- (BOOL)hasSection;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)section;
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
- (void)setSection:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAdSpecification

+ (id)options
{
  if (qword_100289768 != -1) {
    dispatch_once(&qword_100289768, &stru_100234D00);
  }
  v2 = (void *)qword_100289760;

  return v2;
}

- (BOOL)hasSection
{
  return self->_section != 0;
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

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if a3 < 0xC && ((0xF35u >> a3))
  {
    v3 = off_100234D20[a3];
  }
  else
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Banner"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Interstitial"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"IABMediumRectangle"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Audio"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Video"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Flexible"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Native"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Sponsorship"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAdSpecification;
  id v3 = [(APPBAdSpecification *)&v7 description];
  int v4 = [(APPBAdSpecification *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  section = self->_section;
  if (section) {
    [v3 setObject:section forKey:@"section"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t type = self->_type;
    if type < 0xC && ((0xF35u >> type))
    {
      objc_super v7 = off_100234D20[type];
    }
    else
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    [v4 setObject:v7 forKey:@"type"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdSpecificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_section)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_section)
  {
    id v5 = v4;
    [v4 setSection:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_type;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_section copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_type;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  section = self->_section;
  if ((unint64_t)section | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](section, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_type == *((_DWORD *)v4 + 4))
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

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_section hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[APPBAdSpecification setSection:](self, "setSection:");
    uint64_t v4 = v5;
  }
  if (v4[5])
  {
    self->_uint64_t type = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end