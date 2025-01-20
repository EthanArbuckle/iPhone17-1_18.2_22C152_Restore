@interface NEKPBCalendarIdentifier
- (BOOL)hasIdentifier;
- (BOOL)hasIsDefaultLocalCalendar;
- (BOOL)isDefaultLocalCalendar;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsDefaultLocalCalendar:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsDefaultLocalCalendar:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBCalendarIdentifier

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIsDefaultLocalCalendar:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isDefaultLocalCalendar = a3;
}

- (void)setHasIsDefaultLocalCalendar:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsDefaultLocalCalendar
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBCalendarIdentifier;
  v3 = [(NEKPBCalendarIdentifier *)&v7 description];
  v4 = [(NEKPBCalendarIdentifier *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithBool:self->_isDefaultLocalCalendar];
    [v4 setObject:v6 forKey:@"isDefaultLocalCalendar"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004768C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_identifier)
  {
    id v5 = v4;
    [v4 setIdentifier:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_isDefaultLocalCalendar;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_identifier copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 16) = self->_isDefaultLocalCalendar;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_isDefaultLocalCalendar)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_isDefaultLocalCalendar;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[NEKPBCalendarIdentifier setIdentifier:](self, "setIdentifier:");
    uint64_t v4 = v5;
  }
  if (v4[20])
  {
    self->_isDefaultLocalCalendar = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isDefaultLocalCalendar
{
  return self->_isDefaultLocalCalendar;
}

- (void).cxx_destruct
{
}

@end